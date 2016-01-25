require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { dribbles_per_touch: @player.dribbles_per_touch, games_played: @player.games_played, losses: @player.losses, minutes: @player.minutes, name: @player.name, points: @player.points, points_per_touch: @player.points_per_touch, seconds_per_touch: @player.seconds_per_touch, team: @player.team, time_of_possession: @player.time_of_possession, touches: @player.touches, wins: @player.wins }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { dribbles_per_touch: @player.dribbles_per_touch, games_played: @player.games_played, losses: @player.losses, minutes: @player.minutes, name: @player.name, points: @player.points, points_per_touch: @player.points_per_touch, seconds_per_touch: @player.seconds_per_touch, team: @player.team, time_of_possession: @player.time_of_possession, touches: @player.touches, wins: @player.wins }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
