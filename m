Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66D731865
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21FB5C6B459;
	Thu, 15 Jun 2023 12:14:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED1DC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-30fc2b44281so4275330f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831290; x=1689423290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JbQYFD4SJ55C6wrt2tec2lUW3s94uPPtSv2iGx8v1A=;
 b=NPRslouCBXzk7SIrAljKn7IyR9xqIXtfGiJZL/4apJ5e6x6I8VFJ/ocSyGJTYPwF3q
 QQIX8eoP5A52pDtTrvGo7go45WlUZ+Ek5hAjy3eR+Qr7/F8cAqcCeDQXlZrRaYRQhtpI
 tJk5L6l5JY+EJ61fDvSKe254zSYWxhdgwJgQjul+DU519Uw+UhKg2WFebmtOX/uBLrgv
 ESk4W+ofQ0Q4Ylkk4OLAxqC2xXk4Wi5+s9L3yeL55I9Uh4XK4+ShvanEtcuPOjwHfw+l
 /6S7unmyhIDQHcmSejeahvZ+Hm3YP1oupbGT7leLkHOYNnSJNLppsnsRzdHzd1nvvTC9
 0KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831290; x=1689423290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4JbQYFD4SJ55C6wrt2tec2lUW3s94uPPtSv2iGx8v1A=;
 b=H79PKArlnLOj8lLEkMbqaCzge8zR8Y8aQUi329jMZ5qfdXXaRQn8Gk+ETKEX11gkPh
 A4vyUqbFozTS3Fn41qth36l0lMTFwqGgDbcxGBEmBicpGVimjsODj+VJvGMqv7wbUuER
 hFonBNu1KSorwmiadx5yx4biwT3NVaa/ds5CMg4MUzKfDFjBdnCET6RLNzjGIZ/VfiXZ
 JzvGAQyxXZuFQw+gZ/rHSUX8ZqX01Z5/0qJKm6TLT5slVa5sFpuo3km8vhk/5zVA4Sae
 l1yMzyV+7obPHtZXcrHimkc6NCk7VGz626NzC6TNT4p+zJbuLzn/oglacmeBkl6jZdjB
 julA==
X-Gm-Message-State: AC+VfDx4aglIcg43JDI7b5Fk8xCFwer2beylU8abPDNLQCnCxUd0BfyG
 7ARMPKMwEev6OqCK9SrljxE8/g==
X-Google-Smtp-Source: ACHHUZ6pIzCDZgXXG2fkbuMhxenIfdIzLNXZCGgDERQxbzMLj9r96wuVCu262cAJSZ+uUYudMcWoWg==
X-Received: by 2002:adf:ee0a:0:b0:309:38af:d300 with SMTP id
 y10-20020adfee0a000000b0030938afd300mr11842861wrn.33.1686831290598; 
 Thu, 15 Jun 2023 05:14:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu, 15 Jun 2023 14:14:09 +0200
Message-Id: <20230615121419.175862-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 13/23] net: stmmac: dwmac-qcom-ethqos: add
	support for the phyaux clock
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
