Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B52734FB3
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C448FC6B457;
	Mon, 19 Jun 2023 09:24:24 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B01AC6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:23 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f63ab1ac4aso3947178e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166663; x=1689758663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JbQYFD4SJ55C6wrt2tec2lUW3s94uPPtSv2iGx8v1A=;
 b=FO1TsLuyGfLLdjqAOuNl6B4IB5YT42wd94FSALBjASdAJ7CEbTi6fKVotL4F4GvfsN
 s3FCtp35ynTjMGz1T7ZeKmduLTm7j2icbgS+1TSe5/2w4wIMj5gl2gJ5ceyieX1gD8Lw
 othyakqlSaVzaS4ZrdNUphj7u4CVxJnCdrm68qvUq3pyrjDld6euEXu8Hbc2mP9u77mO
 Zj0czW/J0Z4lgp9EofFkqcwa1tP2/wA9oHKPRRaMKdCorDx4moj7bK8PJurXXh3JNziw
 YWbOo+M64YNh66ZDSSNQl3ZbQhb3Gs4W6tYWC1uEgCyT8ih7tTmANF/zxNkVU75xq7SF
 toBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166663; x=1689758663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4JbQYFD4SJ55C6wrt2tec2lUW3s94uPPtSv2iGx8v1A=;
 b=UJhFh1NIlMInOiU2Nc4vpwrVpGq3WYv69meMyrXFiVubbD05ezevbbz9F2axpM5rVL
 QkD+L9wIDgzNg7cEBE/5fHgRyLC+rbsm9UNcpvrOcOR8diqwnBXZTCYe9hK0HeynbZP3
 62YR++bOn93lrDZ+SxLyutfGZLe9iJAAt9jeaxgDq6atC8k4d68F3i/0AGF/CGjWxh30
 0sZv6iTT7vNkw5+7Z1Q/ppmx916o9A7HLjhJXv9/vEdNioWpu453qTle4dL+50n6wI8Z
 32fpSut9EvRRiHhnJ7Ko6UbAyd7Lxwq/6ah5KDZaUtjJWt3Dcz3dm37u21gBlmaGdS0X
 qRbA==
X-Gm-Message-State: AC+VfDwkpDlMvwoYzTz0jOhHxY7FngWqyi5eAvTpxrSSH+UsMhz60TdC
 k6c9BhC9tdsuICe+v3vxaeRI0Q==
X-Google-Smtp-Source: ACHHUZ4OpiZJE0Qs/G+fP+x4GLaCuNxHMdA1ee2XP86bKMUVorC07qhw7wspkw+AOnYveYXvlRZ2Ng==
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id
 f30-20020ac2499e000000b004f86f404776mr1035218lfl.46.1687166662829; 
 Mon, 19 Jun 2023 02:24:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:22 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 11:23:57 +0200
Message-Id: <20230619092402.195578-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 09/14] net: stmmac:
	dwmac-qcom-ethqos: add support for the phyaux clock
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

On sa8775p, the EMAC revision is 4 and we use SGMII instead of RGMII.
There's no "rgmii" clock but there's a fourth clock under a different
name: "phyaux". Add a new field to the chip data struct that specifies
the link clock name. Default to "rgmii" for backward compatibility.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 042733b5e80b..a739e1d5c046 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -85,6 +85,7 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac3;
+	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 };
 
@@ -92,8 +93,8 @@ struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 
-	unsigned int rgmii_clk_rate;
-	struct clk *rgmii_clk;
+	unsigned int link_clk_rate;
+	struct clk *link_clk;
 	struct phy *serdes_phy;
 	unsigned int speed;
 
@@ -156,23 +157,23 @@ static void rgmii_dump(void *priv)
 #define RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ	  (5 * 1000 * 1000UL)
 
 static void
-ethqos_update_rgmii_clk(struct qcom_ethqos *ethqos, unsigned int speed)
+ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
 {
 	switch (speed) {
 	case SPEED_1000:
-		ethqos->rgmii_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
+		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
 		break;
 
 	case SPEED_100:
-		ethqos->rgmii_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
+		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
 		break;
 
 	case SPEED_10:
-		ethqos->rgmii_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
+		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
 		break;
 	}
 
-	clk_set_rate(ethqos->rgmii_clk, ethqos->rgmii_clk_rate);
+	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
 }
 
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
@@ -563,7 +564,7 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed)
 	struct qcom_ethqos *ethqos = priv;
 
 	ethqos->speed = speed;
-	ethqos_update_rgmii_clk(ethqos, speed);
+	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos);
 }
 
@@ -597,9 +598,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->rgmii_clk);
+		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
-			dev_err(&ethqos->pdev->dev, "rgmii_clk enable failed\n");
+			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
 		}
 
@@ -610,7 +611,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->rgmii_clk);
+		clk_disable_unprepare(ethqos->link_clk);
 	}
 
 	return ret;
@@ -662,9 +663,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac3 = data->has_emac3;
 
-	ethqos->rgmii_clk = devm_clk_get(dev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_clk)) {
-		ret = PTR_ERR(ethqos->rgmii_clk);
+	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk)) {
+		ret = PTR_ERR(ethqos->link_clk);
 		goto out_config_dt;
 	}
 
@@ -683,7 +684,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->speed = SPEED_1000;
-	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
+	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
