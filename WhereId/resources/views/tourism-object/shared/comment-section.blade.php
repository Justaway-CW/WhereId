<div class="container mb-5">
    <div class="row">
        <div class="col-12">
            <form method="POST" action="{{ route('tourobject.comments.store', $tourobject->id) }}">
                @csrf

                <div class="input-group mb-4">
                    <input type="text" class="form-control" placeholder="Add a comment" id="comment" name="comment">
                    <button class="btn btn-outline-primary btn-sm" type="submit"
                        id="comment-btn">Comment</button>
                </div>
                @error('comment')
                    <span class="text-danger fs-6">{{ $message }}</span>
                @enderror


            </form>

            <hr>

            @include('shared.success-message')

            @forelse ($comments as $comment)
                <div class="d-flex flex-start mb-3">
                    <a href="{{ route('users.show', $comment->user->username) }}">
                        <img class="rounded-circle shadow-1-strong me-3 avatar-comment"
                        src="https://robohash.org/{{ $comment->user->username }}" alt="avatar"/>
                    </a>
                    <div class="flex-grow-1 flex-shrink-1">
                        <div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="col">
                                    <div class="row justify-content-between align-items-center">
                                        <div class="col-11">
                                            <p class="mb-1">
                                                <a href="{{ route('users.show', $comment->user->username) }}" class="fs-6 black detail-href">
                                                    {{ $comment->user->display_name }}
                                                </a>
                                                <span class="small">- {{ $comment->created_at }} </span>
                                            </p>
                                        </div>
                                        @if (Auth::id() == $comment->user_id)
                                        <div class="col-1 d-flex justify-content-end align-items-center">
                                            <form id="delete-form" onsubmit="return confirm('Are you sure?');"
                                            action="{{ route('tourobject.comments.destroy', $comment->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="borderless-button"><span class="small far fa-trash-alt black"></span></button>
                                            </form>
                                        </div>


                                        @endif

                                    </div>


                                </div>

                            </div>
                            <p class="small mb-0 black">
                                {{ $comment->content }}
                            </p>
                        </div>
                    </div>
                </div>
            @empty
                <p class="text-center mt-4">No Comments</p>
            @endforelse
            {{ $comments->withQueryString()->links() }}

        </div>
    </div>
</div>

