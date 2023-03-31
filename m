Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0876D1A1A
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:35:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E75C7C6A602;
	Fri, 31 Mar 2023 08:35:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A39EC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:35:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id n19so12431274wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
 b=faT7qty2v9mj8Ix42YBnnqiE2BD/zQGcq3gccefKHMH/YuuU8LZ4svbUGwYDSn15al
 dV8wJKJcQkWAkZM70cK6ds9puxEMg+C3u4wDRMDaz725C3hxxzMEWJE391gJ0Jg17AuP
 2fMwEoAleea02+Mxb5yclghoO9G4SJu8nA59Aoxwhz+3THjb/xNVjz8bcn1LLjJut8Dh
 r9V9XVaLp5rt0pbcKx4qinpPznoE0FdbJ4fkafGpL7j5amy06u/P8iDihjNYx6eNP2wS
 pFAPQVIUhgzR6VO3W5CM2AjgrdOkVOZ4ja1cG+v2J+H7pw4pFcKcCt3cz+G4ysJYcdMY
 jfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
 b=D+F9KhSBA4DMyY3DrtYxqtUwfY07jMuT87/orP8jqIjnDX9wDeVOR9gt3Y4jwwj8Pz
 FarzmElQIIV0+sBnMd4O6eAIqO9gVxZcZfsGJIBXzfsh7un5jitt6RVN6L2bmKFM7KCm
 rTK0Y2u8Ewx2JN3Ax2XrXRBvJUdduVsOGJxQPX8Oj6+NClMTY5R8FVFAKasGMoQteXXt
 3mGwY4glGSXjVNbA9wA6hIUdEEDxpcuxr4i0Tw0r+4bFg7c1zFw62pgCAVPy7q9Z7Tjg
 hrviLDfBYwEss93BipRmJTKfQ+IKrKqYZio4bcE0lUFR56BcFDAkCYkA6RMPnAnWpZCs
 4pTA==
X-Gm-Message-State: AO0yUKWngYzTTZtUD39A5zVekfrW1DBfQiksCLJsxkINMr0uub+Rs316
 KMJjBHJvk7gdr4EbZPgb0ijRwA==
X-Google-Smtp-Source: AK7set+EJ3ur6/ee9yCfqdjB5MLNFawGDsn0ZJD+xQ08Aa57oAcgfY47mb3l6TfHxYQ73tsX3o+sPw==
X-Received: by 2002:a1c:7714:0:b0:3ee:3f7:35aa with SMTP id
 t20-20020a1c7714000000b003ee03f735aamr21641887wmi.19.1680251703765; 
 Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:52 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 14/20] dt-bindings: pinctrl: oxnas,
 pinctrl: remove obsolete bindings
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 pinctrl bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
deleted file mode 100644
index b1159434f593..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Oxford Semiconductor OXNAS SoC Family Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-OXNAS 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
- - oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
-
-Example:
-
-pinctrl: pinctrl {
-	compatible = "oxsemi,ox810se-pinctrl";
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl = <&sys>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2a {
-			pins = "gpio31";
-			function = "fct3";
-		};
-		uart2b {
-			pins = "gpio32";
-			function = "fct3";
-		};
-	};
-};
-
-uart2: serial@900000 {
-	compatible = "ns16550a";
-	reg = <0x900000 0x100000>;
-	clocks = <&sysclk>;
-	interrupts = <29>;
-	reg-shift = <0>;
-	fifo-size = <16>;
-	reg-io-width = <1>;
-	current-speed = <115200>;
-	no-loopback-test;
-	resets = <&reset 22>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
