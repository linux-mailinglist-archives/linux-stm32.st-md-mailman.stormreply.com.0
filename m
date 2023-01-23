Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E3677EF4
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B6CC69057;
	Mon, 23 Jan 2023 15:13:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 966C3C69057
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id j17so9305895wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
 b=yTpXkuZVxBf/Okosou2SRl8i1EYnqKjpR9qYNEiJoBGzFJVhTP1BUZcYXSwoDYMMm/
 gGEOvGj+EPw8SDiTsobtFtGxqW5JxRGzgDd8uP9l7D5gjnnmBMvuXxYa5MsvGhtFwGkh
 1tXRuYZCb+3E/KkAf+XmmfvAi5/C3Iw+uW9kmkIK8pzTnKGZIEEg6DuXqnQ1gfRJlvV4
 utPYIa2FsLiGCut+4a08Y8O9Wbw9fGRby/G9y/xEyeEUWM3TfuAwiFOOzfMPfpH7cDwZ
 YthMHBcw7/iaTz1OlbMNI73XKu2je6+LGiC+3p58LLw1SPixX4Bg6TAKC52aP69iurRt
 +TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
 b=rr1MHFHbfOaMbEaPn4qhAB9Fudi6oIux0BuByC/2i43He/RuktdkB3oZc6miHAdhUw
 t0nABiQFSL3aj3g/9hHhGzRfDj/nVR5ep9YNOwZ/jhJyal+c4gEfHur5RI3vJRWnDBjj
 CTn7z/A2UiCAUBbYyHlzuewm0it5rQNUkLAfSldqcoaRgjiIpokH3ph7gcSvp9JbHKge
 eBFJQMuA8lP+jOE5wjjUp9mQ3AyRFFi1hfNdox/CqieyoPhqCwUX2ObLjM3zI/PW3myP
 WSz7BZX73cEWAAGsrEqE2t82iAL60Cnjh5rrXtySBVfjQoqCmLIa1hCZDJ3gtdeOEU+G
 qHFQ==
X-Gm-Message-State: AFqh2krsr82ZQtyGNaJqFSvj+mi5ARxdrM3nEXViGYkiO/phRWoePdyv
 ZBExEAf9haAMUPaeR2cv2V3ceQ==
X-Google-Smtp-Source: AMrXdXu6vYRYY5wV4XGcnXHQFFjaoLMw0vFZzVv4DjurTQnJ18UGrtA3F3Fe/V27r3/7GSCupm0HyA==
X-Received: by 2002:a05:600c:3b82:b0:3d2:392b:3165 with SMTP id
 n2-20020a05600c3b8200b003d2392b3165mr24592200wms.12.1674486805187; 
 Mon, 23 Jan 2023 07:13:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:24 -0800 (PST)
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
Date: Mon, 23 Jan 2023 16:12:56 +0100
Message-Id: <20230123151302.368277-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 07/13] dt-bindings: serial: fsl-imx-uart: drop
	common properties
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

The binding references serial and rs485 schemas, so there is no need to
list their properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index 9d949296a142..b431a0d1cd6b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -83,13 +83,6 @@ properties:
       are sensible for most use cases. If you need low latency processing on
       slow connections this needs to be configured appropriately.
 
-  uart-has-rtscts: true
-
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
