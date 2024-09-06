Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F196E8D1
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 06:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77C73C6DD9A;
	Fri,  6 Sep 2024 04:56:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69DEEC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 04:56:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-714187df604so1656636b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 21:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725598611; x=1726203411;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awdxA94+EDwJxMaDIv2LrPwLHdX9C7ivLS6VUmJAIug=;
 b=dhInvNUhU7IAdAKjzCdcleYoEdA8cjszvxm84AZny0obGxG9Np8RBUNoF/eVVfbW8e
 /aOO9yl+6X7fGUnkNPFCsjSOK6fh9rB9GToMuwTagUD0MJsj5Xa/8TYkg/kJF7zLk1zt
 rdjes2LwYp+EWqGRdoFK2NoSl2lbqWzGfCFPbpas8DtKX6Gth0C3T7U6R572EchLZFMl
 4mKewtqSgwO5CF7MquCAC33kpkeKouiU12CzA5GG6ApCWO9X9NHGNsCRSyGceZcscBjA
 irSpmf5ntcGrpe3SP13i5UyNNuuhQSvDOmtjqnxQ5FEB/xAgKUI88VHQUD2K/nC6gig3
 FbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725598611; x=1726203411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awdxA94+EDwJxMaDIv2LrPwLHdX9C7ivLS6VUmJAIug=;
 b=FM+cdiiXWU9ZRzbUSke8FWL9jO9ljZ+WM/8r13MKqHWhoO8fLlu8/BbnwdDrHfySc8
 Kl+C2rbjPKlgY5MiAw29C3TZEswv57ioBo2PBr9HVKgwsnA6Hc8VdiFwHVHCb9nWaIL4
 K44NAIdL3jZj65pMJ76dnxW3sQl3Q+QzoB3olSo4nTgUAp+ciJSm1RGk/WNaSzEnqhl2
 FshFeSMjqeyTisFoHSvcAFEHRnBr2bVM6+qOpl45kE3z3LBiT72MHn8wR2QQN/nbmg6g
 i1EPkrCXlqTwEweeabkPU/L9aneceCf7ZeFu1qIUZHZmQd6LW8Rp8xtBH+bt6Ji4PTw5
 etdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo1Mvy9oozLUuXn2k2Fb6EQX/lG7FzsdXcygy0j8QfAuI6msfbCE6VuASx5X9aUvJC6mEUf7bygUGvpA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuZFKJ5SBRm9NwqoCRF/dKjbAR8r4j2iZq+WZ+yp5GUZr5Js+9
 04mzDaIYMSQIEc2ehmx962ILKr1ATktjcYzi70CLO79eQeEPnPbx
X-Google-Smtp-Source: AGHT+IHhLryr0A8pwiJ/WABHRdfza5mcvYUq9KAqWs1D4gDvA0WovWkUgZpTbm906++5urOriKthfg==
X-Received: by 2002:a05:6a20:43a9:b0:1bd:1d5f:35be with SMTP id
 adf61e73a8af0-1cf1bfbb548mr2884149637.11.1725598610767; 
 Thu, 05 Sep 2024 21:56:50 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71791e54585sm1704002b3a.182.2024.09.05.21.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 21:56:50 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 12:55:57 +0800
Message-Id: <d8c2e22e3b21589286249c35a53f5b9fe831129c.1725597121.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725597121.git.0x1207@gmail.com>
References: <cover.1725597121.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 2/7] net: stmmac: drop
	stmmac_fpe_handshake
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

ethtool --set-mm can trigger FPE verification process by calling
stmmac_fpe_send_mpacket, stmmac_fpe_handshake should be gone.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +------------------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |  8 -------
 3 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 458d6b16ce21..3ad182ef8e97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -425,7 +425,6 @@ bool stmmac_eee_init(struct stmmac_priv *priv);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
-void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable);
 
 static inline bool stmmac_xdp_is_enabled(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 529fe31f8b04..3072ad33b105 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3533,13 +3533,9 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 
-	if (priv->dma_cap.fpesel) {
+	if (priv->dma_cap.fpesel)
 		stmmac_fpe_start_wq(priv);
 
-		if (priv->fpe_cfg.enable)
-			stmmac_fpe_handshake(priv, true);
-	}
-
 	return 0;
 }
 
@@ -7425,22 +7421,6 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
 	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
 }
 
-void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
-{
-	if (priv->fpe_cfg.hs_enable != enable) {
-		if (enable) {
-			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
-						&priv->fpe_cfg,
-						MPACKET_VERIFY);
-		} else {
-			priv->fpe_cfg.lo_fpe_state = FPE_STATE_OFF;
-			priv->fpe_cfg.lp_fpe_state = FPE_STATE_OFF;
-		}
-
-		priv->fpe_cfg.hs_enable = enable;
-	}
-}
-
 static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
 {
 	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
@@ -7902,7 +7882,6 @@ int stmmac_suspend(struct device *dev)
 				     priv->plat->tx_queues_to_use,
 				     priv->plat->rx_queues_to_use, false);
 
-		stmmac_fpe_handshake(priv, false);
 		stmmac_fpe_stop_wq(priv);
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 9cc41ed01882..b0cc45331ff7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1078,11 +1078,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	netdev_info(priv->dev, "configured EST\n");
 
-	if (fpe) {
-		stmmac_fpe_handshake(priv, true);
-		netdev_info(priv->dev, "start FPE handshake\n");
-	}
-
 	return 0;
 
 disable:
@@ -1107,9 +1102,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			     false);
 	netdev_info(priv->dev, "disabled FPE\n");
 
-	stmmac_fpe_handshake(priv, false);
-	netdev_info(priv->dev, "stop FPE handshake\n");
-
 	return ret;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
