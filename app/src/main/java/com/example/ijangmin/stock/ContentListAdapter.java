package com.example.ijangmin.stock;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.List;


public class ContentListAdapter extends BaseAdapter{

    private Context context;
    private List<Content> contentList;

    public ContentListAdapter(Context context, List<Content> contentList){
        this.context=context;
        this.contentList=contentList;
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

    @Override
    public long getItemId(int i) {
        return 0;
    }

    //가장 중요한 부분
    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = View.inflate(context, R.layout.table_content, null);

        //뷰에 다음 컴포넌트들을 연결시켜줌
        TextView content = (TextView)v.findViewById(R.id.content);
        TextView date = (TextView)v.findViewById(R.id.date);
        TextView conManu = (TextView)v.findViewById(R.id.conManu);

        content.setText(contentList.get(i).getContent());
        conManu.setText(contentList.get(i).getConManu());
        date.setText(contentList.get(i).getDate());


        //이렇게하면 findViewWithTag를 쓸 수 있음 없어도 되는 문장임
        v.setTag(contentList.get(i).getContent());

        //만든뷰를 반환함
        return v;
    }
}






