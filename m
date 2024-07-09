Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C032192B200
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85AF5C6DD9D;
	Tue,  9 Jul 2024 08:22:45 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B963C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:22:44 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2c8c6cc53c7so3364513a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513363; x=1721118163;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kG7XBsQlE3wteyMVxAgB3FeKItlmk44xoPu+CQNnd0w=;
 b=bRCgA5XhlvwDhvJhbHVz2g2r+ygYdj95o34LMOOTgapcTohpCClH9BIBIV/chAL+1+
 RVd5156P+enPSMG2pvTotj7rBXPj+7hvH3YDuC6VD+DVjKhq1rQstuDq0xXEbGjiihVs
 M0XsiU4xsnjI+Rqv/MppumEDDP+Mi8jNjI3T6OGL0IyqquXr5bdn3LAWseSjDQH8jZAM
 I9L8JnAdfSaX5B8NYaz7P6tuHIeYElIcAQs8+bkr9auEYv2LFj47gNeiDEGDkl8iSSXa
 gXV25O1Nxs1nElDKB38Av9NBswBUjNeLwbOrvA3vTA42X1PRsXaY6Xq2kufhN43lfxsw
 7z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513363; x=1721118163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kG7XBsQlE3wteyMVxAgB3FeKItlmk44xoPu+CQNnd0w=;
 b=MwSHaKbD2SKKHAsmOyRdn1aud1NUnNhgeSemzmduqAP5GyELMtQo3GEPoMiBFdvwRK
 GsRGq4s1qUFcXmAufUETqxHY6Uere0ayIccdzsvaCj0tYpi+8TnRsEAxfnTQJ9XNIfpD
 2H+RhrycCmoTidBqFbVBUnvFsEq3ZLtE3si+9JmdlAGcwPEnodz45lNzn8HksyEpzr3D
 i++W1r8lt978Iyvwg5tp5IdrRqhsLsTsUiXKUzra3BEa8cftNvI9N9Vhbcet7a04GoaS
 Z8v8Ta0Th92vA7f9gEQAIsBUGV+IR1P3BjYmbPJWejdrOGxTTvAKbBFP6aJez5RyZ887
 wXZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc5ZHWckg4RZg55FPnFjkL+0iewIp+Q8wHwhJuO9q0nOhCN/RQiz2QJb13JmQZUV/4+vq/4tJXxenL2+taLIhQE63URY0IxEoRxXkod5l0OS5xOR3tciAI
X-Gm-Message-State: AOJu0YxI2ndHrhMMeX7QUapAEddjDcAkTUwMHWwX8llTC+O6TwG2cJzg
 r2w7Jb6wy5dzjZ1YPRmUyQCi33pVC3Rz4jNvj0Lfu9yjvU40t61F
X-Google-Smtp-Source: AGHT+IFgGL6RTLzIY5jdRBvv34mJdpYMSNbt5TDn2M3+NI7ogAZwEyXUqJrg0iTQS9IS1HL8eNA2Bw==
X-Received: by 2002:a17:90a:4966:b0:2bd:d42b:22dc with SMTP id
 98e67ed59e1d1-2ca35d533b9mr1624494a91.43.1720513362881; 
 Tue, 09 Jul 2024 01:22:42 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:22:42 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:19 +0800
Message-Id: <d142b909d0600b67b9ceadc767c4177be216f5bd.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720512888.git.0x1207@gmail.com>
References: <cover.1720512888.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 1/7] net: stmmac: xgmac: drop
	incomplete FPE implementation
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

The FPE support for xgmac is incomplete, drop it temporarily.
Once FPE implementation is refactored, xgmac support will be added.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 --
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 27 -------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 6a2c7d22df1e..917796293c26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -193,8 +193,6 @@
 #define XGMAC_MDIO_ADDR			0x00000200
 #define XGMAC_MDIO_DATA			0x00000204
 #define XGMAC_MDIO_C22P			0x00000220
-#define XGMAC_FPE_CTRL_STS		0x00000280
-#define XGMAC_EFPE			BIT(0)
 #define XGMAC_ADDRx_HIGH(x)		(0x00000300 + (x) * 0x8)
 #define XGMAC_ADDR_MAX			32
 #define XGMAC_AE			BIT(31)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6a987cf598e4..e5bc3957041e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1505,31 +1505,6 @@ static void dwxgmac2_set_arp_offload(struct mac_device_info *hw, bool en,
 	writel(value, ioaddr + XGMAC_RX_CONFIG);
 }
 
-static void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-				   u32 num_txq,
-				   u32 num_rxq, bool enable)
-{
-	u32 value;
-
-	if (!enable) {
-		value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
-
-		value &= ~XGMAC_EFPE;
-
-		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
-		return;
-	}
-
-	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_RQ;
-	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
-	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
-
-	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
-	value |= XGMAC_EFPE;
-	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
-}
-
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
 	.set_mac = dwxgmac2_set_mac,
@@ -1570,7 +1545,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1627,7 +1601,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
