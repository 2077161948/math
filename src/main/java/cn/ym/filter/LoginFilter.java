package cn.ym.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;

import cn.ym.util.Cangliang;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

	private String[] s=new String[] {"ylan","handle","get","combination","login","rePwd","help","register","/","newexam","change","login_out","add"};
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here    
		HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
			if (req.getServletPath().contains(".")) { 
				chain.doFilter(request, response);
			 			return;
			}
			
			for (String r : s) {
				if (req.getServletPath().endsWith(r)) {
					
					chain.doFilter(request, response);
		 			return;
		 		
				}
			}
	
   
        if (req.getSession().getAttribute(Cangliang.TEACHER)!=null||req.getSession().getAttribute(Cangliang.STUDENT)!=null) {
        	chain.doFilter(request, response);
        	return;
        	}
        response.setCharacterEncoding("utf-8");
        	req.getRequestDispatcher("/login").forward(request, response);
        
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
   
		}
	

}
