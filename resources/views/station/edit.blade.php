@extends('layouts.app')


@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    {{ __('Edit Category') }}
                </div>

                <div class="card-body">
                    <form method="POST" action="{{ route('station.update', $station->id) }}">
                        @csrf

                        @error('db_error')
                        <h4 class="text-danger text-center">{{$errors->first()}}</h4>
                        @enderror

                        <div class="row mb-3">
                            <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                       name="name" value="{{$station->name}}" autocomplete="name" autofocus>

                                @error('name')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="category" class="col-md-4 col-form-label text-md-end">{{ __('Categories') }}</label>

                            <div class="col-md-6">

                                <select id="category" name="categories[]" class="form-select @error('category') is-invalid @enderror" multiple aria-label="multiple select">
                                    @foreach($categories as $key => $category)
                                        <option @if(in_array($category->id, $stationcategories)) selected @endif value="{{$category->id}}">{{$category->name}}</option>
                                    @endforeach
                                </select>

                                @error('category')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

{{--                        <div class="row mb-3">--}}
{{--                            <label for="asset" class="col-md-4 col-form-label text-md-end">{{ __('Asset') }}</label>--}}

{{--                            <div class="col-md-6">--}}
{{--                                <input id="asset" type="text" class="form-control @error('asset') is-invalid @enderror"--}}
{{--                                       name="asset" value="{{ $station->asset }}">--}}

{{--                                @error('asset')--}}
{{--                                <span class="invalid-feedback" role="alert">--}}
{{--                                        <strong>{{ $message }}</strong>--}}
{{--                                    </span>--}}
{{--                                @enderror--}}
{{--                            </div>--}}
{{--                        </div>--}}

                        <div class="row mb-3">
                            <label for="asset" class="col-md-4 col-form-label text-md-end">{{ __('Asset') }}</label>

                            <div class="col-md-6">
                                <div class="input-group" data-toggle="aizuploader" data-type="document">
                                    <div class="input-group-prepend">
                                        <div
                                            class="input-group-text bg-soft-secondary font-weight-medium">{{ __('Browse')}}</div>
                                    </div>
                                    <div class="form-control file-amount">{{ __('Choose File') }}</div>
                                    <input type="hidden" name="asset" value="{{$station->asset}}" class="selected-files">
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
    <link href="https://releases.transloadit.com/uppy/v2.10.0/uppy.min.css" rel="stylesheet">
    <script src="https://releases.transloadit.com/uppy/v2.10.0/uppy.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            AIZ.uploader.initForInput();
            AIZ.uploader.removeAttachment();
            AIZ.uploader.previewGenerate();
            $("#category").select2({
                theme: "classic"
            })
        });

    </script>
@endsection
