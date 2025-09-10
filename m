Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEDBB51085
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:08:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2708DC3FADB;
	Wed, 10 Sep 2025 08:08:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28B04C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:08:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45de1f2cdeeso21352215e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491681; x=1758096481;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
 b=KmfFRhbd/bIhJeONcphleGSEdr7h0jyPuYNjEsQ5hvwNxLBCAOss3QENT4sRQFCEBq
 +q8tmh2qbN4o8tl5wl+rXENAzNslWWnpjmaxzSa7b8/41nG6CfbdDsgUGyZeb0s9NGH3
 eeqApzZh5VK1cGOIgcVnMtIKliBLasWTbEvel/wsvSFnGGjbc5GWuy1HNN/NVWtw2Sia
 HrdSMhjbHEvH1I03pUvpc105Emfp5YtIEo3eK0OQFPAYd3i2sAjPL+4Kf4tSe0w7NLZ7
 iBOsaq4QPzDs27comLFmlIlQOmTx+16WQpckkwgD3kWVV++8RVBKpMTz3X/KsuJb9Mw5
 8MbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491681; x=1758096481;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
 b=F2WuJiY239Z4ZLha32XiuxrIgd/FD8HJKnCH0etpufyFnTnEKDMGtMqEBbxni+Dsyc
 o+gqTRssXtdVkaHgegxLs4w6+LgCPaCA2iIrajmWJ/TCiZwscHHztMjqp46DTnKiLHzt
 Sl+fHjwtgwwBCievnAaAghfngyiM0SBJFRfGerZUiPxju3UL1OmXzmNo0GIT+IyFvFLE
 J7XIWtJy/+19yCM5MiPZf+lsVxZg/xA1VRAjHxFvY3BFDAbC0EPIBw7R/iUMc6J3AckH
 SGVaj+ujJRYL1va6gc5N4YBsSrsNs4A7J+50rd2g64psv291Jv8cA3p9jmjJSHolkeAs
 6TlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJNqKDXcEI0kF8R/YUclyx1WIdSqy59x+7KNB5/ZO4Ki8b/RnKdBF1TD9OauiNhNRUZgiwLn1Y8eHcnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtIEBNGafOxMRuBzOieXVuhOxjjChoRJB16ExXqZtKuFsOdZlC
 lMjhK7cqX5RiMf4WFtlZNbo9T/p1/VtjnxOfsefa1O8wCjeJkDLEsBRz2Ev9IyyYFtE=
X-Gm-Gg: ASbGncs3KlXR5Ly/LFKRJwO082hGzSSHjEWcRXCglj1iEx3nhZzhGwMybNMwKvh+/dp
 dgUaQpamvdULAtgfzntSBUQcl13lq+Rxiv6CVWz4RxhDW8V7vL8HnC1u00zw5h8ZFxZvYcgR2kq
 EUNkR+x0NPEjw4aywzNUfum1y83U3hygKVu9SabriEq3/7LGrAd1xehTDcyQOCzGuHH44sO91wk
 8CDxZE59+ey0Kneq8L5Ep1JNQAAieVxSHD0eK5lzZA+D0pP8r9WdItio5yJi2M1MsH2tukOp6j7
 hr4ChTtuj0PrZeo45LCdih/rF5sinQMrixWTN4dubQ5blXSvDXcwupU6TC4B/6j1r3okixH0vCs
 pGrtTYwY973QASzTQNCLsMRnd7giz
X-Google-Smtp-Source: AGHT+IGtTZTBxDp6rKWXdB/VBpkJj6AncbJgtDSJtbOLi94Ze8GYVYUd/pOcMlolezAIYylFkwVcfA==
X-Received: by 2002:a05:600c:468e:b0:45d:da4a:8dd0 with SMTP id
 5b1f17b1804b1-45de6b386abmr80521435e9.27.1757491681543; 
 Wed, 10 Sep 2025 01:08:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:44 +0200
MIME-Version: 1.0
Message-Id: <20250910-qcom-sa8255p-emac-v1-7-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=72Rcv9lcaIE/fmtmW9sA3UZwGSkP3ncYbbWtrZ8FIEk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHOuZe0uiqQW2Zgiw87pkQviYLugbHl4HVm6
 6cuWdNFuamJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzgAKCRARpy6gFHHX
 cqWbD/9JjExtcSAoeJytoBguDSVFDiLWEedYT2wU6Ln/fpgS+pWlLnROCIZr5W2/sroazOl/Gly
 2zfKHYub9rpzVyhcc/FhCHxfsL45TQTo9lzyDYf7wMn7c9FFuqFczU5BhUrGETPCPmw4J9cjDE9
 wk9Xvw2ZBMINtzeCxXB00eUKFHsooYoWFE4G00dncC7b94/ReUz/Xh0P48j+JScRp1FvbAh+t3O
 M62lArrEcvAFTnLEHjYPPLHGMkwfWFf6Y9XirwTNCPnfzeOKZ33dtXcJE3MSDFcHDU86zIfhrHw
 i5bN9PRG2zW19Ac3lt+PQ/2PJdT1aut82NNcRkmY4seswW4ku65ND7HcwlDIX3V6eMupGvfirkc
 8JT9Owbqf0L7w5smgcEbwVTTyTVtnEcLAPt1nxehJTciHnwbLjrQJSYodZZaCSOjUr6YOKSb5zn
 AXPaWrBfjEqTRVxLDnvig+YAGYr634Zo64oAQbEXWPVc5XVg0TFA4zCHE0wTkNUdHL7sP6ggnWg
 ofhmSHgl7z+l4kBeCROm98rH0FOxivvc8+yDt7uQ+MOBmG2PG2HXtYYCtU2Zdp4GLFMwhmxLjgm
 6vHdDKKL7MD9TBzPng07OuRZFv1d5Sf9ujrLI6myzQhfonZTTKydGAO9KgO4f0uxjO7XenKJ409
 lYurxGnOOatO3dw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/9] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
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

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e..1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -110,17 +110,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -186,9 +190,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -645,7 +649,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -724,23 +728,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -749,7 +753,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -762,7 +766,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -859,9 +863,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -872,9 +876,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -898,7 +902,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
