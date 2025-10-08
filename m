Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E8BC3C73
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADA8BC2902A;
	Wed,  8 Oct 2025 08:18:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06989C28770
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so76051075e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911484; x=1760516284;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ul8GBU+O+XdLER6XCbhZBXCxZuiNlzEAtMGpu/p1y6Q=;
 b=Z6z2RNBmFGxE4NAU6OSK0M0Ma3uGmnjIJ2a9QORSdpcrL/rZb3L6PlQWzRl/4XlIUq
 nEBvRuC50jjSXB2oFLlgz3AQEl+WteH1QvozpQZFpSXZ/dplNb/aR+ShpGFzSttiuEcF
 JnJGMxdrkvklQ8SI6u/KPygPf+H357aR4KuUYwWnhcsk+Wg7pwZZw7v2ebKvPwa3RjUh
 IDofuZj1CiK6W3j9jbVvsmT9mTLq/25TYK/Wj/3PYjAkqAYTfEYSCDN8q80iTNsVSINB
 qB3THO5coQNHBq+09dK1J+QQ8XDLfpek54dsPM8/BfB780CMmRcDnXCR83NPA/0sRUI7
 9R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911484; x=1760516284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ul8GBU+O+XdLER6XCbhZBXCxZuiNlzEAtMGpu/p1y6Q=;
 b=AdApR9rQanhQBponiQsKiy+AkRuYmm1vEWT30b59qfEKuHPCdo5COP271/vTeP2XSv
 m9Y6vCoOXRtaOrTHuJZRYmOvc0Nw24RF+nK5Kwz0IUNLoiymHMXlP3/zWNRJsEbSQOAT
 /JxaV96lPsrBBEwiCM0IZX3839TsSceV8NmuWsxTB/PVKATsU5MziSOPF13Rqgr1qBGR
 bTflemq0LyLwNf2Im4jWnrYnFmavq6cX/IyRRQqN4bKs3R8mPlbnu1DjGUddE3oTUqxT
 qeJoiYKGAFri1jnq44lyCZI2Id5blyd/aOD2iLiUcuIddJFTG8+VzNTIuO/fZ88vX1RE
 YPVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBaB0Fg/5k7u/oc5qj4Su99DivrZCTNbBfaQW6KArWIwRxTo3Ooolvmx98dNm/shCqNE6C9Db90hA+7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiY5vPdpFVrgNm+iDxHP038RvtqdYNx0yk1x90S5HXpN1A8qze
 c7M8CCqTpZGWcNiSNz8x1J8+X+GLZPEOCaqwJBQ2fqupDSWoYVzjd6SN1i5WBHlfbR8=
X-Gm-Gg: ASbGnctYc1vPYlf8+EGJFpdTioERFp9zwX05vUAPb9k5722w88hz4qbrZuzc6wRWlDF
 MGh92EmYMYAJoVOCGytcpDFgf8eQ4xxPhoHicnnfb4fptZnBjuON3011ajScJhNc1kQQBk3x+nj
 PwVm9GeYRCpSL6wFT0NqSJv72mO1RTQOOSN8QBf+gSKSbv9F+JXRomkvqm8NfGENXVrMgOiC5Wm
 BFrqmZBAZmYLivjhS8yZI9T645Eocf/Pwk8DkxC4EJ/HK28R3ZiT68dXagVWZcaTo9JB3DaLags
 SBzX+HtrG9yMjYWw0rCTODBzul1mmdEpG81nhLhgFbLmLCpByCmSG2ePHAH15DjpH7vcdmn53u/
 pZiTfDP1t7DjFa5oF/HRCv/XktUXCWGZN1qgpbd8ngX5xLBdNcTxy
X-Google-Smtp-Source: AGHT+IE6ZMyLcsBN0V50RlzjIFoIQLk9iOg6oRiNR5JvPii+uUuTFdHwXGEV0hlJlVRQnaGtVLEXhw==
X-Received: by 2002:a05:6000:60f:b0:425:7589:2737 with SMTP id
 ffacd0b85a97d-4266e8d8e67mr1317470f8f.43.1759911484416; 
 Wed, 08 Oct 2025 01:18:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:49 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-2-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=D247/I9k9+jdDafl4QuGSA0//M+k597SsL92RQwFhvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h413esbXqnjuND12yudzI6EY/1g9lJi/uRCy
 Uuv9fCwSSOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 cpxRD/9UQQ6GsDEhCf2230he2y8bhcrw003wd+e+aOxvP1HQjx2HrvP/Zh1enLCAxqMlTE4Ipiq
 c+UtF6BPiuYKaa62kQx3y8twflIjh1bFOgQCKz0b8Kps5yLsS7lZwX1dSRrIvMCWPxrXJtqXWvx
 HNlULSdJR8x9p8IXMGHCG5rEOSi6Mgo9FsIq0rqbVBwUeX06kOe7pA2ssdvbr44P5KecfrBfnwK
 a6/o5AK8MjJZjOLhhyzuigM92jp4W/KA/qFSEgdRcOP9mSlCaRvV5F0Ibraq6o8b8UZGPWo6HQs
 N11vvaBgINRZNs155aKWFaBuUYy9WM+GJ9+gp8PtR9GGZ/cCVnyar2uf+ZyUemeaa75LyHTuqCZ
 BfuXXMZdAxRjPRtMqdz+nd/RHj/S7/0PCafuZj/nWKgKOTBTFDZvj5UlWbGpHugfFbBcqB9OP5w
 IeemlR06TcuY1gdnoz7/WzHAnC5K8ELWdnDyB+7SU9+S3M0ViN23lM3k/xzPL2sOGQWpPzMi5Py
 rx9bsW3PeEHqilRbhNJ/9AplrkCZwL6BuYoXS3FrGwy1etNxuHiZolqfer5Vg5O2ygobzIdlUus
 qVJQusAqdj1Man4KZInD244TGspt8J5sVbVbs7DkDIQjueXTsaHiO0+OVRoK1yx9pnFfWxVj6cG
 M/aKIqen9XWrJOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/8] net: stmmac: qcom-ethqos: use generic
 device properties
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 9507131875b2ca05fedcab95a3bb4c7f8e8810fc..7734acc6f1dd669ffec622812f48d355c507fc32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -125,7 +125,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced76cbe198f3d3443084daee151b04..aa4715bc0b3e7ebb8534f6456c29991d2ab3f917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -764,7 +764,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -815,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -852,9 +851,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
