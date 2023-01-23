Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8953677EF1
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BBE0C69058;
	Mon, 23 Jan 2023 15:13:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 384F8C6905B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:23 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso8794931wmq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
 b=zKwo3e+7uOyJGADkS3SvY4tG/YcyQsjz83Hw5I13CEburg4Q5MNhT/O9mXFaHC1VHm
 NHpBnUzfLRasM5hHsboJ8qg0tjtusxjgkgU3z7WRakchQU+RDTPBJnRDSdlQige5MWjK
 n04J6T7rlTs3x9+hGTcOrAiMVD24XhCyrC8pae432g0HFZcOudET18IAy6qyEVL5YFKe
 tiWwsiNjm+uFGz47RWjXDJJuk1CSEYl4taTXz6UiG6pRB6Loe9dj7kV0N8md6ZyI+0ft
 Plr0jHIhb9I72XwyXwCtNsowVRCU61bWwloIL2WLm69gsGTF/KCt+exSO/oKQmjopXf0
 1F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
 b=u6n8rVjkl9KUvO5rHSud8vgB20NCi3A4EE8UHrJbKOhc7PLmj7BZUfs2XA+2OKmvMF
 UwustRkoP66B4nKYSksk+zFzBbDb5RABrXF4Bidm5vkVsDj/2UnFLK/1SrEudZPypw2j
 EihCa3f86gQpMiDUaR/IpuQ29ArgMKQNUzqwzLdY6qa3Q0tmG/dcGph29bIDhw1lXQQj
 R/SjI0IJRy0rBj+PdFm4P32RLWeP1DYeqlLoiGagfkCztuncH7bmG1Lkg94NHIsNIVQa
 iFARO8U8a8dDNZH4c7GBByOc9gPGPTsR2HHzlZXog1XW08OciZ7kBnuqO9OCS6jApZ7l
 TOjg==
X-Gm-Message-State: AFqh2kp65IqWRA5BT2ZJwgd6zFKxXMy2hQ8xrzfDc6DWERwXmkTOgBJL
 ow28cN4yUt9EVjL5xK6tp4Vr1Q==
X-Google-Smtp-Source: AMrXdXszs6a9DYNOLInJHWRaCXLtQ/W1X0idHVCXTCQ9XdHt03vNRQ/V7BA7UrJDU9EYj7btHPSV3A==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id
 n26-20020a05600c181a00b003d220439cbfmr24384116wmp.10.1674486802800; 
 Mon, 23 Jan 2023 07:13:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:22 -0800 (PST)
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
Date: Mon, 23 Jan 2023 16:12:55 +0100
Message-Id: <20230123151302.368277-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 06/13] dt-bindings: serial: 8250_omap: drop
	rs485 properties
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 53dc1212ad2e..7db8e5477b03 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -70,11 +70,6 @@ properties:
   dsr-gpios: true
   rng-gpios: true
   dcd-gpios: true
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  rs485-rts-active-high: true
-  linux,rs485-enabled-at-boot-time: true
   rts-gpio: true
   power-domains: true
   clock-frequency: true
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
