Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE816793E4
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:19:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86061C69054;
	Tue, 24 Jan 2023 09:19:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B211C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:19:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g10so10916167wmo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
 b=BfLinym/cklYezWvUdj/D3yAkf3NS77r92L10AME1y3JOtClKrEyZemZUji43xEfmE
 1CTGJHL8LxpGTSF3AkvFqeVNgE+wNerxDjURu1GcsX8rSNVpDps+fEwxFUsL1xhzvIiB
 +JmwNDp9o2c47v+qoJpdwZjZjMOt18r0Fc2C4iVYdDxnRsFioUSNzd9hAO5fdSylxvpr
 UUpTk957V2QsLmu9PRjgqzFHSbSzImHl6JKpF9omsRIvzHfPuFAVkaXEXwuO1hzWJOBA
 0yl9HepBj47QjGkby3EUe8AYOG4bhg7R8UD5AgoB/ADnPyyfeGIxtjSl3t1dXmFoRS3j
 T0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42Hfl1J4qT8SATIfnUTpADzmL78jDne+EhYGf6Qds8c=;
 b=5dGjYtkt8TiviZArEY7QdL0AR/RrqKr/QaKc5mi70tdhNC9pO/juhVcL9mJHLLMmzs
 HLmX6FleWYL4KLsPxt9L6PrhpJoXuIj8JgakBOrXKgn4hEUDc+2mvA7rZRw9q5MM9OAg
 oDo5P52msknNdJ29pQY8EjAZ28f3EU5cNRY/7CnNccup0rRAJLhf8ACdF6Tl1JD0Vigk
 wpyHClUHE06dkk5L2AZFpaIWz2AwB0pTTJ0ttv4ftUa6gDIIV2xRWwE5zpNjZliNXckI
 Le9beuHJwwO3lOv19oHfFB5rdsnCww3BZPKXJfP39E8fnaPlPnu1jC4XGAuQLH/hYvMG
 gVJw==
X-Gm-Message-State: AFqh2kr7bzeiuptKP7ve7iGQg7FNi3tf9UQT2sCoSNCmKtosPVInO+VF
 rIFEKyVDefdOSsdsvZUkEaW8rg==
X-Google-Smtp-Source: AMrXdXs6ofs80YXfseUtI8imesuJyhITR5jNUBCkTkhOsWQiGBk4hZUL16Iu0n0uoxEvTPx24lzRdw==
X-Received: by 2002:a05:600c:540a:b0:3db:a3a:45ac with SMTP id
 he10-20020a05600c540a00b003db0a3a45acmr26791047wmb.32.1674551994306; 
 Tue, 24 Jan 2023 01:19:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:19:53 -0800 (PST)
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
Date: Tue, 24 Jan 2023 10:19:11 +0100
Message-Id: <20230124091916.45054-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 07/12] dt-bindings: serial: fsl-imx-uart:
	drop common properties
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
