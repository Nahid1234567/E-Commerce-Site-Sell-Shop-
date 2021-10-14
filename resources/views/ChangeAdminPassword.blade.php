@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">

              <div class="card-header">{{ __('Change Password') }}</div>

                <div>
                    <ul>
                        @foreach($errors->all() as $error)
                        <li>
                            {{$error}}
                        </li>
                        @endforeach
                    </ul>
                </div>

                @if(session('error'))
                    <div class="alert alert-danger" role="alert">
                        {{session('error')}}
                    </div>
                @endif

                @if(session()->get('message')) 
                    <div class="alert alert-success" role="alert">
                       {{session()->get('message')}}
                    </div>
                @endif

                <div class="card-body">
                    <form method="POST" action="{{ route('update-admin-password') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="current_pass" class="col-md-4 col-form-label text-md-right">{{ __('Current Password') }}</label>

                            <div class="col-md-6">
                                <input id="current_pass" type="password" class="form-control{{ $errors->has('current_pass') ? ' is-invalid' : '' }}" name="current_pass" value="" required>

                                <!-- @if ($errors->has('current_pass'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('current_pass') }}</strong>
                                    </span>
                                @endif -->
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="new_pass" class="col-md-4 col-form-label text-md-right">{{ __('New Password') }}</label>

                            <div class="col-md-6">
                                <input id="new_pass" type="password" class="form-control{{ $errors->has('new_pass') ? ' is-invalid' : '' }}" name="new_pass" required>

                                @if ($errors->has('new_pass'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('new_pass') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="confirm_pass" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="confirm_pass-confirm" type="password" class="form-control" name="confirm_pass" required>
                                @if ($errors->has('confirm_pass'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('confirm_pass') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Update Password') }}
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
