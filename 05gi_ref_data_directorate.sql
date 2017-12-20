--- GI_DIRECTORATE

BEGIN

INSERT INTO GI_DIRECTORATE
(DIR_NAME, START_DATE, END_DATE, CREATED_BY, CREATION_DATE,LAST_UPDATE_DATE, LAST_UPDATED_BY)
VALUES
('Case Management', SYSDATE, NULL, 1, SYSDATE, SYSDATE, 1);

INSERT INTO GI_DIRECTORATE
(DIR_NAME, START_DATE, END_DATE, CREATED_BY, CREATION_DATE,LAST_UPDATE_DATE, LAST_UPDATED_BY)
VALUES 
('Legal Aid Commissioning and Strategy',  SYSDATE, NULL, 1, SYSDATE, SYSDATE, 1);

INSERT INTO GI_DIRECTORATE
(DIR_NAME, START_DATE, END_DATE, CREATED_BY, CREATION_DATE,LAST_UPDATE_DATE, LAST_UPDATED_BY)
VALUES
('Finance and Digital',  SYSDATE, NULL, 1, SYSDATE, SYSDATE, 1);

INSERT INTO GI_DIRECTORATE
(DIR_NAME, START_DATE, END_DATE, CREATED_BY, CREATION_DATE,LAST_UPDATE_DATE, LAST_UPDATED_BY)
VALUES
('Corporate Centre',  SYSDATE, NULL, 1, SYSDATE, SYSDATE, 1);

INSERT INTO GI_DIRECTORATE
(DIR_NAME, START_DATE, END_DATE, CREATED_BY, CREATION_DATE,LAST_UPDATE_DATE, LAST_UPDATED_BY)
VALUES
('Central Legal',  SYSDATE, NULL, 1, SYSDATE, SYSDATE, 1);

COMMIT;
END;
