Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95C762C69
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B909CC6B459;
	Wed, 26 Jul 2023 07:03:33 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 505FFC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:32 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b74209fb60so93233261fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355011; x=1690959811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkfcJ6m4rMM+iyxRVIwvcMlF3hObn2JrNhl7UUZvcR8=;
 b=ovI7chw5qWg3NSsekWG+uefx619yR7xOgr2xvKsTvSgEz0QYgfZP2WBG9cNErcf0uu
 pWRMK/btYC/u+awhud4hNRW17nfQ7zpVaPsdqfYj50K8qWElHMSxpViotFrXCdGKazKZ
 OJcyghDNf77a1xJWN8aIp+/mzOd5jGpHFmFdg2dIlD6GtMDfMgXbHokt7WsK9cJbSjVt
 KXHbhFrCCf2RGu8G7w7x24OjFjDDAU15G2k/VR/EI1dx5iJZda1FBT7D4Mba2yWVrkNM
 uoW9Mqz2pukz52dzOcY6a4Qt9+tBLjEUtNnrgKuPxqIh7RjwTx0q2Qw0UGs3gX8zwWow
 xe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355011; x=1690959811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkfcJ6m4rMM+iyxRVIwvcMlF3hObn2JrNhl7UUZvcR8=;
 b=SZPVzjt3dvlm/rp8sNE4moAom+/ImmHv5MKcHao6A8QpYFmjSmqKLclcB8o0FBn92j
 nHxkuViL4+8YSy/JJ+6OJPedXBKWUHRUhajF7cT5GeEKQEVSqDGmqd6GqdF3h5wobONU
 W8faba4e1x3vFw3LCV/SuaTErnEKJlNBqwYMnFiLDl6J9vH83qR/OGjEqi3w4bQtuVMH
 4KwQNzyH3DAv0xB2ona94qiFk3ZRPkhSdr8v/vYKvMLDhRvlk+WxY++xI5GW7wQT0a5G
 9mdy3VJQLUKVlhz3dIQo4yHfDVzhE9icEvLl3tM/sEvO7koT9/rLXHvVlAgtfG3IEpCw
 HQfw==
X-Gm-Message-State: ABy/qLZJPg1y5O3tZRF1vn2HVcVludR+4vJobSZc0Afr0/RK4Mks12Ke
 2VKl9R6ou+z2grotugt101ObFA==
X-Google-Smtp-Source: APBJJlEufPD2DcGYOU9R7Qm5kXmjp7K+eCgVpmZDKR2Uy3XPSFXWKnNqNHFEpagOzQm0KLH1eS4vMA==
X-Received: by 2002:ac2:4564:0:b0:4fe:d0f:1f1e with SMTP id
 k4-20020ac24564000000b004fe0d0f1f1emr635349lfm.25.1690355011565; 
 Wed, 26 Jul 2023 00:03:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:31 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 09:03:17 +0200
Message-Id: <20230726070322.103871-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/8] AMR: dts: imx28-m28evk: populate fixed
	regulators
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

Fixed regulators put under "regulators" node will not be populated,
unless simple-bus or something similar is used.  Drop the "regulators"
wrapper node to fix this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts | 45 ++++++++++------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
index e350d57a4cec..6bf26f386a5e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
@@ -18,33 +18,28 @@ backlight {
 		default-brightness-level = <6>;
 	};
 
-	regulators {
-		reg_vddio_sd0: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "vddio-sd0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio3 28 0>;
-		};
+	reg_vddio_sd0: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-sd0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 28 0>;
+	};
 
-		reg_usb0_vbus: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "usb0_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 12 0>;
-		};
+	reg_usb0_vbus: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb0_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 12 0>;
+	};
 
-		reg_usb1_vbus: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "usb1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 13 0>;
-		};
+	reg_usb1_vbus: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 13 0>;
 	};
 
 	sound {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
