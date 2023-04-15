Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3876E303A
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 11:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE779C6A613;
	Sat, 15 Apr 2023 09:58:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C478C6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:58:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id dx24so7653322ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681552701; x=1684144701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
 b=ElHS0DixfV4Wx0/NRCOiZ3tsYfPcSyO/g1j7g/FJw5/YfXipUfJBvmFPzXl13E2Tvf
 SlSdK+EcP2/VLC4TtP1izTSZh2TYXhQwqrEHTP4zmLknPDHuF6W0Ez3oOwri2AO4Ln8J
 DKM/IsZIxge+Q36axXN56jyjNpGR6y1DekpVmrGRzkbCcPf8lzZTffR5fyyV3yf3kqgU
 XY3Jr5gNhHwtScMoax+woXvPJV+LbcS1d3mQ8aHbvrtS9cqK7eNuaskGH+C3p4x28hPk
 gE0r2qXpKKwQao2swDA6m552WDpf1EkvhZhgjtn7/+5P2CZIcSXmPfyymhrvI2osVwKR
 mSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681552701; x=1684144701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X++FhK1t/fMQBncyu3FeTc1IPRncKd5sGne3lbXD1HA=;
 b=BvGypDjpchGAy15Vh2G+h5/kL/RBESiWbACGZ/e4t85Pve7bywVRmibjurEizhivqw
 y5wVs9iLdVVtveUg+weA0o2wDNA8MIml/x8NNLYyA+iymBnK8f1A0ZjROlqP7eb3rCJg
 OELL77eIUF3lZlnBgLL4o8aRoaka/P3/NoDPC2UVMxqnWGR3v/2gTf8abaQpSWA2dMZO
 wSgZMBs+M8I89c40Io2cuUojGxOme6PUQ6Wtw9Mh7gjlBvFlh0I/dc1xZTTHFDSfyjhB
 rVK011GJCDgmlo7zHctkvRxHABVITmEmOm+cjdYQwxzAHXIQSkCkBrGFqs7kI9aJ6MFw
 BvsA==
X-Gm-Message-State: AAQBX9dgL5EjlvjFTKpses3bhbbA17v3LJg+OPjIpoJaDIIrFEv+m3hp
 K9Okso9h6HAugFNoMh7k59KXZg==
X-Google-Smtp-Source: AKy350Yav0SQe0tEvR6ZtIMRzAj9K6H8406yqb7Hzclv9sLARZM1w9Vr1g/iMuC5RnPGGtv3bjO69Q==
X-Received: by 2002:a17:906:149b:b0:948:b9ea:3302 with SMTP id
 x27-20020a170906149b00b00948b9ea3302mr1901974ejc.1.1681552700850; 
 Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
 by smtp.gmail.com with ESMTPSA id
 gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 02:58:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>,
 =?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Sat, 15 Apr 2023 11:51:10 +0200
Message-Id: <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/6] dt-bindings: watchdog: fsl-imx7ulp-wdt:
	simplify with unevaluatedProperties
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

Allow generic watchdog properties by using unevaluatedProperties: false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index d3790f1a96a2..4b7ed1355701 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -30,15 +30,13 @@ properties:
   clocks:
     maxItems: 1
 
-  timeout-sec: true
-
 required:
   - compatible
   - interrupts
   - reg
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
