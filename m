Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4531FE34
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 18:48:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC2CBC57B79;
	Fri, 19 Feb 2021 17:47:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD6A1C57B66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 17:47:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JHgIIq007922; Fri, 19 Feb 2021 18:47:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=d6j2WxPuLKUcsUWQ6T1AuS39KqUTMKfzuBaVK3XijJ8=;
 b=AG+HRN02pUCS7QBma/jIGD0/JSWG4WlHADB6xkUw+UZROVL9DqIlQ8LCh+5FyCuTtgS+
 Ws9MuygO3ZHc72g28k+M3k7xXcvFUKAx6i14MBWgz+nv+VCNDbbAFoKnqYZtPGBFTx9p
 QXMOoPKdRnn7HzVCffCf5LspyAzwzygWs6UWBqiSgR51lahlR2bBJb6tbrds57eG1de3
 vW1W7un3aF/xnEqRU47+8qtnHsCTL2uFPgjjdZILi79V33mOTnRyUQWCHyYl80dkZh8S
 bFxuG1FPQ73SLIcXwqhJnWRgNzS6diR0rEKi4b1Plwc6VuVyukz4CUOtXr+SO7U0pJQQ 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36sqadhaxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:47:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE3E610002A;
 Fri, 19 Feb 2021 18:47:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3CFC25F3FD;
 Fri, 19 Feb 2021 18:47:50 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 18:47:50
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Feb 2021 18:47:34 +0100
Message-ID: <20210219174736.1022-12-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219174736.1022-1-erwan.leray@foss.st.com>
References: <20210219174736.1022-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/13] serial: stm32: add FIFO flush when port
	is closed
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

Transmission complete error is sent when ISR_TC is not set. If port closure
is requested despite data in TDR / TX FIFO has not been sent (because of
flow control), ISR_TC is not set and error message is sent on port closure
but also when a new port is opened.

Flush the data when port is closed, so the error isn't printed twice upon
next port opening.

Fixes: 64c32eab6603 ("serial: stm32: Add support of TC bit status check")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 45203648172b..dcc309fd5d2f 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -691,6 +691,11 @@ static void stm32_usart_shutdown(struct uart_port *port)
 	if (ret)
 		dev_err(port->dev, "Transmission is not complete\n");
 
+	/* flush RX & TX FIFO */
+	if (ofs->rqr != UNDEF_REG)
+		writel_relaxed(USART_RQR_TXFRQ | USART_RQR_RXFRQ,
+			       port->membase + ofs->rqr);
+
 	stm32_usart_clr_bits(port, ofs->cr1, val);
 
 	free_irq(port->irq, port);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
