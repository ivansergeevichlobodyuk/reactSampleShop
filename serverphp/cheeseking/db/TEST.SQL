SELECT * FROM `goods_to_category` where categories_id = 1632 and priority = 1
union
SELECT * FROM `goods_to_category` where categories_id = 1628 and priority = 2
UNION
SELECT * FROM `goods_to_category` where categories_id = 1709 and priority = 3
SELECT * FROM `goods_to_category` where categories_id = 1709 and priority = 4
ORDER BY `goods_id` ASC

select goods_id from `goods_to_category` where goods_id in
( select goods_id from `goods_to_category` where goods_id in
( SELECT goods_id FROM `goods_to_category` where categories_id = 1709 and priority = 3 ) and categories_id = 1628 and priority = 2  ) and categories_id = 1632 and priority = 1




Select * from `goods_to_category` where goods_id in
( SELECT goods_id FROM `goods_to_category` where categories_id = 1709 and priority = 3 ) and categories_id = 1628 and priority = 2  )

select * from `goods_to_category` where goods_id in
(select goods_id from `goods_to_category` where goods_id in
(select goods_id from `goods_to_category` where goods_id in
  (SELECT goods_id FROM `goods_to_category` where categories_id = 1709 and priority = 4)
      and categories_id = 1709 and priority = 3) and categories_id = 1628 and priority = 2 ) and categories_id = 1632 and priority = 1



SELECT gtc4.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc4
    WHERE gtc4.goodsToCategories IN(
        SELECT gtc3.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc3
            WHERE gtc3.goodsToCategories IN(
                  SELECT gtc2.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc2
                        WHERE gtc2.goodsToCategories IN(SELECT gtc.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc WHERE gtc.categories=1709 AND gtc.priority=4)))



SELECT gtc4.goodsToCategories
FROM
Eshop\LedaagroBundle\Entity\GoodsToCategory gtc4
WHERE
(gtc4.goodsToCategories IN
  (SELECT gtc3.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc3 WHERE
    (gtc3.goodsToCategories IN
      (SELECT gtc2.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc2 WHERE
        (gtc2.goodsToCategories IN
          (SELECT gtc.goodsToCategories FROM Eshop\LedaagroBundle\Entity\GoodsToCategory gtc WHERE gtc.categories=1709 AND gtc.priority=4)) AND gtc2.categories=1709 AND gtc2.priority=3)) AND gtc3.categories=1628 AND gtc3.priority=2)) AND gtc4.categories=1632 AND gtc4.priority=1

