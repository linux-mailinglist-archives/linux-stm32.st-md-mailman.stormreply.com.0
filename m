Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 908709B7AC2
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 13:38:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BF73C78035;
	Thu, 31 Oct 2024 12:38:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CCEAC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 12:38:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-720aa3dbda5so584011b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378333; x=1730983133;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFGEbEEjLbbQpGlnwYzVMfTZ0wqqjjrWRQOLfRsrvcs=;
 b=MD7lUHNVBq0pp1Ma3LYRcqkP9CY60l5SVZsNBCCbBz4y4cjWrQtWZII+9VacQRpaHx
 uKIRd4mLIORqR/iIErGDrTAL9141DAm+9PYzoybpNvjWxOEvUnBhoOnWJHTh5ixV/TcC
 F/+vAdv0F5rfETM+gN0ym7eFXEk2Akpn6V4NG3NtkRD89+4X9oWHzoi9Km+7Hdk0/n81
 qz3HBHyJoBFLAE/bh+bB597ZDRMY/0WByQ/tOpS9eDBY3rDtiP6RApB1zqjT8ILEPcJ5
 qVvsGnXfKm+l+fjW+TBKZaeatqVshkc8SCnKBjml9F4GwS5cfsXAYWPGvAQvocNEmkgK
 J1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378333; x=1730983133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFGEbEEjLbbQpGlnwYzVMfTZ0wqqjjrWRQOLfRsrvcs=;
 b=o8GKeXOU11rX0/aPN2EEEZGz9gqpsz/v79Dgg/p0HJwC+tgZKuDCx/KBszRNlaN5R9
 hqcRKZGMRSGO5jff85t7IgdfznFNn9/1oJfkCZlRG3Jpgq5RT+bWAIjqUzlquHLvkKpb
 ZYUdqp88iGUn76Z66MSNisGjVY8qc75eHyI4S2xTiavhqBdPCwGcdFzx84/XyCQ8VcEO
 weIfaN6HkTIwDbm7ZxZ9Il4Bo46eZ0ZU6NPixyAhPvL79BJc6NnQOkI/KVFjVJ+8ncHO
 c5e6kURvXVixJG+RmSuD2H05J3RdsAiInu39HavImR53kWk9ubMg8eXBU8IOWZjhS95i
 rMDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmTO6KUYJZDx9vXsg5Ejc9OpFPxQvxZgSfxv7pHU0pr+NGbrVBrAyoih8ipdeT/85CN1DteTfRUOP4rA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzaosYue+bpGCR12MzaYFgC3U2u3mTuTPp/eEq/3WoN+p3eAPJ1
 c44uFEPjFI2wcsmlHHnyqDvNy4IEXN1MERXdVbRb5TZPKRhaHx6Gzb50+A==
X-Google-Smtp-Source: AGHT+IEZxQHxPYwUn+a4vwc02ndfamOj2UcHfNlIlB+PjdVN/65q2Qw46vrTi7Bee/Ggg5dJokSHdQ==
X-Received: by 2002:a05:6a20:2d29:b0:1d8:a1dc:b3b with SMTP id
 adf61e73a8af0-1d9eec4580fmr9881706637.20.1730378333058; 
 Thu, 31 Oct 2024 05:38:53 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:38:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 20:37:58 +0800
Message-Id: <917f3868cdaf8ce1d45239117c3ea1c8c45ba56c.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v7 4/8] net: stmmac: Introduce
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

Call stmmac_fpe_supported() to check both HW capability and
driver capability to keep FPE as an optional implementation
for current and new MAC cores.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 10 +++++-----
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index f2783f7c46f3..1d77389ce953 100644
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
index 818741579904..fe0877ef5f4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -42,6 +42,12 @@ struct stmmac_fpe_reg {
 	const u32 int_en_bit;		/* Frame Preemption Interrupt Enable */
 };
 
+bool stmmac_fpe_supported(struct stmmac_priv *priv)
+{
+	return priv->dma_cap.fpesel && priv->fpe_cfg.reg &&
+		priv->hw->mac->fpe_map_preemption_class;
+}
+
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 {
 	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
@@ -173,6 +179,10 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
 	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
 	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
 	spin_lock_init(&priv->fpe_cfg.lock);
+
+	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
+	    priv->dma_cap.fpesel)
+		dev_info(priv->device, "FPE on this MAC is not supported by driver.\n");
 }
 
 void stmmac_fpe_apply(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 15fcb9ef1a97..2f8bceaf7a0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -16,6 +16,7 @@ struct stmmac_priv;
 struct stmmac_fpe_cfg;
 
 void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
+bool stmmac_fpe_supported(struct stmmac_priv *priv);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
 void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9fcf2df099ec..883b4b814125 100644
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
@@ -5943,7 +5943,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
 		stmmac_est_irq_status(priv, priv, priv->dev,
 				      &priv->xstats, tx_cnt);
 
-	if (priv->dma_cap.fpesel)
+	if (stmmac_fpe_supported(priv))
 		stmmac_fpe_irq_status(priv);
 
 	/* To handle GMAC own interrupts */
@@ -7729,7 +7729,7 @@ int stmmac_suspend(struct device *dev)
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
