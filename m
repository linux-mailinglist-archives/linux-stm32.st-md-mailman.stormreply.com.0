Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C7B51088
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:08:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF4D3C3FAD5;
	Wed, 10 Sep 2025 08:07:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B6C8C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:07:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso56215505e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491676; x=1758096476;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jaxsI5wjc2fZX1+u0/1MOkxyHBJYNhx76B7+LombEVg=;
 b=Bz7fpDRWy7ALWScoslHdgT11EXiKzVuU/IUsqxEeD7b/ezTWGhDE4CGClUpOLWRUgq
 JO/Uu8s2qDdjvtJzopnMKdswkX5TNUlZ/Kc2leMbnMgUekT59CvJxZHPOita8Sm5NR5O
 x4ISnI3a/H2Hwu5h/3Sp0L/Wbq0K+xmDxH/ywQWGoAaoSmEXsWnUMild/WNTeiW2RkzN
 5VGPuMQlzoRKHlfwOBQY+uI7g+eRTxZyIhL9d2Hm+yOKFY0dsJ+wkkEoeO7G4YTtI2OY
 GrdoIhQEwajFFV/CGzeL/rkkgtKt38fsO8Kt5/cdI+yJ7zM70irZ6uPXKQ0+fb2Wfxc/
 gTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491676; x=1758096476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaxsI5wjc2fZX1+u0/1MOkxyHBJYNhx76B7+LombEVg=;
 b=mjibxEosn0Bbr4tSsl1GS8hw7bIS7OwnQaLksGziDYNc4xkb1HmEusWhz/DVaqPlWs
 MGCIPv9+FK6BAvfNbUhdick7NAIT/nhLOx6oDGC8JVqCC1IPHlfAdkQ1o9kAtLDWV8+X
 +s7qgszsmunfP4QhMGpwMe8hgKBt6iNrEPjb0gbE05wvyaLfc+A5/eDzlubTuVTQSG0y
 Q5lsXI9ZQxDFmCWwBU2Y+cUlqVsD6z3uBLb13GxNXPPDqLuFrfoOdXlyLvcpmN+OFmIV
 Rcqkj0dnSEoRiALHkhDFvP3Ctb2WyQFD2H0km+iMxe3ZMcpfF6ffzsRREVW7T4Q999Kg
 xMUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW++dM4PlCXSHq4WvWnoaHzMeI8XnBjsZWzNf7B/UBQasY5a0eYppcltkLrJpw7otpiXU4r60K00qRIZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1MANwCUufBXq/kFpTmb4kniiOl/zYQRkAcJeFscTH7bVI3S8B
 E/faF0X31o2hcifeUv7M7wo67L/fQXT0+9VyJJ4i+KWM41zezeiTWk6nMmfp219JKfs=
X-Gm-Gg: ASbGncsZzUmPMPzSMM2jfghd3nhcdKXykn07E8vd6oOjnZM2cKCbXGTmAgEZNZu/7z8
 w9HTPMBIRGmz1wXfU2AjKaqvibPstQvF5OKXhmZ7o29PlglC3KYUMy5rU9+0z+2iv/s3uJtNZAd
 lat2ehW4FFpoN+pbq5zJUexQyB8cwwgVBhMsfDfRfqrDQoQnDHHiMK7b1ZilP2RIq7VCkaHtDCr
 ZLZxV3Upwcj9ADQ2ZtbgXdiBiO89vCtN8T+Y9qS0FIJCDpBb15be+xZif+sfN7FOKJW/3de5JWD
 1GbzWtBv0LG0AFSdbqKlITXL1wJ1v68q0hE4C9BsmFTty5OFDNH2CLtsKQziC67vbwGNwDU3DXR
 bKsLMrG/44+RhI3uV8wIg3fh+Q3c6
X-Google-Smtp-Source: AGHT+IEsK3oi0wf15kTBAy3YQl8GVyAviVz8pnGaP+PQNHUDKYX8iQ3HQ1jMhkYqaRwKVBm0IQS1Fw==
X-Received: by 2002:a05:600c:a14:b0:45b:72da:e622 with SMTP id
 5b1f17b1804b1-45dddef7fe5mr113764435e9.28.1757491675470; 
 Wed, 10 Sep 2025 01:07:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:42 +0200
MIME-Version: 1.0
Message-Id: <20250910-qcom-sa8255p-emac-v1-5-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5758;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sMGV2HQxeUJ7fEJpZJPTl2YIIxSzYzigYX8J2eZkPAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHN1hh7bVoHkwddobbhnAlbR/3YpFVH0VSzk
 ZGtNXsCxwqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 cjljEADAPtg6edA14A3liA9qVeSJiL8hYCWrFHZ0oUVtq7pHShstUnF0t5Hiy4RztGs8+OTqI+4
 51f6UgJDAyzbfD7/4velVdTgTEeSt9xcU3daYnL0djFwLV5WjqO377W5sOj/gmgEzmG74cB1EVB
 Vk56sX40SRFoyjySR4KATZDlUL9+xodcXU3Szpl7P06rPpCUgZzUgjEViE7mpXqJIDGlGh4Plxy
 RAdGBiusm4gOrUqwCsvyKMwz2MMUylq3q2FwGWEip+6JJnXAHmAqCIYLHVxer8x2MuBYQLWxzop
 WIpjUMXguXGs65GWQZGOab5J0wYCcuvVAD26fW745KcsD0Gbc4Ai9wRQBvFTMHkOyUTpl0Qaxww
 w9zQ66ODYjvZZu1KvCnz8XkvvCoTLRwPjTFM2hTzbJ3ZnfgEgOlrx3WH4nyKFpMjqOP+LXTeBZN
 c0aJV3yc5wRHQbF0azICbdPkJdhjLEyPru7ioH4zf5AQQ32lnKYPOIpInQ1xCe7b4KM0C6HRRiu
 GHvfCfslegpg9sixBNGv23z4IrBFBt8y+WwLjKL7nRybTJt836zF3O47iEn2R9gj/KJuQvORNFF
 g/1nXOINY0xcvqY5kkkY4iGZTBow4Oqq11Vt4j1TWPm6aP/iM4aJ0tqedWonKddeSld5Ui0bowp
 gMTTawSgzOdmuXg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
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

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 53 ++++++++++++++++------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0381026af0fd8baaefa767f7e0ef33efe41b0aa4..dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -102,6 +102,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -219,6 +223,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -235,6 +243,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -267,6 +279,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -303,6 +319,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -766,7 +786,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -817,13 +838,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -851,16 +874,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->has_gmac4 = 1;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->has_integrated_pcs)
+	if (drv_data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -875,10 +898,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
