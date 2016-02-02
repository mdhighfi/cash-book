# Schema Information

## accounts
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
description | string    |
type        | string    | not null, inclusion in [Credit, Checking, Savings, Student_Loan, Personal_Loan, Car_Loan, Mortgage], indexed
apr         | float     | not null
min_payment | float     | not null
credit      | integer   | not null
user_id     | integer   | not null, foreign key (references users), indexed

## expenses
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
frequency   | string    | not null, inclusion in [Daily, Weekly, Monthly, Annual]
user_id     | integer   | not null, foreign key (references users), indexed

## balances
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
amount      | float     | not null
date        | datetime  | not null, indexed
account_id  | integer   | not null, foreign key (references accounts), indexed

## wish_lists
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null

## wishers
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
list_id     | integer   | not null, indexed, unique [user_id]
user_id     | integer   | not null, foreign key (references users), indexed

## account_holders
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
account_id  | integer   | not null, indexed, unique [user_id]
user_id     | integer   | not null, foreign key (references users), indexed

## items
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
image_url   | string    |
list_id     | integer   | not null, foreign key (references wish_lists), indexed


## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users), indexed
item_id     | integer   | not null, foreign key (references items), indexed
date        | datetime  | not null
content     | text      | not null

## tags
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null

## taggings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
item_id     | integer   | not null, foreign key (references items), indexed, unique [tag_id]
tag_id      | integer   | not null, foreign key (references tags), indexed

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, indexed, unique
password_digest | string    | not null
session_token   | string    | not null, indexed, unique
