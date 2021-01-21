Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF712FECCF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jan 2021 15:23:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BB46C3FADB;
	Thu, 21 Jan 2021 14:23:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 079D9C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 14:23:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10LEMvnx030032; Thu, 21 Jan 2021 15:23:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=U9FsoHzVxU/pOZkbNb54dcTo9vqdTnlxm3Qvz96EFUQ=;
 b=yffoLAJ2cGRHYuI3VMDCfwYdGF2LUYCb5hhpRXrfiXQvWfXMHz+mrExrYaR+p0CIlUC4
 QYfxXyUfN22XSlYxmtscEuJ+RRidQ8KEy+IcJbIHBEJz+Rg6scKH+HjlAquMcOdjnlIU
 mF7FfDO0kAFXwckve10ZonSimYYEZEVeyCtul9FWz/+7qNiOGtqAlP/98kMOJpWmX/ra
 MxPBbYi5sbDokKrEKEFE0RrVYLCWo6Klc1qh2lYdpeczlm0CCTrlSqwIJXzb1CUWnw5z
 +kRZcZc5ePOj5Aaq32Plgf+InO+hB2GMSHE875pPWOF/jxxvcALzvKHvhj3tDWqo4KKS sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668q03nr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 15:23:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E231B100034;
 Thu, 21 Jan 2021 15:23:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D011F2AD2D3;
 Thu, 21 Jan 2021 15:23:22 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan 2021 15:23:22
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 21 Jan 2021 15:23:09 +0100
Message-ID: <20210121142309.6327-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_08:2021-01-21,
 2021-01-21 signatures=0
Cc: Valentin Caron <valentin.caron@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] serial: stm32: improve platform_get_irq
	condition handling in init_port
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

Replace "ret" variable by "irq" variable from platform_get_irq condition
handling in stm32_init_port as suggested by Jiri in "STM32 uart cleanup and
improvement" series review.
This change will prevent port->irq to be unexpectly modified by a potential
change of "ret" value introduced by a new patch.

Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 6a9a5ef5f5ba..dde6d526362d 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -981,11 +981,11 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 {
 	struct uart_port *port = &stm32port->port;
 	struct resource *res;
-	int ret;
+	int ret, irq;
 
-	ret = platform_get_irq(pdev, 0);
-	if (ret <= 0)
-		return ret ? : -ENODEV;
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0)
+		return irq ? : -ENODEV;
 
 	port->iotype	= UPIO_MEM;
 	port->flags	= UPF_BOOT_AUTOCONF;
@@ -993,7 +993,7 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 	port->dev	= &pdev->dev;
 	port->fifosize	= stm32port->info->cfg.fifosize;
 	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_STM32_CONSOLE);
-	port->irq = ret;
+	port->irq = irq;
 	port->rs485_config = stm32_usart_config_rs485;
 
 	ret = stm32_usart_init_rs485(port, pdev);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
