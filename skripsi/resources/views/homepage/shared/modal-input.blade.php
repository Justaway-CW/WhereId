<div class="modal fade" id="inputModal">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title">Input</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="removeData()">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form " action="{{ route('tourismobject.index') }}" method="GET" id="formInput">

                    <div class="form-group">
                        <label for="province" class="text-dark mb-1">Province:</label><br>
                        <select name="province" class="form-select" aria-label="Default select example" id="provinceInputSelect2">
                            <option value="" selected>Select your destination</option>

                            @foreach ($provinces as $province)
                                <option value="{{ $province->keyname }}">{{ $province->name }}</option>
                            @endforeach
                        </select>
                        <span class="d-blocks fs-6 text-danger" id="provinceError"></span>
                    </div>

                    <div class="form-group mt-3">
                        <label for="tourism-type" class="text-dark mb-1">Tourism Object Type:</label><br>
                        <select name="type" class="form-select" aria-label="Default select example" id="tourObjectTypeSelect">
                            <option value="" selected>Select an option...</option>
                            @foreach ($tourTypes as $tourType)
                                <option value="{{ $tourType->keyname }}">{{ $tourType->type }}</option>
                            @endforeach

                        </select>
                        <span class="d-blocks fs-6 text-danger" id="typeError"></span>
                    </div>


                <div class="mt-3 d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>

            </div>
        </div>
    </div>
</div>
