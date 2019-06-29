# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HomeApi.Repo.insert!(%HomeApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HomeApi.Repo
alias HomeApi.Directory.Home
Repo.insert! %Home{name: "House 1", description: "Short description A", tag: "IT, Software", price: 100}
Repo.insert! %Home{name: "House 2", description: "Short description B", tag: "Marketing", price: 200}
Repo.insert! %Home{name: "House 3", description: "Short description C", tag: "Accounting", price: 300}
