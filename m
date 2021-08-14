Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33803EC2CD
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Aug 2021 15:13:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 825FDC5A4CE;
	Sat, 14 Aug 2021 13:13:53 +0000 (UTC)
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE8EEC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Aug 2021 13:13:50 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea6117c17f734-8c87d;
 Sat, 14 Aug 2021 21:13:38 +0800 (CST)
X-RM-TRANSID: 2eea6117c17f734-8c87d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56117c17dce6-27868;
 Sat, 14 Aug 2021 21:13:37 +0800 (CST)
X-RM-TRANSID: 2ee56117c17dce6-27868
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Sat, 14 Aug 2021 21:14:18 +0800
Message-Id: <20210814131418.13608-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: use
	devm_platform_get_and_ioremap_resource()
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

Use devm_platform_get_and_ioremap_resource() to simplify code.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/tty/serial/stm32-usart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 090822cd1..d4ea86e28 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1064,8 +1064,7 @@ static int stm32_usart_init_port(struct stm32_port *stm32port,
 				      &stm32port->txftcfg);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	port->membase = devm_ioremap_resource(&pdev->dev, res);
+	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(port->membase))
 		return PTR_ERR(port->membase);
 	port->mapbase = res->start;
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
