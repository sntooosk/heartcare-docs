/* Mapa_logico_heartcare: */

CREATE TABLE tb01_auth (
    tb01_id PRIMARY KEY SERIAL PRIMARY KEY,
    tb01_email UNIQUE KEY VARCHAR(255),
    tb01_password VARCHAR(255),
    tb01_role VARCHAR(255)
);

CREATE TABLE tb00_users (
    tb00_id KEY PRIMARY PRIMARY KEY,
    tb00_dob VARCHAR(255),
    tb00_gender VARCHAR(255),
    tb00_lastname VARCHAR(255),
    tb00_name VARCHAR(255),
    tb00_photo VARCHAR,
    tb00_auth_id PRIMARY KEY SERIAL
);

CREATE TABLE tb02_pressure (
    tb02_id PRIMARY KEY SERIAL PRIMARY KEY,
    tb02_diastolic VARCHAR(255),
    tb02_pulse VARCHAR(255),
    tb02_systolic VARCHAR(255),
    tb02_user_id BIGINT,
    tb02_date TIMESTAMP
);

CREATE TABLE tb03_posts (
    tb03_id PRIMARY KEY SERIAL PRIMARY KEY,
    tb03_comment VARCHAR,
    tb03_title VARCHAR(255),
    tb03_date TIMESTAMP
);

CREATE TABLE tb04_forgot_password (
    tb04_id PRIMARY KEY SERIAL PRIMARY KEY,
    tb04_expiration_time TIMESTAMP,
    tb04_otp BIGINT,
    tb04_auth_id BIGINT
);

CREATE TABLE tb05_medication (
    tb05_id PRIMARY KEY SERIAL PRIMARY KEY,
    tb05_dosage VARCHAR(255),
    tb05_name VARCHAR(255),
    tb05_user_id BIGINT
);

CREATE TABLE pertence (
    fk_tb01_auth_tb01_id PRIMARY KEY SERIAL,
    fk_tb00_users_tb00_id KEY PRIMARY
);

CREATE TABLE recebe (
    fk_tb00_users_tb00_id KEY PRIMARY,
    fk_tb02_pressure_tb02_id PRIMARY KEY SERIAL
);

CREATE TABLE pertence (
    fk_tb04_forgot_password_tb04_id PRIMARY KEY SERIAL,
    fk_tb01_auth_tb01_id PRIMARY KEY SERIAL
);

CREATE TABLE recebe (
    fk_tb00_users_tb00_id KEY PRIMARY,
    fk_tb05_medication_tb05_id PRIMARY KEY SERIAL
);
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_1
    FOREIGN KEY (fk_tb01_auth_tb01_id)
    REFERENCES tb01_auth (tb01_id)
    ON DELETE SET NULL;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_2
    FOREIGN KEY (fk_tb00_users_tb00_id)
    REFERENCES tb00_users (tb00_id)
    ON DELETE SET NULL;
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_1
    FOREIGN KEY (fk_tb00_users_tb00_id)
    REFERENCES tb00_users (tb00_id)
    ON DELETE SET NULL;
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_2
    FOREIGN KEY (fk_tb02_pressure_tb02_id)
    REFERENCES tb02_pressure (tb02_id)
    ON DELETE SET NULL;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_1
    FOREIGN KEY (fk_tb04_forgot_password_tb04_id)
    REFERENCES tb04_forgot_password (tb04_id)
    ON DELETE SET NULL;
 
ALTER TABLE pertence ADD CONSTRAINT FK_pertence_2
    FOREIGN KEY (fk_tb01_auth_tb01_id)
    REFERENCES tb01_auth (tb01_id)
    ON DELETE SET NULL;
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_1
    FOREIGN KEY (fk_tb00_users_tb00_id)
    REFERENCES tb00_users (tb00_id)
    ON DELETE SET NULL;
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_2
    FOREIGN KEY (fk_tb05_medication_tb05_id)
    REFERENCES tb05_medication (tb05_id)
    ON DELETE SET NULL;