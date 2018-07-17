# bucketlist
Ruby Sinatra app providing user with capabilities to create/edit/delete bucketlists (collections of goals).

Users login with an email and password (secure).  The user "name" is used for informational purposes.

Once logged in, users can
- create bucket. Bucket has a name and optional description.  Once created, goals can be added to a bucket.
- edit or delete a bucket.
- create a goal.  Goal can be created by selecting Add Goal on the user home page.  Alternatively, a goal can be created when browsing ideas.  A goal has a required title and optional fields : description, url (for more info on the goal topic), image url for goal.  Once completed, goal can be "checked off"
- edit or delete a goal from a bucket.
- browse ideas (browse all or select category(s)).


Running bucketlist
------------------
Test user logins:
    joe@domain.com  password: test
    martha@domain.com password: test
or sign up to create a different id.

Contributing
------------
Bug reports and pull requests are welcome on GitHub at https://github.com/'BarbaraPruz'/bucketlist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License
-------
Open source under the terms of the MIT License.

Code of Conduct
---------------
Everyone interacting in the InTheNews project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
