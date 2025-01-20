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


CREATE TABLE credential
(
    id           NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id    VARCHAR(20)  NOT NULL,
    type         VARCHAR(5)   NOT NULL CHECK (type IN ('ES256', 'RS256')),
    public_key   VARCHAR(512) NOT NULL,
    created_date DATE         NOT NULL,
    expired_date DATE         NOT NULL
);

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
    id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id VARCHAR(20)  NOT NULL,
    key       VARCHAR(255) NOT NULL,
    value     VARCHAR(255) NOT NULL
);

CREATE TABLE events
(
    id           NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id    VARCHAR(20)  NOT NULL,
    name         VARCHAR(20)  NOT NULL,
    value        VARCHAR(255) NOT NULL,
    timestamp    DATE,
    created_date DATE,
    type         VARCHAR(20)  NOT NULL CHECK (type IN ('info', 'warning', 'error'))
);

CREATE TABLE logs
(
    id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id VARCHAR(20) NOT NULL,
    "level"   VARCHAR(7)  NOT NULL CHECK ("level" IN ('debug', 'info', 'warning', 'error')),
    timestamp DATE        NOT NULL,
    message   VARCHAR(64)
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
    id               NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
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
    id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_type   VARCHAR(20)   NOT NULL,
    major         NUMERIC(3, 0) NOT NULL,
    minor         NUMERIC(3, 0) NOT NULL,
    patch         NUMERIC(3, 0) NOT NULL,
    released_date DATE          NOT NULL,
    data          BLOB          NOT NULL
);

CREATE TABLE devices_firmware
(
    id             NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id      VARCHAR(20) NOT NULL,
    firmware_id    INT         NOT NULL,
    started_date   DATE,
    completed_date DATE,
    attempt        INT,
    error_message  VARCHAR(20)
);

CREATE TABLE configurations
(
    id               NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id        VARCHAR(20) NOT NULL,
    version          VARCHAR(20) NOT NULL,
    data             BLOB        NOT NULL,
    created_date     DATE        NOT NULL,
    acknowledge_date DATE,
    accepted_date    DATE
);



ALTER TABLE meta
    ADD CONSTRAINT "META_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE events
    ADD CONSTRAINT "EVENTS_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE configurations
    ADD CONSTRAINT "CONFIG_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices
    ADD CONSTRAINT "DEVICE_REGISTRY_FK" FOREIGN KEY (registry_id) REFERENCES registry (id);
ALTER TABLE devices
    ADD CONSTRAINT "DEVICE_DEVTYPE_FK" FOREIGN KEY (device_type) REFERENCES device_type (type);
ALTER TABLE firmware
    ADD CONSTRAINT "FIRM_DEVTYPE_FK" FOREIGN KEY (device_type) REFERENCES device_type (type);
ALTER TABLE settings
    ADD CONSTRAINT "SETT_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices_firmware
    ADD CONSTRAINT "DEVFIRM_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE devices_firmware
    ADD CONSTRAINT "DEVFIRM_FIRM_FK" FOREIGN KEY (firmware_id) REFERENCES firmware (id);
ALTER TABLE credential
    ADD CONSTRAINT "CRED_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);
ALTER TABLE logs
    ADD CONSTRAINT "LOGS_DEVICES_FK" FOREIGN KEY (device_id) REFERENCES devices (id);

ALTER TABLE firmware
    ADD CONSTRAINT "VERSION_" UNIQUE (major, minor, patch, device_type)