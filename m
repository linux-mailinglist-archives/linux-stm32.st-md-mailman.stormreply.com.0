Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE43DD32C
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D65C4C5A4D2;
	Mon,  2 Aug 2021 09:44:22 +0000 (UTC)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0214CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 08:53:49 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id BE585C2116;
 Mon, 19 Jul 2021 16:53:46 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [113.57.152.160])
 by smtp.263.net (postfix) whith ESMTP id
 P4547T140388981532416S1626684826149785_; 
 Mon, 19 Jul 2021 16:53:46 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <cd2d5452c41b1d359dbae504a2dc1045>
X-RL-SENDER: chenhaoa@uniontech.com
X-SENDER: chenhaoa@uniontech.com
X-LOGIN-NAME: chenhaoa@uniontech.com
X-FST-TO: peppe.cavallaro@st.com
X-RCPT-COUNT: 11
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Hao Chen <chenhaoa@uniontech.com>
To: peppe.cavallaro@st.com
Date: Mon, 19 Jul 2021 16:53:06 +0800
Message-Id: <20210719085306.30820-1-chenhaoa@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:19 +0000
Cc: Hao Chen <chenhaoa@uniontech.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3] net: stmmac: fix 'ethtool -P' return -EBUSY
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

The permanent mac address should be available for query when the device
is not up.
NetworkManager, the system network daemon, uses 'ethtool -P' to obtain
the permanent address after the kernel start. When the network device
is not up, it will return the device busy error with 'ethtool -P'. At
that time, it is unable to access the Internet through the permanent
address by NetworkManager.
I think that the '.begin' is not used to check if the device is up.

Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d0ce608b81c3..8fbb58c95507 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -15,6 +15,7 @@
 #include <linux/phylink.h>
 #include <linux/net_tstamp.h>
 #include <asm/io.h>
+#include <linux/pm_runtime.h>
 
 #include "stmmac.h"
 #include "dwmac_dma.h"
@@ -412,8 +413,10 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
 
 static int stmmac_check_if_running(struct net_device *dev)
 {
-	if (!netif_running(dev))
-		return -EBUSY;
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	pm_runtime_get_sync(priv->device);
+
 	return 0;
 }
 
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
