package listener_package;

import jakarta.servlet.*;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.io.*;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import jakarta.servlet.*;
import java.sql.*;

import Data_program.*;


/**
 * Application Lifecycle Listener implementation class Listener_progm
 *
 */
@WebListener
public class Listener_progm implements ServletContextListener {

    /**
     * Default constructor. 
     */
	private ScheduledExecutorService scheduler;
	Connection conn;
	
    public Listener_progm() {
        // TODO Auto-generated constructor stub
    }
	public void contextInitialized(ServletContextEvent sce)
	{ 
		conn=null;
		
		try
		{
		InitialContext ic=new InitialContext();
		DataSource ds=(DataSource)ic.lookup("java:/comp/env/jdbc/MyDB");
		conn=ds.getConnection();
		
		
		}
		catch(NamingException ne)
		{
			ne.printStackTrace();
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		 tabel_Data d = new  tabel_Data(conn);
		
	    d.reload();
	    sce.getServletContext().setAttribute(" tabel_Data",d);
		
		scheduler=Executors.newSingleThreadScheduledExecutor();
	    	
//	    scheduler.scheduleAtFixedRate(new Reloader(d), 0, 1, TimeUnit.SECONDS);
		
	}
	public void contextDestroyed(ServletContextEvent sce)
	{
		
		try
    	{
    		conn.close();
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    	scheduler.shutdownNow();
    }
	
}
