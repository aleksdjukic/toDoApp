@extends('layouts.app')

@section('title')
    Show todo: {{$todo->name}}
@endsection
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center">{{$todo->name}}</h1>

            <div class="card card-default">
                <div class="card-header">Details</div>
                <div class="card-body">
                    {{$todo->descrp}}
                </div>
                <a href="/todos/{{$todo->id}}/edit" class="btn btn-success btn-sm my-1">Edit</a>
                <a href="/todos/{{$todo->id}}/delete" class="btn btn-danger btn-sm my-1">Delete</a>
            </div>

        </div>
    </div>
    @endsection