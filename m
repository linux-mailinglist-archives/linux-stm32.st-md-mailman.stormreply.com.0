Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099490F653
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB8C1C78019;
	Wed, 19 Jun 2024 18:46:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5548C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so76191f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822770; x=1719427570;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpAzXcNNxYpTdvfi+BDU0xCxyu40usRKC5CFcQJxaNM=;
 b=pyjrGnx6f/wbHfcuCOYOG+EsGr6LmQ7vdJFejAbpJfidpWRvvmrgTwnPurgcYcNxoy
 U7RgmcOImXudApTlYHFQ+5jOUJAaXtc0WQEESk3dRL3/LexAD0XtpRmB60JixzqK7dxU
 I0iGOzU2sUyUxscHQURkpSR6WJu0a3VT2JRqHZDd8pVvox4ceizuooCvMMWtgZZz9Ftr
 VjAA91iBruDZSzy2d6JPmUC+QoagGLM22fEJbkh19Eyzw0TYi9qCFZo2xX/MmWtwRw+d
 v8e8Cll8Ay9wR6TCU6tScSRilhtZdKjdFZEBNbTp8jYHMgDBxqZh3yjBOB+2djnIqnJ+
 KnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822770; x=1719427570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpAzXcNNxYpTdvfi+BDU0xCxyu40usRKC5CFcQJxaNM=;
 b=bdI0RHf/mg90GqtxWDnzjvVWNSBw0LH4ooQ9gjCHOhFu25hLvMrxo9EhZ5PxWEsDo+
 hTZmB6ZYrWd/7Q+/4p7PCnqnE5inF77rv+9oeP0Sb6vLWgJNFdoLgDvZ0VCdW4Fk9lID
 2VWb48TPSLi4HX8zzVZ+w0rKP3CSVjPr8ljP0MA1PQnuTeP8nhk83c08YuJsbATAIAcE
 paPtVmbA3lDRNL80P99xZWa9y6PWYASSakPOmAXXVLIV3xcnym4ygdJkxTc5hRMAJL1x
 G1LXTxh0kPUuWf7TdZ/Agi4+3o+4Gr8PnT0o/7weSSusNRVb+UI9xTfkc30UeZhz5bTk
 OTjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMRRg4qJgq5fFyddFDGzle42VOXBe/DPTEXwm1d74lPWD48DS2GhXfngNUsf1K/h6uSajdYpnOkb/ZC02cADpQQBBJz+hWeUFHIjlyrOFyfKXX+elPcsij
X-Gm-Message-State: AOJu0Yxhg+NwYl7U+CjC2iVp9n6eKnl6grOH+RnW+NKrpli1YnO6Y4Ca
 RRIXprsqq5bLOsGqhV37ozQXeqS+VGF+y0JKTquefSbXAUMVdcgWs4u0OHLt484=
X-Google-Smtp-Source: AGHT+IHjF8mEpNI/gxyJaJmiFPRUJrocPqa3dz8xJy9EQvsllKfjPZWiH68BZOjcdaFrDoZZqxW6IA==
X-Received: by 2002:adf:e390:0:b0:363:10cb:45aa with SMTP id
 ffacd0b85a97d-36310cb4a2bmr3050189f8f.24.1718822770504; 
 Wed, 19 Jun 2024 11:46:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 19 Jun 2024 20:45:49 +0200
Message-ID: <20240619184550.34524-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619184550.34524-1-brgl@bgdev.pl>
References: <20240619184550.34524-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: qcom-ethqos: add a
	DMA-reset quirk for sa8775p-ride-r3
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
disable loopback after link-up. Use the provided callbacks to do it for
this board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index dac91bc72070..ec43449d0252 100644
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
@@ -678,6 +682,29 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	return ethqos->configure_func(ethqos);
 }
 
+static void qcom_ethqos_set_serdes_loopback(struct qcom_ethqos *ethqos,
+					    bool enable)
+{
+	rgmii_updatel(ethqos,
+		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
+		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
+}
+
+static void qcom_ethqos_open(struct net_device *pdev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+
+	qcom_ethqos_set_serdes_loopback(ethqos, true);
+}
+
+static void qcom_ethqos_link_up(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+
+	qcom_ethqos_set_serdes_loopback(ethqos, false);
+}
+
 static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -861,6 +888,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
+	if (of_device_is_compatible(np, "qcom,sa8775p-ethqos") &&
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_OCSGMII) {
+		plat_dat->open = qcom_ethqos_open;
+		plat_dat->link_up = qcom_ethqos_link_up;
+	}
+
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
