-- REGISTRY

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R001', 'Group_A', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'JSON', 'Registry for device group A.');

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R002', 'XML_logs', TO_DATE('2023-02-26', 'YYYY-MM-DD'), 'XML', 'Registry for XML-based device logs.');

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R003', 'legacy', TO_DATE('2024-12-21', 'YYYY-MM-DD'), 'plain', 'Registry for legacy systems.');

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R004', 'modern', TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'JSON', 'Registry for modern IoT devices.');

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R005', 'XML_logs', TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'XML', 'Registry for high-volume data ingestion.');

-- DEVICE TYPES
INSERT INTO DEVICE_TYPE(TYPE)
VALUES ('core');
INSERT INTO DEVICE_TYPE(TYPE)
VALUES ('pi');
INSERT INTO DEVICE_TYPE(TYPE)
VALUES ('nrf');

-- DEVICES

INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D001', 'R001', 'pi', 'TempSensor', 'active', TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'SN001', 'Warehouse');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D002', 'R001', 'nrf', 'SecurityCam', 'inactive', TO_DATE('2024-12-15', 'YYYY-MM-DD'), 'SN002', 'Main-Gate');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D003', 'R002', 'core', 'Router', 'active', TO_DATE('2025-01-05', 'YYYY-MM-DD'), 'SN003', 'Server-Room');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D004', 'R002', 'nrf', 'LightSwitch', 'inactive', TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'SN004', 'Office1');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D005', 'R002', 'nrf', 'HumiditySensor', 'active', TO_DATE('2025-01-06', 'YYYY-MM-DD'), 'SN005', 'Warehouse');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D006', 'R002', 'core', 'DashButton', 'active', TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'SN390', 'Office1');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D007', 'R003', 'core', 'SmokeAlarm', 'active', TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'SN450', 'Office1');
INSERT INTO devices (id, registry_id, device_type, device_name, status, last_updating, serial_number, location)
VALUES ('D008', 'R003', 'pi', 'Raspbery_pi3', 'active', TO_DATE('2024-12-05', 'YYYY-MM-DD'), 'SN850', 'Office1');


--firmware
INSERT INTO firmware (device_type, major, minor, patch, released_date, data)
VALUES ('core', 1, 0, 1, TO_DATE('2024-12-05', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('1f8b080087cdc152cdc928cf2fca49d1e30200dgjsd0000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('pi', 1, 1, 0, TO_DATE('2025-01-05', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('cvmjdj0087cdc1520c9d75128cf2fcc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('core', 0, 1, 0, TO_DATE('2024-11-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('63ondl1520003f348cdc9c1e30200d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('nrf', 0, 1, 1, TO_DATE('2024-11-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('sukf8b088cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('nrf', 0, 1, 2, TO_DATE('2024-11-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('sgtwe1520003f348cdc9c9d75128cf2fca49d1e30200ddfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('pi', 0, 1, 2, TO_DATE('2024-11-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('1f8b080087cdc15200hsduieee30200d7bbcdfc0e000000'));


--device_firmware
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D001', 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, 'Unsupported');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D002', 2, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D001', 3, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 2, 'Timeout');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D003', 1, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-11', 'YYYY-MM-DD'), 3,
        'Failed');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D002', 4, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D005', 6, TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D004', 4, TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-23', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D008', 6, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-02', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D004', 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 1, NULL);


--settings
INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('1', '?', 'IoT_Project', 'Registry_A', TO_DATE('2023-01-01', 'YYYY-MM-DD'),
        TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('2', '?', 'IoT_Project', 'Registry_B', TO_DATE('2023-02-01', 'YYYY-MM-DD'),
        TO_DATE('2023-02-02', 'YYYY-MM-DD'), NULL);

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('3', '?', 'IoT_Project', 'Registry_C', TO_DATE('2023-03-01', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('4', '?', 'IoT_Project', 'Registry_D', TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        TO_DATE('2023-04-02', 'YYYY-MM-DD'), TO_DATE('2023-04-03', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('5', '?', 'IoT_Project', 'Registry_E', TO_DATE('2023-05-01', 'YYYY-MM-DD'),
        TO_DATE('2023-05-02', 'YYYY-MM-DD'), TO_DATE('2023-05-03', 'YYYY-MM-DD'));


--credential
INSERT INTO credential ( device_id, type, public_key, created_date, expired_date)
VALUES ( '1', 'ES256',
        '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        TO_DATE('2024-01-01', 'YYYY-MM-DD'),
        TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO credential ( device_id, type, public_key, created_date, expired_date)
VALUES ( '2', 'RS256', 'MIIBIjANBgkqhki', TO_DATE('2024-02-11', 'YYYY-MM-DD'),
        TO_DATE('2025-02-11', 'YYYY-MM-DD'));

INSERT INTO credential ( device_id, type, public_key, created_date, expired_date)
VALUES ( '3', 'ES256', 'MIIBIjANBgkqhki', TO_DATE('2023-09-01', 'YYYY-MM-DD'),
        TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO credential ( device_id, type, public_key, created_date, expired_date)
VALUES ( '4', 'RS256', 'MIIBIjANBgkqhki', TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        TO_DATE('2024-04-01', 'YYYY-MM-DD'));

INSERT INTO credential ( device_id, type, public_key, created_date, expired_date)
VALUES ('5', 'ES256', 'MIIBIjANBgkqhki', TO_DATE('2023-05-01', 'YYYY-MM-DD'),
        TO_DATE('2024-05-01', 'YYYY-MM-DD'));

--logs
INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D001', 'info', SYSDATE, 'System start');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D002', 'debug', SYSDATE, 'Connection established');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D003', 'warning', SYSDATE, 'High memory usage');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D004', 'error', SYSDATE, 'Disk failure');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D005', 'info', SYSDATE, 'Backup completed');


--configurations
INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D001', 'v1.1.1',
        UTL_RAW.CAST_TO_RAW('1f8b080087cdc1520003f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'));

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, acknowledge_date)
VALUES ('D002', 'v1.1.0', UTL_RAW.CAST_TO_RAW('?'), TO_DATE('2024-12-11', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, acknowledge_date)
VALUES ('D003', 'v2.0,1', UTL_RAW.CAST_TO_RAW('?'), TO_DATE('2025-01-01', 'YYYY-MM-DD'),
        TO_DATE('2023-03-02', 'YYYY-MM-DD'), NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, acknowledge_date)
VALUES ('D004', 'v2.1.0', UTL_RAW.CAST_TO_RAW('?'), TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        TO_DATE('2023-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-03', 'YYYY-MM-DD'));

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, acknowledge_date)
VALUES ('D005', 'v3.0.0', UTL_RAW.CAST_TO_RAW('?'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, NULL);


--events
INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D001', 'Temperature Alert', '85°C', TO_DATE('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'warning');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D002', 'Battery Level', 'Low: 10%', TO_DATE('2023-01-02 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'info');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D003', 'Overheat', 'Critical: 95°C', TO_DATE('2023-01-03 14:20:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'error');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D004', 'Connection Lost', 'No signal', TO_DATE('2023-01-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'error');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D005', 'Firmware Update', 'Version 2.0 applied',
        TO_DATE('2023-01-05 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), SYSDATE, 'info');


--meta
INSERT INTO meta (device_id, key, value)
VALUES ('1', 'MaxTemp', 85);

INSERT INTO meta (device_id, key, value)
VALUES ('D002', 'MinTemp', 5);

INSERT INTO meta (device_id, key, value)
VALUES ('D003', 'BatteryLife', 80);

INSERT INTO meta (device_id, key, value)
VALUES ('D004', 'SignalStrength', 90);

INSERT INTO meta (device_id, key, value)
VALUES ('D005', 'UpdateInterval', 30);




