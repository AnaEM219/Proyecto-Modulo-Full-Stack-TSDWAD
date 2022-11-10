import pymysql


connection= pymysql.connect(
    host='localhost',
    user='root',
    passwd= 'fsfal4ever',
    db='mountainhikedef', 
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
)

#UPDATE
try:
    with connection.cursor() as cursor:
        sql = "UPDATE blog SET fecha= '1 de enero' WHERE id_blog = 1;"
        cursor.execute(sql)
        connection.commit()
finally:
    connection.close()
#READ
try:
    with connection.cursor() as cursor:
        sql = "SELECT fecha, titulo, cuerpo FROM blog WHERE id_blog = %s;"
        cursor.execute(sql, ('2'))
        result=cursor.fetchone()
        print(result)
finally:
    connection.close()
#CREATE
try:
    with connection.cursor() as cursor:
        sql="INSERT INTO blog (admin_id_admin, fecha, titulo, cuerpo) VALUES (%s,%s,%s, %s);"
        cursor.execute(sql, (1,'10 de Noviembre','Fuertes LLuvias se esperan para Diciembre', 'El servicio meteorológico prevee lluvias abundantes y poco comunes para esta época del año'))
        connection.commit()
finally:
    connection.close()
#UPDATE
try:
    with connection.cursor() as cursor:
        sql="UPDATE blog SET fecha=%s, titulo=%s, cuerpo=%s WHERE id_blog=22;"
        cursor.execute(sql, ('11 de Noviembre', 'november rain', 'El servicio meteorológico anuncia una gran tormente para mediados de este mes'))
        connection.commit()
finally:
    connection.close()
