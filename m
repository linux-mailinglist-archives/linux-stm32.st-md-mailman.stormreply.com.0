Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 283483E8F34
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 12:59:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3E4FC5A4CD;
	Wed, 11 Aug 2021 10:59:36 +0000 (UTC)
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48AB7C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 10:51:13 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56113ab96e18-63f1f;
 Wed, 11 Aug 2021 18:51:02 +0800 (CST)
X-RM-TRANSID: 2ee56113ab96e18-63f1f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66113ab91f32-3a776;
 Wed, 11 Aug 2021 18:51:01 +0800 (CST)
X-RM-TRANSID: 2ee66113ab91f32-3a776
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 11 Aug 2021 18:51:36 +0800
Message-Id: <20210811105136.25392-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Aug 2021 10:59:35 +0000
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: fix the conditional expression
	writing
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

In the function stm32_usart_init_port, intent of the code maybe when
irq returns a value of zero, the return should be '-ENODEV'. But the
conditional expression '? :' maybe clerical error, it should be
'?:' to make '-ENODEV' work.
But in fact, as the example in platform.c is
  * int irq = platform_get_irq(pdev, 0);
  * if (irq < 0)
  * return irq;
So the return value of zero is unnecessary to check, at last remove
the unnecessary '?: -ENODEV'.

Co-developed-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/tty/serial/stm32-usart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index ef793b3b4..090822cd1 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1034,8 +1034,8 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 	int ret, irq;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return irq ? : -ENODEV;
+	if (irq < 0)
+		return irq;
 
 	port->iotype	= UPIO_MEM;
 	port->flags	= UPF_BOOT_AUTOCONF;
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
