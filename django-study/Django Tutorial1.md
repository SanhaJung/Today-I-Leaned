# Django Tutorial - part 1



* ## Creating a project

  ```shell
  .../> django-admin startproject mysite
  ```

  * 현재 디렉토리에 생성됨

  * 파일 구조

    ```django
    mysite/
        manage.py
        mysite/
            __init__.py
            settings.py
            urls.py
            asgi.py
            wsgi.py
    ```

    * `manage.py`: command-line utility(interact Django project)  

      ​	[dnago-admin and manage.py](https://docs.djangoproject.com/en/3.1/ref/django-admin/) 

    * `mysite/`(root): container for project.

      ​							Python package(e.g. import inside : `mysite.urls`)

    *  `mysite/__init__.py` : empty file, donsider a python package

    * `mysite/settings.py` : settings/configuration

      ​	[Django settings](https://docs.djangoproject.com/en/3.1/topics/settings/)

    * `mysite/urls.py` : URL declaration

      ​	[URL dispatcher](https://docs.djangoproject.com/en/3.1/topics/http/urls/)

    * `mysite/asgin.py` : entry-point for ASGI-compatible web server

      ​	[How to deploy with ASGI](https://docs.djangoproject.com/en/3.1/howto/deployment/asgi/)

    * `mysite/wsgi.py` : entry-poing for WSGI-compatible web server

      ​	[How to deploy with WSGI](https://docs.djangoproject.com/en/3.1/howto/deployment/wsgi/)

* ## The developyment server

  ```shell
  ...\> py manage.py runserver
  ```

  ```django
  Performing system checks...
  
  System check identified no issues (0 silenced).
  
  You have unapplied migrations; your app may not work properly until they are applied.
  Run 'python manage.py migrate' to apply them.
  
  January 14, 2021 - 15:50:53
  Django version 3.1, using settings 'mysite.settings'
  Starting development server at http://127.0.0.1:8000/
  Quit the server with CONTROL-C.
  ```

   * warning: about upnapplied database migrations

  * ##### Changing the port

    * default: 8000
    
    ``` django
    ...\> py manage.py runserver 8080
    ```
    
    * change the server's port: 8080
    
    ``` django
    ...\> py manage.py runserver 0:8000
    ```
    
    * change the server's IP: pass it along with the port
  
* ## creating the polls app
  * Django application: automatically generate basic directory structure 

  * projects vs. app

    * app: certain does something - e.g. a seblog system, a database of public records

      ​	   : in multiple projects

      ​       : anywhere on [Python path](https://docs.python.org/3/tutorial/modules.html#tut-searchpath)

    * project: collection of configuragion , app

      ​			   contaion mutiple apps

  * create polls app

    * same directory as `manage.py`

    ``` django
    py manage.py startapp polls
    ```

    * `polls` directory 

     ``` django
    polls/
        __init__.py
        admin.py
        apps.py
        migrations/
            __init__.py
        models.py
        tests.py
        views.py
     ```

* ## Write your first view

  1. first view  --> `polls/views.py` 

  ``` django
  from django.http import HttpResponse
  
  def index(request):
  	return HttpResponse("Hello, world. Your're at the polls index.")
  ```

  2. `polls/urls.py`

  ``` django
  from django.urls import path
  
  from . import views
  
  urlpatterns = [
      path('', views.index, name='index')
  ]
  ```

  3. point the root URLconf at the `polls/urls.py`module

     ``` django
     from django.contrib import admin
     from django.urls import include, path
     
     urlpatterns = [
         path('polls/', include('polls.urls')),
         path('admin/', admin.site.urls),
     ]
     ```

     * `include()` : referencing other URLconfs

       ​					 :  The only exception - `admin.site.urls` 

     * `path()` : 4 arguemtnts(required: `rout`, `view` / optional: `kwars`, `name`)

       * arguemtnt

         ​    `route`: string, URL pattern, find requested URL

         ​				: don't search GET, POST, domain name

            `view`: find a matching pattern 

         ​				 --> `HttpRequest`object as the first argument

           `kwargs`: dictionary to the target view

           `name`: Naming URL 

         ​               --> global hages to the URL patterns while touchgin a single file

  4. ``` django
     ...\> py manage.py runserver
     ```

     * http://localhost:8000/polls/



