Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1291762C68
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60751C6B459;
	Wed, 26 Jul 2023 07:03:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D292BC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so10073364e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355009; x=1690959809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2Us6IanwbA8lyT4wscmTLO3lQgiVOsW82AXUR4/W/0=;
 b=h5a5Ac1hn8yggKYHnK0Ea0eq0sPlb0SCDzSmrBp2f1YkY39I4d5iuPFKYZDggVzmhw
 tRdsB2RybIlv1yX+vFOEp6FMs+Nmac5eSk1vQ4HSmNfi7F4NrCR+Sx7QRDSI3XDFO5Cf
 A2JPP93OYXqCYc0LSPyrk+IQ4NxwkZ5BTRe4sZICG4NxHMpNfeMWxG7d7rT4dynch80N
 6VjoXYkMCvVIzptdNWnEtjhpxPmLw8f4ml026vm+AwclOlibqoIMDR9RaU7nVGYQWZB3
 tUFYdGrSc0WQ61omIutYCvbegm8uOpBU77MzPYGqynZmWa8/TPX/PbnAQ2EqvnAd6xbx
 rrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355009; x=1690959809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2Us6IanwbA8lyT4wscmTLO3lQgiVOsW82AXUR4/W/0=;
 b=ZslJebLsn/Xa8+IMyZiGGMZtgvSxqdZuhjE/RPv3RtPPJw/udUnVdV8SEN/82h3dCu
 QZHaD+dgPSHkD4rLcF4fIJZzbXh5jhsJDCoqD7cQB57OuuxqG+8nt2WwiQY3sRNEAPiW
 SAbo33dWRT5lggqvSmmiQo14FUCH+C2dK6sTTrqPEAsgxD5qkBhTvOm5YE/n7YwJtdb0
 k6JPkJrOELkOieKTC2FGKme6R/1/s/ma7Y9RrlFy2seVwB4GZyKbLORPFaYUqpOgSfIn
 P4xWttj0PcX4YAouZQAnh+17jj81dj1PWr6FqZBXv+EsrKCl0o9Yp+Rpxt/mg6KIi2Ks
 pQHA==
X-Gm-Message-State: ABy/qLYIb7c7XlWgGFZKk57cYO6bro+oPDjjTR9U5K5E/A6yRPvmqMT6
 1+MZ1/xA68lhRhvMk0pwHr2X/Q==
X-Google-Smtp-Source: APBJJlG4uqDx0Nzj3xqvM/cGrQVm3JUntsakohrvMYir78Hup05JTdxpG9dbBpUL8/aRfXCsc4mgvQ==
X-Received: by 2002:a05:6512:4006:b0:4f8:5d94:2e46 with SMTP id
 br6-20020a056512400600b004f85d942e46mr790257lfb.48.1690355009306; 
 Wed, 26 Jul 2023 00:03:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:16 +0200
Message-Id: <20230726070322.103871-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/8] AMR: dts: imx6ull-colibri: drop incorrect
	regulator regulator-type
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

regulator-fixed-clock does not take "regulator-type" property:

  imx6ull-colibri-iris-v2.dtb: regulator-eth-phy: Unevaluated properties are not allowed ('regulator-type' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index fde8a19aac0f..ec3c1e7301f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -102,7 +102,6 @@ reg_eth_phy: regulator-eth-phy {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "+V3.3_ETH";
-		regulator-type = "voltage";
 		vin-supply = <&reg_module_3v3>;
 		clocks = <&clks IMX6UL_CLK_ENET2_REF_125M>;
 		startup-delay-us = <150000>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
