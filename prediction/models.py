from django.db import models


class Administer(models.Model):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=20, blank=True, null=True)
    password = models.CharField(max_length=50, blank=True, null=True)
    head_img = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'administer'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class PostData(models.Model):
    user_id = models.PositiveIntegerField()
    computer_name = models.IntegerField(blank=True, null=True)
    computer_size = models.IntegerField(blank=True, null=True)
    computer_color = models.IntegerField(blank=True, null=True)
    order_channel = models.IntegerField(blank=True, null=True)
    customer_will = models.IntegerField(blank=True, null=True)
    computer_configuration = models.IntegerField(blank=True, null=True)
    order_factor = models.IntegerField(blank=True, null=True)
    customer_salary = models.IntegerField(blank=True, null=True)
    customer_cost = models.IntegerField(blank=True, null=True)
    urgent_need = models.IntegerField(blank=True, null=True)
    total_score = models.FloatField(blank=True, null=True)
    result = models.FloatField(blank=True, null=True)
    post_time = models.DateTimeField()
    verdict = models.TextField(blank=True, null=True)
    result1 = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'post_data'


class User(models.Model):
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=32)
    head_img = models.CharField(max_length=255)
    register_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user'

