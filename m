Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EB3A3C94
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 09:07:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E49C58D5B;
	Fri, 11 Jun 2021 07:07:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2D5C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 07:07:17 +0000 (UTC)
IronPort-SDR: TdIkbRFUWW3Qr9KBkxaJZBMmZQLHvuJFdwySpy7rqIm8d7U28gjaT8HzSvnAva7NW8lNjFcHvc
 P0wWTusvSCaw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205435499"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="205435499"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 00:07:04 -0700
IronPort-SDR: afjxRnVnKdW7kcXTge4k/NNkVMeLOqvtprD/PsspPRHe5JKjDig+E7erlN7fy+rUahcnJ5tQvL
 rc0eajHzK7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="486491531"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2021 00:07:02 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id B189F580BD5;
 Fri, 11 Jun 2021 00:06:59 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 11 Jun 2021 15:11:43 +0800
Message-Id: <20210611071143.987866-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix unused
	values warnings
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

The commit 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines
for mac, safety, RX & TX") introduced the converity warnings:-

  1. Unused value (UNUSED_VALUE)
     assigned_value: Assigning value REQ_IRQ_ERR_MAC to irq_err here,
     but that stored value is not used.

  2. Unused value (UNUSED_VALUE)
     assigned_value: Assigning value REQ_IRQ_ERR_NO to irq_err here,
     but that stored value is overwritten before it can used.

  3. Unused value (UNUSED_VALUE)
     assigned_value: Assigning value REQ_IRQ_ERR_WOL to irq_err here,
     but that stored value is not used.

Fixed these by removing the unnecessary value assignments.

Fixes: 8532f613bc78 ("net: stmmac: introduce MSI Interrupt routines for mac, safety, RX & TX")
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index db97cd4b871d..4177fd6a9db5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3406,8 +3406,8 @@ static void stmmac_free_irq(struct net_device *dev,
 
 static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
-	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
 	struct stmmac_priv *priv = netdev_priv(dev);
+	enum request_irq_err irq_err;
 	cpumask_t cpu_mask;
 	int irq_idx = 0;
 	char *int_name;
@@ -3554,8 +3554,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 
 static int stmmac_request_irq_single(struct net_device *dev)
 {
-	enum request_irq_err irq_err = REQ_IRQ_ERR_NO;
 	struct stmmac_priv *priv = netdev_priv(dev);
+	enum request_irq_err irq_err;
 	int ret;
 
 	ret = request_irq(dev->irq, stmmac_interrupt,
@@ -3565,7 +3565,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 			   "%s: ERROR: allocating the IRQ %d (error: %d)\n",
 			   __func__, dev->irq, ret);
 		irq_err = REQ_IRQ_ERR_MAC;
-		return ret;
+		goto irq_error;
 	}
 
 	/* Request the Wake IRQ in case of another line
@@ -3579,7 +3579,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 				   "%s: ERROR: allocating the WoL IRQ %d (%d)\n",
 				   __func__, priv->wol_irq, ret);
 			irq_err = REQ_IRQ_ERR_WOL;
-			return ret;
+			goto irq_error;
 		}
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
