@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        {{ __('Workouts') }}
                        <br>
                        <div class="float-start">
                            <input type="text" placeholder="Search" id="search" class="form-control float-start">

                        </div>
                        <div class="float-end">
                            <a href="{{route('workout.add')}}" class="btn btn-sm btn-success">+ Add</a>
                        </div>

                    </div>

                    <div class="card-body">
                        <table class="table aiz-table mb-0">
                            <thead>
                                <tr>
                                    <th>{{__('Name')}}</th>
                                    <th>{{__('Days')}}</th>
                                    <th class="text-right">{{__('Options')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($workouts as $key => $workout)
                                    <tr>
                                        <td>{{ $workout->name }}</td>
                                        <td>{{ $workout->days }}</td>
                                        <td class="text-right">
                                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm"
                                               href="{{route('workout.edit', ['id'=>$workout->id] )}}"
                                               title="{{ __('Edit') }}">
                                                <i class="bi bi-pencil"></i>
                                            </a>
                                            <a onclick="return confirm('Are you sure you want to delete this item?')"
                                               class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                               href="{{route('workout.destroy', $workout->id)}}"
                                               title="{{ __('Delete') }}">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="mt-2">
                            {!! $workouts->links('pagination::bootstrap-4') !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        $(document).ready(function(){
            initialzieSearch();
        });
        function initialzieSearch(){
            $("#search").on("keyup", function(e){
                var searchParams = $(this).val().toLowerCase();

                $("table tbody tr").each(function (idx, item){
                    console.log($($(item).find("td")[0]).text().toLowerCase(), " ", searchParams, $(item).text().toLowerCase().indexOf(searchParams));
                    if($($(item).find("td")[0]).text().toLowerCase().indexOf(searchParams) < 0){
                        $(item).hide();
                    } else {
                        $(item).show();
                    }

                    if(searchParams.trim() === ""){
                        $(item).show();
                    }

                });
            });
        }
    </script>
@endsection

