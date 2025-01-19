DROP TABLE devices CASCADE CONSTRAINTS;
DROP TABLE device_type CASCADE CONSTRAINTS;
DROP TABLE meta CASCADE CONSTRAINTS;
DROP TABLE events CASCADE CONSTRAINTS;
DROP TABLE logs CASCADE CONSTRAINTS;
DROP TABLE registry CASCADE CONSTRAINTS;
DROP TABLE settings CASCADE CONSTRAINTS;
DROP TABLE firmware CASCADE CONSTRAINTS;
DROP TABLE devices_firmware CASCADE CONSTRAINTS;
DROP TABLE credential CASCADE CONSTRAINTS;
DROP TABLE configurations CASCADE CONSTRAINTS;


CREATE TABLE devices
(
    id            VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    registry_id   VARCHAR(20) NOT NULL,
    device_name   VARCHAR(20) NOT NULL,
    device_type   VARCHAR(20) NOT NULL,
    status        VARCHAR(20) NOT NULL CHECK (status IN ('active', 'inactive')),
    last_updating DATE        NOT NULL,
    serial_number VARCHAR(20) UNIQUE,
    location      VARCHAR(20) NOT NULL
);

CREATE TABLE device_type
(
    type VARCHAR(20) NOT NULL PRIMARY KEY CHECK ( type IN ('core', 'pi', 'nrf'))
);

CREATE TABLE meta
(
    id        VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id VARCHAR(20) NOT NULL,
    key       VARCHAR(20) NOT NULL,
    value     INT
);

CREATE TABLE events
(
    id           VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id    VARCHAR(20) NOT NULL,
    name         VARCHAR(20),
    value        VARCHAR(255),
    timestamp    DATE,
    created_date DATE,
    type         VARCHAR(20) NOT NULL CHECK (type IN ('info', 'warning', 'error'))
);

CREATE TABLE logs
(
    id        VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id VARCHAR(20) NOT NULL,
    "level"   VARCHAR(7)  NOT NULL CHECK ("level" IN ('debug', 'info', 'warn', 'error')),
    timestamp DATE        NOT NULL,
    message   VARCHAR(20)
);

CREATE TABLE registry
(
    id           VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    name         VARCHAR(20) NOT NULL,
    created_date DATE        NOT NULL,
    type_logs    VARCHAR(7) CHECK (type_logs IN ('XML', 'JSON', 'plain')),
    description  VARCHAR(255)
);

CREATE TABLE settings
(
    id               VARCHAR(20)  NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id        VARCHAR(20)  NOT NULL,
    host_name        VARCHAR(20),
    project          VARCHAR(255) NOT NULL,
    registry         VARCHAR(255) NOT NULL,
    created_date     DATE         NOT NULL,
    acknowledge_date DATE,
    accepted_date    DATE
);

CREATE TABLE firmware
(
    id            INT           NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_type   VARCHAR(20)   NOT NULL,
    major         NUMERIC(3, 0) NOT NULL,
    minor         NUMERIC(3, 0) NOT NULL,
    patch         NUMERIC(3, 0) NOT NULL,
    released_date DATE          NOT NULL
);

CREATE TABLE devices_firmware
(
    id             VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id      VARCHAR(20) NOT NULL,
    firmware_id    INT         NOT NULL,
    started_date   DATE,
    completed_date DATE,
    attempt        INT,
    error_message  VARCHAR(20)
);

CREATE TABLE credential
(
    id           VARCHAR(20)  NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id    VARCHAR(20)  NOT NULL,
    type         VARCHAR(5)   NOT NULL CHECK (type IN ('ES256', 'RS256')),
    public_key   VARCHAR(512) NOT NULL,
    created_date DATE         NOT NULL,
    expired_date DATE         NOT NULL
);

CREATE TABLE configurations
(
    id               VARCHAR(20) NOT NULL PRIMARY KEY USING INDEX ENABLE,
    device_id        VARCHAR(20) NOT NULL,
    version          VARCHAR(20) NOT NULL,
    data             BLOB        NOT NULL,
    created_date     DATE        NOT NULL,
    acknowledge_date DATE,
    accepted_date    DATE
);



ALTER TABLE meta
    ADD CONSTRAINT "META_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE events
    ADD CONSTRAINT "EVENTS_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE configurations
    ADD CONSTRAINT "CONF_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices
    ADD CONSTRAINT "DEVICE_FK1" FOREIGN KEY (registry_id) REFERENCES registry (id);
ALTER TABLE devices
    ADD CONSTRAINT "DEVICE_FK2" FOREIGN KEY (device_type) REFERENCES device_type (type);
ALTER TABLE firmware
    ADD CONSTRAINT "FIRM_FK" FOREIGN KEY (device_type) REFERENCES device_type (type);
ALTER TABLE settings
    ADD CONSTRAINT "SETT_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices_firmware
    ADD CONSTRAINT "DEV_F_FK1" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices_firmware
    ADD CONSTRAINT "DEV_F_FK2" FOREIGN KEY (firmware_id) REFERENCES firmware (id);
ALTER TABLE credential
    ADD CONSTRAINT "CRED_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE logs
    ADD CONSTRAINT "LOGS_FK" FOREIGN KEY (device_id) REFERENCES devices (id);

ALTER TABLE firmware
    ADD CONSTRAINT "VERSION_" UNIQUE (major, minor, patch, device_type)