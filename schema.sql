DROP TABLE IF EXISTS "transaction";

CREATE TABLE "transaction" (
    "transaction_id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card_num" VARCHAR(20)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "transaction_id"
     )
);

DROP TABLE IF EXISTS "merchant";

CREATE TABLE "merchant" (
    "id_merchant" INT   NOT NULL,
    "merchant_name" VARCHAR(50)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id_merchant"
     )
);

DROP TABLE IF EXISTS "merchant_cat";

CREATE TABLE "merchant_cat" (
    "id_merchant_category" INT   NOT NULL,
    "category_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_merchant_cat" PRIMARY KEY (
        "id_merchant_category"
     )
);

DROP TABLE IF EXISTS "credit_card";

CREATE TABLE "credit_card" (
    "card_num" VARCHAR(20)   NOT NULL,
    "cardholder_id" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card_num"
     )
);

DROP TABLE IF EXISTS "card_holder";

CREATE TABLE "card_holder" (
    "cardholder_id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "cardholder_id"
     )
);

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card_num" FOREIGN KEY("card_num")
REFERENCES "credit_card" ("card_num");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id_merchant");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_cat" ("id_merchant_category");

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("cardholder_id");

