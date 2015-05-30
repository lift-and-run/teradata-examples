SELECT customer_name.cust_id, customer_name.first_name, trans.tran_total FROM
   financial.customer_name  LEFT JOIN financial.trans ON trans.cust_id = customer_name.cust_id;

SELECT customer_name.cust_id, customer_name.first_name, trans.tran_total FROM
   financial.customer_name  LEFT JOIN financial.trans ON trans.cust_id = customer_name.cust_id WHERE customer_name.first_name = 'pETROV';

SELECT *
FROM (
    SELECT customer_name.cust_id, customer_name.first_name, trans.tran_total FROM
    financial.customer_name  LEFT JOIN financial.trans ON trans.cust_id = customer_name.cust_id) AS test
WHERE test.tran_total IS NULL;



 SELECT test.cust_id, test.first_name, test.tran_total
 FROM (
     SELECT customer_name.cust_id, customer_name.first_name, trans.tran_total
     FROM financial.customer_name  INNER JOIN financial.trans ON trans.cust_id = customer_name.cust_id) AS test;

 SELECT test.first_name, test.tran_total
 FROM (
     SELECT customer_name.first_name, trans.tran_total
     FROM financial.customer_name  INNER JOIN financial.trans ON trans.cust_id = customer_name.cust_id) AS test ORDER BY test.first_name;

 SELECT test.first_name, MAX(test.tran_total)
 FROM (
     SELECT customer_name.first_name, trans.tran_total
     FROM financial.customer_name  INNER JOIN financial.trans ON trans.cust_id = customer_name.cust_id) AS test GROUP BY test.first_name;

 SELECT test.first_name, MAX(test.tran_total)
 FROM (
     SELECT customer_name.first_name, trans.tran_total
     FROM financial.customer_name  INNER JOIN financial.trans ON trans.cust_id = customer_name.cust_id) AS test GROUP BY test.first_name ORDER BY test.first_name DESC;



 SELECT checking_acct.cust_id
 FROM financial.checking_acct 
 WHERE checking_acct.account_active = 'Y' AND checking_acct.ending_balance >=100;

 SELECT customer.cust_id, customer.age
 FROM financial.customer
 WHERE customer.age >= 50;
 
 SELECT age50.cust_id, age50.age, checking100.ending_balance
 FROM (
     SELECT customer.cust_id, customer.age
     FROM financial.customer
     WHERE customer.age >= 50) AS age50 
 INNER JOIN (
     SELECT checking_acct.ending_balance, checking_acct.cust_id
     FROM financial.checking_acct 
     WHERE checking_acct.account_active = 'Y' AND checking_acct.ending_balance >=100) AS checking100
 ON age50.cust_id = checking100.cust_id;

 
 SELECT customer_name.first_name,
             customer_name.last_name,
             customer_name.postal_code,
             customer_name.state_code,
             customer_name.city_name,
             customer_name.street_name,
             customer_name.street_nbr,
             cast50_100.ending_balance,
             cast50_100.acct_nbr
 FROM ( 
    SELECT age50.cust_id, age50.age, acct_aggregated.ending_balance, acct_aggregated.acct_nbr
    FROM (
         SELECT customer.cust_id, customer.age
         FROM financial.customer
         WHERE customer.age >= 50) AS age50 
    INNER JOIN (
    
         SELECT checking_acct.ending_balance, checking_acct.cust_id, checking_acct.acct_nbr
         FROM financial.checking_acct 
         WHERE checking_acct.account_active = 'Y' AND checking_acct.ending_balance >=100
         
         UNION
         
         SELECT credit_acct.ending_balance, credit_acct.cust_id, credit_acct.acct_nbr
         FROM  financial.credit_acct
         WHERE credit_acct.account_active = 'Y' AND credit_acct.ending_balance >=100
         
         UNION
         
         SELECT savings_acct.ending_balance, savings_acct.cust_id, savings_acct.acct_nbr
         FROM  financial.savings_acct
         WHERE savings_acct.account_active = 'Y' AND  savings_acct.ending_balance >=100
         ) AS acct_aggregated
         
    ON age50.cust_id = acct_aggregated.cust_id) AS cast50_100
    
 LEFT JOIN  financial.customer_name ON customer_name.cust_id = cast50_100.cust_id
 ORDER BY cast50_100.ending_balance;



 create table test.test_user (
    id_user integer  not null primary key,
    user_name varchar (100))
    index (user_name);

 create table test.test_post (
    id_user integer  not null,
    post varchar (300) not null,
    point integer )
    index (post, point);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (4, 'post2', 6);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (4, 'post1', 6);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (3, 'post3', 4);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (3, 'post2', 10);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (3, 'post1', 6);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (1, 'post2', 2);

 insert into  test.test_post (test_post.id_user, test_post.post, test_post.point)
 values (1, 'post1', 10);

 select test_user.id_user, test_user.user_name, sum(test_post.point)
 from test.test_user join test.test_post on test_user.id_user = test_post.id_user
 group by test_user.id_user, test_user.user_name
 order by test_user.user_name;
