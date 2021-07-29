Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D503DD35C
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E7D2C5AB6C;
	Mon,  2 Aug 2021 09:51:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0266C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:11:56 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id c16so8281805plh.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uFCBpDGM4hFIxc9yi8Eu0cialujSpGXKpLF4MnHX0N4=;
 b=o4j5NmYtOd2b6pXYrmg7YUJhk/ntJ1U45lCUKITehyjndOnUXczd6eaYzoajkza/Dq
 6JmJHdTr3dahediTrHJt7WkawEEXnmo7o0mHt1OMLJ7Icx1CsA9ssknXBPvw/KtA9KKs
 UZHUviyVuD4nVGIu72SAfEwiYGfF6qDKUUD4WXfIArHFFCbdE1p/bDYZlnZFF5mLYS+5
 P/Z6+xx2Rdx+bT/x7S4oGHAs6+FWAz5F79dFDwOY8J+CoqJL//mHSTFz8Xg/YZfxb6Qi
 5Ref+r7ObgYFgExWA9S24uP5m/MhSwEALIPKaDywkjZQtU5jtUmgIoKKMRtGdmQhLA8A
 kovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uFCBpDGM4hFIxc9yi8Eu0cialujSpGXKpLF4MnHX0N4=;
 b=JhMrcv+8/70wLhKVV03HQgcDRI7p0MCuHvrcL9cLPwrq7OBm6MFi+agQJw+PDq0YQe
 AQW84z5Wiaf+ep3CLb0v+C3PaUi5n3A+UfbQsM6X9h8aNBl2xVjGHo1vk6tcoacXZBMW
 4TenHdH07L9+T5LioNcEXV71omdJtK15n2t1Q/vI6artfzHmGXqnvn4OMK2oyYRV5HaV
 XXI9oeWiwF8vbaYQ0yIWvGmDyL7j9d2j6SEAxYG6fmwDgtVMMSBFPTcOrgFk1xdLAMJi
 OatAtxmM4MqSa8RLx8ggJK2Ix50ZN4tnbMwadjHKmHfA7sfe9eGL3qiznbHtcJ10Mjaa
 BvWQ==
X-Gm-Message-State: AOAM533iMonMduYfSRaJckXb7P5XkYc3q8/LAFfXNYRsIXxEJ+RvYajM
 AHupN7B3ztzXluUPvk+n4VU=
X-Google-Smtp-Source: ABdhPJwEDY6ObvS9IMV5cadka+41K/yJUlnwQzWz9TVouPF536akBdpkO0DPS1yrDa4svM2C/vlRWQ==
X-Received: by 2002:a17:90b:34e:: with SMTP id
 fh14mr6956614pjb.100.1627589515588; 
 Thu, 29 Jul 2021 13:11:55 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Date: Fri, 30 Jul 2021 01:40:52 +0530
Message-Id: <20210729201100.3994-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add reset
	controller for ethernet phy
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

Add reset controller for Ethernet phy reset on every boot for
Amlogic SoC.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index c7a6588d9398..8b3b5e8c2a8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -17,6 +17,7 @@
 #include <linux/of_net.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -95,6 +96,7 @@ struct meson8b_dwmac {
 	u32				tx_delay_ns;
 	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
+	struct reset_control		*eth_reset;
 };
 
 struct meson8b_dwmac_clk_configs {
@@ -384,6 +386,17 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TX_AND_PHY_REF_CLK,
 				PRG_ETH0_TX_AND_PHY_REF_CLK);
 
+	/* Make sure the Ethernet PHY is properly reseted, as U-Boot may leave
+	 * it at deasserted state, and thus it may fail to reset EMAC.
+	 *
+	 * This assumes the driver has exclusive access to the EPHY reset.
+	 */
+	ret = reset_control_reset(dwmac->eth_reset);
+	if (ret) {
+		dev_err(dwmac->dev, "Cannot reset internal PHY\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -465,6 +478,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
+	dwmac->eth_reset = devm_reset_control_get_exclusive(dwmac->dev, "ethreset");
+	if (IS_ERR_OR_NULL(dwmac->eth_reset)) {
+		dev_err(dwmac->dev, "Failed to get Ethernet reset\n");
+		ret = PTR_ERR(dwmac->eth_reset);
+		goto err_remove_config_dt;
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
