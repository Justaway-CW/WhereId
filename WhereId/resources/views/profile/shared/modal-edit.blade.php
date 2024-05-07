<div class="modal fade" id="editModal">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title">Edit Profile</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form" action="{{ route('users.update', $user->id) }}" method="POST" id="formEdit">
                    @csrf
                    @method('PUT')


                    <div class="form-group">
                        <label for="name" class="text-dark mb-1">Name:</label><br>
                        <input name="name" value="{{ $user->display_name }}" type="text" class="form-control">
                        @error('name')
                            <span class="text-danger fs-6">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group mt-3">
                        <label for="bio" class="text-dark mb-1">Bio:</label><br>
                        <textarea name="bio" class="form-control mb-1" id="bio" rows="3">{{ $user->bio }}</textarea>
                        @error('bio')
                            <span class="text-danger fs-6">{{ $message }}</span>
                        @enderror
                    </div>


                    <div class="mt-3 d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
