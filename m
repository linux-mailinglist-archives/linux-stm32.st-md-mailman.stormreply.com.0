Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030C9B920B
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:32:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 498A2C78013;
	Fri,  1 Nov 2024 13:32:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECD5FC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:32:10 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-720be27db27so1417674b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467929; x=1731072729;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzBHJrheRbAs9ESwUVActksrcefHG2ISlco4X5/KYT0=;
 b=lZUwI3osVhFF2/oZxh9Ebr2vWiJoOdSFsCaIcR/XSHxWLd/DEfyoKISs6G6V+UWj72
 BJsR66Lgm2um6WaVgQoDzXHZKwCQDQdrbS07VlO87cArp7XvN7z9hYo6aMDV/0E/JO5D
 uuYtQO+kvBrBlUCYLvMYDEPfxgAgIvmWHTs/87l5qb9aeKYi7B4uRiwkRXyU9mAMnsdf
 74neRF4KJ5m/qGk9wTDanKmVILJyoIxaZxK6fO77k0Ye7Li1Po2CDJ0dLBsHacrYzK2i
 nQAm1lG+JV4Zom6QXCoEz4gBHJ4IUYijBi5u41bBM/er149mxTlOqUZSwRhdWZHfKjwB
 pWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467929; x=1731072729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzBHJrheRbAs9ESwUVActksrcefHG2ISlco4X5/KYT0=;
 b=sJPJBKHsVLQwuVhyirf7n751OUf69FAC/X+iUCYPKUPBUeHc97z9H3YM3pzfcwzw6j
 BFAdZk8AXm3gPYhOpVzQ6xN5wb8rc0spOyYnlGcor1VbKwGKSjNvn4NBH4ReCczRU4Sh
 0mtKFsGxvh4P5Dw9kKhbtU1Qbn+NDXLBaCs5chRFI9YkM7TRnte10954PgoVi6YVKT3L
 U04vt8dVQfWsPL+Hv5C2wXX1xDF7ZG8yMtyYOHNfavJxaSoTv8D/TP5iJ8sBLF3/nFwa
 MRC3JRZn5IVrkwxraUY7iQcHbQKDxGfU5Kq/obE/UCDsesyjsYNxedYb9ud/tRVqWwoR
 huLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhJ/p3StoMzCre8R3y01xqrOFNZkICzzXnWMzgLUJa1t9f4oki9Gpw0RK70pi0dpzVINasazLJl0cVmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8QRC1CIqtmQe8LPUgKFvf6ZPyot6+pWKThfL4tu5iGwxevFQd
 2I9hiPruyIx7hksHatYGxs+lerKcx3tk0uN6u+IFcJP4uSyHmAph
X-Google-Smtp-Source: AGHT+IEU3hlJ/JMUnrwPhP3mIJwmRERMQKQSquNIAWr9P7V8Y6tRLbHl11iI7I2jGvPtZs7xGGcABw==
X-Received: by 2002:a05:6a20:2d29:b0:1d8:a1dc:b3b with SMTP id
 adf61e73a8af0-1d9eec4580fmr16171427637.20.1730467929332; 
 Fri, 01 Nov 2024 06:32:09 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:32:08 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:30 +0800
Message-Id: <01e9cd13aedd38cb0e9a5d9875c475ce35250188.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v8 3/8] net: stmmac: Introduce
	stmmac_fpe_supported()
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

A single "priv->dma_cap.fpesel" checks HW capability only,
while both HW capability and driver capability shall be
checked by later refactoring to prevent unexpected behavior
for FPE on unsupported MAC cores and keep FPE as an optional
implementation for current and new MAC cores.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c     |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 10 +++++-----
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2792a4c6cbcd..704019e2755b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1271,7 +1271,7 @@ static int stmmac_get_mm(struct net_device *ndev,
 	unsigned long flags;
 	u32 frag_size;
 
-	if (!priv->dma_cap.fpesel)
+	if (!stmmac_fpe_supported(priv))
 		return -EOPNOTSUPP;
 
 	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 41c9cccfb5de..2b99033f9425 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -27,6 +27,11 @@
 #define STMMAC_MAC_FPE_CTRL_STS_SVER	BIT(1)
 #define STMMAC_MAC_FPE_CTRL_STS_EFPE	BIT(0)
 
+bool stmmac_fpe_supported(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.fpesel;
+}
+
 void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 			  u32 num_txq, u32 num_rxq,
 			  bool tx_enable, bool pmac_enable)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 25725fd5182f..fc9d869f9b6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -23,6 +23,7 @@ struct stmmac_fpe_cfg;
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
 void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
+bool stmmac_fpe_supported(struct stmmac_priv *priv);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 20bd5440abca..342edec8b507 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -978,7 +978,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, false);
 }
 
@@ -1092,7 +1092,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_link_state_handle(priv, true);
 
 	if (priv->plat->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
@@ -4040,7 +4040,7 @@ static int stmmac_release(struct net_device *dev)
 
 	stmmac_release_ptp(priv);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	pm_runtime_put(priv->device);
@@ -5955,7 +5955,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		stmmac_est_irq_status(priv, priv, priv->dev,
 				      &priv->xstats, tx_cnt);
 
-	if (priv->dma_cap.fpesel) {
+	if (stmmac_fpe_supported(priv)) {
 		int status = stmmac_fpe_irq_status(priv, priv->ioaddr,
 						   priv->dev);
 
@@ -7745,7 +7745,7 @@ int stmmac_suspend(struct device *dev)
 	}
 	rtnl_unlock();
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
 
 	priv->speed = SPEED_UNKNOWN;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
