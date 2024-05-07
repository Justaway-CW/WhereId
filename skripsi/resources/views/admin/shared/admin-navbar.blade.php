<nav class="navbar navbar-expand-lg bg-light navigation" data-bs-theme="light">
    <div class="container" >
        <a class="navbar-brand fw-light" href="{{route('admin_tour_objects.index')}}"><span class="fas fa-brain me-1">
            </span>WhereID</a>
        <button class="navbar-toggler" type="button" Data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                @guest
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="{{route('login')}}">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('register')}}">Register</a>
                    </li>
                @endguest
                @auth()
                    <li class="nav-item me-3">
                        <a class="nav-link" href="{{route('admin_users.index')}}">User</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="{{route('admin_tour_objects.index')}}">TourObject</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="{{route('admin_provinces.index')}}">Province</a>
                    </li>
                    <li class="nav-item me-3">
                        <a class="nav-link" href="{{route('admin_tour_types.index')}}">TourType</a>
                    </li>

                    <li class="nav-item ">
                        <form action="{{ route('logout') }}" method="POST">
                            @csrf
                            <button class="btn btn-outline-danger btn-sm nav-link" type="submit"> Logout </button>
                        </form>
                    </li>
                @endauth
            </ul>
        </div>
    </div>
</nav>
