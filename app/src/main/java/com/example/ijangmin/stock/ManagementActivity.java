package com.example.ijangmin.stock;

import com.example.ijangmin.stock.R;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
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
    public void onCreate(Bundle saveInstanceState){
        super.onCreate(saveInstanceState);
        setContentView(R.layout.table); Intent intent = getIntent();

        ListView listView = (ListView) findViewById(R.id.listView);
        ArrayList<Content> contentList = new ArrayList<Content>();

        //어댑터 초기화부분 userList와 어댑터를 연결해준다.
        ContentListAdapter adapter = new ContentListAdapter(getApplicationContext(), contentList);
        listView.setAdapter(adapter);

        try{
            //intent로 값을 가져옵니다 이때 JSONObject타입으로 가져옵니다
            JSONObject jsonObject = new JSONObject(intent.getStringExtra("contentList"));

            //List.php 웹페이지에서 response라는 변수명으로 JSON 배열을 만들었음..
            JSONArray jsonArray = jsonObject.getJSONArray("response");
            int count = 0;

            String content, conManu, date;

            //JSON 배열 길이만큼 반복문을 실행
            while(count < jsonArray.length()){
                //count는 배열의 인덱스를 의미
                JSONObject object = jsonArray.getJSONObject(count);

                content = object.getString("content");//여기서 ID가 대문자임을 유의
                conManu = object.getString("conManu");
                date = object.getString("date");


                //값들을 User클래스에 묶어줍니다
                Content content1 = new Content(content,conManu,date);
                contentList.add(content1);//리스트뷰에 값을 추가해줍니다
                count++;
            }


        }catch(Exception e){
            e.printStackTrace();
        }





    }
}
