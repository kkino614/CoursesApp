

package ecom.simpleTag;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.Vector;


public class ShowCart extends SimpleTagSupport {
	
	//Comment No. 601
	private Vector cart;
	private String var;
	public void setCart(Vector a) {
		cart = a;
	}
	public void setVar(String a) {
		var = a;
	}

	
	public void doTag() throws JspException, IOException {
		int size = this.cart.size();
		
		for (int i = 0; i < size; i++) {
			//Comment No. 602
			Object book = cart.elementAt(i);
			
			//Comment No. 603
			getJspContext().setAttribute(var, book);
			
			//Comment No. 604
			getJspBody().invoke(null);
		}
	}
	
	
	
}















