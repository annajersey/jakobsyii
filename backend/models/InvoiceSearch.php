<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Invoice;

/**
 * InvoiceSearch represents the model behind the search form about `backend\models\Invoice`.
 */
class InvoiceSearch extends Invoice
{
    
	public $companyinfo;
   
	/**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'company', 'status'], 'integer'],
            [['amount'], 'number'],
            [['created_time', 'duedate_time', 'number', 'email','companyinfo','description'], 'safe'],
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
        $query = Invoice::find();

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
            'company' => $this->company,
            'amount' => $this->amount,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'number', $this->number])
            ->andFilterWhere(['like', 'email', $this->email])
			->andFilterWhere(['like', 'duedate_time', $this->duedate_time])
			->andFilterWhere(['like', 'created_time', $this->created_time])
			->andFilterWhere(['like', 'description', $this->description]);
			

        $dataProvider->setSort([
            'attributes' => [
                'id','company','amount','created_time','duedate_time','number',
                'status','email','description','companyinfo.companyname',
                'statusstring' => [
                        'asc' => ['status' =>SORT_ASC ],
                        'desc' => ['status' => SORT_DESC],
                        'default' => SORT_ASC
                ],


            ]
       ]);
        $dataProvider->sort->attributes['companyinfo'] = [
                'asc' => ['companyinfo.companyname' => SORT_ASC],
                'desc' => ['companyinfo.companyname' => SORT_DESC],
        ];
		
        return $dataProvider;
    }
}
