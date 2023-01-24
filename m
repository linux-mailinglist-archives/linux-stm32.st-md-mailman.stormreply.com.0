Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC846793DC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:19:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43ED6C65E72;
	Tue, 24 Jan 2023 09:19:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD312C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:19:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so10437266wmq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nb5CwN4fN4XTwRx3Tj+I+Ommhby0lGr2iuTrQcxIb/0=;
 b=Erz+EhOmyjtVC8y8TD1tzEzfeEI+tUpI6auPlhOS+L8rFcrpspoGstb2EvkLgGuuAp
 DpKD+EnP0qVzHF5BpeHg6bzd83CFhVrmFGWodo0QhT85JTbjUDY9rlI2F2q9CqFUqE8H
 Mo/TmRVuwZRoWTTKcd5YrFHbXefcW6Vjg15ub+DUMbZ5/zXbGi+oynGVNw7VL8aiHpzk
 yRUkxDf57i6EJjuOmrAQh0V5XQ3cJSG/q6lOFE89YcI0jNM4Yd9chTApm8BS3Tp2Lz0c
 ytWEkYuRtJnN5GvA0nQYxCJPky8Tviyyop+mibt4vI/EKUDqf+YKvXMhb1EO2OGo3A4D
 EEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nb5CwN4fN4XTwRx3Tj+I+Ommhby0lGr2iuTrQcxIb/0=;
 b=4eTzahgA5nLfdyNtJHmV8CP5f/XI0+FBuaF6pzhhBBESzUc9gyilH8fW94wh4wWSIV
 YX9t9/qETbxQ9Q2aDUzCfLeEf4ITJD+yEspmqh94IU5AEqI0LtpHaqUzZshDz6HxYzJv
 WiJFngOVbWx0OOfL/44ZXZ7OwB6odAATca9k4pxArg0TjhmWEdHU0UjQunPkilAKda2x
 AEKGKSCdq855ldxP7nyYqxfYzED0hkHQnDFwDdVTUJHPkYWorZgaUx0Nxw3KxSxDk19Y
 9STHwB6kHRc6+jjhgq4H8Z0m9Ser0Usz814E6Wsfc/FGKLf2J5BJpv3G9lBbY8ttVEUK
 C6HQ==
X-Gm-Message-State: AFqh2kogDr+/lS31oqbfxctMqlBRYFscMIjImy5jEObFLCJ07s974o9c
 lY+BebgUwz8yRhJg3kb7nixeQg==
X-Google-Smtp-Source: AMrXdXtDAh7QFXNJKNHeXnVkYsOgnO5HNUP0pkqugffnYolM/QSylK27RP72alQg+Wi0pRiLhcw4xg==
X-Received: by 2002:a05:600c:4928:b0:3da:909f:1f6b with SMTP id
 f40-20020a05600c492800b003da909f1f6bmr27413613wmp.1.1674551983490; 
 Tue, 24 Jan 2023 01:19:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:19:42 -0800 (PST)
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
Date: Tue, 24 Jan 2023 10:19:08 +0100
Message-Id: <20230124091916.45054-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michal Simek <michal.simek@amd.com>
Subject: [Linux-stm32] [PATCH v2 04/12] dt-bindings: serial: correct ref to
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
Acked-by: Michal Simek <michal.simek@amd.com>
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
