<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Todo;
use phpDocumentor\Reflection\DocBlock\Tags\Return_;

class TodosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $todos = Todo::all();

        return view('todos.index')->with('todos', $todos);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('todos.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate(request(),[
            'name' => 'required|min:6|max:30',
            'descrp' => 'required|min:8'
        ]);
        $data = request()->all();

        $todo = new Todo();
        $todo->name = $data['name'];
        $todo->descrp = $data['descrp'];
        $todo->completed = false;

        $todo->save();

        session()->flash('success', 'Todo created successfuly');

        return redirect('/todos');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $todo = Todo::findOrFail($id);

        return view('todos.show')->with('todo', $todo);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $todo = Todo::findOrFail($id);

        return view('todos.edit')->with('todo', $todo);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updated(Request $request, $id)
    {
//        $this->validate(request(),[
//            'name' => 'required|min:6|max:12',
//            'descrp' => 'required|min:8'
//        ]);

        $data = $request->all();
        $todo = Todo::findOrFail($id);

        $todo->name = $data['name'];
        $todo->descrp = $data['descrp'];

        $todo->save();

        return redirect('/todos');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $todo = Todo::findOrFail($id);
        $todo->delete();

        session()->flash('delete', 'Todo has been delete');
        return redirect('todos');
    }
    public function complete(Todo $todo){

        $todo->completed = true;
        $todo->save();

        session()->flash('completed', 'Task has been completed');
        return redirect('todos');
    }
}
