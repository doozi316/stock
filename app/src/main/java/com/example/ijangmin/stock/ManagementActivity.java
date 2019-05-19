package com.example.ijangmin.stock;

import com.example.ijangmin.stock.R;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.content.Intent;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by user on 2019-04-26.
 */

public class ManagementActivity extends AppCompatActivity {
    private ListView listView;

    private ContentListAdapter adapter;

    private List<Content> contentList;

    private List<Content> saveList;//회원검색 기능용 복사본


    public void onCreate(Bundle saveInstanceState){
        super.onCreate(saveInstanceState);
        setContentView(R.layout.table);
        Intent intent = getIntent();

        ListView listView = (ListView) findViewById(R.id.listView);
//        ArrayList<Content> contentList = new ArrayList<Content>();


        contentList = new ArrayList<Content>();

        saveList = new ArrayList<Content>();





        //어댑터 초기화부분 userList와 어댑터를 연결해준다.
       // ContentListAdapter adapter = new ContentListAdapter(getApplicationContext(), contentList);
        adapter = new ContentListAdapter(getApplicationContext(), contentList, this, saveList);//로 수정됨

        listView.setAdapter(adapter);

        try{
            //intent로 값을 가져옵니다 이때 JSONObject타입으로 가져옵니다
            JSONObject jsonObject = new JSONObject(intent.getStringExtra("contentList"));

            //List.php 웹페이지에서 response라는 변수명으로 JSON 배열을 만들었음..
            JSONArray jsonArray = jsonObject.getJSONArray("response");
            int count = 0;

            String content, num, conManu, date;

            //JSON 배열 길이만큼 반복문을 실행
            while(count < jsonArray.length()){
                //count는 배열의 인덱스를 의미
                JSONObject object = jsonArray.getJSONObject(count);

                content = object.getString("content");
                num = object.getString("num");
                conManu = object.getString("conManu");
                date = object.getString("date");


                //값들을 User클래스에 묶어줍니다
                Content content1 = new Content(content,num,conManu,date);

                contentList.add(content1);//리스트뷰에 값을 추가해줍니다
                saveList.add(content1);//회원 검색 기능 용
                count++;
            }


        }catch(Exception e){
            e.printStackTrace();
        }

        EditText search = (EditText)findViewById(R.id.search);

        search.addTextChangedListener(new TextWatcher() {

            @Override

            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override

            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

                searchContent(charSequence.toString());//회원 검색 기능용

            }

            @Override

            public void afterTextChanged(Editable editable) {

            }

        });

    }

    public void searchContent(String search){

        contentList.clear();

        for(int i = 0; i < saveList.size(); i++){

            if(saveList.get(i).getNum().contains(search)){//contains메소드로 search 값이 있으면 true를 반환함

                contentList.add(saveList.get(i));

            }

        }

        adapter.notifyDataSetChanged();//어댑터에 값일 바뀐것을 알려줌

    }

}

