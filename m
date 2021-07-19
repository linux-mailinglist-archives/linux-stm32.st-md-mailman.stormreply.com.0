Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7943DD336
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 998D1C5A4DD;
	Mon,  2 Aug 2021 09:44:40 +0000 (UTC)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB8FFCFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 13:09:29 +0000 (UTC)
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id EDB8EB1936;
 Mon, 19 Jul 2021 21:09:25 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [113.57.152.160])
 by smtp.263.net (postfix) whith ESMTP id
 P13644T140562088032000S1626700165290287_; 
 Mon, 19 Jul 2021 21:09:26 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d0e9c68a6780ff19d835a3a8d28dbae0>
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
Date: Mon, 19 Jul 2021 21:08:45 +0800
Message-Id: <20210719130845.2102-1-chenhaoa@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:19 +0000
Cc: Hao Chen <chenhaoa@uniontech.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5] net: stmmac: fix 'ethtool -P' return -EBUSY
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
I think that the '.begin' is not used to check if the device is up, it's
just a pre hook for ethtool. We shouldn't check if the device is up
there.

Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d0ce608b81c3..8901dc9f758e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -410,13 +410,6 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
 
 }
 
-static int stmmac_check_if_running(struct net_device *dev)
-{
-	if (!netif_running(dev))
-		return -EBUSY;
-	return 0;
-}
-
 static int stmmac_ethtool_get_regs_len(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -1073,7 +1066,6 @@ static int stmmac_set_tunable(struct net_device *dev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
-	.begin = stmmac_check_if_running,
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
