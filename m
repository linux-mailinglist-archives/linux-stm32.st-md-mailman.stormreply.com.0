Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E3B3EC2B4
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Aug 2021 14:49:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 368F3C5A4CE;
	Sat, 14 Aug 2021 12:49:28 +0000 (UTC)
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9687C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Aug 2021 12:49:23 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66117bbc64ba-8c694;
 Sat, 14 Aug 2021 20:49:12 +0800 (CST)
X-RM-TRANSID: 2ee66117bbc64ba-8c694
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76117bbc2f36-269aa;
 Sat, 14 Aug 2021 20:49:11 +0800 (CST)
X-RM-TRANSID: 2ee76117bbc2f36-269aa
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Sat, 14 Aug 2021 20:49:51 +0800
Message-Id: <20210814124951.30084-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: use the defined variable to
	simplify code
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

Use the defined variable 'dev' to make the code cleaner.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/tty/serial/stm32-usart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index d4ea86e28..8f032e77b 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1176,7 +1176,7 @@ static int stm32_usart_of_dma_rx_probe(struct stm32_port *stm32port,
 	if (uart_console(port))
 		return -ENODEV;
 
-	stm32port->rx_buf = dma_alloc_coherent(&pdev->dev, RX_BUF_L,
+	stm32port->rx_buf = dma_alloc_coherent(dev, RX_BUF_L,
 					       &stm32port->rx_dma_buf,
 					       GFP_KERNEL);
 	if (!stm32port->rx_buf)
@@ -1242,7 +1242,7 @@ static int stm32_usart_of_dma_tx_probe(struct stm32_port *stm32port,
 
 	stm32port->tx_dma_busy = false;
 
-	stm32port->tx_buf = dma_alloc_coherent(&pdev->dev, TX_BUF_L,
+	stm32port->tx_buf = dma_alloc_coherent(dev, TX_BUF_L,
 					       &stm32port->tx_dma_buf,
 					       GFP_KERNEL);
 	if (!stm32port->tx_buf)
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
