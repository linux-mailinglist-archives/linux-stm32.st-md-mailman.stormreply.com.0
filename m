Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC379087EE
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B803C78011;
	Fri, 14 Jun 2024 09:46:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44D64C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:43 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso266157366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358403; x=1718963203;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HRsblTKIKueUASpgZPIAhHvU/Xf2tJR2h/CrNqwHNsA=;
 b=cA/g4X8XI6/6heXS3Ch+sPlmclPO4HIPwjH3sQsNW91v1nGDtiDG8kAm5l00AT8Ljs
 LRg+16BJGO/VR51q4uU3WeM0GloiHVztTgPkyIK5Uvl6FGTra/1NIe4BZer2jGR91rEH
 3JSU4OtNinpQlJUneY+Bk0lty4dgGcjG+4lWLZRISF4EH+LYOQteywCFVdMubgaUBLZ+
 Rg+/MRqwC7cBIH33sEkHoSrIP3fJbZO7hOkmy4lXPGVMQiY4LKJbgMs2kGDDHpkyOMxl
 1wnKPK9P7jpoUqMnoEwMilqBLePUhldz+RhrhOSFURZ+suBLI1/aRCYyv0sDH8WNw8+a
 481g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358403; x=1718963203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HRsblTKIKueUASpgZPIAhHvU/Xf2tJR2h/CrNqwHNsA=;
 b=P906vCaCKazHmIvdHmtiOt0xkniQXWFQ1vl/1e9PU4fmWqq76Mej1CODmWjF8Fmwcs
 2/l6+nrhuO5g86jc5BsAlvF2lpoThK7hJhriinf/NH+0NKLohesstb+e3XNds4TwFkof
 8666kIoPMshUcHYJt9QfY3KKDzfI/THM0iU/4Jptem1+MMkrs+Buk3SELJbV94lY++0u
 URLWyq10jpFNyEKsQbB8Wz7Nn+Tpa1uiFcNcijS8KUMFoOh/iVAcnqhHEsvmo681pypW
 qQWQXoXsCfJtcDPOuh2KdEvo8CQ+t+huoo+GaC8/tiSBBp30byQL2jZaEu7Z9YJUPRQg
 g6QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHRco84bYLUr7ok/JacnUdVXctO+58o86v8KivY5Q7qQssoIf1RsMJxVaS1Wy81CJLfzAA3aE+GLpB8mk2EIFyNPpsNAwD0OTJiiM+gwXQoDm6V8nWyZtY
X-Gm-Message-State: AOJu0Yw717//QMawsLoPaXhM0Zbv9O2F/BztnxOQL74egYf3XZuyKrlk
 UDbDSvZrxUPzSgcCIEEBiQ5xBN8UKjuqdywy8/4gzhwZRuiFGo1TV698iN39iJo=
X-Google-Smtp-Source: AGHT+IHzdJCeAm+5V7F39Yivzvz9eVzXveA/g8tczDyMLlUBzFf2wYZouWpzoH3GkUNVdrzOuRHhVQ==
X-Received: by 2002:a17:906:66c1:b0:a6f:5fc2:fe8b with SMTP id
 a640c23a62f3a-a6f60d1e0ccmr134676066b.32.1718358402837; 
 Fri, 14 Jun 2024 02:46:42 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:04 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-5-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ai81JSuQOdlCv1p1Eoa8aLrKA1CvKqWZCg0pr4dpmPA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFk+/e4mLd8U5fNTEKa3WDi6sHWNOs+Kjv6y
 YiAHKkIy/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZAAKCRDBN2bmhouD
 18tOD/sGEt/+Dkm52ln4YMwmPWkNNxRx/rHJj4mdO3bytCygp+noPWg2IhLxNuoM/XTWFt10nzG
 0f79B1p8TZZorhJKb10piKpMEwop1YmDWDY0y6qPPY3AxEVqdIHcPVDccIBLIlRTyWTIAtK+sKg
 fpKPQxaUgFxyOgFBwmxKkUTqkiHtac8RouoPVnrtIf6CMweyHY6E9DYmD3x2Ughzedz1SClLbQM
 k432cdtgiPy6APeqO/xVvX/cUcT2k6CuwHRfXeoESe+oAzdACJbUj5RJNjL1KqGKwIT7a/fJt4w
 MG6ayvMJ1hiYn+avP6uBw61Y9aM53Uyx0iksXCzovSiCvjdDPDT4P09ZYy52nXIXohF6Ct3Mx/y
 wn4qE+O1akccWIwrVF/7qUIH6/KZn4jARxe7AWsqHjdbYqNuU8D84P/Uv1JpfNok0Q4SuAx0gJG
 woHg0DyS6g5TiJHj+FO5JQ3U/yfgRX5eJgc1VqmKZKMTaAmLWhsk9OVBkLiYbIlNnYVZYwtZm30
 Wk+hbyjStKbqzcCI42C2wy8tLAi6YBYcouKGxeu4FlOowRsBx51ZFr7/tOOxj3iKiKOzufxqFqw
 /O3E5fAHfmLVkX7w9ETIIgs8/YjdsPoumGfSdF8STZzrKfdIqKokZ/Fe3XoS7ltExAkv5uMmVWR
 vOx428/JGca/mQQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/22] dt-bindings: thermal: generic-adc:
 reference thermal-sensor schema
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
index f1fc3b0d8608..12e6418dc24d 100644
--- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
@@ -15,6 +15,8 @@ description:
   sensor resistor. The voltage read across the sensor is mapped to
   temperature using voltage-temperature lookup table.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: generic-adc-thermal
@@ -44,11 +46,10 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
   - io-channels
   - io-channel-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
