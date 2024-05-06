Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9C8BCE2D
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 14:40:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B736C5E2CB;
	Mon,  6 May 2024 12:40:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F834C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 12:40:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41b79450f8cso11196245e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2024 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714999201; x=1715604001;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rxjJb/KzzXIFQHfzAUi7FnhbwHdNprYeBkYOQsJcPKk=;
 b=ZtucT+PBiueR7kK40pfsRifbB7de1S2bNoM87Dc++P6XpGQ3RBOjqahZR83YvHF74N
 r4WCQmiK1DND4gGUPgUPZMikfeFLA+aAmS8Wv6xlTiyKnQrrOCF5b6BieiBGmnTJh7fl
 ax+3TWeSqYDNf/PLjzezrO6W1YlRJph4l2F8uPVurC+OQiC0HVsUF6HbEzEjotnprBcC
 RYa2go38O4HfpwGoMS2pkUW16I2/pEmwgl8ufzYunsr7LZcujiZEw+mYH1y4cUP40lKO
 JFKt/3T1WgjPE7r+oB6Hsq+o+pUREwBuQvncbWadrKMzgP1VeZD0MshGMOUo4ZDQs8Jd
 AsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714999201; x=1715604001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rxjJb/KzzXIFQHfzAUi7FnhbwHdNprYeBkYOQsJcPKk=;
 b=iXVcS1yjgi4u/7PhJPruhfy8NiHwW2QaOT9qBjg4LRC6wbwBLq6Jv5CA+dbNF8Sanq
 ZFDF21o0D5IvvNDGQL5BlJIyrdqlGP7VIZAhmAxm6rYxfFR2FirytF83ugTwNUrTd16E
 dr6XgK7dRx5kk0iBiYH7jvnVd3PojwQhA3JYWlPGVU7q0S/BMP/W9EDoZ2sO2EZvDHoQ
 krqvfJ57DCVO/wIzi9T+jj7glNWkYTuWzfQYS7aM9iyeYNLB+BZ98JjFJ4dXWiDZRelv
 K8JaxcXmg4r7KseLnpQRWpq7PU5dMDdTSI7jY6qaOVehynrG7xBXiGUnF+NLQ2q8RmhV
 wn0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4/VkXO90YD6eTCONk1QZjKMqyu+YCVtgPCYQ0JPI4slf3cIpY3jL8zSuw+FgU9jDVAK2BNG4pgwmaA+dgnCIe5eOCWxRA1xh6TNkF0Gl6vJ5mos7+6hE3
X-Gm-Message-State: AOJu0YzLWSxr8KBiOnqL7uekF8DDer/b/ldlEQdt2ZHlqftMzz6gm/a4
 I94oWbqoypP1+HQ86g8qwEvPdRtsextIcGPDDEuKT2/LQsyxME7m
X-Google-Smtp-Source: AGHT+IFkCu+JtPeZm2GUtpMORrZzigCeL8aXT4N3/ncy5DZ8TaVMDuXbslHscLBHDWJBFqgIrb6ZgA==
X-Received: by 2002:a05:600c:1c03:b0:41a:3868:d222 with SMTP id
 j3-20020a05600c1c0300b0041a3868d222mr7722487wms.0.1714999200464; 
 Mon, 06 May 2024 05:40:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it.
 [93.34.90.105]) by smtp.googlemail.com with ESMTPSA id
 g17-20020adfa491000000b0034de87e81c7sm10714865wrb.23.2024.05.06.05.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:39:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  6 May 2024 14:32:46 +0200
Message-ID: <20240506123248.17740-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH] net: stmmac: dwmac-ipq806x: account
	for rgmii-txid/rxid/id phy-mode
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

Currently the ipq806x dwmac driver is almost always used attached to the
CPU port of a switch and phy-mode was always set to "rgmii" or "sgmii".

Some device came up with a special configuration where the PHY is
directly attached to the GMAC port and in those case phy-mode needs to
be set to "rgmii-id" to make the PHY correctly work and receive packets.

Since the driver supports only "rgmii" and "sgmii" mode, when "rgmii-id"
(or variants) mode is set, the mode is rejected and probe fails.

Add support also for these phy-modes to correctly setup PHYs that requires
delay applied to tx/rx.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 281687d7083b..4ba15873d5b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -171,6 +171,9 @@ static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, unsigned int speed)
 
 	switch (gmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		div = get_clk_div_rgmii(gmac, speed);
 		clk_bits = NSS_COMMON_CLK_GATE_RGMII_RX_EN(gmac->id) |
 			   NSS_COMMON_CLK_GATE_RGMII_TX_EN(gmac->id);
@@ -410,6 +413,9 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	val |= NSS_COMMON_GMAC_CTL_CSYS_REQ;
 	switch (gmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val |= NSS_COMMON_GMAC_CTL_PHY_IFACE_SEL;
 		break;
 	case PHY_INTERFACE_MODE_SGMII:
@@ -425,6 +431,9 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	val &= ~(1 << NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id));
 	switch (gmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val |= NSS_COMMON_CLK_SRC_CTRL_RGMII(gmac->id) <<
 			NSS_COMMON_CLK_SRC_CTRL_OFFSET(gmac->id);
 		break;
@@ -442,6 +451,9 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	val |= NSS_COMMON_CLK_GATE_PTP_EN(gmac->id);
 	switch (gmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val |= NSS_COMMON_CLK_GATE_RGMII_RX_EN(gmac->id) |
 			NSS_COMMON_CLK_GATE_RGMII_TX_EN(gmac->id);
 		break;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
