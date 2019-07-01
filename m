Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3DC2545A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 17:46:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC8FBC7BF76
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 15:46:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5255C7BF75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 15:46:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LFjw7P004981; Tue, 21 May 2019 17:46:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qEx6uDe0U5ghEnBHm99gzwaV8EBDYsz7AHTItZcDFEI=;
 b=OJB0s+yPhWGa2riM+WQcEmikoIcHn9qFrpXobf2+XbjfYFTcePdkfELu1iPgLH9ZaEzs
 Wj2RvfWDFP8rMcXte8Ns5Jv0GhMtKqgikVnvH4BdePxL2yYjjOA5UTmDyXyzQmIOqu5n
 cZiWR9dFmn/w8u9i0RMDaLX2F5MUhN8b3KUOkottCtIMDUlR9FpTMC0ALxt/DQzXwDZl
 iS0O48fITRub/fbS772sR29o/SLB4bnGJbE11nYqcfDHXF9UUVMCl3ulC4pVDiEWvetk
 bGnf0RKE5/HYGWg9abWZEI7g6HXV3NONtyI4/WdJmXBUianUH6t9iEHK4c6N7T2Nir+0 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7tu2h6r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 17:46:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEB8D3D;
 Tue, 21 May 2019 15:46:37 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9A352CEA;
 Tue, 21 May 2019 15:46:37 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 17:46:37 +0200
Received: from localhost (10.201.23.31) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 17:46:36
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>
Date: Tue, 21 May 2019 17:45:43 +0200
Message-ID: <1558453547-22866-4-git-send-email-erwan.leray@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558453547-22866-1-git-send-email-erwan.leray@st.com>
References: <1558453547-22866-1-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.31]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_03:, , signatures=0
Cc: linux-kernel@vger.kernel.org, Erwan Le Ray <erwan.leray@st.com>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] serial: stm32: fix rx data length when
	parity enabled
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

- Fixes a rx data error when data length < 8 bits and parity is enabled.
RDR register MSB is used for parity bit reception.
- Adds a mask to ignore MSB when data is get from RDR.

Fixes: 3489187204eb ("serial: stm32: adding dma support")
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index f6b7393..0a7953e 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -194,8 +194,8 @@ static int stm32_pending_rx(struct uart_port *port, u32 *sr, int *last_res,
 	return 0;
 }
 
-static unsigned long
-stm32_get_char(struct uart_port *port, u32 *sr, int *last_res)
+static unsigned long stm32_get_char(struct uart_port *port, u32 *sr,
+				    int *last_res)
 {
 	struct stm32_port *stm32_port = to_stm32_port(port);
 	struct stm32_usart_offsets *ofs = &stm32_port->info->ofs;
@@ -205,10 +205,13 @@ static int stm32_pending_rx(struct uart_port *port, u32 *sr, int *last_res,
 		c = stm32_port->rx_buf[RX_BUF_L - (*last_res)--];
 		if ((*last_res) == 0)
 			*last_res = RX_BUF_L;
-		return c;
 	} else {
-		return readl_relaxed(port->membase + ofs->rdr);
+		c = readl_relaxed(port->membase + ofs->rdr);
+		/* apply RDR data mask */
+		c &= stm32_port->rdr_mask;
 	}
+
+	return c;
 }
 
 static void stm32_receive_chars(struct uart_port *port, bool threaded)
@@ -679,6 +682,7 @@ static void stm32_set_termios(struct uart_port *port, struct ktermios *termios,
 		cr2 |= USART_CR2_STOP_2B;
 
 	bits = stm32_get_databits(termios);
+	stm32_port->rdr_mask = (BIT(bits) - 1);
 
 	if (cflag & PARENB) {
 		bits++;
diff --git a/drivers/tty/serial/stm32-usart.h b/drivers/tty/serial/stm32-usart.h
index 8d34802..30d2433 100644
--- a/drivers/tty/serial/stm32-usart.h
+++ b/drivers/tty/serial/stm32-usart.h
@@ -254,6 +254,7 @@ struct stm32_port {
 	bool hw_flow_control;
 	bool fifoen;
 	int wakeirq;
+	int rdr_mask;		/* receive data register mask */
 };
 
 static struct stm32_port stm32_ports[STM32_MAX_PORTS];
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
