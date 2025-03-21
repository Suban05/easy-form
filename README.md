[![Build Status](https://github.com/Suban05/easy-form/workflows/CI/badge.svg)](https://github.com/Suban05/easy-form/actions)

# Form generator

## Usage

```rb
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'programmer', gender: 'm'
EasyForm.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">programmer</textarea>
# </form>
```

## Running Tests

To run the test suite, first install the necessary dependencies:

```bash
make install
```

Then, you can run the tests with:

```bash
make test
```
