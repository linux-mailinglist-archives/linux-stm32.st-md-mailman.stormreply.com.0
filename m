Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BF95CAEC
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 12:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AAE6C71289;
	Fri, 23 Aug 2024 10:50:38 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09046C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 10:50:37 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2d41b082ab8so1318587a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724410235; x=1725015035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awdxA94+EDwJxMaDIv2LrPwLHdX9C7ivLS6VUmJAIug=;
 b=nIpJzTtIjGuoUoIo9+hZZ+FXILKkJbogGPLg/zFWdS2t9GeOjo3Vpx+0kujAx3X4bn
 8Oh92KQw3vonGlCMEka6p8t7jRv8FDwYaN7ZX3OK7RDrcOld1hsaGX71iW9cXNCjFD+R
 DD4QSjGR385qgURBp1UFPDErLFAPBpJmbihmWzkUxwYwEoZldkJzpN2mRyA+JZYl7cbp
 aBlq8Hd9kPB6IjvUk1GPNUdGeqkyBkS4njzdcsvfeKze2Tj0rY1VH6DW2njrSsiKe+Yb
 qAiLJaM5a/+0dzd9oifCc9ZaCsapvaAeQT6GpP4XGtxl+zwoijZSUWDiECLHQjRUvkuA
 mmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724410235; x=1725015035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awdxA94+EDwJxMaDIv2LrPwLHdX9C7ivLS6VUmJAIug=;
 b=Bq4xAWHTQBgcKltLNElVopiihdUHYfablaRyu+Maod7Sr5q00VxG9OZj9s3SUAYKdj
 +PEstpnUuLIbn9im1QApXENg7YfT5vhsULxI8fzLiai/Kjxqmp9Fzs1hn7zz295Fyhmw
 Is3I6Tog5qZpPZoezeTc0o+uwO2oIDy+hEAdB1M2HLZ5DbCpZGJ8F9lztNsCNUTTesyk
 Bbkn9vGA82OhoM2CM5vzouZgnFzB1f2PqVBGQ3yOU4nsTkWhBd8DZ7FWAc0LfR5MwFV7
 CikUMzpE5R9bgWwU6SufwpRyXUhwpA5EYenhDs9CS0Yz9oPC2kZ/KfRT/P3YIkhHFDzy
 PO+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyoeWTQD3RCLtj6yvEOQi5dvGtdn5VLQBTveM9+VudTInaUmdIay5jQo2O8ntYEjwPbdXAsUW8maOvAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJCoMhtSbJwqLraquXQTk1Ymd6/Ie8y/DXt29Sq8AR0FA6lUYT
 N4OIAATj4b45G2bJ/7Hy+kj8uvw3ZFyMHKwYRUhoDJeAE8xN4LeS
X-Google-Smtp-Source: AGHT+IH4kxTuSKLf4y16h4uAuWw4Yl1Q/hYlaVuMkg66SCkTUsl9iUC6V/GkbMkYFKLSZZvu6nVf0A==
X-Received: by 2002:a17:90a:4611:b0:2d3:ce76:4af2 with SMTP id
 98e67ed59e1d1-2d646bd8d39mr1735993a91.18.1724410235374; 
 Fri, 23 Aug 2024 03:50:35 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d5eb8d235esm6074344a91.6.2024.08.23.03.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:50:35 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri, 23 Aug 2024 18:50:09 +0800
Message-Id: <9cd8ebf4b6c110b223219f15d024fe0be301a498.1724409007.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724409007.git.0x1207@gmail.com>
References: <cover.1724409007.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/7] net: stmmac: drop
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
