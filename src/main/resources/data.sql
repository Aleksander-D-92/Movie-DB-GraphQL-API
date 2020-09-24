insert into authorities (authority_id, authority)
values (nextval('authority_seq'), 'ROLE_USER_FREE'),
       (nextval('authority_seq'), 'ROLE_USER_PAID'),
       (nextval('authority_seq'), 'ROLE_ADMIN');

insert into users(user_id, username, password, registration_date, account_non_locked)
values (nextval('user_seq'), 'demo_free_account', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(),
        true),
       (nextval('user_seq'), 'user2', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user3', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user4', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user5', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user6', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user7', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user8', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user9', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user10', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user11', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user12', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'user13', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true),
       (nextval('user_seq'), 'demo_paid_account', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(),
        true),
       (nextval('user_seq'), 'demo_admin', '$2a$10$SiRr.soEFLATu6/d.6Tyzu6U20S0DaItwzPyyWRpsmAt/gqTgLXhe', now(), true);

insert into users_authorities(user_id, authority_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 1),
       (7, 1),
       (8, 1),
       (9, 1),
       (10, 1),
       (11, 1),
       (12, 1),
       (13, 1),
       (14, 2),
       (15, 3);

insert into bank_accounts(bank_account_id, title, description, account_type, creation_date, user_id)
VALUES (nextval('bank_account_seq'), 'Account name', 'random description', 'CHECKING', now(), 1),
       (nextval('bank_account_seq'), 'Account name', 'random description', 'SAVINGS', now(), 1),
       (nextval('bank_account_seq'), 'Account name', 'random description', 'CASH', now(), 1),
       (nextval('bank_account_seq'), 'Account name', 'random description', 'CREDIT_CARD', now(), 1),
       (nextval('bank_account_seq'), 'Account name', 'random description', 'CREDIT_CARD', now(), 1),
       (nextval('bank_account_seq'), 'Account name', 'random description', 'CREDIT_CARD', now(), 1);

insert into categories (category_id, name, type, user_id)
VALUES (nextval('category_seq'), 'Education', 'EXPENSE', 1),
       (nextval('category_seq'), 'Transportation', 'EXPENSE', 1),
       (nextval('category_seq'), 'Household', 'EXPENSE', 1),
       (nextval('category_seq'), 'Food', 'EXPENSE', 1),
       (nextval('category_seq'), 'Salary', 'INCOME', 1),
       (nextval('category_seq'), 'Allowance', 'INCOME', 1),
       (nextval('category_seq'), 'Petty Cash', 'INCOME', 1),
       (nextval('category_seq'), 'Bonus', 'INCOME', 1),
       (nextval('category_seq'), 'Transfer', 'INCOME', 1),
       (nextval('category_seq'), 'Modified Balance', 'INCOME', 1);


insert into transactions(transaction_id, type, note, balance, date, bank_account_id, category_id)
    --inserting expenses and incomes
--EXPENSE 1-4 INCOME 5-8
values (nextval('transaction_seq'), 'EXPENSE', 'random note', 100, now(), 1, 1),
       (nextval('transaction_seq'), 'EXPENSE', 'random note', 100, now(), 1, 2),
       (nextval('transaction_seq'), 'EXPENSE', 'random note', 100, now(), 1, 3),
       (nextval('transaction_seq'), 'EXPENSE', 'random note', 100, now(), 1, 4),
       (nextval('transaction_seq'), 'INCOME', 'random note', 100, now(), 1, 5),
       (nextval('transaction_seq'), 'INCOME', 'random note', 100, now(), 1, 6),
       (nextval('transaction_seq'), 'INCOME', 'random note', 100, now(), 1, 7),
       (nextval('transaction_seq'), 'INCOME', 'random note', 100, now(), 1, 8);

-- insert into transactions(transaction_id, type, note, balance, date, bank_account_id, sender_account_id,
--                          receiver_account_id)
-- values (nextval('transaction_seq'), 'TRANSFER', 'random note', 100, now(), 1, 1, 2);


