<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Companyinfo;

/**
 * CompanyinfoSearch represents the model behind the search form about `backend\models\Companyinfo`.
 */
class CompanyinfoSearch extends Companyinfo
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['companyname', 'dbname'], 'safe'],
            [['driver_fee', 'client_fee', 'subscription_fee'], 'number'],
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
        $query = Companyinfo::find();

        // add conditions that should always apply here

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
            'id' => $this->id,
            'driver_fee' => $this->driver_fee,
            'client_fee' => $this->client_fee,
            'subscription_fee' => $this->subscription_fee,
        ]);

        $query->andFilterWhere(['like', 'companyname', $this->companyname])
              ->andFilterWhere(['like', 'dbname', $this->dbname]);

        return $dataProvider;
    }
}
