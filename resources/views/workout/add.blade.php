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

                        <div class="row">
                            <label for="pods" class="col-md-4 col-form-label text-md-end">{{ __('Waterbreak') }}</label>

                            <div class="col-md-3">
                                <input id="waterbreak_freq" name="waterbreak_freq" type="number" class="form-control">
                                <p class="">Frequency</p>

                                @error('waterbreak_freq')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="waterbreak_time" class="col-md-4 col-form-label text-md-end">&nbsp;</label>

                            <div class="col-md-3">
                                <input id="waterbreak_time" name="waterbreak_time" type="number" class="form-control">
                                <p class="">Time</p>

                                @error('waterbreak_time')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
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



                        <div class="clearfix"></div>
                        <div class="row mb-0">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary float-end">
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

        <div class="col-sm-12 pod-item">
            <h2>Pod {i}</h2>
            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Sets') }}</label>
                <div class="col-md-8">
                    <input type="number" class="form-control" onchange="addTimeSplit(this.value, '{i}')"
                           name="sets_{i}" value="">
                </div>
            </div>
            <div class="row mb-3" id="timesplit_{i}_container">

            </div>

            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Laps') }}</label>
                <div class="col-md-8">
                    <input type="text" class="form-control"
                           name="laps_{i}" value="">
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-md-4 col-form-label text-md-end">{{ __('Stations') }}</label>
                <div class="col-md-8">
                    <input class="form-control" onchange="addStation(this.value, '{i}')"
                           type="number"
                           name="stations_{i}" id="stations_{i}" value="">
                </div>
            </div>
            <div class="row mb-3" id="stations_{i}_container">

            </div>

            {{--            <div class="row mb-3">--}}
            {{--                <label for="" class="col-md-4 col-form-label text-md-end">{{ __('Stations') }}</label>--}}

            {{--                <div class="col-md-6">--}}

            {{--                    <select id="stations_{i}" name="stations_{i}[]" class="form-select stations-list" multiple aria-label="multiple select">--}}
            {{--                        @foreach($stations as $key => $station)--}}
            {{--                            <option value="{{$station->id}}">{{$station->name}}</option>--}}
            {{--                        @endforeach--}}
            {{--                    </select>--}}

            {{--                </div>--}}
            {{--            </div>--}}
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

        var app_stations = @json($stations);

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

        function addStation(stations, id){
            var options = "";
            for (var i = 0; i < stations; i++) {
                options += "<div class=\"col-sm-4\">";
                options += "<select name=\"stations_"+id+"[]\" onchange=\"showVideo(this, this.value)\" class=\"form-select stations-list"+id+"\" aria-label=\"select\">";
                options += "<option value=\"\">Select one</option>";
                $.each(app_stations, function (a,b) {
                    options += "<option value=\""+b.id+"\">"+b.cname +" - "+b.name+"</option>";
                });
                options += "</select>";
                options += "</div>";
            }
            $("#stations_"+id+"_container").html(options);
            $(".stations-list"+id).select2({
                theme: "classic"
            });
        }

        function addTimeSplit(timeSplit, id){
            var options = "";
            for (var i = 0; i < timeSplit; i++) {
                options += "<label class=\"col-md-4 col-form-label text-md-end\">{{ __('Timesplit') }}</label>";

                options += "<div class=\"col-md-8 mb-1\">";
                options += "<input type=\"text\" class=\"form-control\" name=\"timesplit_"+id+"[]\" value=\"\">";
                options += "</div>";
            }
            $("#timesplit_"+id+"_container").html(options);
        }

        function showVideo(obj, id){
            var asset_path = "";
            $.each(app_stations, function (a,b) {
                if(id == b.id) {
                    asset_path = b.file_name;
                }
            });

            $(obj).prev('video').remove();
            $(obj).next('video').remove();

            if(asset_path != "") {
                var options = "<video width=\"100%\" height=\"200\" controls>";
                options += "<source src=\"{{getBaseURL()}}storage/app/"+asset_path+"\" type=\"video/mp4\">";
                options += "</video>";

                $(obj).after(options);
            }
        }

    </script>
@endsection
