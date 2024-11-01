Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B71099B9214
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2EBC78037;
	Fri,  1 Nov 2024 13:32:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F308CC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:32:33 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71e3fce4a60so1558642b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467952; x=1731072752;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtzA86pp72kOdXxZZwIORo56/g13hQx8u+e/ETOI+EM=;
 b=hGFY2oMbBCMpYMLNbOBFYmqIkG4fZjrIjJyOSm7UxGUhMmqY1fyopJBmjw3s1FrMww
 gzoKoGolMVhM6FRpHtIImph2mhGbplUfSoTB5uBasRREbDX7BttxTLMXsjKyfvP0kLRP
 O35+hOF4oXs4iG+/rm0f7nCapAj/zntvtJii0sxb1yVjvXAOY3XRvCcVqDNg6TpejDVE
 RI1C9kyA1aQZlkUZlnJqCVW54RY2W5gKo8PiJXlMWbb2bdoK4rq2mUy8XQTz94Tkv1fC
 DWjUQWgR89cwkRS4nRtLujlRLNr1kl0jcXji6O1njiDgllHcrfJ7CmbFxaiFTgjgPNyz
 sUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467952; x=1731072752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtzA86pp72kOdXxZZwIORo56/g13hQx8u+e/ETOI+EM=;
 b=IHgJSK2Lk+1dTLAcA0h+L+DZOtLRXp8UMN2/Y0OmMHQQJ9PRb4TW2vRj2RSC1dokYH
 n5sO9WIGalEuUfwapP+QP/Xn62u++gFftUmLC1vCVL4aKNJqHOBWGBjZXFCpQzyDd8GO
 eDI43FeStrAHhh4mzIoBZ1bMUE8+ti/V2AuVQRi2yGuyoCY6ZrBwWNBkQTKTxGkMdHbQ
 3nXyXcRpMh9THNbF6byMhTOpgNwe2hZx0qLbqo/NPDMNz9TEwStftb99Caw2usbLKsPM
 9U7xS3YGfARPBuymQPR8J0UMwVHQVKiA52yTwDoWa0iaFGBnKClndhPZU0swd1Sgs6cU
 6J9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkYMUrY4xTaF0NIiLne3YqeJis394l2gKVZd2Cw4HivrsPjtuQZ+yt37zhH/DHebZ6X+DeKiiZ6ib6yw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxvg4p123gp8KAKdXG/Rlk+xc1eqEsJ8V6irOhbQtlEFMxpOSjb
 59xZTTRMsVJT+4aT5GO7RmvwTojF7FGBqOsMiOAWRoNFaQs91Udq
X-Google-Smtp-Source: AGHT+IEIrf5Jc0S5SUHIgMo8LFRuqQulN1uTl6WBxSZzPDPh2/GVfOJ18wu6iTPuwNXTONnPcdvvbA==
X-Received: by 2002:a05:6a21:3a82:b0:1d8:f1f4:f4ee with SMTP id
 adf61e73a8af0-1d9a83aba1bmr28240695637.8.1730467952395; 
 Fri, 01 Nov 2024 06:32:32 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:32:31 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:34 +0800
Message-Id: <d0347f2b8a71fee372e53293fe26a6538775ec5d.1730449003.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v8 7/8] net: stmmac: xgmac: Complete
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
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  2 +
 3 files changed, 47 insertions(+)

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
index 5ccdc6887b28..3a4bee029c7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -351,6 +351,49 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	int num_tc = netdev_get_num_tc(ndev);
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
index b5a896d315bf..b884eac7142d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -24,6 +24,8 @@ void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
 
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack, u32 pclass);
 
 extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
 extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
