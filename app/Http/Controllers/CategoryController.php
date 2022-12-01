<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{

    public function index()
    {

        $categories = Category::orderBy('name', 'ASC');
        $categories = $categories->paginate(10);

        return view('category.index', compact('categories'));
    }

    public function create()
    {
        return view('category.add');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100'
        ]);

        $category = new Category;
        $category->name = $request->name;
        $category->save();
        return redirect()->route('category');
    }


    public function show(Category $category)
    {
        //
    }

    public function edit($id)
    {
        $category = Category::findOrFail($id);

        return view('category.edit', compact('category'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100'
        ]);

        $category = Category::findOrFail($id);
        $category->name = $request->name;
        $category->save();
        return redirect()->route('category');
    }

    public function destroy($id)
    {
        Category::destroy($id);
        return redirect()->route('category');
    }
}
