@auth()
    @if (Auth::user()->isFav($recommendation))
        <form method="POST" action="{{ route('unfavourite', ['id' => $recommendation['id'] , 'from' => 1])}}">
            @csrf
            <button type="submit" class="fw-light nav-link fs-6"> <span class="fas fa-heart" style="color: red">
                </span> </button>
        </form>
    @else
        <form method="POST" action="{{ route('favourite', ['rank' => $recommendation['rank'], 'id' => $recommendation['id'] ])}}">
            @csrf
            <button type="submit" class="fw-light nav-link fs-6"> <span class="far fa-heart">
                </span> </button>
        </form>
    @endif
@endauth
@guest
    <a href="{{ route('login') }}" class="fw-light nav-link fs-6"> <span class="far fa-heart ">
        </span> </a>
@endguest
