<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Notification;

/**
 * NotificationSearch represents the model behind the search form about `backend\models\Notification`.
 */
class NotificationSearch extends Notification
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['company', 'message', 'from', 'to'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Notification::find();

        // add conditions that should always apply here
        $query->joinWith(['companyinfo']);    
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            self::tableName().'.id' => $this->id,
            
        ]);

        $query->andFilterWhere(['like', 'company', $this->company])
            ->andFilterWhere(['like', 'from', $this->from])
            ->andFilterWhere(['like', 'to', $this->to])
            ->andFilterWhere(['like', 'message', $this->message])
            

    
                ;
         $dataProvider->setSort([
                'attributes' => [
                        'id','company','message','from','to','companyinfo.companyname',
                        'companyinfo' => [
                                'asc' => ['companyinfo.companyname' =>SORT_ASC ],
                                'desc' => ['companyinfo.companyname' => SORT_DESC],
                                'default' => SORT_ASC
                        ],


                ]
        ]);
      
        return $dataProvider;
    }
}
