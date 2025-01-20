-- REGISTRY

INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R001', 'Group_A', SYSDATE, 'JSON', 'Registry for device group A.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R002', 'XML_logs', SYSDATE, 'XML', 'Registry for XML-based device logs.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R003', 'legacy', SYSDATE, 'plain', 'Registry for legacy systems.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R004', 'modern', SYSDATE, 'JSON', 'Registry for modern IoT devices.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R005', 'modern', SYSDATE, 'ISON', 'Registry for for modern systems.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R006', 'XML_logs', SYSDATE, 'XML', 'Registry for high-volume data ingestion.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R007', 'XML_logs', SYSDATE, 'XML', 'Registry for high-volume data ingestion.');
INSERT INTO registry (id, name, created_date, type_logs, description)
VALUES ('R008', 'legacy', SYSDATE, 'plain', 'Registry for for legacy system.');

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
VALUES ('pi', 1, 0, 0, TO_DATE('2025-10-12', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('cvmjdj0087cdc1520c9d75128cf2fcc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('core', 0, 1, 0, TO_DATE('2024-08-25', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('63ondl1520003f348cdc9c1e30200d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('nrf', 0, 1, 1, TO_DATE('2024-11-19', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('sukf8b088cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('core', 0, 1, 2, TO_DATE('2024-03-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('sgtwe1520003f348cdc9c9d75128cf2fca49d1e30200ddfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('pi', 2, 1, 2, TO_DATE('2024-11-14', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('giwq887cdc15200hsduieee30200d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('pi', 0, 2, 2, TO_DATE('2025-01-15', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('250sflb32d7bbcdfc0e000000'));
INSERT INTO firmware(device_type, major, minor, patch, released_date, data)
VALUES ('nrf', 0, 0, 2, TO_DATE('2024-12-27', 'YYYY-MM-DD'),
        UTL_RAW.CAST_TO_RAW('0dlba30hsduieee30200d7bbcdfc0e000000'));


--device_firmware
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D001', 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, 'Unsupported');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D002', 2, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-02', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D001', 3, TO_DATE('2024-03-05', 'YYYY-MM-DD'), TO_DATE('2024-03-06', 'YYYY-MM-DD'), 2, 'Timeout');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D003', 1, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-11', 'YYYY-MM-DD'), 3,'Failed');
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D002', 4, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D005', 6, TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-16', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D004', 4, TO_DATE('2024-11-23', 'YYYY-MM-DD'), TO_DATE('2024-11-23', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D008', 6, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO devices_firmware (device_id, firmware_id, started_date, completed_date, attempt, error_message)
VALUES ('D004', 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-03', 'YYYY-MM-DD'), 1, NULL);


--settings
INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('1', '?', 'IoT_Project', 'Registry_A', SYSDATE,
        TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('2', '?', 'IoT_Project', 'Registry_B', SYSDATE,
        NULL, NULL);

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('3', '?', 'IoT_Project', 'Registry_C', SYSDATE, NULL, NULL);

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('4', '?', 'IoT_Project', 'Registry_D', SYSDATE,
        TO_DATE('2023-04-21', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('5', '?', 'IoT_Project', 'Registry_E', SYSDATE,
        TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-10', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('6', '?', 'IoT_Project', 'Registry_E', SYSDATE,
        TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-05-14', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('7', '?', 'IoT_Project', 'Registry_E', SYSDATE,
        TO_DATE('2023-11-28', 'YYYY-MM-DD'), TO_DATE('2023-11-30', 'YYYY-MM-DD'));

INSERT INTO settings (device_id, host_name, project, registry, created_date, acknowledge_date, accepted_date)
VALUES ('8', '?', 'IoT_Project', 'Registry_E', SYSDATE,
        TO_DATE('2024-12-31', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));


--credential
INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D001', 'ES256',
        '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D002', 'RS256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiw79j0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2025-02-11', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D003', 'ES256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgahywqu7w0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D004', 'RS256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkedvyum0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2026-04-10', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D005', 'ES256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkdrkovxw0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2025-09-30', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D006', 'ES256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBsrjov4uAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2025-12-11', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D007', 'RS256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiG9w0BAQEFAAOCAsr7kfIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2025-05-01', 'YYYY-MM-DD'));

INSERT INTO credential (device_id, type, public_key, created_date, expired_date)
VALUES ('D008', 'ES256', '-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhdtkvs0BAQEFAAOCAQ8AMIIBCgKCAQEAsHQWBhHaxpYY+R/1rscY CAzAn/FUonnoc7ZU4UcKgCgNXOgMIXJTL5CJusCUIc4nSVkqgxcv9xbkGnOLTa55 eONI5UIuDaTK+daJnqisl829hII38wep0mKLVGIog5LB/pPxogck88Q+KFf0uiwV B4eGQSGaNbbCQDB+toxT0Z+PfxZeHE+aiDl6nJ6U6DJHD+a3N03/FVCBTF0Yrtuk hX/+RNhuAEmsRyCJLjNlGLNSkOI4bnbJQ8EN36jSrm8grCQEz15BBHjACg/q/ueD a+374oKjlXdMIKzcY2/7IVnlVlMzpClSR5TXvoie3U/oWxvWN/0yfqapUKgKqhbN 8wIDAQAB -----END PUBLIC KEY----- ',
        SYSDATE,TO_DATE('2026-07-21', 'YYYY-MM-DD'));

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
VALUES ('D005', 'debug', SYSDATE, 'Backup completed');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D005', 'info', SYSDATE, 'System start');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D005', 'info', SYSDATE, 'Finished successful');

INSERT INTO logs (device_id, "level", timestamp, message)
VALUES ('D005', 'warning', SYSDATE, 'Backup completed');

--configurations

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D001', 'v0.1.1',
        UTL_RAW.CAST_TO_RAW('1f8b080087cdc1520003f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-03', 'YYYY-MM-DD'));

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D002', 'v1.1.0', UTL_RAW.CAST_TO_RAW('c9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2024-12-11', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D003', 'v2.0,1', UTL_RAW.CAST_TO_RAW('87cdc15348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2025-01-01', 'YYYY-MM-DD'),
        TO_DATE('2023-03-02', 'YYYY-MM-DD'), NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D004', 'v1.0.1', UTL_RAW.CAST_TO_RAW('56798b080087cdc1520003f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        TO_DATE('2023-04-02', 'YYYY-MM-DD'), TO_DATE('2024-04-03', 'YYYY-MM-DD'));

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D005', 'v2.1.0', UTL_RAW.CAST_TO_RAW('y3f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D006', 'v2.0.0', UTL_RAW.CAST_TO_RAW('y3f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D007', 'v2.1.1', UTL_RAW.CAST_TO_RAW('y3f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, NULL);

INSERT INTO configurations (device_id, version, data, created_date, acknowledge_date, accepted_date)
VALUES ('D008', 'v3.0.0', UTL_RAW.CAST_TO_RAW('y3f348cdc9c9d75128cf2fca49d1e30200d7bbcdfc0e000000'),
        TO_DATE('2024-05-01', 'YYYY-MM-DD'), NULL, NULL);


--events
INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D001', 'Temperature Alert', '85°C',
        TO_DATE('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'warning');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D002', 'Battery Level', 'Low: 10%',
        TO_DATE('2023-01-02 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'info');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D003', 'Overheat', 'Critical: 95°C',
        TO_DATE('2023-01-03 14:20:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'error');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D004', 'Connection Lost', 'No signal',
        TO_DATE('2023-01-04 09:15:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'error');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D005', 'Firmware Update', 'Version 2.0 applied',
        TO_DATE('2025-01-05 16:45:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'info');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D006', 'Firmware Update', 'Version 2.1 applied',
        TO_DATE('2023-11-19 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'info');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D007', 'Humidity Level', '60% - level 3',
        TO_DATE('2023-01-05 22:13:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'info');

INSERT INTO events (device_id, name, value, timestamp, created_date, type)
VALUES ('D008', 'Firmware Updates Failed', ' Updates to Version 2.2 failed',
        TO_DATE('2024-06-24 18:03:00', 'YYYY-MM-DD HH24:MI:SS'),
        SYSDATE, 'error');


--meta
INSERT INTO meta (device_id, key, value)
VALUES ('D001', 'MaxTemp', 85);

INSERT INTO meta (device_id, key, value)
VALUES ('D002', 'MinTemp', 5);

INSERT INTO meta (device_id, key, value)
VALUES ('D003', 'BatteryLife', 80);

INSERT INTO meta (device_id, key, value)
VALUES ('D004', 'SignalStrength', 90);

INSERT INTO meta (device_id, key, value)
VALUES ('D005', 'UpdateInterval', 30);

INSERT INTO meta (device_id, key, value)
VALUES ('D006', 'Altitude', 250);

INSERT INTO meta (device_id, key, value)
VALUES ('D007', 'ConnectionStatus', 1);

INSERT INTO meta (device_id, key, value)
VALUES ('D008', 'Power', 10);

INSERT INTO meta (device_id, key, value)
VALUES ('D003', 'LightIntensity', 85);







