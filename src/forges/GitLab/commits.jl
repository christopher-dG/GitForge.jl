@json struct Commit
    id::String
    short_id::String
    title::String
    author_name::String
    author_email::String
    committer_name::String
    committer_email::String
    created_at::DateTime
    message::String
    committed_date::DateTime
    authored_date::DateTime
    parent_ids::Vector{String}
    last_pipeline::Pipeline
    status::String
end

endpoint(::GitLabAPI, ::typeof(get_commit), owner::AStr, repo::AStr, ref::AStr) =
    Endpoint(:GET, "/projects/$(encode(owner, repo))/repository/commits/$ref")
into(::GitLabAPI, ::typeof(get_commit)) = Commit
