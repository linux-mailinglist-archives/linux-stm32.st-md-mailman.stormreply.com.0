Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EB791C51
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 20:06:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FFDEC6B455;
	Mon,  4 Sep 2023 18:06:43 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28C2EC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 18:06:42 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2bceb02fd2bso24748421fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Sep 2023 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693850801; x=1694455601;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UerQu8X0sDSfgf2+CbpRUuHP8N70bRTmPby/bAIFB0Q=;
 b=h0mP3Hix1dcpLZUZ1e75KUZimZUXTiKFvXk7oCvwRZd1geP87vFyBZ7sgheAmsLx9X
 rm9L8R9m8VN2gBCobBPWGBT1e8Oh3UY3EPqiKQNGD2rK8lUiIY+jaVmZSOiBe0zbSHYD
 QtqGfXi+GwDj2Xu47NgnYd7af9BxAEe5BdoHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693850801; x=1694455601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UerQu8X0sDSfgf2+CbpRUuHP8N70bRTmPby/bAIFB0Q=;
 b=VEqjuQwlgH6oZ6ZL+/SG+H1jSbdc+Bi2QQZZGbPbS1ZlS8iLQKaBgWTaqN5VPbepC9
 qIS0ZzWnnSWpI4Od+Iy6D1jxLOQqo+JCnjCdB9nwMXRSXcfVmZET9Va9WtonBQBVj1Jd
 SDuA8bM6LKCcfJ3TVZqo5W3+/Ytwi4g3q5VN9dp2EBZHfvlNuAaI3y06WFctMMdgtrmS
 z+aSYwKG8Nxn84ffShTr5fWZmlDGM+PRrYzBM85srtpc3fGcs+ezo7M1iA21AHv5OAZl
 KcgonmRqgPzBjBe4sl/3p4Et9ojK8FCAmXlZQ6DFFVFZokWqZA/aHYnGXWsrRinfhm5b
 7gfg==
X-Gm-Message-State: AOJu0YxswKkliAJYyFBXUqWKz5TxDbL0iw49MvJRRZrNrgUZOQvDPjQr
 d0ws2hTZZJVGo8W9dPvNDZ4+vA==
X-Google-Smtp-Source: AGHT+IE/yOwJTB71sCvOOHxNASxN/IQyYmWk7RSn4j6RvAtd5i/3U4nhAxCAXlqEBo6qGeVdzmGmfw==
X-Received: by 2002:a2e:b6c2:0:b0:2bc:da3e:3bda with SMTP id
 m2-20020a2eb6c2000000b002bcda3e3bdamr6653000ljo.2.1693850801146; 
 Mon, 04 Sep 2023 11:06:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906a40d00b0099bc0daf3d7sm6534375ejz.182.2023.09.04.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 11:06:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  4 Sep 2023 20:06:35 +0200
Message-Id: <20230904180635.923506-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH] ARM: dts: stm32f469-disco: use the same
	3v3 for SD and DSI nodes
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
