Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FED3424F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 10:56:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF8C5CCB5C1
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2019 08:56:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F341CCB5BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2019 08:55:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x548tKLT021280; Tue, 4 Jun 2019 10:55:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yTPNF8NzWBm5vzgD+OGOm08Rs+hMsqFWwyqewCqFUQM=;
 b=nt9f0HhHzqlvs7dytp20CclCsHOdp6LI5HyyykId23EZ+8oTqcg4StUcmDsrpyzXzm78
 7HQ1eS4qlb/FtBYtHe2Diz+BQ5kAHc7Od2aIDVAUw6URCSwyNBigqpKplCwsuFWICJHt
 RlJwBYiuWMx6V8DcH3aivgEidylhQClxPR4XbvShZENKc3jmK4Iw+RYy31T2TEkiRo/8
 Afz/3LKocaUxTcfUwOT5KPy82VQUK/AB7QiDW9bryTgeTLgATzhhfQGFJhLPy3jxXjYk
 eZsrf+E9kGuN6DwTVmuTSl1aZ3RKkZJuTMIoultWUO+t8baxrsaOBHaXj+uIa+P54slm KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sundrynhw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 04 Jun 2019 10:55:43 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 579B415E;
 Tue,  4 Jun 2019 08:55:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3591E2507;
 Tue,  4 Jun 2019 08:55:35 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019
 10:55:35 +0200
Received: from localhost (10.201.23.31) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019 10:55:32
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>
Date: Tue, 4 Jun 2019 10:55:13 +0200
Message-ID: <1559638519-6128-5-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
References: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-04_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erwan Le Ray <erwan.leray@st.com>, linux-serial@vger.kernel.org, Fabrice
 Gasnier <fabrice.gasnier@st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/10] serial: stm32: add pm_runtime support
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use pm_runtime for clock management.

Signed-off-by: Bich Hemon <bich.hemon@st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 8a7c582..05d2ef6 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -765,13 +765,13 @@ static void stm32_pm(struct uart_port *port, unsigned int state,
 
 	switch (state) {
 	case UART_PM_STATE_ON:
-		clk_prepare_enable(stm32port->clk);
+		pm_runtime_get_sync(port->dev);
 		break;
 	case UART_PM_STATE_OFF:
 		spin_lock_irqsave(&port->lock, flags);
 		stm32_clr_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 		spin_unlock_irqrestore(&port->lock, flags);
-		clk_disable_unprepare(stm32port->clk);
+		pm_runtime_put_sync(port->dev);
 		break;
 	}
 }
@@ -1040,6 +1040,11 @@ static int stm32_serial_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &stm32port->port);
 
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
+
 	return 0;
 
 err_nowup:
@@ -1058,6 +1063,9 @@ static int stm32_serial_remove(struct platform_device *pdev)
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 	struct stm32_usart_config *cfg = &stm32_port->info->cfg;
+	int err;
+
+	pm_runtime_get_sync(&pdev->dev);
 
 	stm32_clr_bits(port, ofs->cr3, USART_CR3_DMAR);
 
@@ -1084,7 +1092,12 @@ static int stm32_serial_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(stm32_port->clk);
 
-	return uart_remove_one_port(&stm32_usart_driver, port);
+	err = uart_remove_one_port(&stm32_usart_driver, port);
+
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+
+	return err;
 }
 
 
@@ -1241,7 +1254,29 @@ static int stm32_serial_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */
 
+static int __maybe_unused stm32_serial_runtime_suspend(struct device *dev)
+{
+	struct uart_port *port = dev_get_drvdata(dev);
+	struct stm32_port *stm32port = container_of(port,
+			struct stm32_port, port);
+
+	clk_disable_unprepare(stm32port->clk);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_serial_runtime_resume(struct device *dev)
+{
+	struct uart_port *port = dev_get_drvdata(dev);
+	struct stm32_port *stm32port = container_of(port,
+			struct stm32_port, port);
+
+	return clk_prepare_enable(stm32port->clk);
+}
+
 static const struct dev_pm_ops stm32_serial_pm_ops = {
+	SET_RUNTIME_PM_OPS(stm32_serial_runtime_suspend,
+			   stm32_serial_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_serial_suspend, stm32_serial_resume)
 };
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
