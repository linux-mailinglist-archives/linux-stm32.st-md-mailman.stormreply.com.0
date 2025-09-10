Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF81B51087
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:08:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 135B3C3FAD7;
	Wed, 10 Sep 2025 08:08:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF229C3FAD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:07:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45cb5e1adf7so53771515e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491678; x=1758096478;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
 b=OAThjIlgMRa9lVC3TwnkmWwmw1djpTcYDJFkLLYbFmpFxDg1eSocVGHuFhZpI01Sl8
 Ib57/nxTRUzTys7TuR0VAiRIjU7C8KtX5WytmAY2ns6xz7hifbgCVLbmgYMhpQcbR4ab
 y9H5URhvb/pRQ27K4icKTrvsrG9Wk2flSjrYnkWsHCi5uw5RZ8+BMdNRyHCicSY97z5h
 zF5qwP7gYHYQjtRRezmfwQlsfQIRJoLU5n1mzk2WW3Zoa25q116zk/za+e1TSETGkPd0
 romprGXHKIaDAb1piTyzQ4It3/FtXTxzSynuzLmSOHDNNKCsFj+4Fc8Q8BUTazHx0hoW
 HIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757491678; x=1758096478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
 b=JvrWzwE/d4j1SjKzAFjiXqu33cvYc2mwtPH/EgJ2EXGoQ+PzmGZBNjAfEIIqigzGrL
 gp2Mt5VPuLCrMnEWA59nT+rVZHOy1quKGmIaIglyCXpObQiSRh6rzyFFMvpj1dY+5q2d
 S6n9H11iswCqm3v/PYAzS1B7TnVgZJQpnWmS9En5T7dnR5XWepb/mDMaumPXuGVHGZKY
 OJ8mHFcKGDI2fE5kw44GsIbjI9VakHqdgAj5irT2LKBFTgWbaHiOXrS8c9EnXBfTPuYC
 eVdkQiTx3ZEk3qZtj2PdKHykMAr0XsU5t8bOlq7jjw1LSIwfyx7UeG4qchD5XEJ6XYEW
 OXKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV81pZFz+/30PcwEvji12kW7pWOpVsnp2BoTeX+zaAyXOrWA50THVgo6MBXtihzp0Y9vS1wClLboyEvLw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQbRWTFhzG4Ce+GvVHrYGO7wa7W+yuGG/IG2R1Eze/AYsUMLDm
 ie21MNB4pFPu8A6kHPRCYIdQbC7wDg1KAZ8WBO13Lv5L35VLhqUYGaJZohthfBd/gPs=
X-Gm-Gg: ASbGncvgWYCqk6OU87QecAOlamhXJvesiHWXG5+ugGAj8FHVcFtFXJpiX43gek3IlQq
 FO9AlPN9glEDbty3P8cq7CcsAWUWvY0sfbAHZyX+ayPIx7yKtYcntn5UqQ9tGR1+hPclJT9UFsI
 Tih+tXITMSkRhhbWLpHa5oCTr7UcRPGMBfZLVmIgN/g7V5MsZIOtLfYh+OfdIbkyqxzRPNg9BLq
 5pagrIuHuwrz4kbOBGR14waKqNyUP/0fbNiewVVgYACCNrLcYbhhxRmAJHpwm7vK4/v6HOrB6eR
 mYD0f+3VxhYEaGZZSAPlswGUABjCkcZ3jMkUIUtV9P8JdqkO0PWQKPm4a8xFZpAkpi5cQT6fDXm
 9pAiqNzzamhDyt+NgqFmrc8BnNKuY
X-Google-Smtp-Source: AGHT+IGcNjYgg+7jgh4blEMFccFbkJGi6bO3RhLZjRwgFf65PTFPcgmBOAxw+fKWIq8T2MZtB5RgxQ==
X-Received: by 2002:a05:6000:647:b0:3e7:1f63:6e7d with SMTP id
 ffacd0b85a97d-3e71f6373admr13288055f8f.45.1757491678234; 
 Wed, 10 Sep 2025 01:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 01:07:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:43 +0200
MIME-Version: 1.0
Message-Id: <20250910-qcom-sa8255p-emac-v1-6-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QXDtZJBSeiuTqR9NRW8KT3qs59BPygxIGrInXJc2Y/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNSoutMu84csaXFAxK6JnDf6fEo4asszTGJ
 FRKVbeAlzmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 cpjoEACYKIZtA23uWtKTc0XoGqp/fP7cMOcYG5mSWp8fvqyIw8kXSHByC0xxlZe/srDOLERBEhF
 yKU25p1oPHRtZisFB6RsQcgiszzHbZ/kjL5ZRQciJETi0moEBIkrsOkFx1dRwgaaFrHpNfD8rPq
 4mcf0j8xD+yssUJneaB2FANeiklmrp2PTZncMYKfnD88RJS8KO8HzgN01+puQGPd1wD3puGSv3O
 oyFQnvcFb5ssK/QShi0JKNtrDKc1o1hneQjoNNj+OzspZ+p/f9NccvKCcR8qFUVe9Cv23ck7zxt
 uRi5UD5z8ip/JF/bOigUNvgvdWCpsCeKjrkC88txKlACsUHMtkfFBq+I3JgQjvKNdNPeLt2fNgN
 G6OkHIMX8T/7c1Ug9r33lfRReohcPlk8bMXGu7CuwD4vXovzQ/sc/wc0XZwghe+DxyTzbrmh37J
 dJTS3HQ/Ih9OfatUUGz2P48FROomMfLD2cTYSnG+6dYnAm9DuKhmTWttLmzoh+6+RmRTLQLEa7n
 maqZU+srgHub5I++RBm/Hp7aHq7g9HR8hZipyCcFWMJFMO79boC6n21fShmqupy16Q73Wt9+Id6
 0oNsysqQ49Z9GLt/+wOZZEtHMME19WePfEu2TDmoXNy2HgWqPckjl7cA91nLzXqr22srgpwrtuR
 An7Ylq9J9Xb5RrA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5..d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,15 +95,19 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -297,7 +301,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
@@ -319,8 +322,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -787,11 +795,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -839,6 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -846,7 +859,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
