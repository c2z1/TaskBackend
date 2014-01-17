package de.androidlistexample;

import java.util.ArrayList;
import java.util.List;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.ListView;

public class AndroidListViewActivity extends ListActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
//		setContentView(R.layout.activity_task_list);
		
		final List<String> valueList = new ArrayList<String>();
		for (int i = 0; i<10 ; i++) {
			valueList.add("value " + i);
		}
		
		final BtnListAdapter<String> adapter = new BtnListAdapter<String>(getApplicationContext(), valueList) {
				@Override
				public void itemBtnClicked(final View row, final View btn, final String item) {
		          row.animate().setDuration(2000).alpha(0)
		              .withEndAction(new Runnable() {
		                @Override
		                public void run() {
		                  valueList.remove(item);
		                  notifyDataSetChanged();
		                  row.setAlpha(1);
		                }
		              });
				}

				@Override
				public void itemClicked(View rowView, View textView, String item) {
					Intent intent = new Intent();
					intent.setClassName(getPackageName(), TaskDetailsActivity.class.getName());
					intent.putExtra("selected", item.toString());
					startActivity(intent);
				}
			};
		
	    setListAdapter(adapter);
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.android_list_view, menu);
		return true;
	}

}
