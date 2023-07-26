Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17436762C6D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC26EC6B45A;
	Wed, 26 Jul 2023 07:03:35 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 560D0C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:34 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso10136620e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355013; x=1690959813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1CX68KTNlS373FwdWF/UAKpFV3pcBsBsg1fSNG+Fkfc=;
 b=vnjThvalLQH0gZeIBxJIzOoMx7W8K66THSq8d+a9PnbhXAECqX6QQFEmVUNqh5RhX0
 xtuIXa+Wxi+InwlFdSnmi1iPPWFbBc46n/Hhq8IJDX2PFdyUrisRZJR7y5+DQAOV6KES
 nRGO1HpL0xFHBuQAgKmBGigkjmwbhPy7QyS+LDn5YtqpSdL8rxurRDdRotctHt7FqjRq
 bOsja3t93bf0KxlZ3U7/1/RRo7ZoZYT7OjfKOQbWiLwxZCQWuSm08H5gkQUJQIWah0rp
 1R19878jRCJJqmb34JCwGJLHjWD5NdzS1EZFYIhYVgjyXzFwp/wEMt1Erh/r10EnaCKW
 mGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355013; x=1690959813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1CX68KTNlS373FwdWF/UAKpFV3pcBsBsg1fSNG+Fkfc=;
 b=dllBiK5XcHRhChP0toEsr7Qwzp32OChXaemh5Ha/VGn1P8CoXf/gd35jPotWiygF9X
 r6MNTN92PgeanQBl3iqev+cb9QeU0E4YrQ+cmbhJ2B2t6uTLqGfG+dbcTQxbvdeJPtIH
 yPlBxizF2zOZcQveaWJbOb47U7WjkEd0Y642Nj5ttbj13qpTr0lnyoCySq3UTBmo4fLK
 Dzfp/ltEYC86w7Osc0uBZbiIjciD2xP+pBpJLYyxOPdy2AgdyTNLtDvRnZSvVkPwgyp5
 3wOni1A4ZyOl9HZsjVQr3/o6FMETRhYMai5/rlY47Dh+IdxELqLeqRRc1ZjwDD9AbtlN
 SOpQ==
X-Gm-Message-State: ABy/qLbXVfSTBDoUn/3NpFQr2d5BkOrb/QW30BEPKt1dldfejavZ7v4F
 mtWiaUsRmvjYMUqlAFILCCA3zw==
X-Google-Smtp-Source: APBJJlFWMqrZSd7R434rksbmHZdzfMht3VzmZAjhddWpsJvotnhmve2a41K+HTjtylzz7YkKhHjUkg==
X-Received: by 2002:a19:6447:0:b0:4fb:52f1:9ab4 with SMTP id
 b7-20020a196447000000b004fb52f19ab4mr702858lfj.50.1690355013734; 
 Wed, 26 Jul 2023 00:03:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 dy16-20020a05640231f000b005224f840130sm1572003edb.60.2023.07.26.00.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:33 -0700 (PDT)
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
Date: Wed, 26 Jul 2023 09:03:18 +0200
Message-Id: <20230726070322.103871-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
References: <20230726070322.103871-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/8] AMR: dts: imx50-kobo-aura: switch to
	enable-gpios
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

The recommended name for enable GPIOs property in regulator-gpio is
"enable-gpios".  This is also required by bindings:

  imx50-kobo-aura.dtb: gpio-regulator: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index 467db6b4ed7f..b1a6a9c58ac3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -73,7 +73,7 @@ sd2_vmmc: gpio-regulator {
 		states = <3300000 0>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		enable-gpio = <&gpio4 12 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
 	};
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
