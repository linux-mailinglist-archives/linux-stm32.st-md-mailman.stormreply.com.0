Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974DB677EED
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58045C6905A;
	Mon, 23 Jan 2023 15:13:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B68F3C69056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n7so11122126wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
 b=jcfa4hARo1HJwIehRkPDvzT0+j43uVWrJYFNzZFKJFnKpJiYnKY2DxtS+F/JYF6uV4
 KknhnLaVrHDF1aK+YU+We/6hYH28642w2VsAR2GhuxMYrMGdHZ4yvQdKZpcnOwkKtjNs
 9YeAeCXyUlV+RLV/5E6LYVH0K+wemk8/uI/1dcbZpOzNblLuvGNxrTnammNGXidPuI0r
 ESQrQEpLx/TKFTbBmG38BRF//5BuQ7VLC+rC4pjygLZu77HP7SzuoAViTIttym9i2g6+
 dyPK25KiunlTmQVEYImYPt0PSo2l+BBax4BFQZTf5+cfTrrzSHX9Ua9rb0bUiuClnAvS
 sn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
 b=3hpymqmWfZLB01PNLJ5cdPGM+1mLRvHzZSOYhK8+CxJyvbfHjGxSvQw2znsSYLS5kn
 mBUCd2/qq7kYp9Ku/FRuX1U98W8runmdhmg01AXYThW5rocHgGn2b9wnsM6OLY3V3ZTZ
 hX3K6cmrRBOO4Z/DLm5ssq0wE0ble542kS0ZblRm3b/1ImYhrH7YBtZV1Y6hF/+c3YQL
 QIqeu22wsBfiEurDg1QG0TKRPD1Q+wtcJyaqbDGT8ld1ACsPZl82a0lWAKHE4UTJPy0r
 PuLMbwZFkok3zHScvF9RrGJOIKw1qhsfnyJh6EvvFedQlCXgmhBB7z2tuXwkNDVhYlCb
 PSDg==
X-Gm-Message-State: AFqh2kph6X4uEtmTwJKauvkxHq4+v6NnNYuGVIRPgdZ1apWpmeCBIFz6
 dQf+eE7vHEsA/12VnNEXW5X0wRbh26JN1Nnw
X-Google-Smtp-Source: AMrXdXunaNSmvF24sA3mpkTnzyAxSSQqlgKz33L99W7wuvo753haLL+xzVFn6hjB2Li7pbF1fFW5Cg==
X-Received: by 2002:a5d:5954:0:b0:2bd:bdb5:baf1 with SMTP id
 e20-20020a5d5954000000b002bdbdb5baf1mr19905320wri.10.1674486800444; 
 Mon, 23 Jan 2023 07:13:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 23 Jan 2023 16:12:54 +0100
Message-Id: <20230123151302.368277-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 05/13] dt-bindings: serial: cdsn,
	uart: add power-domains
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

Few Xilinx DTS have power domains in serial node:

  zynqmp-zc1232-revA.dtb: serial@ff000000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/cdns,uart.yaml   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 0c118d5336cc..38925b79cb38 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -9,9 +9,6 @@ title: Cadence UART Controller
 maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -46,6 +43,9 @@ properties:
       port does not use this pin.
     type: boolean
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -53,6 +53,17 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: serial.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cdns,uart-r1p8
+    then:
+      properties:
+        power-domains: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
