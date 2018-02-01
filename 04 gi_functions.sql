create or replace FUNCTION GI_AUTHORISATION(NAME IN VARCHAR2, ROLE IN NUMBER)
RETURN BOOLEAN
IS
USERNAME VARCHAR2(50);
ROLEID NUMBER;

BEGIN
USERNAME := NULL;
ROLEID := NULL;

SELECT USER_NAME INTO USERNAME FROM GI_USERS WHERE UPPER(NAME) = UPPER(USER_NAME);

SELECT ROLE_ID INTO ROLEID FROM GI_USERS WHERE UPPER(USERNAME) = UPPER(USER_NAME);

IF ROLEID = ROLE THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;

END;
/
create or replace FUNCTION gi_generate_code
RETURN varchar2
AS
code varchar2(100);
BEGIN
code := DBMS_RANDOM.string('x',10);
RETURN code;
END;
/
create or replace function gi_getMD5(
  in_string in varchar2)
return varchar2
as
  cln_md5raw raw(2000);
  out_raw raw(16);
begin
  cln_md5raw := utl_raw.cast_to_raw(in_string);
  dbms_obfuscation_toolkit.md5(input=>cln_md5raw,checksum=>out_raw);
  -- return hex version (32 length)
  return rawtohex(out_raw);
end;
/
create or replace FUNCTION gi_user_validate_fnc (
 p_username IN VARCHAR2, --User_Name
 p_password IN VARCHAR2 -- Password
)
 RETURN BOOLEAN
AS
 lc_pwd_exit VARCHAR2 (1);
 a_password VARCHAR2(80);
BEGIN
 -- Validate whether the user exits or not
 a_password := gi_getMD5(UPPER(p_password) || (p_username));
 SELECT 'Y'
 INTO lc_pwd_exit
 FROM GI_USERS
 WHERE (user_name) = (p_username) AND (user_pwd) = (a_password);

RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END gi_user_validate_fnc;
/
create or replace FUNCTION CURRENT_STATUS(TEXT IN VARCHAR2)
RETURN NUMBER
IS
VALUE NUMBER;
BEGIN

SELECT VALUE_ID INTO VALUE FROM GI_LOOKUP_VALUES WHERE UPPER(DESCRIPTION) = UPPER(TEXT);

IF VALUE IS NOT NULL THEN
RETURN VALUE;
ELSE RETURN NULL;
END IF;

END;
/
