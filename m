Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E471931FE30
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 18:47:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3E38C57B6A;
	Fri, 19 Feb 2021 17:47:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B50C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 17:47:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JHliam024587; Fri, 19 Feb 2021 18:47:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=09/kY+M5hA8Jr80kzo1oUnnWddYqgoiumzAxzpyWSaU=;
 b=1RvJsxDYAqXuI5c0feWaOwSFOa2sAH45Rvlmk8oMLVYGIOAWriWMVzDGPVVTPUOnXng4
 9to3K7bbG2FOfV5KA3MFk75a33YUw2UZB0c9+71HNgd1C9TLb0XO7ThWkCxHXYTLmIeE
 BG0d6n39YxCKR9Xb7TZv9zcYXDpP/jKhx/Nu5PAxje6lGWe4x5U18mEOlgAtEYCnQl49
 YEGt65jG6zRoNlmtkDv8b5G5ztJ13X/UKnMQ00y8m1Zv5NmPJMRQfGVZm0UhX/wWSxaL
 mQbqau9aVdZrbb7ETILVNwZ3+VSYvZLNGrs50Gb71yVlz4OXs+wEwszVl2RBOVMHalFO iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p6hq7p34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:47:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24B3710002A;
 Fri, 19 Feb 2021 18:47:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1927F25F3FC;
 Fri, 19 Feb 2021 18:47:47 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 18:47:46
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Feb 2021 18:47:30 +0100
Message-ID: <20210219174736.1022-8-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219174736.1022-1-erwan.leray@foss.st.com>
References: <20210219174736.1022-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/13] serial: stm32: fix a deadlock in
	set_termios
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

CTS/RTS GPIOs support that has been added recently to STM32 UART driver has
introduced scheduled code in a set_termios part protected by a spin lock.
This generates a potential deadlock scenario:

Chain exists of:
&irq_desc_lock_class --> console_owner --> &port_lock_key

Possible unsafe locking scenario:

     CPU0                    CPU1
     ----                    ----
lock(&port_lock_key);
                           lock(console_owner);
                           lock(&port_lock_key);
lock(&irq_desc_lock_class);

*** DEADLOCK ***
4 locks held by stty/766:

Move the scheduled code after the spinlock.

Fixes: 6cf61b9bd7cc ("tty: serial: Add modem control gpio support for STM32 UART")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 14011183edfe..4ba164820904 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -829,12 +829,6 @@ static void stm32_usart_set_termios(struct uart_port *port,
 		cr3 |= USART_CR3_CTSE | USART_CR3_RTSE;
 	}
 
-	/* Handle modem control interrupts */
-	if (UART_ENABLE_MS(port, termios->c_cflag))
-		stm32_usart_enable_ms(port);
-	else
-		stm32_usart_disable_ms(port);
-
 	usartdiv = DIV_ROUND_CLOSEST(port->uartclk, baud);
 
 	/*
@@ -916,6 +910,12 @@ static void stm32_usart_set_termios(struct uart_port *port,
 
 	stm32_usart_set_bits(port, ofs->cr1, BIT(cfg->uart_enable_bit));
 	spin_unlock_irqrestore(&port->lock, flags);
+
+	/* Handle modem control interrupts */
+	if (UART_ENABLE_MS(port, termios->c_cflag))
+		stm32_usart_enable_ms(port);
+	else
+		stm32_usart_disable_ms(port);
 }
 
 static const char *stm32_usart_type(struct uart_port *port)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
