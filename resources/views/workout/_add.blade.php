@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    {{ __('Add Workout') }}
                </div>

                <div class="card-body">
                    <form method="POST" action="{{ route('workout.store') }}">
                        @csrf

                        @error('db_error')
                        <h4 class="text-danger text-center">{{$errors->first()}}</h4>
                        @enderror

                        <div class="row mb-3">
                            <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                       name="name" value="{{ old('name') }}" autocomplete="name" autofocus>

                                @error('name')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="day" class="col-md-4 col-form-label text-md-end">{{ __('Days') }}</label>

                            <div class="col-md-6">
                                <select id="days" name="days[]" class="form-select @error('day') is-invalid @enderror" multiple aria-label="multiple select">
                                    <option value="Sunday">Sunday</option>
                                    <option value="Monday">Monday</option>
                                    <option value="Tuesday">Tuesday</option>
                                    <option value="Wednesday">Wednesday</option>
                                    <option value="Thursday">Thursday</option>
                                    <option value="Friday">Friday</option>
                                    <option value="Saturday">Saturday</option>
                                </select>
                                <p class="">Select multiple by holding "ctrl".</p>

                                @error('days')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="asset" class="col-md-4 col-form-label text-md-end">{{ __('Image') }}</label>

                            <div class="col-md-6">
                                <div class="input-group" data-toggle="aizuploader" data-type="document">
                                    <div class="input-group-prepend">
                                        <div
                                            class="input-group-text bg-soft-secondary font-weight-medium">{{ __('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ __('Choose File') }}</div>
                                    <input type="hidden" name="asset" value="" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                                </div>
                            </div>
                            @error('asset')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>

                        <div class="row mb-3">
                            <label for="pods" class="col-md-4 col-form-label text-md-end">{{ __('Pods') }}</label>

                            <div class="col-md-2">
                                <input onchange="addPods(this.value)" id="pods" type="number" class="form-control @error('pods') is-invalid @enderror"
                                       name="pods" value="{{ old('pods') }}">

                                @error('pods')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>


                        <div id="pod-details" class="row">

                        </div>

                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Submit') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('script')
    <script id="pod-template" type="text/html">

        <div class="col-sm-12 col-md-6 pod-item">
            <h2>Pod {i}</h2>

            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Timesplit') }}</label>

                <div class="col-md-8">
                    <input type="text" class="form-control"
                           name="timesplit_{i}" value="">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Sets') }}</label>
                <div class="col-md-8">
                    <input type="text" class="form-control"
                           name="sets_{i}" value="">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Laps') }}</label>
                <div class="col-md-8">
                    <input type="text" class="form-control"
                           name="laps_{i}" value="">
                </div>
            </div>
            <div class="row mb-3">
                <label for="" class="col-md-4 col-form-label text-md-end">{{ __('Stations') }}</label>

                <div class="col-md-6">

                    <select name="stations_{i}[]" class="form-select stations-list" multiple aria-label="multiple select">
                        @foreach($stations as $key => $station)
                            <option value="{{$station->id}}">{{$station->name}}</option>
                        @endforeach
                    </select>

                </div>
            </div>
        </div>

    </script>

    <link href="https://releases.transloadit.com/uppy/v2.10.0/uppy.min.css" rel="stylesheet">
    <script src="https://releases.transloadit.com/uppy/v2.10.0/uppy.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            AIZ.uploader.initForInput();
            AIZ.uploader.removeAttachment();
            AIZ.uploader.previewGenerate();
        });

        function addPods(pods){
            var html = "";
            for(var i = 0; i < pods; i++){

                html += $("#pod-template")[0].innerHTML;

                html = html.replace(/{i}/g, i+1);
            }
            $("#pod-details").html(html);

            $('.stations-list').select2({
                theme: "classic"
            });
        }

    </script>
@endsection
