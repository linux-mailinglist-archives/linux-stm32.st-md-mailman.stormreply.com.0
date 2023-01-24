Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A646793ED
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:20:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFBF3C69054;
	Tue, 24 Jan 2023 09:20:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF983C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:20:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m15so10903620wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
 b=iF/SVufCGutRcvsU52HZA2iBFjZzxQZO4nhJCwGWZmUjf5gH3yh4xXtKUZAp84g6l0
 W3kqM3ALCgpVEjYQ4HYkJY/Yq5urA7lwLgbYyqCwOnA3TV+8xAqsFiA8IASXn5B8FgEL
 plvdf8WLwo2bthlymR45KrY25uuMPQBOuxEMh5sepkeewYiFXwsEriSt/m2zEP7Cf5Sb
 WQvVnoVBef1B+fW0QZ8rzKqhmRuFfMAybd70PTLdYH9242C2sI35wrccvVx4S78Em+fd
 xIUJVMv8RnGNzJRTWD9tI6EE/NBFcgPTaJu/ehnlGx+R4RnacDCONVq9UY/Qwq44Cl5B
 5YHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
 b=7Cgi/sPW+OuYygBS3Rqs7gD1VnlelXx5GJRLXtRCa2dRyJAJF/qBDhFnmy5aYmqXAN
 QaQrbz02ZYH5HHKMaINFJUxFA/PalN2Zzn8GcG8lR+B+vO1vFGEj+IaP90GbYAxReL2+
 z2ohklkyXutqH7odbLJO5G19hZfhnjQ18iboQzE0RLr3f7meuqxTO8Zu780opWkW97AN
 i2dBoVYDyth1cqJf3g4Aodwf7zIilR/kOa8U5OB/z6/7fE9jojls7BaYDjY/kBQKISWH
 Za98MHN2fxOdZvxkQC348VXH8lN8btWeWLCy/+P3jdCx/r3yOVhw1tgYC4iq0DcpsdwP
 izYQ==
X-Gm-Message-State: AFqh2kqRzn5vk3+kyhtqsHvu1SpN6moByIgNjJd+BfZe6abRKWTh95nC
 1FY+G9gG7GC/3XDkp+uZLWvIZQ==
X-Google-Smtp-Source: AMrXdXtZql21ZBrKkdmMysJwTEVcbN5GKUTYDDo2IexCQ0hGTMdVG5t3LB4Onaamm/PtjPXUrsWjbw==
X-Received: by 2002:a05:600c:47cf:b0:3da:fa3d:cf5e with SMTP id
 l15-20020a05600c47cf00b003dafa3dcf5emr26558124wmo.28.1674552008559; 
 Tue, 24 Jan 2023 01:20:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:20:08 -0800 (PST)
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
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 10:19:15 +0100
Message-Id: <20230124091916.45054-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 11/12] dt-bindings: serial: drop unneeded
	quotes
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

Cleanup by removing unneeded quotes from refs.  No functional impact
except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml            | 4 ++--
 .../devicetree/bindings/serial/fsl,s32-linflexuart.yaml       | 2 +-
 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml    | 4 ++--
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml      | 2 +-
 Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index badaf6d5b6fe..2d0cac642427 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -203,12 +203,12 @@ properties:
     deprecated: true
 
   aspeed,lpc-io-reg:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
 
   aspeed,lpc-interrupts:
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
     maxItems: 2
     description: |
diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
index 8b643bae3c7b..920539926d7e 100644
--- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
@@ -16,7 +16,7 @@ maintainers:
   - Chester Lin <clin@suse.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index b431a0d1cd6b..4cbe76e1715b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
-  - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
+  - $ref: rs485.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 26c3593fa98b..ab81722293d3 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fugang Duan <fugang.duan@nxp.com>
 
 allOf:
-  - $ref: "rs485.yaml"
+  - $ref: rs485.yaml#
   - $ref: serial.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
index 14c7594c88c6..6a400a5e6fc7 100644
--- a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
