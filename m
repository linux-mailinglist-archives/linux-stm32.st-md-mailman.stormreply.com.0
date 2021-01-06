Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F672EC121
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 17:24:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 188B1C5718D;
	Wed,  6 Jan 2021 16:24:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAAFBC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 16:23:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106GHMxE012043; Wed, 6 Jan 2021 17:23:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=NOnMZTvRCPz4nCDUvAVvkeo7nZTTuO+I1JzMInY3HtE=;
 b=5zBJQUv1sUw2balNfU4KYwysHgHVsVbRbE9155AC5cpa0kCO2ouy3zUXTxH8eMstK5jV
 tNYew6wLeinxbq7m+hhau4YL1cOKMyreYhAahxENjHPl8YboEJIA9ERI6zisDQuDfS/c
 MEp8+YstHmv3rdeBr0QrIm48aGukuOWZm663gnap8SYow/NMmwxwuVGsDBHs/uIgnTQq
 zcTzjdhdxj2M8psQpLjyxqLpqNnKkosYzNdThQ3LZC57bOTZw9p+PWHHWSEb1KF6+KI/
 gdyQe+LHx1V/HubxWal/MMCihZEQYTEFkVmZBl61BTSCRrjKSQfY8v5PHl+VNrBhI21q MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf6740h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 17:23:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB73F10002A;
 Wed,  6 Jan 2021 17:23:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC3982417A8;
 Wed,  6 Jan 2021 17:23:50 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan 2021 17:23:50
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 6 Jan 2021 17:22:02 +0100
Message-ID: <20210106162203.28854-8-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106162203.28854-1-erwan.leray@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_09:2021-01-06,
 2021-01-06 signatures=0
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, Etienne Carriere <etienne.carriere@foss.st.com>,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] serial: stm32: clean probe and remove
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
