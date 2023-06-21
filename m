Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B063173899A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F58C6B456;
	Wed, 21 Jun 2023 15:37:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E04B3C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3f9c532fa45so6264545e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361831; x=1689953831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzkZoWqIdrFL84uinSijWf7BmQOJpWDfpkjROxZd1c8=;
 b=PcGca/hWjJcVv+Y/tbmdA71BgJ7Lr6OMUaqZiMiOw/DP9D2tyjb2ebFZwqVne5WD/Z
 JQWUu6+eZ+cphu8t9HiFXX4Oe0PApDoD8mDbNRalw0FyE7F29WNYN61faxh1Wh+JUY2T
 SCtMK2sfzM6L5oWuLO06DYM+7eITR+bMkb0qsRAjucXpmWBHc756CN2nbbp2Evg5ifd5
 J4USwnkUh2Ml7zPchKernlpz+3oGy56v10NHcOt7x0+WKK0GbHYvIlYSwD2k3lpbTaFg
 F79ZuOgORX3hOD6C9VxWLe06gI/y9L3VIhoAh012UQeyay+mV+a+vRRIuuMEFENPYXzz
 KMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361831; x=1689953831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzkZoWqIdrFL84uinSijWf7BmQOJpWDfpkjROxZd1c8=;
 b=ZZn2CB1SqJDDMu6u9PBONBqxQgoG4olXEOJymJUBE2+j+oLNYjcr+AcSJEufiMieEm
 vsZsM/aj0UjuoL8MOv+YdaXyt9i7gRJEZZE6y8GazHDGIVBypVR0vM98wYNJCTZBvi20
 c39U5HC6HIXb+McTzLpkh+RimT8GoBaPx5Q3fioSIFGrcdqaFumck9u4IiKTuUoTS+66
 iG4WfmmKG+CHSgD8v4f7bJk/16BxglVFQf2GwpUgu9jO3j1gtTzqD0fKuzNvAgxYlyx0
 5KLxwvI1MulgiXp35u2KCMrQcecKPtNc9MgxJsSU5pgRW8EkPjTqC5PVFK57KEUjI+8N
 Im0w==
X-Gm-Message-State: AC+VfDwzAmNlCfyOGO9v3Flyo6q86s6HBm0fLnu7xq8eJH8pyYEPOxxd
 X+3wUL0FusKFD426Xy0kpkYqXA==
X-Google-Smtp-Source: ACHHUZ6+m4x+02dzD0msTZyYePiggPtcVzXmvvy5Lf7/ySBqdENggcehBQ1qprkG4JzujBxj3sOUTA==
X-Received: by 2002:a05:600c:22d8:b0:3f8:f884:ebe7 with SMTP id
 24-20020a05600c22d800b003f8f884ebe7mr10660338wmg.0.1687361831603; 
 Wed, 21 Jun 2023 08:37:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Wed, 21 Jun 2023 17:36:48 +0200
Message-Id: <20230621153650.440350-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: dwmac-qco-ethqos:
	use devm_stmmac_probe_config_dt()
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

Significantly simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt(). This allows to drop the goto jumps
entirely.

The remove_new() callback now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 49 ++++++-------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fa0fc53c56a3..7b9fbcb8d84d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -708,7 +708,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
 		dev_err(dev, "dt configuration failed\n");
 		return PTR_ERR(plat_dat);
@@ -717,10 +717,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->clks_config = ethqos_clks_config;
 
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
-	if (!ethqos) {
-		ret = -ENOMEM;
-		goto out_config_dt;
-	}
+	if (!ethqos)
+		return -ENOMEM;
 
 	ethqos->phy_mode = device_get_phy_mode(dev);
 	switch (ethqos->phy_mode) {
@@ -734,19 +732,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
 	case -ENODEV:
-		ret = -ENODEV;
-		goto out_config_dt;
+		return -ENODEV;
 	default:
-		ret = -EINVAL;
-		goto out_config_dt;
+		return -EINVAL;
 	}
 
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base)) {
-		ret = PTR_ERR(ethqos->rgmii_base);
-		goto out_config_dt;
-	}
+	if (IS_ERR(ethqos->rgmii_base))
+		return PTR_ERR(ethqos->rgmii_base);
 
 	ethqos->mac_base = stmmac_res.addr;
 
@@ -757,24 +751,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk)) {
-		ret = PTR_ERR(ethqos->link_clk);
-		goto out_config_dt;
-	}
+	if (IS_ERR(ethqos->link_clk))
+		return PTR_ERR(ethqos->link_clk);
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
-		goto out_config_dt;
+		return ret;
 
 	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
 	if (ret)
-		goto out_config_dt;
+		return ret;
 
 	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy)) {
-		ret = PTR_ERR(ethqos->serdes_phy);
-		goto out_config_dt;
-	}
+	if (IS_ERR(ethqos->serdes_phy))
+		return PTR_ERR(ethqos->serdes_phy);
 
 	ethqos->speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
@@ -797,16 +787,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
-	ret = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto out_config_dt;
-
-	return ret;
-
-out_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
@@ -820,7 +801,7 @@ MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
 
 static struct platform_driver qcom_ethqos_driver = {
 	.probe  = qcom_ethqos_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = "qcom-ethqos",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
