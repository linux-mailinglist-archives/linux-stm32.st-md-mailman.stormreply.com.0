Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB8C31205
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 14:09:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A869C62ECF;
	Tue,  4 Nov 2025 13:09:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0893C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 13:09:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so45082585e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 05:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261778; x=1762866578;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
 b=f+mGueaYtlLzZOD3Q/QaL7Mo1HJ1akurt+GMuEGWTIvEYK58BadNzzAAP1oGAhhE2L
 pR7kvdrJmgztS/mZA0+RdvmwybGLnANcGCgHR3R6NmHnytepCRzvi3ZNlQLJ55ej4hQj
 RmlEYppF96612E8eEbSNPjN3DC+UXcH59Pgfie1G6QB2jJxfBW+Gw5XPBkHroA8vYvsF
 EIBi6ygYqf7OHwBxUK8DXUEjhSxXvAUtWmly2k5G7EYRuoaGwgRSI8poA0+31NgbSmsV
 rqAgxYxqNOdZujp5IIi438HiZHJmho80Un/as2j+FUuVksQrq2g9cFO6DHae6HdBR9i9
 ybZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762261778; x=1762866578;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
 b=nRYtu7je/IU+7tPbLhshKOTXtuNlYvjjOfqL4VjGTfcsKdsCRdRjKT4LL+BTas7ZDv
 ciOzI+MWD56ENS4Xe7lzT/hIm3yfBbOGCSEzPvt5QkPoOfQE57TvK5f3lP2IHU1hZVSq
 x4MHZDxgwx0BY4bQSc72JN77ZjaGnqlPFPnUoaoYRTHwi70j+NjugE169Nx5tvfG/KfO
 RDPddydl6205euhUk12v6MTR9sOE+9Ao55pwcP6Qevl6fecKI+Oyf04b0wovLQ6++yhf
 T4TocE0Fxzc5LZmdvvpwtX24DNOht2V6cSEUScDsCnV9CaRempuJW1+sPiDN1eNVf+Un
 2cRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqEb3WzYZtL2hmL5ApOPFTaZQ+XbJaE/XFfqahRiaHN3X+XpI3wnD0TpLhCOqP1geIksmM+EFzHX8sQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2Lgq1R1ZcgAIwFxQ10q06LuD2dshJfEymk3NSMLURK2JB+OrT
 d6fvgVAUX8lE8tWRmSOLndM1vjOL7+ys5bcRqWQLbOZ/nL8CSTJ4rOxnY/c5FC2Aqxo=
X-Gm-Gg: ASbGnctCGueXdh13EhxZhONBbL8y4KmLh0e3tVOhLM+pbd84jZ+CvTafLo4AfhuQ/G9
 sZRLOkkSLNAJpYgJqL9pxifuxRv5fEDCyRhDo+GRlbn15HS+/EDO87mP6pQyohC/j1I9r5ib8Ap
 BpBxn7VxsYRMe15oSHj3oN6Id0ZH44d8jUIfA9Sz4t12FuYMVoBIsr/GbyiVBFrr1JudClqDNis
 nepZYjq+rM31W5Lev23SwrDPB/5CKTPST03aPkt/0doVhhcoci7KXIA0x8jKBESM+/ZCfAD165E
 IdOZHMsm3+dIJdEx7plloA+dcp4xk5E2klJ+P/wbvVXavHCQD8q5haXgsS2rUjorcc2M1gnv7VL
 L5EXcctVVdvh6sQxXANw68SWc5GI38HV4yqWA9mVkMKkgVVyb0rgdvtw7cDw5nukcdsWMzA==
X-Google-Smtp-Source: AGHT+IG1GvRdz1G4OVuTzfGg2rW2umU84ydK8m7ey6D7UWi4H5D+BCD/zY38vh6KQiL9kxoSITMbLQ==
X-Received: by 2002:a05:600c:3b0f:b0:46e:4a60:ea2c with SMTP id
 5b1f17b1804b1-477308a897dmr149553725e9.37.1762261777808; 
 Tue, 04 Nov 2025 05:09:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 05:09:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:57 +0100
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-6-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
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
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ywDusXCc0OEyB5wkP2D4YZe7bremgDjiZGqRKKOTVlo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrtclrVDAlMIr4bBijfyWznJtGzxJmoLoxKY
 +2FL+/n8aeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 ctIBEAC2l+TiXa3iP8a5AInCFJWKNapCdwbhYWx13UqtZMBgW57BQKI3iEtjlqAPNohvqcgOctk
 0JUeVMqskmHXPpKwwqXRPXzoNcJlfipAmbpDAzCKW5iALUWMCiaFodgqdz97ML0c0AyT/PoLbrw
 XiUG6dk5NJ0tD5FL0E0tOGhQEcTv0llsBYVuwRBVNSih7rrSmLIzNECL0arhuok0qFj4R2v5YYX
 1F0ol9gnXR7+OMae+CNJUSmao4IGbk1uotH7t5QQAnw9hroGg2dCtNdzX/pesedZR4OGaP/R9P9
 2tAq63d7pcOZUdwrvoSiBCdncHK5IqlM43kBDojNWhirTdjWhHKVgPJn72ZjZzQ7FD5MRJqRyAw
 e+7OtVgHYukGRDwG2OaXWZbBnxVInaIOoniDe1GCRgIgS6mM2rw0CetFQSWGQ3ZG2acoLvkh4lV
 9vBPdvoIfSzZTY2R+MEUJIqGRK5HYHu6mxbtEr8fck31gHO8MRyW/lu6YFC8hdbUDrGuz3rtkx+
 G8Vv10l2V7R/fjBI+kdB5yBACw0w79wQbFLyjvw5hdCrT1B4TmqCWuLT8twrdUZaIxTGPsrbImt
 pd1NcGf7YFp3IasjD5uizb7PejGV/SG8p8rUuiN1q6g/l9/Tz2nFK6/zrSv9zmEvgLcfXLWWEBD
 LXjn9oDxsxIrmnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 6/8] net: stmmac: qcom-ethqos: split power
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
index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af2769ddff4964e6596 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
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
@@ -181,9 +185,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -639,7 +643,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -708,23 +712,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
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
@@ -733,7 +737,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -746,7 +750,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -843,9 +847,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -856,9 +860,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -880,7 +884,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
