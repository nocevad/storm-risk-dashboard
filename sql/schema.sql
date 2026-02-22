CREATE DATABASE storm_risk CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE storm_risk;

CREATE TABLE counties (
    fips_code    VARCHAR(5)   PRIMARY KEY,
    county_name  VARCHAR(100) NOT NULL,
    state_name   VARCHAR(50)  NOT NULL,
    state_fips   VARCHAR(2)   NOT NULL,
    county_fips  VARCHAR(3)   NOT NULL
);

CREATE TABLE fema_disasters (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    fips_code         VARCHAR(5)   NOT NULL,
    disaster_number   VARCHAR(20),
    declaration_date  DATE,
    disaster_type     VARCHAR(100),
    incident_type     VARCHAR(100),
    state             VARCHAR(2),
    program_declared  VARCHAR(10),
    FOREIGN KEY (fips_code) REFERENCES counties(fips_code)
);

CREATE TABLE hurricane_susceptibility (
    fips_code            VARCHAR(5) PRIMARY KEY,
    storm_count          INT        DEFAULT 0,
    avg_wind_speed       FLOAT      DEFAULT 0,
    susceptibility_score FLOAT      DEFAULT 0,
    FOREIGN KEY (fips_code) REFERENCES counties(fips_code)
);

CREATE TABLE county_day_features (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    fips_code      VARCHAR(5) NOT NULL,
    feature_date   DATE       NOT NULL,
    disaster_count INT        DEFAULT 0,
    risk_score     FLOAT      DEFAULT 0,
    UNIQUE KEY unique_county_day (fips_code, feature_date),
    FOREIGN KEY (fips_code) REFERENCES counties(fips_code)
);

CREATE TABLE monthly_risk (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    fips_code     VARCHAR(5) NOT NULL,
    month         VARCHAR(7) NOT NULL,
    enhanced_risk FLOAT      DEFAULT 0,
    UNIQUE KEY unique_county_month (fips_code, month),
    FOREIGN KEY (fips_code) REFERENCES counties(fips_code)
);