Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4E2E9161
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 09:02:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55976C5719D;
	Mon,  4 Jan 2021 08:02:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09351C5717E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:00:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIIur0I011741; Fri, 18 Dec 2020 20:00:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NOnMZTvRCPz4nCDUvAVvkeo7nZTTuO+I1JzMInY3HtE=;
 b=JJHQ53eBMUY2RcqxUlfwmy0bbPpBtTBkVI+QMIDklJQxgRTfeuNEYFCzIA+fFoyDUQaK
 IEhUEX1X/ZCK5iWW9NQsjM7qD1VXJxtaIupT9VvD1GDjKaEf6WFyI6BFnDUYABzpTzKw
 V6nWNOUXYk/vmbU7NaATC+Zx8ivI5X3w89SBM9RerMo1HYkwUAOsCGpwMUQ5TryaVRed
 gnO0KMnahN+duT85Snw+G5L1DfJMMxpKVsjZCdyUOmjuqpXTNloxqKsmqWfyvDKSciyo
 pMANyNZAPTHAsZXKJunQr+cG6pwH06Tq4TBdDXoa/DAqXJRoHIJ0ddRiTYI24ZxjB9ei HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9ux45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 20:00:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B640100038;
 Fri, 18 Dec 2020 20:00:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EBA1228601;
 Fri, 18 Dec 2020 20:00:32 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 20:00:31
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Dec 2020 20:00:18 +0100
Message-ID: <20201218190020.1572-8-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218190020.1572-1-erwan.leray@foss.st.com>
References: <20201218190020.1572-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_12:2020-12-18,
 2020-12-18 signatures=0
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:02:42 +0000
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, Etienne Carriere <etienne.carriere@foss.st.com>,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] serial: stm32: clean probe and remove
	port deinit
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

Clean probe and remove port deinit by moving clk_disable_unprepare in a
new dedicated deinit_port function.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 0d6c7f3375f0..9d73f6976586 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -970,6 +970,11 @@ static const struct uart_ops stm32_uart_ops = {
 	.verify_port	= stm32_usart_verify_port,
 };
 
+static void stm32_usart_deinit_port(struct stm32_port *stm32port)
+{
+	clk_disable_unprepare(stm32port->clk);
+}
+
 static int stm32_usart_init_port(struct stm32_port *stm32port,
 				 struct platform_device *pdev)
 {
@@ -1279,7 +1284,7 @@ static int stm32_usart_serial_probe(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, false);
 
 err_uninit:
-	clk_disable_unprepare(stm32port->clk);
+	stm32_usart_deinit_port(stm32port);
 
 	return ret;
 }
@@ -1318,7 +1323,7 @@ static int stm32_usart_serial_remove(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, false);
 	}
 
-	clk_disable_unprepare(stm32_port->clk);
+	stm32_usart_deinit_port(stm32_port);
 
 	err = uart_remove_one_port(&stm32_usart_driver, port);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
