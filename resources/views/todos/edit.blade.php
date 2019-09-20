@extends('layouts.app')

@section('content')

    <h1 class="text-center">Editing Todo</h1>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card card-default">
                <div class="card-header">
                    <h1>Edit Todo</h1>
                </div>
                <div class="card-body">
                    <form action="/todos/{{$todo->id}}/update-todos/" method="POST">
                        {{ method_field('POST') }}
                        @csrf

                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="Name" value="{{$todo->name}}">
                        </div>
                        <div class="form-group">
                            <textarea name="descrp" placeholder="Description" class="form-control" value="{{$todo->descrp}}"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-warning">Update Todo</button>
                        </div>

                    </form>
                </div>

            </div>

            @extends('errors.form-error')

        </div>
    </div>

@endsection
