
<!---- deploy info ---->
# Introduction to RDBMS・SQL 8

## The goal

```
To get the necessary knowledge about RDBMS, which is indispensable for creating Web application, and language SQL for dealing with it.
```

## Overview

```
Learn how to concatenate multiple tables and extract data.
```

## Concatenate tables

You've been working on only the crops table, now let's use the price table by associating the price table with the crops table.


`join Table name to be associated　on　 Key columns of the original table　＝　
Key columns of the table to be associated `


When concatenating two tables with a common give_for column as a key, write the following query.

```
select crops.give_for, weight, price, date
from crops
join price on crops.give_for = price.give_for;
```

As for the key column, you need to clarify by describing which table the key column belongs to in order for errors to avoid error occuring.
Describing the table name and the column name by connectiing with .(comma) is the key.


```
give_for                   | weight | price |    date
---------------+--------+-------+------------
Wife's parents' home       |    256 |     0 | 2015-06-21
Self consumption           |    105 |     0 | 2015-06-21
Self consumption           |    118 |     0 | 2015-06-23
Self consumption           |    344 |     0 | 2015-06-26
Self consumption           |     92 |     0 | 2015-06-26
Self consumption           |    330 |     0 | 2015-06-27
Self consumption           |    324 |     0 | 2015-06-27
General Affairs Auntie     |    374 |   200 | 2015-06-29
省略
(145 rows)
```


### Extract quantity and sales for each transfer destination(give_for)

Let's extract quantity and sales total value for each give_for.

```
select crops.give_for, count(*), sum(price) as sales
from crops
join price on crops.give_for = price.give_for
group by crops.give_for
order by sales desc;
```


```
give_for                | count | sales
-------------- -+-------+-------
General Affairs Auntie  |    22  |  4400
Colleagues              |     8 |  1200
Cousin                  |     3 |   300
Friends                 |     2 |   200
Wife's friends          |     1 |    50
Wife's parents' home    |    16 |     0
Self consumption        |    93 |     0
```

Let's work on the small task below with all the knowledge you've learned so far.

## Summary

```
In order to associate tables, use 'join' and describe table name and column name by connecting them with .(comma).
```

## Small task

There is no obligation to submit small tasks, but please be sure to move your hands and work on it! (To move hands is very important for programming. If you want to ask questions or check answers for the task, please post to posting questions field)

Extract the data list that satisfies the following requirements.

```
・The total of the quantity, the average value of the length, the average value of the weight, the total sales amount should be displayed for each transfer destination(give_for)
・to narrow down to those with a length of 20 cm or more
・to narrow down to those with a weight of 200 g or more
・To narrow down the quality to good ones
・It should be displayed in descending order of total sales
```

（An example of the correct code is posted at the end of this curriculum, but please implement it yourself before that. If you can not do it well, compare the code of the correct answer with the code of yourself and review what was missing）

## Thank you for your hard work

Please visit the following URL to ask questions.

https://diveintocode.jp/diver/questions/new

## About text feedback

For the future growth of DIVE INTO CODE,
please give us feedback if you have time.
We would appreciate it if you would give us the feedback in DIVER's comment field referring to the following.

・Was the difficulty of the text appropriate?

・Was the amount of the text appropriate?

・Did you find any terms not explained?

・Were there any errors in the text?

・Was the content appropriate for the text goals?

・Do you need any more explanation for a specific part?

・Did you enjoy the text?

・Was the text beneficial?

**Examples of answers to small task**

```
select crops.give_for, count(*), avg(length) as avg_length, avg(weight) as avg_weight, sum(price) as sales
from crops
join price on crops.give_for = price.give_for
where quality = true and
length >= 20 and
weight >= 200
group by crops.give_for
order by sales desc;
```
