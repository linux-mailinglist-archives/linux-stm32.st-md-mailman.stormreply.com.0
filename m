Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E29B2367
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 04:08:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C63E3C78016;
	Mon, 28 Oct 2024 03:08:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4DBC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 03:08:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20c7ee8fe6bso31138165ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084894; x=1730689694;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IK0+tz6UgrWkk3eQKtuPkyttD+TXu0biBXSgNcL1KU=;
 b=mK0IWvTupw1SMWE+oX/VtSfKR4oIe1ZWrUvP6WYWSOcMdI2+fIRCwV1rGcarRZtJh5
 c9+S3XCApY7hnXYn+n/CI3eDKr1ozI96/SFdy2kh9OU/OkDIpyeDkFKyCqYz2Rs7bYh8
 AL+7nPzqT0azn9zu69ThLjldDuYoXbLqTzkF9Mxuj1MGBBFDDbeqKaX5JAfnUS9z1ZHg
 pM8bCUGJJRbwmCThAOyAgIZdnTecGzAREB3eueWEbelpFA5N+1MZRyxDxew2NLzhjGkB
 Q2hwr+ZSEiB9BaWamV7iGRxGO6ZRmdPLmMs2Jl+Uxe+GBuFtyKDkfZt3YLMDBWn7DxuJ
 HV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084894; x=1730689694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IK0+tz6UgrWkk3eQKtuPkyttD+TXu0biBXSgNcL1KU=;
 b=nDrGu2Jhd2hBbOpnnUbdkyMN3c+MnVczfzlVYq0kkGBVwm1R+WWS13jrGc21lPETB8
 hh8CIZgFBIgjdL+OmxhLdZ73O4gkXEIN9QC0WhnKmNVXVmitFAWe868CGoQD3JkPNWYN
 DkKI7ue1BW6icJ1mS7M77I5gxAvjULJc0pvT9KqCqm6K8Cb90926DP0AXd0XDRoMhVro
 TEKx86JdrYWtDDO9hxNZI+JGawy6Va+mZZlVySgyq6D8oob7X1LzktCKL2UnIgz13G6U
 Q0A2uufz1VVu7ehxM2p0iU+caxsMmEtiNraQ625s2p+ePE8xi+RQwUNPBI7SWKiKDkzy
 TbkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZYzxUsLGTf07w2s8+BB8vZ3f3QVFD9LC/Awb30xuOQpoPe0QQSNW3h6Qwidt+rJkB5RO0nAZyBL6PjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzl75F5wtAO2BiWrFC+wOiWRWHp7yDpsh4qbGqk9V3QIPcAyiLk
 pmlDTwfMZgYtdFphjexqlskf/ck32QXaz1DqjtPgP3D4uKAu9tr5
X-Google-Smtp-Source: AGHT+IE1LfTy77L+XgqKFk08IJORYTgfKR/xYxHxwpKcRnPD2X0/L4nVVPTJb2xMm9Vl7axWq/7AFQ==
X-Received: by 2002:a17:902:cf0a:b0:20c:9d79:cf85 with SMTP id
 d9443c01a7336-210c6c932ecmr92308935ad.54.1730084894044; 
 Sun, 27 Oct 2024 20:08:14 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 20:08:13 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 11:07:28 +0800
Message-Id: <3126dce1a85138a7760096fc15c580a5c6bbf5c9.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730084449.git.0x1207@gmail.com>
References: <cover.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v5 5/6] net: stmmac: xgmac: Complete
	FPE support
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

Implement the necessary fpe_map_preemption_class callback for xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 43 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  3 ++
 3 files changed, 48 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index de6ffda31a80..9a60a6e8f633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1545,6 +1545,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1601,6 +1602,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index ce5dc896f9d8..541fe6ce87f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -350,6 +350,49 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 num_tc = ndev->num_tc;
+
+	if (!num_tc) {
+		/* Restore default TC:Queue mapping */
+		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+		}
+	}
+
+	/* Synopsys Databook:
+	 * "All Queues within a traffic class are selected in a round robin
+	 * fashion (when packets are available) when the traffic class is
+	 * selected by the scheduler for packet transmission. This is true for
+	 * any of the scheduling algorithms."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
+
+		for (u32 i = 0; i < count; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+		}
+	}
+
+	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+
+	return 0;
+}
+
 const struct stmmac_fpe_reg dwmac5_fpe_reg = {
 	.mac_fpe_reg = GMAC5_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = GMAC5_MTL_FPE_CTRL_STS,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 0b601a9fd805..ea18ea738da6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -34,6 +34,9 @@ void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
 
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack,
+				      u32 pclass);
 
 extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
 extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
