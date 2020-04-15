
#需求：求统计视频观看数Top50所关联视频的所属类别Rank
#先求top50(t1),然后炸相关视频列表(t2)，再join大表得到每个相关视频的category,再炸，最后统计

SELECT
COUNT(*) nums, t3.every_cate_name
FROM
(SELECT every_cate_name
FROM
(SELECT category
FROM
(SELECT DISTINCT related_id_name FROM
(SELECT relatedId, views FROM gulivideo_ori ORDER BY views DESC LIMIT 50)t1 lateral VIEW explode(t1.relatedId) tmp AS related_id_name)t2
LEFT JOIN gulivideo_ori ON gulivideo_ori.videoId = t2.related_id_name
) t_cate lateral VIEW explode(t_cate.category) tmp2 AS every_cate_name) t3
GROUP BY t3.every_cate_name
ORDER BY nums DESC;

#需求：统计每个类别中的视频热度Top10，以Music为例
#很简单，先炸再统计
SELECT videoId, views, cate_name
FROM gulivideo_ori lateral VIEW explode(category) tmp AS cate_name
WHERE tmp.cate_name = "Music" ORDER BY views DESC LIMIT 10;

#需求：统计上传视频最多的用户Top10以及他们上传的观看次数在前20的视频
SELECT t1.uploader, t2.videoId, t2.views
FROM
(SELECT uploader, videos FROM gulivideo_user_ori ORDER BY videos DESC LIMIT 10) t1
LEFT JOIN gulivideo_ori t2
ON t1.uploader = t2.uploader
ORDER BY t2.views DESC LIMIT 20;

#需求：统计每个类别视频观看数Top10
#用排序函数把炸开category的表排序（partition by 类别），再选择排名数量

SELECT * FROM
(SELECT t1.videoId, t1.category_name, t1.views, row_number() over(PARTITION BY t1.category_name ORDER BY t1.views DESC) rk
FROM
(SELECT videoId, category_name, views FROM gulivideo_ori lateral VIEW explode(category) tmp AS category_name ) t1) t2
WHERE t2.rk <=10 ;
