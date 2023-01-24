Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E026793CC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:16:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 166F2C6904B;
	Tue, 24 Jan 2023 09:16:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EF4CC65E72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:16:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n7so13193047wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
 b=ht5LLAmNCXWk91VFJhzqk3ETiT3S9WKDG9n7Lx34WQTWnXdrGkZP64QQUAWkTtSXNa
 ligZsLEVT1/DBjRLdUveGHswtzvOyZziia9CJSqHYHxw6ygC5yzZG+P6MGFe1hewkplA
 /dTii7SzPpAqyO8zaMUwVmfKckjQAein0gvyeQgaBlVkfNUhzd3iZ3R32jVGlp8gek4A
 DYnlWns/Yp0181BU/8sD2FC7rZKX9/NW7gqpzGeubeDSWD4d3HvQWkzyFbp8B+8h4n+W
 eDhNjkxQv9MBYHh2wFwckrcgPT6ygEiKKtCDU5C7JxQpJOSSZGp8FmyBg/n5lNAQRJ93
 nuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
 b=wEv0eDPp3c/i0SFoU45o6VOU4fX+jzVlUcFEQQpH3ZAsq553ASmyONetK78LEZhBs7
 vKJhwA8OxMSMKoP3B3UclUjsG3A/11sEKC8+/h4I+vxyiPViOSi0KD7N61jiqBzwVQhG
 zgCz4v1mC4AOMMplEXPww3FqRJ1PDh2yKSE7bvzwqQa6GugEKApwd9bWf1tVkoAUg0Z/
 ThmYoFj6UQlt9zryywnSuWSmChs0SNhRUSNcZzuAA/5hdyqvGcbyUaewik9Bk8e4Rplq
 bZzRyFVLwOiIRkz6i8Xt5HhzOLYHEgzCr3Sj/8lDUTyt52ZhxUXq0z5t30jl2MaijPjY
 iMtA==
X-Gm-Message-State: AFqh2krszn0fupUkLJJNqZNDd28EWcrzwi9wvMzl7UK9cQpZCy1Z6Ued
 Ka5Wf+z2g2TIN9ZNIcFi7BbqIA==
X-Google-Smtp-Source: AMrXdXuIOcn5b9xxfQPmfx/uSv6bF6pKWJ7ZoEGBGaeCFLwbW79S6Ckn7BhmNXuURhSjuTgFfkIeIg==
X-Received: by 2002:adf:f14e:0:b0:242:728a:fa7 with SMTP id
 y14-20020adff14e000000b00242728a0fa7mr25807903wro.61.1674551777096; 
 Tue, 24 Jan 2023 01:16:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm17882131wms.18.2023.01.24.01.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:16:16 -0800 (PST)
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
Date: Tue, 24 Jan 2023 10:15:52 +0100
Message-Id: <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 02/12] dt-bindings: serial: 8250: correct
	Nuvoton NPCM850 compatible
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

Nuvoton NPCM850 UART is compatible with NPCM750, so add proper fallback
to match existing DTS and Linux driver.

Fixes: c8177f90b7c6 ("dt-bindings: serial: 8250: Add npcm845 compatible string")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 34b8e59aa9d4..badaf6d5b6fe 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -62,7 +62,6 @@ properties:
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
-      - const: nuvoton,npcm845-uart
       - const: nvidia,tegra20-uart
       - const: nxp,lpc3220-uart
       - items:
@@ -92,6 +91,10 @@ properties:
           - enum:
               - ns16550 # Deprecated, unless the FIFO really is broken
               - ns16550a
+      - items:
+          - enum:
+              - nuvoton,npcm845-uart
+          - const: nuvoton,npcm750-uart
       - items:
           - enum:
               - ralink,mt7620a-uart
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
