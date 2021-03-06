CREATE OR REPLACE  TRIGGER  BI_GI_BUSINESS_AREAS
BEFORE INSERT ON GI_BUSINESS_AREAS
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.BA_ID is null then
      select GI_BUSINESS_AREAS_SEQ.nextval into :NEW.BA_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE TRIGGER  BI_GI_COMMENTS
BEFORE INSERT ON GI_COMMENTS
FOR EACH ROW
DECLARE
ln_user_id NUMBER;
BEGIN
   -- get user_id from function
   ln_user_id := 1;

   IF :NEW."COM_ID" is null then
      select GI_COMMENTS_SEQ.nextval into :NEW.COM_ID from dual;
   end if;

   if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;

END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_DIRECTORATE
BEFORE INSERT ON GI_DIRECTORATE
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.DIR_ID is null then
      select GI_DIRECTORATE_SEQ.nextval into :NEW.DIR_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_IDEAS
BEFORE INSERT ON GI_IDEAS
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.GI_ID is null then
      select GI_IDEAS_SEQ.nextval into :NEW.GI_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_IT_SYSTEMS
BEFORE INSERT ON GI_IT_SYSTEMS
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.SYS_ID is null then
      select GI_IT_SYSTEMS_SEQ.nextval into :NEW.SYS_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_LOOKUP_VALUES
BEFORE INSERT ON GI_LOOKUP_VALUES
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.VALUE_ID is null then
      select GI_LOOKUP_VALUES_SEQ.nextval into :NEW.VALUE_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_OFFICE
BEFORE INSERT ON GI_OFFICE
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.OFFICE_ID is null then
      select GI_OFFICE_SEQ.nextval into :NEW.OFFICE_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_STATUS_HISTORY
BEFORE INSERT ON GI_STATUS_HISTORY
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.STAT_HIS_ID is null then
      select GI_STATUS_HISTORY_SEQ.nextval into :NEW.STAT_HIS_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE TRIGGER  BI_GI_USER_ROLES
BEFORE INSERT ON GI_ROLES
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.ROLE_ID is null then
      select GI_ROLES_SEQ.nextval into :NEW.ROLE_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_TEAMS
BEFORE INSERT ON GI_TEAMS
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.TEAM_ID is null then
      select GI_TEAMS_SEQ.nextval into :NEW.TEAM_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_GI_USERS
BEFORE INSERT ON GI_USERS
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.USER_ID is null then
      select GI_USERS_SEQ.nextval into :NEW.USER_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
CREATE OR REPLACE  TRIGGER  BI_VOTING
BEFORE INSERT ON GI_VOTING
FOR EACH ROW
DECLARE
ln_user_id            NUMBER;

BEGIN
   -- get user_id from function
   ln_user_id := 1;
   if :NEW.VOTE_ID is null then
      select GI_VOTING_SEQ.nextval into :NEW.VOTE_ID from dual;
   end if;
    if :NEW."CREATION_DATE" is null then
      :NEW."CREATION_DATE" := SYSDATE;
   end if;

   if :NEW."CREATED_BY" is null then
      :NEW."CREATED_BY" := ln_user_id;
   end if;

    if :NEW."LAST_UPDATED_BY" is null then
      :NEW."LAST_UPDATED_BY" := ln_user_id;
   end if;

   if :NEW."LAST_UPDATE_DATE" is null then
      :NEW."LAST_UPDATE_DATE" := SYSDATE;
   end if;
END;
/
