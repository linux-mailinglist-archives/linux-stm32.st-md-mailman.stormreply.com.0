Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A5734FB9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096F4C6B454;
	Mon, 19 Jun 2023 09:24:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11BAC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so3998584e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166665; x=1689758665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8IJKtNsdBW540hrOificFtv5+xZ0NqYlT5TEOHx1Rg=;
 b=zzGOUZ2uzsuPMUj7xgWml1QV/Tr6XdMyXmX+xc7AZMeyVzpd1Th/8FJfRjlZ6b/Uq/
 yd4EJjeffDrgCmQDIGR0pr9ZiQvZWe+HA2qtXVrxVCh7/mD/wsEn0fQfZnwDCkYwyM6L
 fBJSc0nl9690FCVc7nwMmmckb/MTr8dby/FMQCLaNvowlkJBNVOwKp05zJ1E8vhUPKna
 UTwVvG7tUC7R85ULg2ypelbyIxlnqpSSYMHTr85wDJ6h59nAlVONIgJtfu0twFOD4djT
 07J8Krl5X42jZW97hTmWad2tLrnGOeEMKJyd4zXwM22fGU9oF5i0/K+qXseiInCCOJSO
 60kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166665; x=1689758665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8IJKtNsdBW540hrOificFtv5+xZ0NqYlT5TEOHx1Rg=;
 b=dYsihQ2Cv1UpdoguavYk1ADu3210T6ul0Jwtbtc/lbKB6Rk6ZWnldu9u6CqAnR2XsP
 oo+oqXUNNntHa8hOlbE5HNoVQe4kU+NnuaDAyjdQM3RcsWHtYqbYYpZ1/2GoZCMAwkNz
 46hjHzQJzUnWwKt6avgimJ5npWTCYXdvC19vF0wHhGMLo/wSGTf6Rv0xKMLDt506nZlr
 eW73qb9DIN6WqbMuamqM/92V7eRSzsDoaWbM3jwdhoJr7Y4f+DvUKZfL7RQuYkXVF2bf
 xef+8xJVAxjXN4yNCmyWi/Er5IDwimlnWud+bZR/hwZ0G+JNX4LV6O5pEZrZRVEd1YN7
 swzQ==
X-Gm-Message-State: AC+VfDzHSgh0sEdPZarora2rD3UEnBdl7/Eb69a11uvjx0Uie+CPaWBw
 sHWiMR8V1i8cl11ZQht9+2phxg==
X-Google-Smtp-Source: ACHHUZ6Tcbw6KE5SoygObxk8oAVfpAVRz4iKBToqkTlVGVNorPJd1Ll1aCOQBwTd8HhnaFWn+tOQbw==
X-Received: by 2002:a19:7718:0:b0:4f8:6d54:72f9 with SMTP id
 s24-20020a197718000000b004f86d5472f9mr1308228lfc.61.1687166665212; 
 Mon, 19 Jun 2023 02:24:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 19 Jun 2023 11:23:59 +0200
Message-Id: <20230619092402.195578-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 11/14] net: stmmac:
	dwmac-qcom-ethqos: add support for SGMII
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

On sa8775p the MAC is connected to the external PHY over SGMII so add
support for it to the driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0ececc951528..bdf59a179f87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -75,6 +75,10 @@
 #define RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL	BIT(6)
 #define RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN	BIT(5)
 
+/* MAC_CTRL_REG bits */
+#define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
+#define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -92,6 +96,7 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
+	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos);
 
 	unsigned int link_clk_rate;
@@ -559,6 +564,33 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
+{
+	int val;
+
+	val = readl(ethqos->mac_base + MAC_CTRL_REG);
+
+	switch (ethqos->speed) {
+	case SPEED_1000:
+		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
+		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+			      RGMII_IO_MACRO_CONFIG2);
+		break;
+	case SPEED_100:
+		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
+		break;
+	case SPEED_10:
+		val |= ETHQOS_MAC_CTRL_PORT_SEL;
+		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
+		break;
+	}
+
+	writel(val, ethqos->mac_base + MAC_CTRL_REG);
+
+	return val;
+}
+
 static int ethqos_configure(struct qcom_ethqos *ethqos)
 {
 	return ethqos->configure_func(ethqos);
@@ -663,6 +695,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
+	case PHY_INTERFACE_MODE_SGMII:
+		ethqos->configure_func = ethqos_configure_sgmii;
+		break;
 	case -ENODEV:
 		ret = -ENODEV;
 		goto out_config_dt;
@@ -678,6 +713,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		goto out_config_dt;
 	}
 
+	ethqos->mac_base = stmmac_res.addr;
+
 	data = of_device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
