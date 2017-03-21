defmodule AppName.User do
  import Joken
  use AppName.Web, :model
  schema "users" do  
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
  
    timestamps
  end
  
  @required_fields ~w(email password)



  def generate_token(user) do  
    %{user_id: user.id}
    |> token
    |> with_signer(hs256("secret-change-me"))
    |> sign
    |> get_compact
  end
  
  def changeset(model, params \\ :empty) do  
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 5)
    |> hash_password
  end
  
  defp hash_password(changeset) do  
    if password = get_change(changeset, :password) do
      changeset
      |> put_change(:password_hash, Comeonin.Bcrypt.hashpwsalt(password))
    else
      changeset
    end
  end  
  
end
