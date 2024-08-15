package uz.click.controller.paymentsControllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.click.entity.Transaction;
import uz.click.repository.CardRepository;

import java.io.IOException;

@WebServlet("/payment")
public class PaymentsController extends HttpServlet {
    MobilePayment mobilePayment = MobilePayment.getInstance();
    CardRepository cardRepository = CardRepository.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/payments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String where = req.getParameter("where");
        Transaction result;
        switch (type) {
            case "mobilePay": {
                if (where != null && where.equals("toMobile")){
                    req.setAttribute("cards", cardRepository.getCards());
                    req.setAttribute("phone", req.getParameter("phone"));
                    req.setAttribute("amount", req.getParameter("amount"));
                    req.getRequestDispatcher("/views/mobilePay.jsp").forward(req, resp);
                    return;
                }

                result = mobilePayment.pay(req, resp);
                req.setAttribute("transaction", result);
                req.setAttribute("sender", cardRepository.getCardByNumber(result.getSender()).get());
                req.getRequestDispatcher("/views/transferResult.jsp").forward(req, resp);
                return;
            }
            default: {
                req.getRequestDispatcher("/views/page_404.jsp").forward(req, resp);
                return;
            }
        }

    }
}
