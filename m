Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34233DE454
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 04:23:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8A95C597BE;
	Tue,  3 Aug 2021 02:23:32 +0000 (UTC)
Received: from smtpbg511.qq.com (smtpbg511.qq.com [203.205.250.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 583DDC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 02:23:29 +0000 (UTC)
X-QQ-mid: bizesmtp42t1627957400teqn1yb4
Received: from localhost.localdomain (unknown [113.57.152.160])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 03 Aug 2021 10:23:19 +0800 (CST)
X-QQ-SSF: 0140000000200050B000B00A0000000
X-QQ-FEAT: Ry58bBY793vwWAmJfkkzlbE2CLg2irVtpec/fjDR8hPwID05wka8DM9dg5hOr
 0zAAEZrr2zpmw0bXWXaiYMdYrRGBtwkowaeYyIPdBTSzK2BlqU+CO1SCIZIw5INnlk7wGs+
 EwR2IdSuiv6H6cec7ctlYCRoZ4cJdEpyGPzccJuS6ur/WkIYR8N1gGVkj6wWuin8zxDWfsL
 8DgD+AoX+XUZmYqzbfJQYObD9UMvIC9RTPNFnC+ylUmTy8nVQ3r+SOnbqtoQLzsFN+Xnaq9
 F0RzcbFHG8KdOzSoE1ZN5ZypC+Qu8Fl6d6T/kvhMrS2xqj66duWPNmWzWVX12SgHz4T/cOu
 KQ7fa4rpHOeb72O1Kfozch2aL37+RfAGFNcnXLs+Oul4NNh3YE=
X-QQ-GoodBg: 2
From: Hao Chen <chenhaoa@uniontech.com>
To: peppe.cavallaro@st.com
Date: Tue,  3 Aug 2021 10:22:32 +0800
Message-Id: <20210803022232.23145-1-chenhaoa@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: Hao Chen <chenhaoa@uniontech.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next,
	v8] net: stmmac: optimize check in ops '.begin'
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

I want to get permanent MAC address when the interface is down. And I think
it is more convenient to get statistics in the down state by 'ethtool -S'.
But current all of the ethool command return -EBUSY.

I don't think we should check that the network interface is up in '.begin',
which will cause that all the ethtool commands can't be used when the
network interface is down. If some ethtool commands can only be used in the
up state, check it in the corresponding ethool OPS function is better.
This is too rude and unreasonable.

Compile-tested on arm64. Tested on an arm64 system with an on-board
STMMAC chip.

Changes v7 ... v8:
- Optimize commit description information, optimization parameters of
  pm_runtime function.

Changes v6 ... v7:
- fix arg type error of 'dev' to 'priv->device'.

Changes v5 ... v6:
- The 4.19.90 kernel not support pm_runtime, so implemente '.begin' and
  '.complete' again. Add return value check of pm_runtime function.

Changes v4 ... v5:
- test the '.begin' will return -13 error on my machine based on 4.19.90
  kernel. The platform driver does not supported pm_runtime. So remove the
  implementation of '.begin' and '.complete'.

Changes v3 ... v4:
- implement '.complete' ethtool OPS.

Changes v2 ... v3:
- add linux/pm_runtime.h head file.

Changes v1 ... v2:
- fix spell error of dev.

Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d0ce608b81c3..8e2ae0ff7f8f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -12,8 +12,9 @@
 #include <linux/ethtool.h>
 #include <linux/interrupt.h>
 #include <linux/mii.h>
-#include <linux/phylink.h>
 #include <linux/net_tstamp.h>
+#include <linux/phylink.h>
+#include <linux/pm_runtime.h>
 #include <asm/io.h>
 
 #include "stmmac.h"
@@ -410,11 +411,14 @@ static void stmmac_ethtool_setmsglevel(struct net_device *dev, u32 level)
 
 }
 
-static int stmmac_check_if_running(struct net_device *dev)
+static int stmmac_ethtool_begin(struct net_device *dev)
 {
-	if (!netif_running(dev))
-		return -EBUSY;
-	return 0;
+	return pm_runtime_resume_and_get(dev->dev);
+}
+
+static void stmmac_ethtool_complete(struct net_device *dev)
+{
+	pm_runtime_put(dev->dev);
 }
 
 static int stmmac_ethtool_get_regs_len(struct net_device *dev)
@@ -1073,7 +1077,8 @@ static int stmmac_set_tunable(struct net_device *dev,
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
-	.begin = stmmac_check_if_running,
+	.begin = stmmac_ethtool_begin,
+	.complete = stmmac_ethtool_complete,
 	.get_drvinfo = stmmac_ethtool_getdrvinfo,
 	.get_msglevel = stmmac_ethtool_getmsglevel,
 	.set_msglevel = stmmac_ethtool_setmsglevel,
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
