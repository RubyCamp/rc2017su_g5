class Director
  WALL_WIDTH = 20
  BOX_SIZE = 30

  def initialize
    @space = CP::Space.new
    @space.gravity = CP::Vec2.new(0, 500)
    @speed = 1 / 60.0
    @objects = {}

    # 壁の生成と登録
    [
      [20, 0, Window.width - WALL_WIDTH, WALL_WIDTH],                         # 上壁
      [0, Window.height - WALL_WIDTH, Window.width, WALL_WIDTH],              # 下壁
      [0, 0, WALL_WIDTH, Window.height - WALL_WIDTH],                         # 左壁
      [Window.width - WALL_WIDTH, 0, WALL_WIDTH, Window.height - WALL_WIDTH], # 右壁
      [Window.width - 100 + WALL_WIDTH, 250, 400, WALL_WIDTH],                 # 障害棚 ゴール用

    ].each do |x, y, w, h|
      add_obj(Wall.new(x, y, w, h))
    end

#邪魔する壁
    [
      [400, rand(400) + 60, 50, 50],
      [500, rand(300) + 60, 100, 100],
      [600, rand(400) + 60, 50, 50],                            
      [700, rand(300) + 60, 100, 100],
      [800, rand(400) + 60, 50, 50]                             
    ].each do |x, y, w, h|
      add_obj(Wall.new(x, y, w, h))
    end

    
    # アイテム配置
    [

      [960, 100]
    ].each do |x, y|
      add_obj(Box.new(x, y, BOX_SIZE, BOX_SIZE))
    end

    # ボールの生成
    ball = Ball.new(100, 350, 15)
    add_obj(ball)

    # 各種当たり判定の定義
    _set_collisions
  end

  # 当シーンにおける1フレームの処理を制御するコントローラメソッド
  def play
    # 物理演算空間の時間を@speed分進める
    @space.step(@speed)

    # 登録済みの全オブジェクトに対してdrawメソッドを呼び出し、画面に描画する
    # ※ @objectsに登録する全てのオブジェクトは、必ずdrawメソッドを実装していることを前提としている点に留意
    @objects.values.each {|obj| obj.draw }
  end


  private

  # 物理演算空間（並びに描画対象格納配列）にオブジェクトを登録
  def add_obj(obj)
    @objects[obj.shape] = obj
    obj.add_to(@space)
  end

  # 物理演算空間（並びに描画対象格納配列）からオブジェクトを削除
  def remove_obj(shape)
    @objects[shape].remove_from(@space)
    @objects.delete(shape)
  end

  # 当たり判定を設定する
  # ※ サンプルなので1種類しか登録していないが、複数種類の衝突判定を登録することを想定してメソッドを分割している
  def _set_collisions
    _set_collision_ball_and_item
  end


  # ボールとアイテムの衝突判定追加
  # add_collision_handlerのブロック変数はそれぞれ衝突元（第1引数のcollision_typeに該当するオブジェクト（に含まれるShape）、
  # 衝突先（第2引数の対象オブジェクトのShape）、Arbiterオブジェクト（衝突内容の詳細を保持するオブジェクト）が入る。
  # 以下の点に留意。
  # * ブロック変数の頭2つは、Shapeオブジェクトが入るのであって、Wall/Box/Ballクラスのインスタンスではない
  # * Arbiterオブジェクトは、衝突した両者の接合点（衝突した個所）など、ゲーム作成に有用な情報を多数保持している。

  
  def _set_collision_ball_and_item
    @space.add_collision_handler(Ball::DEFAULT_COLLISION_TYPE, Box::DEFAULT_COLLISION_TYPE) do |ball, box, arb|
      @space.add_post_step_callback(box) do |_, shape|
        remove_obj(shape)
      end
    end
  end
end
