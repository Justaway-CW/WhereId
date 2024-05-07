@extends('admin.shared.layout')
@section('content')
    <div class="row mt-1">
        <div class="col-md-12">
            <div class="card border-0 shadow-sm rounded">
                <div class="card-body">


                        <div class="row">
                            <div class="col-6 d-flex justify-content-start">
                                <a href="{{ route('admin_users.create') }}"class=" btn btn-sm btn-primary"><span class="fas fa-plus">
                                </span> Add New</a>
                            </div>
                            <div class="offset-3 col-3 d-flex justify-content-end">
                                <form action="{{route('admin_users.index')}}" method="GET">
                                    @include('admin.shared.search-bar')
                                </form>
                            </div>
                        </div>
                    <table class="table table-bordered my-3">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">display_name</th>
                                <th scope="col">username</th>
                                <th scope="col">bio</th>
                                <th scope="col">action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($datas as $data)
                                <tr>
                                    <td>{{ $data->id }}</td>
                                    <td>{{ $data->display_name }}</td>
                                    <td>{{ $data->username }}</td>
                                    <td>{{ $data->bio }}</td>

                                    <td class="text-center">
                                        <form onsubmit="return confirm('Are you sure?');"
                                            action="{{ route('admin_users.destroy', $data->id) }}" method="POST">
                                            <a href="{{ route('admin_users.show', $data->id) }}"
                                                class="btn btn-sm btn-secondary">Show</a>
                                            <a href="{{ route('admin_users.edit', $data->id) }}"
                                                class="btn btn-sm btn-primary">Edit</a>
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            @empty
                            <div class="alert alert-danger mt-3">
                                No Result Found!
                            </div>
                            @endforelse
                        </tbody>
                    </table>
                    {{ $datas->withQueryString()->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
