Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1C744064
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 18:58:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69E08C6B456;
	Fri, 30 Jun 2023 16:58:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20951C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 16:58:53 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3112f5ab0b1so2332828f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688144332; x=1690736332;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
 b=a6hqvXY1JZ53EuG1WH+aJvzumRxz8MhojSkJAkXi5hAQb5v5fGuTTh4KK4Uw3cUajv
 PSjqHesy/jV0RaO96YTj4rT462zAZY19OyAkphRPRykyxTQTW/ANH1DuGHCOO/JulfVg
 nLaQqkH3L0YtaMY5x2h3+NvSw4clXziXBZzJBYWjnzXrs53abbtjZYHMibeluJrAODfz
 mWAKd7fyLySIipmS+LO9d+UPhPX5vI4CZ/owp3JTgP91N7FWy9g3So2NQhDOWWDzeCAH
 jPf+E8YYg5uOZXJkf2PACxH6JZw4pWGh/bZkOUTqSVZVfahLS0EYYq8uio+V4gidJnEr
 kDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688144332; x=1690736332;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
 b=BeEjy1k6Os8+EKE8fPYoAfZQ7ziWZXCTPNOJNJYCvVuYwHJqJLvk189duxUtemZzor
 dgpWf+7utUK2OjlA7eTi9rMfLvQYfS2q2pAOMtMI7kn7Up2BBCEV2w6xbZvSxicEywFQ
 SM8m8CPbVVmAwYXOR4n9ATAc2DJSP1KN0myoPASSCMAtcL65vY9vXml/sbnbM3NHH9Jg
 IZow2vRcZXTNneYMD+QhJMWqCpsF/rJdl6OVWERNZaxM/WDnEnD9JLAuw6C8+H5w8Gzn
 RvotCyrdMZfrBQnMn8t6RC/9kB+SWEFCmDlumJyFxMeTV4qs1LEDxhRc2G2hqClpqFob
 ayhQ==
X-Gm-Message-State: ABy/qLZEVjyf3J4uWSU1bvD2pjBNrcIIbFOCvMl83z5O/rMo6jSkCbpL
 TGP7V1u5T4xFRKyqPowGQvmDwg==
X-Google-Smtp-Source: APBJJlGMQoq8MJdB0hfT3I6T0d0F1LVt3vu4+o1NWHKLvHvj4GZq3IgRqC7tve+tvUz9c8RXUpjMNw==
X-Received: by 2002:adf:cc81:0:b0:314:d19:fc31 with SMTP id
 p1-20020adfcc81000000b003140d19fc31mr2913745wrj.51.1688144332721; 
 Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:35 +0200
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-10-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lU0Rgil/ev1/BqzGapYknrWAekAzhIDCjFFvr/Tl7mg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm4+5/g0rcYb66QxjBIlFiUjvocLVgWZT6mtpaE
 GF1Pn0+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuAAKCRB33NvayMhJ0dPvD/
 93ZAw/LIPqNPF0li9/7yv9xUx84tStF1AkO8ltYZ00U95njJe5mPlivwj+pDdPNLiCEk2nmUPunY3M
 7CuVgtBbHpWcIqx8BDZ70S3yrj6NvQ4MaoES6FuoTEwqXEc8PMvk6wEkEjfL0M13jSe/oNVrYgnzlq
 tenzbEkFaTh5Hgi4XxDqiMvprL37YdzCRzmsoic5XqS2eewnvUAUqy+rhQ1GdnpyiOVv8V0tp4Pqm5
 9cOwbashPgyJeWOsmnzN6Rae795M5pTBkJx1knCyQtXZLKEPNifnQOCfpzSjIFHuPMTqYDQzeZetvI
 fjP4q1vHO1m6hvP6sYHb4iMNXi4ho37b8eUabnUBZP2syBsyP+UBeL0f6wMbDE4Bqyc8i2Me9rXVVD
 qbaKXAAZzqiZgNKBbCRSU+kwDU0/mZVH9BNnAORdEYeYo4XSglwuLtKubLamhA1DHbMmeO5spP202f
 3O5Rg17wscN4iJbKsZjfzH4YJ2Vx0gMqEO77pyJhyhxiLkXDfiHiX3ESELQpbUQb76vCDlxOvUNIis
 sLVWN+pk3K2ckjcQhpsFrL3blpXjHiNTZDdFkjiMf2MdFl69K2sRxnNDEvBZCAAkMBXGExG5t6kuE5
 YzCjrEAZmHYK/h/PtJt2bj+n/N+O8EIkQJnxiI6dKaSy/UtKIirJ4XpqqPqw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 10/15] dt-bindings: pinctrl: oxnas,
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 pinctrl bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
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
