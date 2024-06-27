Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D491A572
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:40:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BE4BC71289;
	Thu, 27 Jun 2024 11:40:04 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2391CC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:39:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so86489231fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488398; x=1720093198;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pg+dewGD9qJnz964kSExuGkcfdlUV33yviPPBuaIJc=;
 b=CxXmjlB3pLiCBjYCrBQ/gRLMMv+ctffda7a8AnZ3aiTEU5BMvxG7+FCTXx30FLQ96t
 pbCKEECNO4zEhfeeRhxexyOvDAI9/BgGa0IFR0J8BrXG6U7muHlsvehrrBc9x/n2JVpI
 YIV1ZzpOSMOozedtCGtJdFmV2ci7lhV+Opx0kDau51+l8LqOaKPohi42OaFy8r14ZuBj
 8zjeBlQSDLzw8JIWicgM9svnamA46Wvi/6TcMWiUJGHpfsQ7h9qD1qVvgJVLIe2lgQ0k
 JdKIzQ9pLShiPJSMHx/KxhP/0iDwfVIH6blhN85dlVLGOK7Pf+NxXIgCOhhLwDwNbG1C
 Pzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719488398; x=1720093198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pg+dewGD9qJnz964kSExuGkcfdlUV33yviPPBuaIJc=;
 b=tpudyEfnw2vwxlz3GtPrgTMhgO2iuYrgYx3e+pSi9PquD6hPrSFMO5jOwiV04Y1rhh
 4og9tVSZrsv+MwOy0CD3ivb+xbCCatqVPqoOR69QiotvXThhfplpXTqxmUQBJVrbLQBE
 xBXcFp0xhNWQK91Ws2B0nJ+e412GxmHoiMUeq8czf0aoZS3gm0q2pN66HFDgYEvGil4o
 3mR3tIGHFKBZmZsxh/Cc8eqdGWsD2APTM//TNIP43gNnxYQAKvwKnWgtI9EVMIBuzwDO
 /j5Rujj0KVILv7vQHazZLeXaOShg9Mfr7xK/kCABvZbMpOjcaT4s22vfkgOIAZhB6BQy
 XTOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEfe+ql2Ql39u//hV3JNAk5D0soIrjY9Yb18Yy0MS8Nvy0Ve9iIaDi6KyS9aXHRCYjeE1KcVu3DCe9gtTEmi1Zaa3TvCFZE1SzO0FjcSgvZ/8Wdx0d2Zf7
X-Gm-Message-State: AOJu0Yx3lvV1TVSgR/6o3wW16WpSVprEDNSYd2U931T8R1jrQwdI5qcF
 Am7LXBekp1jzZLzQaOow/u8pS/Br2fFv4BWY9QCCtX8XUDOUH0WR1Y/bSwb40DY=
X-Google-Smtp-Source: AGHT+IFesDthKKQJOFKJN5mrhDcAjnIOVckKhyM8WzR1KTGyuUBEn5Q3dR+OhY/YzKz0W/J5FKzIyg==
X-Received: by 2002:a2e:7e0f:0:b0:2ec:56b9:259f with SMTP id
 38308e7fff4ca-2ec5b3e24d7mr75758781fa.48.1719488398134; 
 Thu, 27 Jun 2024 04:39:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8468613sm62081815e9.39.2024.06.27.04.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 27 Jun 2024 13:39:47 +0200
Message-ID: <20240627113948.25358-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627113948.25358-1-brgl@bgdev.pl>
References: <20240627113948.25358-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add
	a DMA-reset quirk for sa8775p-ride
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
the time of the DMA reset so we need to loop TX clocks to RX and then
disable loopback after link-up. Use the existing callbacks to do it just
for this board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 91fe57a3e59e..f4d72d75e8de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -21,6 +21,7 @@
 #define RGMII_IO_MACRO_CONFIG2		0x1C
 #define RGMII_IO_MACRO_DEBUG1		0x20
 #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
+#define EMAC_WRAPPER_SGMII_PHY_CNTRL1	0xf4
 
 /* RGMII_IO_MACRO_CONFIG fields */
 #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
@@ -79,6 +80,9 @@
 #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
 #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
 
+/* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
+#define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
+
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
 struct ethqos_emac_por {
@@ -95,6 +99,7 @@ struct ethqos_emac_driver_data {
 	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
+	bool needs_sgmii_loopback;
 };
 
 struct qcom_ethqos {
@@ -114,6 +119,7 @@ struct qcom_ethqos {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	bool needs_sgmii_loopback;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -191,8 +197,21 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
 	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
 }
 
+static void
+qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
+{
+	if (!ethqos->needs_sgmii_loopback)
+		return;
+
+	rgmii_updatel(ethqos,
+		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
+		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
+}
+
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	rgmii_updatel(ethqos, RGMII_CONFIG_FUNC_CLK_EN,
 		      RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
@@ -277,6 +296,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
+	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
@@ -682,6 +702,7 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mo
 {
 	struct qcom_ethqos *ethqos = priv;
 
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 	ethqos->speed = speed;
 	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos);
@@ -820,6 +841,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
