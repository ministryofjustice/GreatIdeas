--- GI_ROLES
--- Created_by and Creation_date get updated by a trigger

BEGIN
INSERT INTO gi_roles(role_name, start_date)
values ('LAA Staff', sysdate);

INSERT INTO gi_roles(role_name,start_date)
values('Admin',sysdate);

INSERT INTO gi_roles(role_name,start_date)
values('Great Idea Lead',sysdate);

INSERT INTO gi_roles(role_name,start_date)
values('Senior Leaders',sysdate);

COMMIT;
END;
