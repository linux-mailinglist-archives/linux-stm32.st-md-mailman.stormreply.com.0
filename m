Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93608762C75
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:04:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55FAAC6B45C;
	Wed, 26 Jul 2023 07:04:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6F0DC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:59 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-991c786369cso985868866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355039; x=1690959839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRaenXoW9ED5z6ykYCC4nTP4YO7Ln/kJx6OoQkFxhJ0=;
 b=AcuFcfWRbOIvi//TDDtHtI9SDhOAqbU26ab9g7x3ewborwzWCcZkkzRi0LTcYxt1aI
 9/6x9Ab8Mnc/cfEblggBpEsO6iLxegIgPo+d2arWFmKPg3EUNBhv4+76Qbq3c2FL/0WT
 PC8Jfibs4zwR4aHnjibtNhTZEY+b9Y7ni+UjDCbwl44+AxrOMp/QyHtqzL8TfHZEdO+C
 RqdMvQXA5nxjN16lrbFDXa6QV+du1PM8g19JfKKE0Axa0WGlXzQ5cypldaiGEJ+ICo0/
 C8qvHJoCJzqR6VTHuvkL4g07h5xxTrWVd6mu+cdxXd3FlBC6VH2bOwdjIVd6tFhEwc4K
 vA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355039; x=1690959839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RRaenXoW9ED5z6ykYCC4nTP4YO7Ln/kJx6OoQkFxhJ0=;
 b=jMwWcNLvJb9G5fLlp5BCVhdSswmej7cMh9GgJPHoY78byb7S8C3xfbKjITuharbKkD
 8GDM3yKJMF3+mwOAqTRl4MCsbG8ybvEYqUryPVqDWo2aPjTqd1JFz1stuk8a3HyNXpw5
 wW/OF60iD/xNscl06sU+w2K3Xx+tKIJWLQSShCp+uwi2kHL0HNZsP5miG3P67rYrL/tM
 SexVXSRnlRYZjezdhCMCVOwVMT2fyx/TG9q6O8tX2TDtyIvilBtgf/ix0GWiMfn0uZ0c
 vEZvduOu+Xs+bw3SsEpqqa0S6pF8Zgo3GNZ1/BMj2VAK1v9/6NlBQHFh7BZfd8m+4Pe2
 NVpA==
X-Gm-Message-State: ABy/qLabXUpvJx+f6i+U9f/DbU0oMN6xON7UBxeEoVNDSBb1n0eAR0vm
 Asu4S///Lz2SvwGYi50eZEHFAA==
X-Google-Smtp-Source: APBJJlFszf/28HoAVClrXvkXOPjHFCAcWzrtDqfxU+rdB5bRhmL1z1O+ONed789extBHeuUtidnd1A==
X-Received: by 2002:a17:906:53c2:b0:99b:59bb:c4a4 with SMTP id
 p2-20020a17090653c200b0099b59bbc4a4mr772410ejo.60.1690355039243; 
 Wed, 26 Jul 2023 00:03:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b0097404f4a124sm9212372ejb.2.2023.07.26.00.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:52 +0200
Message-Id: <20230726070353.103989-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
References: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/4] AMR: dts: st: ste: switch to enable-gpios
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

  ste-hrefv60plus-stuib.dtb: regulator-gpio: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/ste-href520-tvk.dts       | 2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts  | 2 +-
 arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts    | 2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts | 2 +-
 arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts   | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts          | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href520-tvk.dts b/arch/arm/boot/dts/st/ste-href520-tvk.dts
index 4201547c5988..7f661f8f13ad 100644
--- a/arch/arm/boot/dts/st/ste-href520-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-href520-tvk.dts
@@ -28,7 +28,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
index dfc933214c1a..a29e345a43d3 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-stuib.dts
@@ -27,7 +27,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&tc3589x_gpio 18 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
index 75506339a93c..1968bd143114 100644
--- a/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefprev60-tvk.dts
@@ -27,7 +27,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&tc3589x_gpio 18 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&tc3589x_gpio 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
index 52c56ed17ae6..7a5b6aa1db5b 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dts
@@ -29,7 +29,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
index 2db2f8be8b03..d5af3f375161 100644
--- a/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
+++ b/arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dts
@@ -29,7 +29,7 @@ vmmci: regulator-gpio {
 			  2900000 0x0>;
 
 		gpios = <&gpio0 5 GPIO_ACTIVE_HIGH>;
-		enable-gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 9a3d6546399d..27c2ec51e732 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -229,7 +229,7 @@ vmmci: regulator-gpio {
 			/* GPIO228 SD_SEL */
 			gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
 			/* GPIO217 MMC_EN */
-			enable-gpio = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+			enable-gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 
 			regulator-min-microvolt = <1800000>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
