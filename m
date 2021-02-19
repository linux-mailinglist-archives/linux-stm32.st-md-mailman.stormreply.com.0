Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F179E31FE31
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 18:47:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2EB6C57B6E;
	Fri, 19 Feb 2021 17:47:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10B61C57B68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 17:47:57 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JHgJkq007987; Fri, 19 Feb 2021 18:47:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=K2uTlfei1P+sErSac4XVVp+eTsZmAZZ9mEtyxUIwD98=;
 b=CPlA6AdT3/bDvjYTxpna/wdnSVOmb5suuz6MpBP2SzDWT2IffKEkyGqu7wsKrjEzIziY
 pYe/9T69cPh5/5Ds1r0zrBPmLNlxoFBLbpkIF2LBTGAmM1W7DowsaZntSm8tuwOktaCb
 iYYRGpgyoKP3m3zR7TDEosDHjoLT4Os8u94wi3lWRH06afdLFGFYkkTNcF5Zx756V7X7
 2WbVapTMmsTBDVGvVlJo0lKTbAtYNAiqytGPGKUbuWTQv/tq/ciiwpT7ocm2W4WdRmyz
 XzoL8Rki3zJXEbQZNor8k4XsqXWoxCjaQUef6W49/J5JGD2UHHd2JSf16RRbdh0Wjy++ gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36sqadhaxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:47:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCCA710002A;
 Fri, 19 Feb 2021 18:47:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B163925F3FD;
 Fri, 19 Feb 2021 18:47:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 18:47:51
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 19 Feb 2021 18:47:35 +0100
Message-ID: <20210219174736.1022-13-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219174736.1022-1-erwan.leray@foss.st.com>
References: <20210219174736.1022-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/13] serial: stm32: fix tx_empty condition
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

In "tx_empty", we should poll TC bit in both DMA and PIO modes (instead of
TXE) to check transmission data register has been transmitted independently
of the FIFO mode. TC indicates that both transmit register and shift
register are empty. When shift register is empty, tx_empty should return
TIOCSER_TEMT instead of TC value.

Cleans the USART_CR_TC TCCF register define (transmission complete clear
flag) as it is duplicate of USART_ICR_TCCF.

Fixes: 48a6092fb41f ("serial: stm32-usart: Add STM32 USART Driver")
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index dcc309fd5d2f..114408f3892a 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -515,7 +515,10 @@ static unsigned int stm32_usart_tx_empty(struct uart_port *port)
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
 
-	return readl_relaxed(port->membase + ofs->isr) & USART_SR_TXE;
+	if (readl_relaxed(port->membase + ofs->isr) & USART_SR_TC)
+		return TIOCSER_TEMT;
+
+	return 0;
 }
 
 static void stm32_usart_set_mctrl(struct uart_port *port, unsigned int mctrl)
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index d4c916e78d40..e305462d0de6 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -127,9 +127,6 @@ struct stm32_usart_info stm32h7_info = {
 /* Dummy bits */
 #define USART_SR_DUMMY_RX	BIT(16)
 
-/* USART_ICR (F7) */
-#define USART_CR_TC		BIT(6)
-
 /* USART_DR */
 #define USART_DR_MASK		GENMASK(8, 0)
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
