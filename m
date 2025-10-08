Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 487D0BC3C89
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C582C46D55;
	Wed,  8 Oct 2025 08:18:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E5F8C424C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so477442f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911492; x=1760516292;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
 b=naPRgI5qZQ6cnlwAqiLvDXdwAQS5fIWqgSUdrAqc0Zk4eKqQak1NqJaIcA40ZkVvr9
 VH4RLP+Jir/gsAsoEuln/0iekSTyUB2yrwzmnZxA4/KTJOS/jM2f+t3MOj9zOiS3pX8P
 mZScgTo/gJpVKHW1DRD/cllTIu/5P59HWavKkZDD2a5riyepkZ9gJbXaCWFL+EYirZuY
 N8R4dwlgbsPbXCrDnZxxXwnwtLo0BEW1VVPKJBBTNPAXjzn2gk3c5/p3O/wJwtuxKlsU
 zpIj65eLBaYnEZZ3ESIk3ieIiBM/USS/A4FBnAY0EHb0VUWwhSm9JtGP4+sCFRhoZTpZ
 06bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911492; x=1760516292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vSLcjrovVRdefyPQB8K8T5zFHjp8pcBoDKJgvNVhJg=;
 b=PVzeAB5cbnvlzI1zacv6lLQ0lmBIwK4EtGl9iYfIVRSib+6hGgUpxDVpY/iG2CGLkq
 Uc0xYk2JQfHgRGG5b940afg62LNASKgStqvZeZPpDNKezbHj5CE+AihhIJqcWGEgUnvM
 8lGG0jnpJOOAh1mQov9PD1sj95G/8zDFXqEgSrbeCajrL5WcxOlO6XHC1sjMugCToqpu
 LMz9Uw4QHjcUluITkm8ksEHyQ0BGtGjSWOvMivssdFpG++YXVYEkKJ2bz/MxI2pq1Ark
 +7S4fHIOoK3tQ5b5wQwwzF/0H7js0VGRISkNUs1URkmbId5qzOTLBcm6UQ/iFOejWYmo
 8yRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbohwXRIIyEqallz0LgxBB4pi0SVT+qb8ULDcgPPQJ4lbyCR++pb64IZNRD5zDq/tbuorxmwEN2ywjJg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAjq9nMDT/ifQkyV717auXdW2mp6IKXMNPElc3kveqQgVLJNoj
 5U/6mZBdSjL9mNZXJDILYrajyUK4wSn5eBZOaazViBpHTkp0061Gau3wzmu8N/aFmQ8=
X-Gm-Gg: ASbGncuN1gT42GEZeBHYhJQ7ZcaHmyp6s+0TvYXng/QwpIvtSEn0eNPFeBBxmHv3qMS
 T4Ep0pxPck7k84T0zRejARBNuw0oi7fPtD4liwcHhGdRSKDyvHfEUNHThm3CYinv0FNexARs8Pi
 OZbCIYqlmBHVgiUs7Tyb/ByxDkHm065bgIigyCfI4Jc6LqIMKgPb885OcMVyGciWHZilWrJz2e+
 QCQ0JUTwdZgyN6OamaFtgK23BXKf9so+lpnkOV7pO1mxVtsLrB0mOCuSJl7tfqON806FObwpfay
 ym/a474oDAWm7HcJ8h024rMeBDUbcz+GPVLFIEyvLwC9E805cnzJTUGICJYtYMEOmmeh10MCpdw
 khLQ5n4mKbyg6+R4WkEQPpr+16wwqUd2HaHIZJkp+yQ==
X-Google-Smtp-Source: AGHT+IEkLvf+ip6rnng1Q3wqUaE7YnRlE5+SKbX9ob3uGgdaQmwMgPZM1fXpO1H39fcBtRjNqboEKA==
X-Received: by 2002:a05:6000:4210:b0:3d8:3eca:a97d with SMTP id
 ffacd0b85a97d-42666aa6616mr1684492f8f.11.1759911491904; 
 Wed, 08 Oct 2025 01:18:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:53 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-6-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h4202HoR6T5dxOtuURsXoZwH667ULKwPUQFt
 Pg5ZX90pKCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 cvlXD/4oMQTfpDo2uPwukuQI/KQzXU/y8GklCY3xl2oO9CQHg18InhSbcIB9dCmUvObM94bmnBD
 n0J4E2ACalqEmPZUdDJ60jHvqactv0F+ntRz2qkDFYzaFexRkfXATjzFchCpRqAXvGcU5VpB1ZQ
 i2UDsHvtzVzNg4pipc7aPGvimknq7CfFFRbZMD5lRGEHGioI+XCGYUNsTNrIJykpwfaFiPmzN30
 XUb6glegwPsqra4CQ99uSKclBK47FOh7o4+VhVUZsNRaa8xa9/naZ/1JOLYU3TQh2uNXwvzJ8e5
 TNsWN0mzl3MVeoPLkD+pVZFH9CbDPGdzNeksgEEYiqgzXJSaqeCuIpB28EFp1UQrRw4uzwgBmsN
 jbhqw9LWU8l2rwBCobJtSMZSoZ50dTicEoQMhvR5ZBeBrjYSRRHB7JJKhsoy+T93Yu7C3b5qcfK
 V0ua3QeFOxf4uEUygKIu/SlgVq/j8ZVKSByJ/WkjPccIT7smJOCydOxlHoLIU85FoQ3U0jizMIv
 ZLAhuNgLcx+r7C5d0FM3sekaGOIA8J41lTbOCnz+hv+O2/W5YCciZd5IXC5LV1PcqIP6WYYE4Ib
 NMqYXy6BGOQIc7iv2vIzf+uNDjW7JbanfVIHHJT0ZM9PsfhDA24lyp1YNS35D7UXP7zU965LxpM
 eF/64jenVdSWCKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/8] net: stmmac: qcom-ethqos: split power
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
