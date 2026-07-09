package Data_program;




public class Reloader implements Runnable{
	
	tabel_Data d;
	
	
	public Reloader(tabel_Data d)
	{
		this.d=d;
	}
	@Override
	public void run()
	{
		synchronized(d)
		{
		d.reload();
		}
	}
	
	}



