Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1E9102E1
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9207BC7128E;
	Thu, 20 Jun 2024 11:35:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81312C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:07 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so8046595e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883307; x=1719488107;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rm0p3ifM1mvsX1ZP0z5AtqzhzB7gV2tVDLMJERR6NCI=;
 b=dLtGOUr62sQYD/NG7x9utPLS6SsWwS88kgd7lQ6YHCwlzqxq3+81JHMLl9zDc4QghN
 qM6wpf3yDsLI9C7eWiykJ4werhQ6r+vUqlLotscM3+aKwLurU88y1/mMbDD2D9J0wKMv
 zSD904GgF3W3HqLQQkgZRmMwTUTYtpwV7yq01WRzxaSciplhI8CeKXa85GpwUrzI1vlo
 4l3PjauLgSjKZE7uGH7rMp8VLTEM14JMVlUvfsf4uxW/3jheitLpt0thHIkJDSX6B+Eq
 UDf25vKqu2y8katJjt3ZblitPV+FuerntzbL+9KuICLvfbQhmG+yRFkjOeVv5hllEsOV
 d3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883307; x=1719488107;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rm0p3ifM1mvsX1ZP0z5AtqzhzB7gV2tVDLMJERR6NCI=;
 b=uhYJxh2sFSMA8lzFnckqGUhrmJeiYHeS2G0Exn11wj8HEExOKNYkcYTqlCdvjS7ICl
 tKWiUOC5D+yShA2AI3w0COHMO360Lh6gb9VwcF8/Q10aVSBB3B0bj8jIhJh2gtecEiJw
 GbB7VpZVgIsv1Jsdf0aylFK7e447YMLCU2JVbGYsu8F+O7lf7tfCJefg7Va5ZHFvX0qv
 APNvCq6QKJKvXLxkg+j78QiR+5dYudUq92GVTY7hQVdcl7BKrEY2U6YYOrPZfnf4n/hB
 BBEbHjXKodEoSnjNvlVrOSnZRwhAikY5yP9/EtJHxFBGg91dCpvSy8lagZd5xc6wGgP+
 Apvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQYdwD1dC5i0i7kLQuRGEt+wWtIwh6jFBThMrI6EiEOoxqX/iZbf1Y0MeC3pGmasTKYz5CMiiydeCJF7aObWh3du8gKnbZRmOoRcPeVMwfhC4Tu5MUAtai
X-Gm-Message-State: AOJu0YyoLDFCydYG8V8SYahcteDdYS84Z73ICZr6fGzlDfvYh2B7PtG5
 cSKtzalG50lON88YUXBRG0LCu1Q+ikytvtiJutCvV8C2kBNdWzBq+T8WoQyCaRo=
X-Google-Smtp-Source: AGHT+IGITfCEpwFct/l4OjaPbZYnxzu8jG4aF3Etd4mv8IL4/vYQZk/8aqDfBzKmZssKsLb26FIdcw==
X-Received: by 2002:a05:600c:22c3:b0:424:7615:ecc0 with SMTP id
 5b1f17b1804b1-4247615eed9mr36879725e9.6.1718883306600; 
 Thu, 20 Jun 2024 04:35:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:49 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-1-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u46DXMnnV+4LGWHLSY0HJbWET1X6kq31L8FmQvAWJfo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPfKTxkgSWFS16ttNrSkHVD+KfF9UARnuiYo
 p/Rg1/qfC2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT3wAKCRDBN2bmhouD
 1zFeEACRB+3buIVB42wep9GrsWRJvPAbGfU1NiSOwOWMl4acBsi/Ae7Sgi5W0g2LptUCrzkfkGQ
 xUD/SXSg8YfnX4nS43j8v+T6sdKojb/YDnwydeU4dcZ3QiXwDOFXKUYBhD1fDg+H8nj/Bf0ONL8
 5ACzYaz7KG+UibU9qrO38oQZRUGnnaQZziZ5PPDbdhKmJJMR17dJm+j5b95yf1vddig+6q3EXyB
 3Pe15ZkAttWaqygCI9BzVdJtRI+fLyuZyRElgrKPHFiRUZ8CCQraImgzLMPAiImujpgWBw6S3gk
 aQ7agZgAsbtcx5zTS6OkpIjqKfTWoiJ2mLhllJ9K7NsaD30I3b7zZcx8xdf1RgWVcites4dLQ/h
 MrDNwXUxJ9+OCngyaGTvvk7S9Ue5pkucYk3Xkh3sqgGmko1AnAHHJbj9/4OEf6yDuMqerFsa+up
 iXraRVe4ss1L9zvciJRhJ5/GAFq8b+9wNKpOaQJ5E/iwdSQP6GwGQpG0EbGqavil/1deI6DnXYq
 ojQlij3BgC/stXMg4mA/56o/2yDjIKup6nrl+lUWebS9+DV96Mnmw+eb8KxRc5df6fogfVBRT3p
 bjtUkCU/fR5+IQyJkhrqTIcDZsveUV/E3H7/oiFIk/ShvLXbcGQuuBd/y1ug0McV5mw9W+gKcmu
 3xrSukroiOeO5GQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: i2c: atmel,
 at91sam: correct path to i2c-controller schema
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

The referenced i2c-controller.yaml schema is provided by dtschema
package (outside of Linux kernel), so use full path to reference it.

Cc: <stable@vger.kernel.org>
Fixes: 7ea75dd386be ("dt-bindings: i2c: convert i2c-at91 to json-schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index b1c13bab2472..b2d19cfb87ad 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -77,7 +77,7 @@ required:
   - clocks
 
 allOf:
-  - $ref: i2c-controller.yaml
+  - $ref: /schemas/i2c/i2c-controller.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
