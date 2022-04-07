Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 167634F8D4D
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 08:00:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD41FC628C3;
	Fri,  8 Apr 2022 06:00:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21569C628A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 14:30:31 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id f18so6636704edc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Apr 2022 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zllbixT8uwwRAVX+QMa2CP3U9HgtcTg/FeMKsXjsUYM=;
 b=u6ATGlIv6X2WFKo3R1hVE/lTaoxaCg9Er9kklI3dOr/U/syEMPq5alKk5jKRLSoMz0
 J1ZJSvSIoN9sc//+nHCBPtYPO85jf7HtKRlDi6/+xycPUBMI2SL70ZUViNmFT21AZ4DJ
 6elP3inT+iiuIKDg3ER0qpTI1oXh3n/JciGaZu3NUGcXsCnP52+Fd0RcqClZkXxEce8l
 Tdrvr95CWJiNNqwFZuZ2zHGss0FyXg1bQbRB5zPrBLHMIYVpx3CnAaHdBCaFhNZD1gsa
 RzcQ7Hr7UKu1k9hwd0AOtLhQp9Q4FOhrST6VoIkOUXBaWI4WMReKUKkXb+V4KdbikNlc
 AE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zllbixT8uwwRAVX+QMa2CP3U9HgtcTg/FeMKsXjsUYM=;
 b=iu7rhN2/n4nv/4kZb4BippoKeK0WRiUnv8+KsF3OSyr6v904WnLlx9DRxamul6C0Ex
 f2+OeB9ndQczfxkPyw8QOWBW3N78zv+Z1VPH3Nce5T9tBanhAOx0Cd2NMqG6JQvHRdBo
 D6msqTagNTbiPUtAAK6X/kFBSoyQXR5uAiyj2c+ua0ZGTlOnIIJ8BrwpSzcwXatzei88
 7Uby4zbUWBKErSVNhPeKe00GLB1YrKja9BB1OIzFMzCGDwjL8fMJOPTXO5mZqWPxGgJF
 rgIwkpNSyQZyCtC1pWbroLBsruXX0FDAhzG+zVWgQ26BFUq0jKbrhbAR7EC00xYrZJvV
 yp/A==
X-Gm-Message-State: AOAM530mSGvL3Q5YuQYTOf415aIhzPdhARgu2d3bQqt+yqWZLku0um5Z
 J7w3vfd7czB7XGGagwRG5csDZg==
X-Google-Smtp-Source: ABdhPJylvMQfZo0mmKmPVZrTGayBO1CUslG2f0TvN0gV6Pn8PN9mNCoe3csN+n6Mvj9EGmyt5P+V2g==
X-Received: by 2002:a05:6402:350c:b0:419:3d18:7dd2 with SMTP id
 b12-20020a056402350c00b004193d187dd2mr14847093edd.148.1649341830705; 
 Thu, 07 Apr 2022 07:30:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05640226c900b0041d015bb8a5sm1133039edd.26.2022.04.07.07.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:30:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu,  7 Apr 2022 16:30:27 +0200
Message-Id: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Apr 2022 06:00:18 +0000
Cc: Olof Johansson <olof@lixom.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [Linux-stm32] [PATCH] ARM: dts: align SPI NOR node name with
	dtschema
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

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/da850-evm.dts                  | 2 +-
 arch/arm/boot/dts/dm8168-evm.dts                 | 2 +-
 arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
 arch/arm/boot/dts/spear1340-evb.dts              | 2 +-
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 87c517d65f62..e9aecac4f5b5 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -278,7 +278,7 @@ &spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins &spi1_cs0_pin>;
-	flash: m25p80@0 {
+	flash: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm/boot/dts/dm8168-evm.dts b/arch/arm/boot/dts/dm8168-evm.dts
index 5126e2d72ed7..778796c10af8 100644
--- a/arch/arm/boot/dts/dm8168-evm.dts
+++ b/arch/arm/boot/dts/dm8168-evm.dts
@@ -177,7 +177,7 @@ &mcspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcspi1_pins>;
 
-	m25p80@0 {
+	flash@0 {
 		compatible = "w25x32";
 		spi-max-frequency = <48000000>;
 		reg = <0>;
diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 4cbadcb41084..ddd1cf4d0554 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -379,7 +379,7 @@ stmpe_touchscreen {
 					};
 				};
 
-				m25p80@1 {
+				flash@1 {
 					compatible = "st,m25p80";
 					reg = <1>;
 					spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index fd194ebeedc9..3a51a41eb5e4 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -439,7 +439,7 @@ spi0: spi@e0100000 {
 				cs-gpios = <&gpiopinctrl 80 0>, <&gpiopinctrl 24 0>,
 					   <&gpiopinctrl 85 0>;
 
-				m25p80@0 {
+				flash@0 {
 					compatible = "m25p80";
 					reg = <0>;
 					spi-max-frequency = <12000000>;
diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
index 33ae5e0590df..ac53ee3c496b 100644
--- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
@@ -398,7 +398,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: is25lp016d@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <133000000>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index e222d2d2cb44..d142dd30e16b 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -262,7 +262,7 @@ &qspi {
 	#size-cells = <0>;
 	status = "okay";
 
-	flash0: mx66l51235l@0 {
+	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
@@ -271,7 +271,7 @@ flash0: mx66l51235l@0 {
 		#size-cells = <1>;
 	};
 
-	flash1: mx66l51235l@1 {
+	flash1: flash@1 {
 		compatible = "jedec,spi-nor";
 		reg = <1>;
 		spi-rx-bus-width = <4>;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
