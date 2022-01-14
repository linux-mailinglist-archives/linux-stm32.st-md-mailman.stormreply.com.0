Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F1448E4BD
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 08:14:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF751C5F1F5;
	Fri, 14 Jan 2022 07:14:42 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2495CCFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 07:14:42 +0000 (UTC)
Received: from HP-EliteBook-840-G7.. (1-171-243-193.dynamic-ip.hinet.net
 [1.171.243.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B24093F051; 
 Fri, 14 Jan 2022 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642144481;
 bh=AMaeJwU6vbVLUBH+hvlV4mBDorxRdvxU3bET57l5NAY=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=acRxMnndfebrBcxljP3PF+UnnU+o4fZnyKgE6Qo6ZMSBX33J52Hf+hKm28su4sFGy
 8B2lagGNQp2pPRgiX1k+kbvxKOPUK+TuJmue6NuMF61YghKD7BZFPWXWjPxksTRQKf
 JOzJXjIuQcBbcYtvvSGQkJ7gZG6GS+EUkcslkNanJkhP1S0QqFxoxShI0iWlVMvdVK
 XTUIurf/sHcGbF4O6+/57dJ6CvlwerwmDAhx6n1WjOEHk+uCHpeRe3/5qe87L3JPsj
 dj8TEec97rNRBcdlG9iAvFcoZkzE4HqtFA9yrcv++qb+EhAGbHj8tNaH5bKwAy0wok
 2Cr2UEG+ULR6g==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com
Date: Fri, 14 Jan 2022 15:14:30 +0800
Message-Id: <20220114071430.1335872-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Fix "Unbalanced
	pm_runtime_enable!" warning
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

If the device is PCI based like intel-eth-pci, pm_runtime_enable() is
already called by pci_pm_init().

So only pm_runtime_enable() when it's not already enabled.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 63ff2dad8c85f..6708ca2aa4f73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7159,7 +7159,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	pm_runtime_get_noresume(device);
 	pm_runtime_set_active(device);
-	pm_runtime_enable(device);
+	if (!pm_runtime_enabled(device))
+		pm_runtime_enable(device);
 
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI) {
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
