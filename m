Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0D2EC106
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 17:22:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EAE9C56638;
	Wed,  6 Jan 2021 16:22:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1115AC56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 16:22:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106GH8vt010910; Wed, 6 Jan 2021 17:22:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nonLGf1B6T2CZJMK3B9e7kkjnQiPSLaoUrjdE7chuKA=;
 b=QXn1YMU1js9y09Gr3dhMd0Xve4JXOmtwLzWXzXfE/W4a0zOHWS4UqAse1rOGv6YKSYSo
 4fbSVcGvm5lpKxu4a65CJ/NS1bOll3qa5n6IXYDXZCQt08tSKm2lA0oFNcqXGf6sBBRv
 YwxBwXs3f8djnZCGNFWRUkumVsoJFHXW0qQGSbVfFoj7q7wfDRdWMFFm1xNQo4/ZyZ/e
 sK5P+fPO2P2U5kF0XR8hABhbFLc/SLyvZ3HpmMiIqIjAtH1si44t+txZBh3kcJo4DJGu
 dD1cjO3cbN8dWkH+7neWAvnrsCMKVcHjEQ7WoH7fwwN9TwpKlr9PDI+C6V0DWNh/QLvf Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35th25urr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 17:22:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84AC0100038;
 Wed,  6 Jan 2021 17:22:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 702A12A4D9E;
 Wed,  6 Jan 2021 17:22:20 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan 2021 17:22:19
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 6 Jan 2021 17:21:56 +0100
Message-ID: <20210106162203.28854-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106162203.28854-1-erwan.leray@foss.st.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_09:2021-01-06,
 2021-01-06 signatures=0
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/8] serial: stm32: fix DMA initialization
	error handling
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

DMA initialization error handling is not properly implemented in the
driver.
Fix DMA initialization error handling by:
- moving TX DMA descriptor request error handling in a new dedicated
fallback_err label
- adding error handling to TX DMA descriptor submission
- adding error handling to RX DMA descriptor submission

This patch depends on '24832ca3ee85 ("tty: serial: stm32-usart: Remove set
but unused 'cookie' variables")' which unfortunately doesn't include a
"Fixes" tag.

Fixes: 3489187204eb ("serial: stm32: adding dma support")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
---
Changes in v2:
- delete DMA cookie variables removal from V1 patch as already done by a
previous patch
- update commit message as DMA cookie variables removal is no more
included in this patch

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index f4de32d3f2af..6248304a001f 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -383,17 +383,18 @@ static void stm32_transmit_chars_dma(struct uart_port *port)
 					   DMA_MEM_TO_DEV,
 					   DMA_PREP_INTERRUPT);
 
-	if (!desc) {
-		for (i = count; i > 0; i--)
-			stm32_transmit_chars_pio(port);
-		return;
-	}
+	if (!desc)
+		goto fallback_err;
 
 	desc->callback = stm32_tx_dma_complete;
 	desc->callback_param = port;
 
 	/* Push current DMA TX transaction in the pending queue */
-	dmaengine_submit(desc);
+	if (dma_submit_error(dmaengine_submit(desc))) {
+		/* dma no yet started, safe to free resources */
+		dmaengine_terminate_async(stm32port->tx_ch);
+		goto fallback_err;
+	}
 
 	/* Issue pending DMA TX requests */
 	dma_async_issue_pending(stm32port->tx_ch);
@@ -402,6 +403,11 @@ static void stm32_transmit_chars_dma(struct uart_port *port)
 
 	xmit->tail = (xmit->tail + count) & (UART_XMIT_SIZE - 1);
 	port->icount.tx += count;
+	return;
+
+fallback_err:
+	for (i = count; i > 0; i--)
+		stm32_transmit_chars_pio(port);
 }
 
 static void stm32_transmit_chars(struct uart_port *port)
@@ -1130,7 +1136,11 @@ static int stm32_of_dma_rx_probe(struct stm32_port *stm32port,
 	desc->callback_param = NULL;
 
 	/* Push current DMA transaction in the pending queue */
-	dmaengine_submit(desc);
+	ret = dma_submit_error(dmaengine_submit(desc));
+	if (ret) {
+		dmaengine_terminate_sync(stm32port->rx_ch);
+		goto config_err;
+	}
 
 	/* Issue pending DMA requests */
 	dma_async_issue_pending(stm32port->rx_ch);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
