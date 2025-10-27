Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D8C0F06C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B963C60492;
	Mon, 27 Oct 2025 15:45:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B386C60493
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so21316165e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579912; x=1762184712;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eNS/wqhYOljfWC+fSnpn1y3WQ4q23+yxEBnxY7wxw6g=;
 b=vd/N47BOCJChxBlEOAJtJcpJ+rh5mIhGpdPZ7f6dunYX4yuIoSTQVaIdFSYIJoWvqI
 ROkN2BnZ6H31Wlw1GhJrKxvgpoaj5uB8CghK+7NVvEhU4FrDlmuEfglkDT6AzZXvoopI
 +LAsat1W9eKUfi7kKjL8wcNYlmGFDVNYKArHNIejRckstGge0slBgYZLWM57/IWgNfLK
 bWMI2zyajKh8PJ0U4t8abeLk20LuCm1GNVeJZML8AKtLbP0FyNZF8TM+5CoMENawlMwK
 wXi4TRpFMdI/EGP0au67RkelrN/OSKr080PsVKEcNmsfNaYaVdsHQTWI6OsF8u5tvLpZ
 9o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579912; x=1762184712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNS/wqhYOljfWC+fSnpn1y3WQ4q23+yxEBnxY7wxw6g=;
 b=QWrbREFwes3tpsScY4daORjEw1juooNehr3yaNJJimWaBXfdWeNs11FHsh55/rUw2K
 K26xaAzhKCBZ4SOmeMbSHI7y4U+KR9Xxbiunpd/8YiMUftM8l9elhupDBFFgeuGJukaR
 L5Y74lvAVu30mQ7h1cYVP/Gk+7YeG77mxVspyPrP1ZVKRZRoEtnyYwnkL9GQZVIx/jO8
 pGHRc2enSp1zlb61sWwTPrXwCIsybpgcDoT97EhXXR4pD6+jVm/NJPcql6LKji7ELCgL
 /PgCaGuugcwcbwa34VLsdvMcy6MWMjCmhjLe3+oCyXiJQCHwjm3cPFJvIYIyR38MOwZx
 Nq7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg2REFQEG9k9n41gj5CE3N0x5qX1+yd+s1IU4aRvzf33RkMcb57WNMAj02RV6kkSYZK/uFh+fMLsgtSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDmDr5OH75sZwFJYqsFvQcykN/56ZtXj7mo6SIXGGBlTT4JL2s
 WVIiRqqv0LKKfS3sZayYO9e/hFqNELyG7R9ni21kPC6vHCu/2Mk+NrUQq050mmK/daI=
X-Gm-Gg: ASbGncunR7sS1UOD64jX48xpQWhY1W9c1NDq6IOcfbkzgo7z7y8HC8O5Rk9K+bZHyi/
 D4bNzMaotiGedTALzv5YAjyhx/JnEgjb9IkK+glOJ9t0yW8DbkVA9/0uFL/IsYsrCuAxe55DYCd
 mERL/RA55KW61DFDX51wxAO4qJu8yZvxexeimHNyteKHskQWuFyOX0w8CxYAsRmc3RTrPaHK9Uf
 S4tQ8cJkJtOhF9prHPH38txfiUE02af3YTSfUN4r5yuIotkdKO3x7Bnx9K0mP3Kl/4IS/87U88f
 jpuFuAlFxD9Mf9W76GqOdnY7P9zA3Av+h3gjAQ+Om/kLboRgIeHnl/eJMiQ+OUWvtMPT5CMC1mW
 R3u0+fu+OC0jCg3tOHyfGyvDW74t2akcKUUH0l1ngJekGIVZqdHBQ8FGyCh2Ng7MLIVcIS/4=
X-Google-Smtp-Source: AGHT+IEcS3+Mjv+mhXDzePSPYtR5z2XLlTFPrVb1vdXnvrOFtKLZZKXhn+EX6Uyf8++3V+KI2L1nQA==
X-Received: by 2002:a05:600c:3109:b0:475:dba3:9ca with SMTP id
 5b1f17b1804b1-47717e7fa0fmr551335e9.39.1761579912349; 
 Mon, 27 Oct 2025 08:45:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:54 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-6-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
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
 bh=GgzPtEPZX7xvMWn454sVcSaK6B006ED6cn0Ay90ur54=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N8H8/tfulP9sfcdTh0prmWo4yvzuq4p3oVM
 UzG5vCPRh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TfAAKCRARpy6gFHHX
 ckfYD/9GFZbGhB0rIgQMsDuYjJI2F6r8bEJR2t5MXewyHGb0uBNirHJxqdDET5pMKzrBjXMX4i6
 AMmgzpETEwaCyZAswoOaTBd6YYaQo286whbtuGE/TVm671hhPk/mTkXcHnFUtC8C7QnwSAxTliq
 h1yXzbw9Yn7kOiOiCbhV6PHouufWr/FVGORHbqvkBYmae451ubnkG/8RPye1JwGBR2KKBTH2ECN
 LxfQ/LT9F91EgLGgi856IJz6OJZ0fzY0jRl0VwNbwMsjBe0ZLr/W315gMbRMzjobB7SK48vflJn
 kABE1SXMUrEF29ZM8KyKtx5BTz/yQ2fYZcFVYw3kSxW91nuTOk2h3jpgncAJmX2XfFMldm6SIVO
 bKCPsxtf7AKsVN9w268LsHvdemlilofFoYSP6863Ofq6L7UVMHiIaUAY4gTY3/Xw6qQ0OrIp7MA
 VBYngI5Lhe2NLsAHWCvVcvwVpUgIshWlSl9fpdhP8wCIGVcnYJlxF3mNu5UBIkyN3ESGiCeAl/G
 +ytjDgLy2TxB8dFqrMKk162NaW6E9DXdkoVoDujO+0tyw9detsCzs2d8fNu4g5V12u+KBJ9hxPV
 FIspXSJBb5mU47bGsF4bsagQIYmEz1koQQipGYowzi3OV2jeB8Hd4u61AY01NP3SBLP8M9OQKg1
 lMUDvHUmSKnRsvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 6/8] net: stmmac: qcom-ethqos: split power
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
index 7ed07142f67c931cb2c2c0e8806f5a7fbd68945d..c25b4b4581f9cea6107a39f0bc6165be6955cc1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -109,17 +109,21 @@ struct ethqos_emac_match_data {
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
@@ -185,9 +189,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -643,7 +647,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -722,23 +726,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
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
@@ -747,7 +751,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -760,7 +764,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -857,9 +861,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -870,9 +874,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -894,7 +898,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
