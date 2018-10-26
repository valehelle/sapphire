defmodule Sapphire.MocksTest do
  use Sapphire.DataCase

  alias Sapphire.Mocks

  describe "projects" do
    alias Sapphire.Mocks.Project

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mocks.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Mocks.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Mocks.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Mocks.create_project(@valid_attrs)
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mocks.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Mocks.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Mocks.update_project(project, @invalid_attrs)
      assert project == Mocks.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Mocks.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Mocks.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Mocks.change_project(project)
    end
  end

  describe "endpoints" do
    alias Sapphire.Mocks.Endpoint

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def endpoint_fixture(attrs \\ %{}) do
      {:ok, endpoint} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mocks.create_endpoint()

      endpoint
    end

    test "list_endpoints/0 returns all endpoints" do
      endpoint = endpoint_fixture()
      assert Mocks.list_endpoints() == [endpoint]
    end

    test "get_endpoint!/1 returns the endpoint with given id" do
      endpoint = endpoint_fixture()
      assert Mocks.get_endpoint!(endpoint.id) == endpoint
    end

    test "create_endpoint/1 with valid data creates a endpoint" do
      assert {:ok, %Endpoint{} = endpoint} = Mocks.create_endpoint(@valid_attrs)
      assert endpoint.name == "some name"
    end

    test "create_endpoint/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mocks.create_endpoint(@invalid_attrs)
    end

    test "update_endpoint/2 with valid data updates the endpoint" do
      endpoint = endpoint_fixture()
      assert {:ok, endpoint} = Mocks.update_endpoint(endpoint, @update_attrs)
      assert %Endpoint{} = endpoint
      assert endpoint.name == "some updated name"
    end

    test "update_endpoint/2 with invalid data returns error changeset" do
      endpoint = endpoint_fixture()
      assert {:error, %Ecto.Changeset{}} = Mocks.update_endpoint(endpoint, @invalid_attrs)
      assert endpoint == Mocks.get_endpoint!(endpoint.id)
    end

    test "delete_endpoint/1 deletes the endpoint" do
      endpoint = endpoint_fixture()
      assert {:ok, %Endpoint{}} = Mocks.delete_endpoint(endpoint)
      assert_raise Ecto.NoResultsError, fn -> Mocks.get_endpoint!(endpoint.id) end
    end

    test "change_endpoint/1 returns a endpoint changeset" do
      endpoint = endpoint_fixture()
      assert %Ecto.Changeset{} = Mocks.change_endpoint(endpoint)
    end
  end

  describe "configs" do
    alias Sapphire.Mocks.Config

    @valid_attrs %{body: "some body", delay: 42, is_selected: true, status_code: 42, type: "some type", url: "some url"}
    @update_attrs %{body: "some updated body", delay: 43, is_selected: false, status_code: 43, type: "some updated type", url: "some updated url"}
    @invalid_attrs %{body: nil, delay: nil, is_selected: nil, status_code: nil, type: nil, url: nil}

    def config_fixture(attrs \\ %{}) do
      {:ok, config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mocks.create_config()

      config
    end

    test "list_configs/0 returns all configs" do
      config = config_fixture()
      assert Mocks.list_configs() == [config]
    end

    test "get_config!/1 returns the config with given id" do
      config = config_fixture()
      assert Mocks.get_config!(config.id) == config
    end

    test "create_config/1 with valid data creates a config" do
      assert {:ok, %Config{} = config} = Mocks.create_config(@valid_attrs)
      assert config.body == "some body"
      assert config.delay == 42
      assert config.is_selected == true
      assert config.status_code == 42
      assert config.type == "some type"
      assert config.url == "some url"
    end

    test "create_config/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mocks.create_config(@invalid_attrs)
    end

    test "update_config/2 with valid data updates the config" do
      config = config_fixture()
      assert {:ok, config} = Mocks.update_config(config, @update_attrs)
      assert %Config{} = config
      assert config.body == "some updated body"
      assert config.delay == 43
      assert config.is_selected == false
      assert config.status_code == 43
      assert config.type == "some updated type"
      assert config.url == "some updated url"
    end

    test "update_config/2 with invalid data returns error changeset" do
      config = config_fixture()
      assert {:error, %Ecto.Changeset{}} = Mocks.update_config(config, @invalid_attrs)
      assert config == Mocks.get_config!(config.id)
    end

    test "delete_config/1 deletes the config" do
      config = config_fixture()
      assert {:ok, %Config{}} = Mocks.delete_config(config)
      assert_raise Ecto.NoResultsError, fn -> Mocks.get_config!(config.id) end
    end

    test "change_config/1 returns a config changeset" do
      config = config_fixture()
      assert %Ecto.Changeset{} = Mocks.change_config(config)
    end
  end

  describe "parameters" do
    alias Sapphire.Mocks.Parameter

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def parameter_fixture(attrs \\ %{}) do
      {:ok, parameter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Mocks.create_parameter()

      parameter
    end

    test "list_parameters/0 returns all parameters" do
      parameter = parameter_fixture()
      assert Mocks.list_parameters() == [parameter]
    end

    test "get_parameter!/1 returns the parameter with given id" do
      parameter = parameter_fixture()
      assert Mocks.get_parameter!(parameter.id) == parameter
    end

    test "create_parameter/1 with valid data creates a parameter" do
      assert {:ok, %Parameter{} = parameter} = Mocks.create_parameter(@valid_attrs)
      assert parameter.name == "some name"
    end

    test "create_parameter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mocks.create_parameter(@invalid_attrs)
    end

    test "update_parameter/2 with valid data updates the parameter" do
      parameter = parameter_fixture()
      assert {:ok, parameter} = Mocks.update_parameter(parameter, @update_attrs)
      assert %Parameter{} = parameter
      assert parameter.name == "some updated name"
    end

    test "update_parameter/2 with invalid data returns error changeset" do
      parameter = parameter_fixture()
      assert {:error, %Ecto.Changeset{}} = Mocks.update_parameter(parameter, @invalid_attrs)
      assert parameter == Mocks.get_parameter!(parameter.id)
    end

    test "delete_parameter/1 deletes the parameter" do
      parameter = parameter_fixture()
      assert {:ok, %Parameter{}} = Mocks.delete_parameter(parameter)
      assert_raise Ecto.NoResultsError, fn -> Mocks.get_parameter!(parameter.id) end
    end

    test "change_parameter/1 returns a parameter changeset" do
      parameter = parameter_fixture()
      assert %Ecto.Changeset{} = Mocks.change_parameter(parameter)
    end
  end
end
