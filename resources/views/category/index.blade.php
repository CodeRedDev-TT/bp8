@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    {{ __('Category') }}
                    <div class="float-end">
                        <a href="{{route('category.add')}}" class="btn btn-sm btn-success">+ Add</a>
                    </div>

                </div>

                <div class="card-body">
                    <table class="table aiz-table mb-0">
                        <thead>
                        <tr>
                            <th>{{__('Name')}}</th>
                            <th class="text-right">{{__('Options')}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($categories as $key => $category)
                            <tr>
                                <td>{{ $category->name }}</td>
                                <td class="text-right">
                                    <a class="btn btn-soft-primary btn-icon btn-circle btn-sm"
                                       href="{{route('category.edit', ['id'=>$category->id] )}}" title="{{ __('Edit') }}">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a onclick="return confirm('Are you sure you wnat to delete this item?')" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                       href="{{route('category.destroy', $category->id)}}" title="{{ __('Delete') }}">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="mt-2">
                        {!! $categories->links('pagination::bootstrap-4') !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
