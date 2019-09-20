@extends('layouts.app')

@section('content')

    <h1 class="text-center">Create Todos</h1>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card card-default">
                <div class="card-header">
                    <h1>Create New Todo</h1>
                </div>
                <div class="card-body">
                    <form action="store-todos" method="POST">
                        @csrf
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <textarea name="descrp" placeholder="Description" cols="5" rows="5" class="form-control"></textarea>
                        </div>
                        <div class="form-group text-center">
                           <button type="submit" class="btn btn-warning">Create Todos</button>
                        </div>
                    </form>
                </div>

            </div>

            @extends('errors.form-error')

        </div>
    </div>

    @endsection
