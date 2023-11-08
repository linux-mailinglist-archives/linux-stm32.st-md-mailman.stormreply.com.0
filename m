Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDC7E5812
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Nov 2023 14:44:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5888C6B44D;
	Wed,  8 Nov 2023 13:44:42 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30A33C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 13:44:41 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id
 a640c23a62f3a-9d10f94f70bso1050015066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Nov 2023 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699451080; x=1700055880;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IVv5mcW5zUgVSiSOauQHcHZhJPg5UCLoWJRDvmkhj7k=;
 b=GzSOY7MShxHpSuwLifq6gl04WltAJz0XINE33R9Z3F908Z3UUz/WA6tY+36RsE29zP
 0lcbJ0jRFyGK2QaZBVwEm3QqZ9E8VLlOIko0L0XqO2qVpHpkZdWi0aZfRqvErykzgEMv
 +/qWLfEliZE5ANPLu2q2Zsw65CyfLtSfRDd2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699451080; x=1700055880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IVv5mcW5zUgVSiSOauQHcHZhJPg5UCLoWJRDvmkhj7k=;
 b=XlmhNBdYbUD1DKOmV9fpmWqbon9dV07/cPEjTAKI69mV80DFcrqcCvHXG57KMPCd3y
 sxrCwrRxc583sr4rXmN7iJmtZXmaGthEW/3kgysUoGMCZ+gJ41bKK+My1MRcuIlV2SM0
 UYF6u//GgkLJDjL+7DiSH++HvjD1lZkfuNzhnZflK0OqROcp0vvdGAGDQQFNclsRmw6W
 sVdYNnZKQISwC88sTPdpAoMpvnBtj4YYYZlqYlQ2Uks/iu2lRNh8B7lHmI0cViZTAqbf
 OrgfMAUaX89pgMQhZoacexfGu9ra9AaSs5Gl4YI1mN8vFv6Xh9q07c0h8+eZzPwOQo9f
 qTFQ==
X-Gm-Message-State: AOJu0YxhcQXkYFQCNbFnKiwrYyqJSZXcz5Uwja0dqVAgLiIUK6MR7gAD
 sXkOzoCfJoGvrKpA5edDeDaVCA==
X-Google-Smtp-Source: AGHT+IEn/7ehRYp2n2E4vkCWEuoVxQ7nZKTWTIBc8HV+mV3MsZL6jh3kxXkuRcD9ZyWoygMo5iN7MA==
X-Received: by 2002:a17:907:987:b0:9e0:4910:1649 with SMTP id
 bf7-20020a170907098700b009e049101649mr1775121ejc.8.1699451080611; 
 Wed, 08 Nov 2023 05:44:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 kj3-20020a170907764300b009bf7a4d591csm1091457ejc.11.2023.11.08.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 05:44:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  8 Nov 2023 14:44:06 +0100
Message-ID: <20231108134426.4174699-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH] ARM: dts: stm32f469-disco: use the
	same 3v3 for SD and DSI nodes
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

In the board schematic, the power supply for the SD card is the same 3.3
volts used to power the LCD panel and other peripherals. By generalizing
the name of the voltage regulator, it simplifies the device tree and makes
it more readable.

Link: https://www.st.com/en/evaluation-tools/32f469idiscovery.html#cad-resources
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32f469-disco.dts | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index cbbd521bf010..8a4f8ddd083d 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -69,16 +69,9 @@ aliases {
 		serial0 = &usart3;
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-
-	vdd_dsi: vdd-dsi {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_dsi";
+		regulator-name = "vcc_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -164,7 +157,7 @@ panel@0 {
 		compatible = "orisetech,otm8009a";
 		reg = <0>; /* dsi virtual channel (0..3) */
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
-		power-supply = <&vdd_dsi>;
+		power-supply = <&vcc_3v3>;
 		status = "okay";
 
 		port {
@@ -219,7 +212,7 @@ timer@2 {
 
 &sdio {
 	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
+	vmmc-supply = <&vcc_3v3>;
 	cd-gpios = <&gpiog 2 GPIO_ACTIVE_LOW>;
 	broken-cd;
 	pinctrl-names = "default", "opendrain";
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
