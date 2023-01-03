## Table Name Here

- attribute_name (data type)

( App 1 )

## Feedbacks

- recipient_handle (string)
- tweet_id (string)

( App 2 )

## Users

IF a user exists, it has a pair to a UserSubmission with status 'approved'

- email
- password
- first_name
- last_name
- job_role
- user_submission_id # MAYBE

## UserSubmissions

IF a submission is approved, we will map (copy/paste) the fields to a User record

- email
- first_name
- last_name
- website
- job_role
- text
- status (pending, approved, rejected)
- user_id # MAYBE

## Digests (aka Newsletters, Stakeholder Updates)

- title (ex: Fomo.com)
- description (ex: Monthly updates from a solo founder)
- website
- avatar_url => stringified image: <https://fomo.com/favicon.ico>
- user_id (ex: 5)

## StakeholderUpdates

- content (ex: "This month we...")
- digest_id (which Digest does this update belong to?)

## Subscriptions

what ARE subscribers? users with relationship to other users

- digest_id (ex: 4)
- user_id (ex: 2)

# Relationships

- Users
  - UserSubmissions
  - Digests
    - StakeholderUpdates
    - Subscriptions
