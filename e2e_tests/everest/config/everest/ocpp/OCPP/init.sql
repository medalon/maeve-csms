PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS CONNECTORS (
    ID INT PRIMARY KEY NOT NULL,
    AVAILABILITY TEXT
);
CREATE TABLE IF NOT EXISTS AUTH_CACHE (
    ID_TAG TEXT PRIMARY KEY NOT NULL,
    AUTH_STATUS TEXT NOT NULL,
    EXPIRY_DATE TEXT,
    PARENT_ID_TAG TEXT
);
CREATE TABLE IF NOT EXISTS AUTH_LIST_VERSION (
    ID INT PRIMARY KEY NOT NULL,
    VERSION INT
);
CREATE TABLE IF NOT EXISTS AUTH_LIST (
    ID_TAG TEXT PRIMARY KEY NOT NULL,
    AUTH_STATUS TEXT NOT NULL,
    EXPIRY_DATE TEXT,
    PARENT_ID_TAG TEXT
);
CREATE TABLE IF NOT EXISTS TRANSACTIONS (
    ID INT PRIMARY KEY NOT NULL,
    TRANSACTION_ID INT,
    CONNECTOR INT NOT NULL,
    ID_TAG_START TEXT NOT NULL,
    TIME_START TEXT NOT NULL,
    METER_START INT NOT NULL,
    CSMS_ACK INT NOT NULL,
    METER_LAST INT NOT NULL,
    METER_LAST_TIME TEXT NOT NULL,
    LAST_UPDATE TEXT NOT NULL,
    RESERVATION_ID INT,
    PARENT_ID_TAG TEXT,
    ID_TAG_END TEXT,
    TIME_END TEXT,
    METER_STOP INT,
    STOP_REASON TEXT,
    FOREIGN KEY(CONNECTOR) REFERENCES CONNECTORS(ID)
);
INSERT
    OR IGNORE INTO AUTH_LIST_VERSION (ID, VERSION)
VALUES (0, 0);

CREATE TABLE IF NOT EXISTS CHARGING_PROFILES (
    ID INT PRIMARY KEY NOT NULL,
    CONNECTOR_ID INT NOT NULL,
    PROFILE TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS OCSP_REQUEST (
    LAST_UPDATE TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE IF NOT EXISTS TRANSACTION_QUEUE(
    UNIQUE_ID TEXT PRIMARY KEY NOT NULL,
    MESSAGE TEXT NOT NULL,
    MESSAGE_TYPE TEXT NOT NULL,
    MESSAGE_ATTEMPTS INT NOT NULL,
    MESSAGE_TIMESTAMP TEXT NOT NULL
);
