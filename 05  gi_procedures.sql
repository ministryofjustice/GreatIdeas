/*
create or replace PROCEDURE gi_add_user (firstname in varchar2, lastname in varchar2, username in varchar2, email in varchar2, phoneNum in varchar2, directorate in number,businessArea in number, businessAreaOther in varchar2, team in number, teamOther in varchar2, OFFICE in varchar2)
AS
e varchar2(16);
l_body_html varchar2(1000);
b VARCHAR2(1000);
BEGIN

e := gi_generate_code;

INSERT INTO GI_USERS (user_name, first_name, last_name, creation_date, start_date, last_update_date, user_pwd, password_flag, email_address, user_contact_num, user_directorate, user_business_area, user_business_area_other, user_team, user_team_other,office, ROLE_ID,CREATED_BY,LAST_UPDATED_BY)

VALUES (UPPER(username), INITCAP(firstname), INITCAP(lastname), SYSDATE, SYSDATE, SYSDATE,  gi_getMD5(UPPER(e) || upper(email)), 0, UPPER(email), phoneNum, directorate, businessArea, UPPER(businessAreaOther), team, UPPER(teamOther), office,1,1,1);

b := INITCAP(firstname) || ' ' || INITCAP(lastname) || '.<p> Welcome to Great Idea, your temporary password is: ' || UPPER(e) || '</p><p>You will be asked to change your password when you log in.</p>';

l_body_html := '<p>Hello ' || b || '</p>';

APEX_MAIL.SEND(
    p_to        => email,
        p_from      => 'greatidea@justice.gov.uk',
        p_subj      => 'No Reply',
        p_body      => l_body_html,
        p_body_html => l_body_html);

APEX_MAIL.PUSH_QUEUE;

commit;
END gi_add_user;
/
*/

create or replace PROCEDURE gi_auto_email (email in varchar2, message in varchar2)
IS
b varchar2(100);
l_body_html varchar2(100);
firstname varchar2(50);
lastname varchar2(50);

BEGIN

SELECT GI_USERS.first_name, GI_USERS.last_name INTO firstname, lastname FROM GI_USERS WHERE (email) = UPPER(GI_USERS.user_name);
b := firstname || ' ' || lastname || '. ' || UPPER(message);

l_body_html := '<p>Hello, ' || b || '</p>';

APEX_MAIL.SEND(
p_to        => email,
p_from      => 'greatidea@justice.gov.uk',
p_subj      => 'APEX_MAIL: DO NOT REPLY TO THIS MESSAGE',
p_body      => 'DO NOT REPLY',
p_body_html => l_body_html);
APEX_MAIL.PUSH_QUEUE;
END;
/
/*
create or replace PROCEDURE gi_add_user_admin (firstname in varchar2, lastname in varchar2, username in varchar2, email in varchar2, phoneNum in varchar2, directorate in number, businessArea in number, businessAreaOther in varchar2, team in number, teamOther in varchar2, OFFICE in varchar2, ROLE_ID in number)
AS
e varchar2(16);
l_body_html varchar2(1000);

b VARCHAR2(1000);
c VARCHAR2(1000);
BEGIN

e := gi_generate_code;

INSERT INTO GI_USERS (user_name, first_name, last_name, creation_date, start_date, last_update_date, user_pwd, password_flag, email_address, user_contact_num, user_directorate, user_business_area, user_business_area_other, user_team, user_team_other,office, ROLE_ID,CREATED_BY,LAST_UPDATED_BY)

VALUES ((username), INITCAP(firstname), INITCAP(lastname), SYSDATE, SYSDATE, SYSDATE,  gi_getMD5(UPPER(e) || UPPER(email)), 0, (email), phoneNum, directorate, businessArea, (businessAreaOther), team, (teamOther), office,role_id,1,1);

     c  := INITCAP(firstname) || ' ' || INITCAP(lastname) || '<p> You have been set up to use the Great Idea�s application. Your username and temporary password will be sent to you shortly. Once you have received your login details, please click on the link below to access the Great Idea�s application </br> https://apex.oracle.com/pls/apex/f?p=87886:LOGIN_DESKTOP:7675770489349::::: &nbsp </p>';
       l_body_html := '<p>Hello ' || c || ',</p>';

       APEX_MAIL.SEND(
    p_to        => email,
        p_from      => 'greatidea@justice.gov.uk',
        p_subj      => 'No Reply',
        p_body      => l_body_html,
        p_body_html => l_body_html);

APEX_MAIL.PUSH_QUEUE;

b := INITCAP(firstname) || ' ' || INITCAP(lastname) || '.<p> An account for Great Ideas has been created for you, your temporary password is: ' || UPPER(e) || '</p><p>You will be asked to change your password when you log in.</p>';

l_body_html := '<p>Hello, ' || b || '</p>';

APEX_MAIL.SEND(
    p_to        => email,
        p_from      => 'greatidea@justice.gov.uk',
        p_subj      => 'No Reply',
        p_body      => l_body_html,
        p_body_html => l_body_html);

APEX_MAIL.PUSH_QUEUE;

commit;
END gi_add_user_admin;
/
*/
create or replace procedure "GI_P21_SEARCH_TABLE"
(keyword IN VARCHAR2,
directorate IN NUMBER,
ba IN NUMBER,
team IN NUMBER)
is
begin
SELECT
    D.DIR_NAME AS "Directorate",
    BA.BA_NAME AS "Business Area",
    T.TEAM_NAME AS "Team",
    I.GI_REF AS "GI Ref",
    U.FIRST_NAME || ' ' || U.LAST_NAME AS "Initiator",
    I.TITLE_OF_IDEA AS "Title",
    I.DATE_LOGGED AS "Date Logged",
    I.CURRENT_STATUS AS "Current Status"
FROM
    GI_IDEAS I
    JOIN GI_USERS U
        ON I.INITIATOR_ID = U.USER_ID
    JOIN GI_DIRECTORATE D
        ON U.USER_DIRECTORATE = D.DIR_ID
    JOIN GI_BUSINESS_AREAS BA
        ON U.USER_BUSINESS_AREA = BA.BA_ID
    JOIN GI_TEAMS T
        ON U.USER_TEAM = T.TEAM_ID
WHERE

    LOWER(I.TITLE_OF_IDEA) LIKE LOWER('%' || NVL(:P21_SEARCH_BAR, '') || '%')
    --U.USER_DIRECTORATE = :P21_DIRECTORATE_DROP_DOWN
ORDER BY
    I.DATE_LOGGED DESC
end;
/
create or replace PROCEDURE gi_reset_user_pwd (email in varchar2, newpwd in varchar2)
AS
BEGIN
UPDATE GI_USERS SET USER_PWD  = gi_getMD5(UPPER(newpwd) || UPPER(email)) WHERE UPPER(email) = UPPER(USER_NAME);
UPDATE GI_USERS SET PASSWORD_FLAG  = 0 WHERE UPPER(email) = UPPER(USER_NAME);
COMMIT;
END;
/
create or replace PROCEDURE gi_auto_email (email in varchar2, message in varchar2)
IS
b varchar2(100);
l_body_html varchar2(100);
firstname varchar2(50);
lastname varchar2(50);

BEGIN

SELECT GI_USERS.first_name, GI_USERS.last_name INTO firstname, lastname FROM GI_USERS WHERE (email) = UPPER(GI_USERS.user_name);
b := firstname || ' ' || lastname || '. ' || UPPER(message);

l_body_html := '<p>Hello, ' || b || '</p>';

APEX_MAIL.SEND(
p_to        => email,
p_from      => 'greatidea@justice.gov.uk',
p_subj      => 'APEX_MAIL: DO NOT REPLY TO THIS MESSAGE',
p_body      => 'DO NOT REPLY',
p_body_html => l_body_html);
APEX_MAIL.PUSH_QUEUE;
END;
/
create or replace PROCEDURE gi_add_user_temp (firstname in varchar2, lastname in varchar2, username in varchar2, email in varchar2, phoneNum in varchar2, directorate in number,businessArea in number, businessAreaOther in varchar2, team in number, teamOther in varchar2, OFFICE in varchar2, password in varchar2)
AS

e varchar2(100);

BEGIN

e := password;

INSERT INTO GI_USERS (user_name, first_name, last_name, creation_date, start_date, last_update_date, user_pwd, password_flag, email_address, user_contact_num, user_directorate, user_business_area, user_business_area_other, user_team, user_team_other,office, ROLE_ID,CREATED_BY,LAST_UPDATED_BY)

VALUES (UPPER(username), INITCAP(firstname), INITCAP(lastname), SYSDATE, SYSDATE, SYSDATE,  gi_getMD5(UPPER(e) || upper(email)), 1, UPPER(email), phoneNum, directorate, businessArea, UPPER(businessAreaOther), team, UPPER(teamOther), office,1,1,1);

commit;
END gi_add_user_temp;
/

create or replace PROCEDURE gi_add_user_admin_temp (firstname in varchar2, lastname in varchar2, username in varchar2, email in varchar2, phoneNum in varchar2, directorate in number, businessArea in number, businessAreaOther in varchar2, team in number, teamOther in varchar2, OFFICE in varchar2, ROLE_ID in number, password in varchar2)
AS
e varchar2(100);

BEGIN

e := password;

INSERT INTO GI_USERS (user_name, first_name, last_name, creation_date, start_date, last_update_date, user_pwd, password_flag, email_address, user_contact_num, user_directorate, user_business_area, user_business_area_other, user_team, user_team_other,office, ROLE_ID,CREATED_BY,LAST_UPDATED_BY)

VALUES ((username), INITCAP(firstname), INITCAP(lastname), SYSDATE, SYSDATE, SYSDATE,  gi_getMD5(UPPER(e) || UPPER(email)), 0, (email), phoneNum, directorate, businessArea, (businessAreaOther), team, (teamOther), office,role_id,1,1);

commit;
END gi_add_user_admin_temp;
/
