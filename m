Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733367274D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 19:45:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38DD5C6904C;
	Wed, 18 Jan 2023 18:45:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 652F6C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 18:45:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1855124wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 10:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utAAnWEqDvZ+nar543hXWyxMXHUCp5XsRyDad4J9M4E=;
 b=XFhCYx97n+HDJzxe+iB6DUXEtKjYXdmXc+tzD0D2nIypo0/UCbXRJdgme9+/TTKD9R
 Vf6B479K0ic1PkwUjbZbLptYwYGZbCXP0/sKU+Kr2WOY6nOO3qzhPkFkjDwWd+5jEKqA
 JqZFB/AV3Vkd5ryMlk6FcYrwJpy6PpLld9RmaZt/harSKRpcm/o3QcJTSJ/3MtiX12tg
 gnmyfjX284VUXZ83QVocg29BCHPoxWR2YStYuL8gMiqtuLqVIPSLfJSH+nkppKsMadHU
 15JnFaXigZ3/NpNkG1oHiUuHmsu2oSpQ68T+oOvLDezYJXDYCb2Z8Lb5dGPkTq3HbLBv
 M5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utAAnWEqDvZ+nar543hXWyxMXHUCp5XsRyDad4J9M4E=;
 b=E4hCgD5j+ZvpSp1xt28njTJd+1PlwhyIxwPMGwio6aO0yEodl5o3FD5c1Rn3uWGAhE
 pFGypWF3XC1lPL45LagJ82wrJLSS31LFvltd2/oaKsbexMrknGOqCrC8mbz7acic1Qfl
 d4JwlHpGA0TWSY40VHT+K/X7tsauGFpbNbQnhKUURKM3bxpy7XidfDTDDVSCk4YyyILp
 AbPj8Buxa6OpnTVau9IYlWDDKsZ/sRCLmmeghbt5LBCWAkKLTAvz4ipM9LD1erhf8bYt
 UDvFQM7iRA86VzFA0ALFdUUdpacD8PyGCi3unWxNqkzX+J9/6I6vfAZ4UWKC3snQSDs3
 jyNQ==
X-Gm-Message-State: AFqh2kqLInGsbs7XAIj8+oIQn+NlZEk9YyO+bgW1VoB6+DV3GsLc5K8w
 G/cNqWKlW4UOt8cxNahYJ4STGA==
X-Google-Smtp-Source: AMrXdXskpaf/iWMxPZZaBogusBgNElDx3kRWdeVaaeERbwhpclpRtco1seaspTwqi52nXFm3FDeYmQ==
X-Received: by 2002:a05:600c:3b91:b0:3d3:5c9e:6b27 with SMTP id
 n17-20020a05600c3b9100b003d35c9e6b27mr3721339wms.12.1674067501025; 
 Wed, 18 Jan 2023 10:45:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b00241cfe6e286sm31640325wrs.98.2023.01.18.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:45:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Renato Lui Geh <renatogeh@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andreas Klinger <ak@it-klinger.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Stefan Popa <stefan.popa@analog.com>,
 Robert Yang <decatf@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Artur Rojek <contact@artur-rojek.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philippe Reynes <tremyfr@yahoo.fr>, Alexandru Lazar <alazar@startmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Stefan Agner <stefan@agner.ch>, Daniel Baluta <daniel.baluta@nxp.com>,
 Harald Geyer <harald@ccbib.org>, Eugene Zaikonnikov <ez@norophonic.com>,
 Phil Reid <preid@electromag.com.au>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stephen Boyd <swboyd@chromium.org>, Sankar Velliangiri <navin@linumiz.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
Date: Wed, 18 Jan 2023 19:44:12 +0100
Message-Id: <20230118184413.395820-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/5] dt-bindings: iio: use lowercase hex in
	examples
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

Use lowercase hex in addresses in examples.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml     | 2 +-
 .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml     | 2 +-
 Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml   | 2 +-
 .../devicetree/bindings/iio/potentiometer/adi,ad5272.yaml   | 2 +-
 .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml    | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
index 714e48e613de..6ddb03f61bd9 100644
--- a/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.yaml
@@ -44,7 +44,7 @@ examples:
 
         accel@f {
             compatible = "kionix,kxtf9";
-            reg = <0x0F>;
+            reg = <0xf>;
             mount-matrix = "0", "1", "0",
                            "1", "0", "0",
                            "0", "0", "1";
diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index e27d094cfa05..dca6cfe1e88e 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -150,7 +150,7 @@ examples:
 
     adc@126c0000 {
         compatible = "samsung,exynos3250-adc";
-        reg = <0x126C0000 0x100>;
+        reg = <0x126c0000 0x100>;
         interrupts = <0 137 0>;
         #io-channel-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
index 88298bc43b81..79da0323c327 100644
--- a/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/ti,dac5571.yaml
@@ -46,7 +46,7 @@ examples:
 
         dac@4c {
             compatible = "ti,dac5571";
-            reg = <0x4C>;
+            reg = <0x4c>;
             vref-supply = <&vdd_supply>;
         };
     };
diff --git a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml
index 0ebb6725a1af..b8d7083c97f8 100644
--- a/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml
+++ b/Documentation/devicetree/bindings/iio/potentiometer/adi,ad5272.yaml
@@ -44,7 +44,7 @@ examples:
 
         potentiometer@2f {
             compatible = "adi,ad5272-020";
-            reg = <0x2F>;
+            reg = <0x2f>;
             reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
         };
     };
diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
index b69813f281da..3e5b7b47bcdc 100644
--- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
+++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
@@ -519,9 +519,9 @@ examples:
                         reg = <12>;
                         adi,sensor-type = <26>; //Steinhart
                         adi,rsense-handle = <&rsense2>;
-                        adi,custom-steinhart = <0x00F371EC 0x12345678
-                                        0x2C0F8733 0x10018C66 0xA0FEACCD
-                                        0x90021D99>; //6 entries
+                        adi,custom-steinhart = <0x00f371ec 0x12345678
+                                        0x2c0f8733 0x10018c66 0xa0feaccd
+                                        0x90021d99>; //6 entries
                 };
 
                 thermocouple@20 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
