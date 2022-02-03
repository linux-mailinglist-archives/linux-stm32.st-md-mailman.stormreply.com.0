Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4132B4AC51F
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:16:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 095CAC5AB61;
	Mon,  7 Feb 2022 16:16:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 447E8C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:15:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E48861A6C;
 Thu,  3 Feb 2022 20:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D003BC340F2;
 Thu,  3 Feb 2022 20:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920279;
 bh=6ytp33LHeA0fWlCO8dxFEv7EPxbWH7tru4IbV3pym4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MUtEKr1lQWjUhOtjTf52BGtHYAP3iM7+fCLpv7Wggg1ZdhmkaR78ossZ4g11Ke26g
 8hM0N1T8mlSpN1zGGWw41Rfx5gKb7LD9IeLytki7dxwWWmW8vsJ8lrHwe30DPe2ZGC
 z//vNCvk0tXG6ojX55c+NnrQEHEJu2ESEbenB9wfjEdppuDqMxZvo/hfoNXYt1EU/F
 ktMKo3iebjlSDYtJoLfwEq64xM++w++W+suach+P0eU+rxGm6tf7luTzyIiWN1S+wo
 jNoEpkJws4cgf6G29X20iFQ5jpbI8MA16qBaOqJ5xokOBEjPT2yjdKw7XAVSwoPmaw
 MUlVV8rCeCTUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  3 Feb 2022 15:29:29 -0500
Message-Id: <20220203202947.2304-35-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203202947.2304-1-sashal@kernel.org>
References: <20220203202947.2304-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 Jisheng Zhang <jszhang@kernel.org>, kuba@kernel.org, peppe.cavallaro@st.com,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.16 35/52] net: stmmac: reduce
	unnecessary wakeups from eee sw timer
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

From: Jisheng Zhang <jszhang@kernel.org>

[ Upstream commit c74ead223deb88bdf18af8c772d7ca5a9b6c3c2b ]

Currently, on EEE capable platforms, if EEE SW timer is used, the SW
timer cause 1 wakeup/s even if the TX has successfully entered EEE.
Remove this unnecessary wakeup by only calling mod_timer() if we
haven't successfully entered EEE.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e81a79845d425..a361ad8e863ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -400,7 +400,7 @@ static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
  * Description: this function is to verify and enter in LPI mode in case of
  * EEE.
  */
-static void stmmac_enable_eee_mode(struct stmmac_priv *priv)
+static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 {
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 	u32 queue;
@@ -410,13 +410,14 @@ static void stmmac_enable_eee_mode(struct stmmac_priv *priv)
 		struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
 
 		if (tx_q->dirty_tx != tx_q->cur_tx)
-			return; /* still unfinished work */
+			return -EBUSY; /* still unfinished work */
 	}
 
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
 				priv->plat->en_tx_lpi_clockgating);
+	return 0;
 }
 
 /**
@@ -448,8 +449,8 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 {
 	struct stmmac_priv *priv = from_timer(priv, t, eee_ctrl_timer);
 
-	stmmac_enable_eee_mode(priv);
-	mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+	if (stmmac_enable_eee_mode(priv))
+		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
 }
 
 /**
@@ -2640,8 +2641,8 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
 
 	if (priv->eee_enabled && !priv->tx_path_in_lpi_mode &&
 	    priv->eee_sw_timer_en) {
-		stmmac_enable_eee_mode(priv);
-		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
+		if (stmmac_enable_eee_mode(priv))
+			mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
 
 	/* We still have pending packets, let's call for a new scheduling */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
