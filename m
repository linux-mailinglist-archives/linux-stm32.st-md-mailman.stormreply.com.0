Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F71BE21A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 17:09:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3A61C36B0D;
	Wed, 29 Apr 2020 15:09:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55BBBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 15:09:38 +0000 (UTC)
IronPort-SDR: +rUc6sjqRtHIatXqgy3eq+Jve0Rmm/oOdl7iBe2dOk2vbdtMjvYyNgAji9AosoQeMko8DdVZX3
 tcHgQe47cLIQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 08:09:35 -0700
IronPort-SDR: WQ7JPyqiixk3tjGBb+d8JzMARm8zJ3Z8nbI5rSzN27DzgvK5Ll2064gPOKVaXONKiJQl6SOnyi
 w440qNlrbDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="293227924"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2020 08:09:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 41993166; Wed, 29 Apr 2020 18:09:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Wed, 29 Apr 2020 18:09:32 +0300
Message-Id: <20200429150932.17927-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>
Subject: [Linux-stm32] [PATCH v1] stmmac: intel: Fix kernel crash due to
	wrong error path
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

Unfortunately sometimes ->probe() may fail. The commit b9663b7ca6ff
("net: stmmac: Enable SERDES power up/down sequence")
messed up with error handling and thus:

[   12.811311] ------------[ cut here ]------------
[   12.811993] kernel BUG at net/core/dev.c:9937!

Fix this by properly crafted error path.

Fixes: b9663b7ca6ff ("net: stmmac: Enable SERDES power up/down sequence")
Cc: Voon Weifeng <weifeng.voon@intel.com>
Cc: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 565da6498c846e..ff22f274aa43d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4991,7 +4991,7 @@ int stmmac_dvr_probe(struct device *device,
 						 priv->plat->bsp_priv);
 
 		if (ret < 0)
-			return ret;
+			goto error_serdes_powerup;
 	}
 
 #ifdef CONFIG_DEBUG_FS
@@ -5000,6 +5000,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	return ret;
 
+error_serdes_powerup:
+	unregister_netdev(ndev);
 error_netdev_register:
 	phylink_destroy(priv->phylink);
 error_phy_setup:
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
