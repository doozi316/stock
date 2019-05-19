package com.example.ijangmin.stock;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.TextView;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.List;


public class ContentListAdapter extends BaseAdapter{

    private Context context;
    private List<Content> contentList;
    private Activity parentActivity;//삭제 강의때 추가
    private List<Content> saveList;
    //여기서 Actvitivy parentActivity가 추가됨 삭제 및 관리자기능 예제

    public ContentListAdapter(Context context, List<Content> contentList, Activity parentActivity, List<Content> saveList){
        this.context=context;
        this.contentList=contentList;
        this.parentActivity=parentActivity;//삭제용
        this.saveList=saveList;//검색용
    }


    //출력할 총갯수를 설정하는 메소드
    @Override
    public int getCount() {
        return contentList.size();
    }

    //특정한 유저를 반환하는 메소드
    @Override
    public Object getItem(int i) {
        return contentList.get(i);
    }
    //아이템별 아이디를 반환하는 메소드
    @Override
    public long getItemId(int i) {
        return 0;
    }

    //가장 중요한 부분
    @Override
    //int i 에서 final int i 로 바뀜 이유는 deleteButton.setOnClickListener에서 이 값을 참조하기 때문

    public View getView(final int i, View view, ViewGroup viewGroup) {
        View v = View.inflate(context, R.layout.table_content, null);

        //뷰에 다음 컴포넌트들을 연결시켜줌
        //final추가 안붙이면 에러남 리스너로 전달하고 싶은 지역변수는 final로 처리해야됨

        final TextView num = (TextView)v.findViewById(R.id.num);
        TextView content = (TextView)v.findViewById(R.id.content);
        TextView date = (TextView)v.findViewById(R.id.date);
        TextView conManu = (TextView)v.findViewById(R.id.conManu);

        content.setText(contentList.get(i).getContent());
        num.setText(contentList.get(i).getNum());
        conManu.setText(contentList.get(i).getConManu());
        date.setText(contentList.get(i).getDate());


        //이렇게하면 findViewWithTag를 쓸 수 있음 없어도 되는 문장임
        v.setTag(contentList.get(i).getContent());

        //삭제 버튼 객체 생성

        Button deleteButton = (Button)v.findViewById(R.id.deleteButton);

        deleteButton.setOnClickListener(new View.OnClickListener(){

            @Override

            public void onClick(View view) {

                //4. 콜백 처리부분(volley 사용을 위한 ResponseListener 구현 부분)

                Response.Listener<String> responseListener = new Response.Listener<String>(){

                    @Override

                    public void onResponse(String response) {

                        try{

                            JSONObject jsonResponse = new JSONObject(response);

                            boolean success = jsonResponse.getBoolean("success");

                            //받아온 값이 success면 정상적으로 서버로부터 값을 받은 것을 의미함

                            if(success){

                                contentList.remove(i);//리스트에서 해당부분을 지워줌

                                //saveList는 찾아서 해줘야됨 이게 기준이기 때문임

                                for(int i = 0; i < saveList.size(); i++){

                                    if(saveList.get(i).getNum().equals(num.getText().toString())){

                                        saveList.remove(i);

                                        break;

                                    }

                                }

                                notifyDataSetChanged();//데이터가 변경된 것을 어댑터에 알려줌

                            }

                        }

                        catch(Exception e){

                            e.printStackTrace();

                        }

                    }

                };

                //volley 사용법

                //1. RequestObject를 생성한다. 이때 서버로부터 데이터를 받을 responseListener를 반드시 넘겨준다.

                //위에서 userID를 final로 선언해서 아래 처럼 가능함

                DeleteRequest deleteRequest = new DeleteRequest(num.getText().toString(), responseListener);

                //2. RequestQueue를 생성한다.

                //여기서 UserListAdapter는 Activity에서 상속받은 클래스가 아니므로 Activity값을 생성자로 받아서 사용한다

                RequestQueue queue = Volley.newRequestQueue(parentActivity);

                //3. RequestQueue에 RequestObject를 넘겨준다.

                queue.add(deleteRequest);

            }//onclick

        });



        //만든뷰를 반환함
        return v;
    }
}






