Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF8C0F05B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 16:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECF7EC6048C;
	Mon, 27 Oct 2025 15:45:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FFC4C6048B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:45:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-475dc0ed8aeso22057275e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579905; x=1762184705;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
 b=pGxUFth56trhmmAbYS+wEOXoH2hdsYc0dC3mQJhlAKuKP2TZeh3lh3ZCQretqqjP+e
 z9Z2vL6IwUkZu5OlU+38gFDkttGegcwxvCQWfGqUQ1E+OaGNPTOpSAJkNNdLKDTG0hyY
 ickm4TDSh56zGyjqUQD6/4WMNyTYt8mlWsD32pXyNuUULYiRlXvSeihpeNi+tJywtYOI
 dqCd5oyP9xYMcXebQvdv64+UnK15G5sK7K8J6xyRiR745jYU52B7nJfxQ0JPO+AO4d0R
 6zYXBO7oPo3lwwva9jqg0TDridArqg+czDPbx74h8vN67Ya4VEN7suP3L3iMs2I8qjk4
 jkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761579905; x=1762184705;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPXw61XXVZPE5iGSa5+dbW4T5B5jPT8r8QbZD1R689Y=;
 b=GCwl5gsS7Qb8Jb+/Ujb6oqnvvWM4kAm3GzJAfn6pUwT49YgngIoGBVpb+WSvXViT+Y
 7dVHN9lPeAVwZiMxAy9FCSGqXJC8Jz0uVR05MwTb5WDPJ9etBuxcpwT+mY2bPWuP4CtB
 gOqSaNBMAQcirJCVN6fZVpL11xGX9O69dgqMHpoZ3hrMH0Y8p8XCdR9z7bOzlC7J1oIT
 Tt0f5SJXDtT359wuOOg7XpgOjLXlylRBxiHN0RSVW8eosXS2pEqDsCtVnqqEWYKhzVLB
 NbOwJymdPE8dQCeDY1ZMFiGn5FDFOYbD9vOXYNTvZ+/oQfG5LC2FhPwyJIo5tLhzXN8B
 yKrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC1oRXiyBQEPFPHE9DNRdM3wIFPVwCgFKFcd1/MBA4BYedE2pD4lNwEfaNiOfDqVvOuB9r2J3I2gqtCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxAXUZisqJCUASihRSiXs4LgusDVT5jc4nej4HI82GEtojZprd
 mvHE7f2sxK3XD7fAOtpYoHASiYxa6BGTwlSCFEmphHotTEgxR06lF54IK80djm6MEEU=
X-Gm-Gg: ASbGncvM90/0I6Fq8qxR1vIZaZ4wMPGBt5Hn9hjmzzac4LULl3yeyFJAiBkC+gyUryM
 YmmDDiWxovNJORgIuCWpUZ/z4E9i4ZQBoV5mho2mihELZ8LpPp7EPxohzeEwT7OqG+jUZ2OkizQ
 NbOXrvA5kP3lNREezQL0CcL7eexeL0DTLztrHShzp7KbUAOBLQ6HATZ7L+fA6E2z2QgR7P651aq
 TUU7UsvrZ/k6HiGx3DckL5C0WvdjCZK2h3fQ4AffoHg4ednKSKAoq2bewsVSSs7IBPQ3Q9gxGXm
 BwmS5RYrbBK+yueyMKru4Tsfd4eSBDX0sTLIcTZFsSwxdTHxkyJLmWEIoRMlTtVj93UaOKI8yJs
 Ws9twBsSM1OBoLJ5BmGNLgkAI2XnrkxdbeYDBW+OXWzgw5zEJKbADluqiLD7hMbeX67K3zp8lkK
 1CwsP6ow==
X-Google-Smtp-Source: AGHT+IEGeaS0+QG2Aha1NgT9BPrRrz4NonOWyil4rVeyKXTgBzuqvDLGB5Q4ZzRtF1NNuDSXdfB8XA==
X-Received: by 2002:a05:600c:45c7:b0:471:747:2116 with SMTP id
 5b1f17b1804b1-47717e62ebdmr726945e9.41.1761579905524; 
 Mon, 27 Oct 2025 08:45:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:45:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:50 +0100
MIME-Version: 1.0
Message-Id: <20251027-qcom-sa8255p-emac-v3-2-75767b9230ab@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vnoFLVrcb6l7nKIGlK4OOB/YGlbBMeK7LkpWKpc+pc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N7HQYH3vFxPerzcQsvDYeZugsZRuhl7VhVy
 2Quu9L5hP6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TewAKCRARpy6gFHHX
 csb+D/4hfQLnbDWWeEYALfZLjfvHcxj8QC1o1ijyYS0DGDMJ3ieET7R5s5vFXLyeidjo2LB6Tkh
 8xuNaYYnOMXK012RnFUcfWsqh9VA6dULq/Jec7Icz2SLCkvhUoOz1ECVU8P7/1HgscqZhmPhOrA
 OAVF7sMh5tRhWVl9KR89qFqaOsx3xtcKj1Irh465tlUbN0zClc5WMgPgXvHthIRPi0mT7evAzul
 0BFb8/NM0urZ3Ltl0bA7WAnBBi7dQFlTXlebiWRHr9tRKb1lRD3yOq+JZBOdi6YGlBRX7lPU9qh
 toxfr8G9uzCoO74mRZa3B4nfcbC3XPCMc5ElZCyAizNPH8G9poSOjBCbTIqCtm3liPTitgcCX9K
 Wato94CMw/zKGgD1iH7/PXuT9dUx9nVhoKh4HihhNHyhIFhdXusnBLB6Ef6t0UwNF6lxxZbmbG0
 sbFuan/mab3AyWEcHTXgY0kQWr61TRd61v7YFITF6W9l0sfwuHXbcDKUR8LRrP3dd4pr4IsNNwd
 a58xY/CshZ5B6P6t4DUaz27fECD5yhDvH1034dCAf5VZCUSjfXtpsLy/nyoaZsZXDJsYSQARDry
 sMsM1CFH/f6CYRh1vjyNCQgrB0KaYJGp7Iwc31evTSdVWgJzwY4Ou/YG7ueRtt4DzQU4AZaAjgA
 sickoFDA15UyOgg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/8] net: stmmac: qcom-ethqos: use generic
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
index 716daa51df7e50e401e2c2ca305055dc52897793..d27733b8a05a393ce356543c799da18a6d9b9083 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -134,7 +134,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d1e48b524d7a964f229e2bf28e7a316325726193..b24134923fdff0de8b608c140dfb8ffaccd19303 100644
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
@@ -762,7 +762,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -813,7 +812,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -850,9 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
