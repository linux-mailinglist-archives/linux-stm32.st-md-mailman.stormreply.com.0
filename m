Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D954B4847C4
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 19:26:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C9FC60467;
	Tue,  4 Jan 2022 18:26:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B319BC60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 18:26:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204FQG3K032620;
 Tue, 4 Jan 2022 19:25:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5bcwS38T/HZMOjrZpC28q7ZFA6+/QWchHVmneYfJfeE=;
 b=FBoxAasqPWRIkJDBDUIsINVqVUj+cTanpvDBg8RjJyV39wzE22vpR7y9anOyjmJJyKlj
 tjUy4nSfoi9RMcQcKg2FHBB+ecrV74FKyM1gIINos4a/F/57T0zl46eqA2jrBeU+anN+
 EssXoPmKRvJSIOHGui2Yv6L7DTJVqLUk5tKOj1cypF1fsbLkPz5CCA8YPnnWZwKe3btp
 8kfyu0BPTUWhBvKVFYAFNIEaznm3u87eWi6nwJN9j074UU8ubt9zu/qgXLA8xO8sMzs1
 j2z29MQxqFQNRr2wlSZ6chWPdgL0wmjvdSZ7ranfgz2a0EiegJsuk7oYrMtj5/Y+JL5P mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcagrc7wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 19:25:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABC8F10002A;
 Tue,  4 Jan 2022 19:25:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5D9E24D5E6;
 Tue,  4 Jan 2022 19:25:51 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 19:25:50
 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 4 Jan 2022 19:24:45 +0100
Message-ID: <20220104182445.4195-5-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220104182445.4195-1-valentin.caron@foss.st.com>
References: <20220104182445.4195-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_09,2022-01-04_01,2021-12-02_01
Cc: linux-serial@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] serial: stm32: correct loop for dma error
	handling
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

In this error handling, "transmit_chars_dma" function will call
"transmit_chars_pio" once per characters. But "transmit_chars_pio" will
continue to send characters while xmit buffer is not empty.

Remove this useless loop, one call is sufficient.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/tty/serial/stm32-usart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 788e002688f2..1f89ab0e49ac 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -477,7 +477,7 @@ static void stm32_usart_transmit_chars_dma(struct uart_port *port)
 	const struct stm32_usart_offsets *ofs = &stm32port->info->ofs;
 	struct circ_buf *xmit = &port->state->xmit;
 	struct dma_async_tx_descriptor *desc = NULL;
-	unsigned int count, i;
+	unsigned int count;
 
 	if (stm32_usart_tx_dma_started(stm32port)) {
 		if (!stm32_usart_tx_dma_enabled(stm32port))
@@ -542,8 +542,7 @@ static void stm32_usart_transmit_chars_dma(struct uart_port *port)
 	return;
 
 fallback_err:
-	for (i = count; i > 0; i--)
-		stm32_usart_transmit_chars_pio(port);
+	stm32_usart_transmit_chars_pio(port);
 }
 
 static void stm32_usart_transmit_chars(struct uart_port *port)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
