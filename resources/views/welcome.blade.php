<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Things To Do</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                padding: 20px;
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            /*.links > a {*/
                /*color: dodgerblue;*/
                /*padding: 0 25px;*/
                /*font-size: 20px;*/
                /*font-weight: 600;*/
                /*letter-spacing: .1rem;*/
                /*text-decoration: none;*/
                /*text-transform: uppercase;*/
            /*}*/

            a {
                background-color: #d61016;
                color: white;
                padding: 1em 1.5em;
                text-decoration: none;
                text-transform: uppercase;
            }

            a:hover {
                background-color: #d61016;;
            }

            a:active {
                background-color: black;
            }

            a:visited {
                background-color: #d61016;
            }

            .pics{
                margin-bottom: 100px;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="content">
                
                <div class="pics">
                    <img src="{{url('img/thingstodo.png')}}" class="img-fluid" alt="">
                </div>
                
                <div>
                    <a href="/todos">
                        THINGS TO DO
                    </a> 
                </div>
                
            </div>
        </div>
    </body>
</html>
