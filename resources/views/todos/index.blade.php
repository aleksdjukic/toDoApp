@extends('layouts.app')

@section('title')
    Todos list
    @endsection

@section('content')
    <h1 class="text-center">TO DO PAGE</h1>
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card card-default">
                <div class="card-header">

                </div>
                <div class="card-body">
                    @foreach($todos as $todo)
                        <ul class="list-group">
                            <li class="list-group-item">
                                {{$todo->name}}

                                @if(!$todo->completed)
                                    <a href="/todos/{{$todo->id}}/complete" class="btn btn-danger btn-sm float-right">Completed</a>
                                    @endif


                                <a href="/todos/{{$todo->id}}" class="btn btn-warning btn-sm float-right mr-2">View</a>

                            </li>
                        </ul>
                    @endforeach
                </div>
            </div>

            @if(session()->has('delete'))

                <div class="alert alert-success">
                    {{session()->get('delete')}}
                </div>

            @endif
            @if(session()->has('completed'))

                <div class="alert alert-success">
                    {{session()->get('completed')}}
                </div>

            @endif
        </div>
    </div>

    @endsection