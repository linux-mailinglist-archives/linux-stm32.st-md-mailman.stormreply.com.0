Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAE846F7F
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 12:53:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C03FC71281;
	Fri,  2 Feb 2024 11:53:47 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 310F5C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 11:53:46 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a372a3773a5so6798366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 03:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706874825; x=1707479625;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=chFACr7MR9Ie62Cl4HcGIVhOuYwWzPk1OTqyFmMkvt8=;
 b=AtgCpJjJEVXf++wizlWdqrPw+Ch4ngINHc8W7g6Kjr8sKWh5GscNkXjnzaIrxLqeUt
 uSthwcPGb9m5EQgm6hmNoWf7k5aBNaoyP1C04olj+il8+hb4OoB4M3cb76FjUvbnU8Y/
 H2J6gpFbGCLWKMX28PfeDnSYG/gUY3DUCOHnKAB+NAhYwXx5jOGhNCTkp4koK18qQ/Zu
 CU3YYNtjmTYuopPrxd7l5ShDz/8LYDTDjTzWWBb1JAiTSTdPYBFx6TYuIzic96IhaxwG
 YyawkJOFTE2B4PC5Izf12PMHXcHmNqvU2uYDaBThTKnlJuAOxBS12CvBtvtiAhyr0fxq
 gNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706874825; x=1707479625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=chFACr7MR9Ie62Cl4HcGIVhOuYwWzPk1OTqyFmMkvt8=;
 b=Rtcop+6OulJkvoL1NnoH6ud8XQBwjEdLVUAkStkv7rETMKZ3BGm3fozCwG959i52DZ
 eqmggvIWX7xbYkBdFl8IEelD2Ss0jW19WrD0XiJMGZFhb5FYRtKvAz8H2ROUaoaJNJR+
 +K0tTfq5/GA4/SzWeqx5mrSUJD5+38e8O8G2lpPfi5PRTc+vUdksQAxt7zqIs+aOZL1G
 sMz85w0rb4ievja6YJo9l3TdJw723az3iSaFjiN9l3gzOKuEItnbCxJQjxJwC7KO14E0
 fJ+RJt+mATgkeO1wNLbyUeXKB9Go9CaIn7QNB+UCoqrwWxlvuqlJW1DMnWrJ4qq9u/a4
 g0kQ==
X-Gm-Message-State: AOJu0Yych6Di7Og9Mf84qqVBHSALCrk5cnEm13VYgrmaPWJqTuj0WL+f
 9M9H53nKknmPqMQI1j6u8AvbYlw8pmoWwnIfYCCfk0pb0iZnyJYVqxniZ22u
X-Google-Smtp-Source: AGHT+IHgtPzxTgoWrYPdI6bSC46SDoDHkACBArBJBC158JhVNR8Gu9N5AjN6Ac16iWkOsYHeHE+7ww==
X-Received: by 2002:a17:907:50a2:b0:a36:7221:17d7 with SMTP id
 fv34-20020a17090750a200b00a36722117d7mr1131287ejc.71.1706874824718; 
 Fri, 02 Feb 2024 03:53:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUipqeGvpmM6cBlznRrnIPe10oqX6eYFUFtHNcTD8MNcCcei0Sr/r+MQGTQhjOx1me/YO+wp7gEKBwrLgThP7NwImwcXXABiOCTG0l7HepnqDq49aCXYL8SyjT30vJzyeWb0wu/txKjM8lcgWMf1YQ7eY/RMoferJp0iU2Wud+Aruc27pCgghrGsrbuL4B7mvAHYeezof6/cD6JatJ9u5aqWJKBCC/OtijgIcpCP+V6nZqIYoQsVp+SYiARtiPq2ls3EO/kq1MINFRf43lXxl2TZ8XtGJo2dC3TkPVxtPcB9QByEvhhdzZd7JY/z/hVd1vEMOiaiB9DflleDJP6lxqUylsjkA+oNO5HRzi7FuELFm4nuGjKn9k1/WGOa4g=
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 tk12-20020a170907c28c00b00a30e1f233b4sm802616ejc.128.2024.02.02.03.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:53:43 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 02 Feb 2024 12:53:33 +0100
MIME-Version: 1.0
Message-Id: <20240202-stmmac-axi-config-v2-1-64eab2bab17b@nvidia.com>
References: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
In-Reply-To: <20240202-stmmac-axi-config-v2-0-64eab2bab17b@nvidia.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=18284; i=treding@nvidia.com;
 h=from:subject:message-id; bh=e7/uMoSOaGFi5mNdwNBbxthZcHFbcUycw0rVS5PjeR0=;
 b=owEBbQKS/ZANAwAIAd0jrNd/PrOhAcsmYgBlvNfFZ/Bw513RAb+TVtB5Q14wluvkt7Ei9MfN6
 rkKs/65zlOJAjMEAAEIAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCZbzXxQAKCRDdI6zXfz6z
 oeCGEACwOA16bU5AIcKVjgwyCDvPx1cu12NVQcLMsbEQXUtukjjNhw419UJxMZ0LS58e/m/ThPv
 vccRFXk+Pps7hidE5Edbptfc1EYxlkPQCXTMtdnFHZWLKiPF9scbg0VC1zGBgtHP105p+3r2vXf
 RzRee18Hmhj8MWFzQNKS1419eZnNLAurnREhFyHSHW6x+IO8LIBMqY7dPA44XyALgxoHnOm66/9
 FyXRveSUQfd+GxFcln3GnHRuDCOT8ugOmwycJ/+CsaSjp0iCbwcDKyum+y/MvUr6V4id+s04E18
 uVvXVtaB1bP3Pyb+bmfN8JBD4Nxb08BvjgL/P97UApgICdAt8yKBB49mHKkS8o1bfgTDbK5Z5Md
 Lr9IQhqyM3qFDSFPh4yR4qr0BS5roYp10QPhh09Jgzpkaq7MrHWOSLsnYxe79PW9ZasMiNSJUwL
 t6rlSZbKAgkce3BSYmakx3M6xF+/PqXegFcfmKApVKN1+zeJX1bPw0/R+9YLiB95ffRCZWytGzP
 cg01Cz73vdoOgvWpyuzmVJFZYhIjcdG7qk8zs7N9Eh+rxfPvcNt4lFPjjYT5V0Nb6hEkECYr02P
 lahoeRIhhdqMwHSkPBlKYAiPuSmXohbLoDF7AzCQZ2nudW1WlBgYVa8FEQTwLCty2M+/oFVKJfr
 dUVbhiJR0oAjdOQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
Cc: linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac: Pass resources
 to DT parsing code
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

From: Thierry Reding <treding@nvidia.com>

We already pass the stmmac_resources structure to other initialization
functions since it allows us to exchange more data between the driver
and those functions. Passing this structure to the DT parsing code makes
it easier to extend what we pass around in the future.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix bisectability
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 19 +++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h |  3 ++-
 24 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index 643ee6d8d4dd..f37d9912380b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -115,7 +115,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(gmac))
 		return PTR_ERR(gmac);
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index ec924c6c76c6..36ef2ed9fd2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -435,7 +435,7 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(stmmac_res.addr))
 		return PTR_ERR(stmmac_res.addr);
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 598eff926815..98a00084807b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -27,7 +27,7 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 		return ret;
 
 	if (pdev->dev.of_node) {
-		plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+		plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 		if (IS_ERR(plat_dat)) {
 			dev_err(&pdev->dev, "dt configuration failed\n");
 			return PTR_ERR(plat_dat);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 6b65420e11b5..d72b9d8ac464 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -331,7 +331,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 19c93b998fb3..de2f5d7e95b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -241,7 +241,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d68f0c4e7835..79582983c060 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -84,7 +84,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat)) {
 		dev_err(&pdev->dev, "dt configuration failed\n");
 		return PTR_ERR(plat_dat);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 281687d7083b..311410509012 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -384,7 +384,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	if (val)
 		return val;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 3e86810717d3..1ede4f409937 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -169,7 +169,7 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
 				     "dt configuration failed\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 4c810d8f5bea..004bf4d14fdb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -37,7 +37,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 2a9132d6d743..763ec218ff2c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -656,7 +656,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
index a16bfa9089ea..5bd936ef2796 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
@@ -52,7 +52,7 @@ static int meson6_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index b23944aa344e..88db2907640d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -400,7 +400,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 31631e3f89d0..473e8d4228e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -735,7 +735,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to get platform resources\n");
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat)) {
 		return dev_err_probe(dev, PTR_ERR(plat_dat),
 				     "dt configuration failed\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 382e8de1255d..4297a6919c8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1824,7 +1824,7 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 68f85e4605cb..e827e01b4398 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -400,7 +400,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 4e1076faee0c..a0f15fbb8993 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -122,7 +122,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, err,
 				     "failed to get resources\n");
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
 				     "dt configuration failed\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 4445cddc4cbe..5b2cde45dc3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -273,7 +273,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index c92dfc4ecf57..af131b0bf589 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -366,7 +366,7 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 137741b94122..3ccf695c8b5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return -EINVAL;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 2653a9f0958c..f78e244b9d81 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -108,7 +108,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index 362f85136c3e..bab57d1675df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -284,7 +284,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_clks;
 
-	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
+	plat = devm_stmmac_probe_config_dt(pdev, &res);
 	if (IS_ERR(plat)) {
 		err = PTR_ERR(plat);
 		goto disable_clks;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index a5a5cfa989c6..f99d147b3424 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -220,7 +220,7 @@ static int visconti_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, &stmmac_res);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 70eadc83ca68..650ec8d2f5d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -424,13 +424,14 @@ static void stmmac_remove_config_dt(struct platform_device *pdev,
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
- * @mac: MAC address to use
+ * @res: driver-specific parameters
  * Description:
  * this function is to read the driver parameters from device-tree and
  * set some private fields that will be used by the main at runtime.
  */
 static struct plat_stmmacenet_data *
-stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
+stmmac_probe_config_dt(struct platform_device *pdev,
+		       struct stmmac_resources *res)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat;
@@ -443,12 +444,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (!plat)
 		return ERR_PTR(-ENOMEM);
 
-	rc = of_get_mac_address(np, mac);
+	rc = of_get_mac_address(np, res->mac);
 	if (rc) {
 		if (rc == -EPROBE_DEFER)
 			return ERR_PTR(rc);
 
-		eth_zero_addr(mac);
+		eth_zero_addr(res->mac);
 	}
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
@@ -677,17 +678,18 @@ static void devm_stmmac_remove_config_dt(void *data)
 /**
  * devm_stmmac_probe_config_dt
  * @pdev: platform_device structure
- * @mac: MAC address to use
+ * @res: driver-specific parameters
  * Description: Devres variant of stmmac_probe_config_dt(). Does not require
  * the user to call stmmac_remove_config_dt() at driver detach.
  */
 struct plat_stmmacenet_data *
-devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
+devm_stmmac_probe_config_dt(struct platform_device *pdev,
+			    struct stmmac_resources *res)
 {
 	struct plat_stmmacenet_data *plat;
 	int ret;
 
-	plat = stmmac_probe_config_dt(pdev, mac);
+	plat = stmmac_probe_config_dt(pdev, res);
 	if (IS_ERR(plat))
 		return plat;
 
@@ -700,7 +702,8 @@ devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 }
 #else
 struct plat_stmmacenet_data *
-devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
+devm_stmmac_probe_config_dt(struct platform_device *pdev,
+			    struct stmmac_resources *res)
 {
 	return ERR_PTR(-EINVAL);
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index bb6fc7e59aed..daf3bbb503a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -12,7 +12,8 @@
 #include "stmmac.h"
 
 struct plat_stmmacenet_data *
-devm_stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac);
+devm_stmmac_probe_config_dt(struct platform_device *pdev,
+			    struct stmmac_resources *res);
 
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
