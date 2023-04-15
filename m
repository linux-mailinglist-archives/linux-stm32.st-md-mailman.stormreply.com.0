Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79F6E3046
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 11:58:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14AE0C6A613;
	Sat, 15 Apr 2023 09:58:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564E3C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:58:26 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id jg21so51350791ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681552706; x=1684144706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
 b=KBrssLMtLKmsLeebg43o7A5lMW1PVjr0FL9EGnzfptlfeJU2+O2WNhBQ0HFo977Iua
 rcld+cXUs9Y3HxWGpMiWcxuAfuHnC6x2cl+2qmiauB6x3msu3sypy5NK/yx27mTj9y9H
 Ewx0zS9sHKphX1IM5mkG+xkB6sHk7sfp4o4noyPWiYZEJSHxddoi/P8z/eEN6vWGUkfS
 YvSlcUyBbUSaYJGQsDy8QWLzuLGdkAmSAIUuNvqPRl4XN5crob1qw9uZzXUe5YMUnJhX
 g80zIJJQURIGeGysIlmkHk5jlgHtryhPW/OjPjPmOckvxXqsnLQS//OqqROjirbCPdRq
 tmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681552706; x=1684144706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fr2pBCD6umNhczQxq97ewzN+14iVAoxszUR3df4m1JI=;
 b=XHO8Wbq8B+OsKGXMcBk/K2kuV499oSbPeZf/Sh0neZHirGdY+2+UQqbtdvLsmJBD8D
 IJoO/e9eroYumG/eEoMUQZOpR8PdKYXfSydlz6Ail2vs/JWM2jd98fWSysDwsDC30+tf
 7VjiYCUAZtIjqApFnYwDxPUSk6DsL+vZAdt778JcZ4BJz6npDP3eoLaKiqoQeyhmX77d
 tvClDkrwLF6Wb/Vk7KsqA7XbwoM521zvgi7Oqr9Nd9l4myCExNRMQpzL72iow9yCCM9Y
 BpjX+1rhC4qIEtMusnr6ESNvOhWRLAyVRWNF22s0n5yoJt01NaUUw6rU4EO8OYe41S2h
 cSEw==
X-Gm-Message-State: AAQBX9cyLtIOTLGs2WIWtHBpvZ5+2vyv7Eb5SQGoUfjfJ/qJlpEQxZvc
 kttB2s8+XKWAB8bbcM6Uc9hc5Q==
X-Google-Smtp-Source: AKy350bZWvNaGJptFPLSmIHH7cRbLl7V6f22Bt1WbL4mPTQOR4EbC2AYcFac6G7sc67vcTz0OtrFlQ==
X-Received: by 2002:a17:906:b788:b0:94c:548f:f81d with SMTP id
 dt8-20020a170906b78800b0094c548ff81dmr1404066ejb.71.1681552705946; 
 Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
 by smtp.gmail.com with ESMTPSA id
 gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 02:58:25 -0700 (PDT)
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
Date: Sat, 15 Apr 2023 11:51:12 +0200
Message-Id: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 6/6] dt-bindings: watchdog: realtek,
	otto-wdt: simplify requiring interrupt-names
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

Required properties should be listed in "required:" block.  Since
interrupts are already there, the dependency of interrupt-names on the
interrupts can be simplified.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/realtek,otto-wdt.yaml        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
index 099245fe7b10..1f5390a67cdb 100644
--- a/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
@@ -67,12 +67,10 @@ required:
   - reg
   - clocks
   - interrupts
+  - interrupt-names
 
 unevaluatedProperties: false
 
-dependencies:
-  interrupts: [ interrupt-names ]
-
 examples:
   - |
     watchdog: watchdog@3150 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
