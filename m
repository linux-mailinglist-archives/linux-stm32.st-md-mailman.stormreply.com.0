Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F8C0F066
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D85BC60492;
	Mon, 27 Oct 2025 15:45:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A4AC6048D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47112a73785so30946695e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579911; x=1762184711;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gbnM+7JUoQu99psJVRjfGTzLa9V8XPsbrju+vMCFuVM=;
 b=BGw7bQx+PaHjL53a1GxjAXQVRJWlbEssTophzGes9pTk+IWwVczN2Vc0S9uEAoX4d+
 s6sui1gFgXZ62Hp0brHmEeN72Ht9+Yj80lrdYT298eriQCkzx6r8LmBscIQVk5I5N4P/
 j99+xap4ULFMSuQ6rO3ubZLVcBdVkNtjG0i2toJlkqJ4d3v0deJkiQA4iwPCcTzS2Qet
 Xt1sqgg/A3JrQoE1N21nenjk5yf4/9cUIttOOaKxTDD1Gf63xv2fzf8q9vb1GnaLovAJ
 CW/LCrse3f0KHUGO3qdHvUPygDkMnsn+1JR1lRzZK34S+u+rbrXV4FZ5clEeJn2sVuHD
 oXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579911; x=1762184711;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gbnM+7JUoQu99psJVRjfGTzLa9V8XPsbrju+vMCFuVM=;
 b=FwiSF9oAnmiyWOGQfrhjfg6MNeoahN6ut06o+PdXhXNDHudJ7kNybCOo8FbxE+DQfO
 LNJcWJfm0Vz/vz7TJ3YszvGWYzayA6AVP6uUBk+zwHB2RXNFikwWP44AlDX0G5nZxNaE
 JuVxAvNtBfd608TGMljxC5aW3efKl76zd1bcGUtr4rVe+rw0ArfhqfUCJaD1dFZ72g3T
 jTRoo89UmDbuppQh/OQtvysLGa25tghCzGBFQAmkBnZsf5AaaHlzlVdMZCkNKlwDo6vN
 j0gksXfvtm2jMN+CXNZlQGfFG8JUM19uBEPTKEuWrChmWU4ZeAPERioC0dDlFNDtut75
 llpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6zsDw0GXY6+xeW6ZB6TYXJY+G1R/HF3N9ZUu+QX7zj0TReVXmLjOqamjgUJeYHu0ZB78usbCK7mkP4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDgM57im3awG94gRPK9L4+/boaTlclEy+aTcsPIiUqj/5w2Dgs
 BiceFY9OwGFIMZX/CwU0QIQbQYmyqW5gOAmL41Efx0X06Wee+zjDZ5nWwJe5f80BupA=
X-Gm-Gg: ASbGncvdwrWJJSAG0x8dPMAhO22thzAOxlunGh+sb3nw7TgW/UyDpUoRyqCor+RNuye
 kNo3OqqyePJAgM9hRPYiZHI5SjmUw7aMEmaSdbxFWGOYiDJ23eAEmX1+RxCgP/h2VaoI4jsZeSJ
 mH46bPvEFQg3DkHFAF7bn/bb1jdO3zf6VFOuyb3T3/Q+AbXe/z95XgT+JjmfTXeQMyF2l5ImiwE
 +mUNIFHI0itub3/7vVUKp1d+YMcRYY2yR/kOtPpDe4q59KsayL1SngRth9/4Z5xoO5A044xrcXz
 glwLvjMS6LN/RSruYxIikjk6elbH//BFRCjCc4ajcJouig8q3HRRmOCgpanbfZGdqj2Dgwv3GNI
 330HsEDrYxpBem2ip6INXV01O/oGI1g3ItsPN84lU9jpv+WjgPhA22Wx1vlgbE9yf1HDe4e3GHo
 tI2TTV6w==
X-Google-Smtp-Source: AGHT+IGvMG3wu3r+IbbZg/5/7mILxDWAzW1LalNld5Mwz0HOjM2EkN8wK4I3r8TzG4x6hIzWvNeibA==
X-Received: by 2002:a05:600c:3154:b0:46e:39e1:fc3c with SMTP id
 5b1f17b1804b1-47717def755mr1118575e9.5.1761579910577; 
 Mon, 27 Oct 2025 08:45:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:53 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-5-75767b9230ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EQbFLUJhBusR5R/WLS2zY6u2a3Qrdavc6CuZtxM8a7Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N732qdepXwjTMMy3gsuitEVbWcrcVZjQoR7
 Zsfgri/RgSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 ckPzD/4iZm89XdVS11zAr9khaNEvnEltpu59g4ozId5XbAMVxDZglviYveiLmqycpJ4ruDOay49
 QW1IHD1qaIiGbhzj398upRiUvk9h/6XjjVtjFG8h/iRWzkg/sduilnVGPPUsHDqZq5Fehm2XRNJ
 +HgergEpmyi871x5T4LIKxW13HzuAECg2FMLBAoNR8hRvM34p/DC5+pdOQeQJj+kJxWrzbeF5Sl
 Qt38NSuIlBYV0vWL9ALsuipnZIMVDXp3eGMjhoAeoFjJJckDGV45yqFswWYUQ9B7C2D4wpCfhGY
 ZIpFGiDQiXFw5LPO+6HxTzXEdPf83Yz9SUwNkld9kCx4+rBCbiTdkTapduBAlehxo0VtIC/DYKl
 WLlXvRpr8IFaKzRidwPY8RLhWPhdZUZtLWno2DWzcbtRDbN8KWVAInmJPv6Hx9EsBjKwUXD0Ts3
 3moUpB+I6nWUjWebMCedX0U/T7KpoehAJyeHSjDOAOSs9vs94pLqQvObv1iUJUpLgks+Vg9y4lB
 GrTebcmkkjB0L7yJEpEsHAJrPI0EKTTWnzowh8DbHTP5+THcTfcEeAEpzM/7OTM8UV+AOeCUfcs
 shy3tH23ZNwVhY/ycIRVx2l7pLj0uuZLC3EbnnRGUcC+eDoXhViB0YFdmI0b/x1IJ/j7JJivvAm
 wxZsoJrM/fwHA3g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/8] net: stmmac: qcom-ethqos: split power
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
index 2739bc00e7525a5913bd3a5d28d9c9a8871fb7cf..7ed07142f67c931cb2c2c0e8806f5a7fbd68945d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,14 +95,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
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
@@ -296,7 +300,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -317,8 +320,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -785,11 +793,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -837,6 +847,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -844,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
