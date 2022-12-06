@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    {{ __('Station') }}
                    <div class="float-end">
                        <a href="{{route('station.add')}}" class="btn btn-sm btn-success">+ Add</a>
                    </div>

                </div>

                <div class="card-body">
                    <table class="table aiz-table mb-0">
                        <thead>
                        <tr>
                            <th>{{__('Category')}}</th>
                            <th>{{__('Name')}}</th>
                            <th>{{__('Asset')}}</th>
                            <th class="text-right">{{__('Options')}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($stations as $key => $station)
                            <tr>
                                <td>{{ $station->cname }}</td>
                                <td>{{ $station->name }}</td>
                                <td>@if($station->asset != "" || $station->asset != null)
                                        <video width="200" height="200" controls>
                                            <source src="{{uploaded_asset($station->asset)}}" type="video/mp4">
                                        </video>
                                    @endif
                                </td>
                                <td class="text-right">
                                    <a class="btn btn-soft-primary btn-icon btn-circle btn-sm"
                                       href="{{route('station.edit', ['id'=>$station->id] )}}" title="{{ __('Edit') }}">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a onclick="return confirm('Are you sure you want to delete this item?')" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                       href="{{route('station.destroy', $station->id)}}" title="{{ __('Delete') }}">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="mt-2">
                        {!! $stations->links('pagination::bootstrap-4') !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
