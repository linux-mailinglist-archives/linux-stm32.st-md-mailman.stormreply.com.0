Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5F677EEC
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43F06C6905A;
	Mon, 23 Jan 2023 15:13:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99C8BC69057
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n7so11122021wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
 b=YNHH8XRTX/01S31iQXYst52wcTTzbNbPtyQX8SbuGG5qAnPY1IAqJCxowByc5NAiIj
 EVn8g39hWWoxqwFSvp+seTBUawYQXnNdYFG80ce8+U59d80Q9psruK3xc4Ch80Q9YQ2K
 7nLXo8JaD+hoq87mrhJnw9b9r2JkD5hpoExRj3QchU725f9quBfOmlP3QFCp1yrmlIh+
 yN0fT+2BIch3oSwCfldxTIrUFhydcgT/dWrzIQtWy5fZU5RDfkbqSugyevH04iBrUfo4
 KkH+FZ5UVdtouXOh29sg6LYwdfy4Y6E8tyFQT+bxnvnvq0tiMvWZprOXXi1+E/vda0cB
 kxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5LLyL4NM9RFy872x3bTzHa5dSLMasbi37/mYNx6DCA=;
 b=ntxw41o6ZViX4rNULoA3d4o360T2S4PMNVuNVAao+mAk24HBt6Fg8gXTNlcMvsL6nt
 91IQM3P76E3QQn1jXgg7J4PXJ3MWsKPDlSUgjezwyV+Fgsh2BSau3LCkRpwKMEw3LAm9
 PG6bY83PP32CDnUVFGW38AgLLv2/XVAjizXnvbobFPWGdDgLK6guY2G3J1QzcLd0ajFx
 YxrC3e/es0HUNtYX2BqoaMJkj0oxuU0H1Hchh+U4HzpQ92GT/ldyEgVqAYPst/k19XrF
 sLyuYu2DfXhqhPszLDkseEicmM+uCQPI/ayBLItwaJ5saekhdHtl9hN3/ojcrnUz4wx8
 V4Wg==
X-Gm-Message-State: AFqh2kr1yZV4shTYScOMWva3a8S6Q5WREciL4cmyYAxK8nuT4Yn+c6w0
 DiAPYE6hHeoA+7c/Jx0+WFx6dA==
X-Google-Smtp-Source: AMrXdXsQsitf8BzeJXaPtKrY+OeCwfG0Ax0tXdx3cyfdOVAR+FOLMjW3bN2wF/BNgF4woch/VT2ctg==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id
 r16-20020adfce90000000b002bbedc70504mr23324176wrn.26.1674486798260; 
 Mon, 23 Jan 2023 07:13:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:17 -0800 (PST)
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
Date: Mon, 23 Jan 2023 16:12:53 +0100
Message-Id: <20230123151302.368277-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 04/13] dt-bindings: serial: correct ref to
	serial.yaml
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

The serial bindings should reference the local (in kernel) serial.yaml,
not the /schemas/serial.yaml.  The latter comes from dtschema package
and is a small subset of serial bindings.

Usage of the local serial.yaml allows typical properties and children:

  xilinx/avnet-ultra96-rev1.dtb: serial@ff000000: Unevaluated properties are not allowed ('bluetooth' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 876b8cf1cafb..0c118d5336cc 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
index 2f4390e8d4e8..6f65e9a81c29 100644
--- a/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
+++ b/Documentation/devicetree/bindings/serial/xlnx,opb-uartlite.yaml
@@ -63,7 +63,7 @@ required:
   - xlnx,use-parity
 
 allOf:
-  - $ref: /schemas/serial.yaml#
+  - $ref: serial.yaml#
   - if:
       properties:
         xlnx,use-parity:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
