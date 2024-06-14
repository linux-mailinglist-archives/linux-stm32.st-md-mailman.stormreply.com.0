Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7733C9087F3
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A36FC78011;
	Fri, 14 Jun 2024 09:46:54 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F9AC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6267778b3aso196327466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358412; x=1718963212;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gVGhPsD6Qfn4mBoK6MEbCiA4reC20IqmZAzrPH10YVc=;
 b=a4RWpHoMNHzPqTUIj532Q0u7gmWNUbGM9uyMgnV0C9aoI+D+GXUfiipFVQ7MGHjrx1
 DcXcrCzJdidFm0awRQSIIgxtnfwICm6/DQZF95nI6Apt5lqDLHLkqUq3gwR0Peq7le3o
 9HoWyO9+ptq3TMsXJqPXKNs0BJxOiAEx3/u6SOsPodoIO7/KBK/9Q7SQmPEUcxEz4S++
 yn8ld7srTMqtlyJQYd/2TTvhns8SexXgAf4MXmEnAi7a8O0tLijzvlE/PGI+9BxTUn/y
 gS4WVKn51OQK4TZ1p0xDtL5lO4liLnK6yQLnqEGwMAW4H80JzuRbaCK1wB7CWDiyzdxF
 6ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358412; x=1718963212;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gVGhPsD6Qfn4mBoK6MEbCiA4reC20IqmZAzrPH10YVc=;
 b=YPMevvodZclouRt6gowPFPzV+rchH8RdHd6Y0BEiHI/wwDEdPsLHESSErtbykID69X
 odDFTdIxzgil880c1VYflkF7FCK3AO5t/aR1c7EZWfa5Z6FlrAgluKD8e2Pf65VID7WP
 Zlua/DtMNzUcn185+wo6ttdDa+iGrsl52YDutaKxyvTI/tdNrEGCGGXmFp5RN/A3bubG
 CFxO26xIEEkoHHWK/htqJ1LrOmI/pnwBfKKHM2v+rDT29qzhqSXClsg/ETQrXCYB43my
 2+P2eV0qIR/wpoh755naTA4gDRnm6aO92MhLEkyw+lwvOHp6ulQ1gyMTeMwwqZ2D7i7n
 J99Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnksDyaqrVZTXTsuyPKvf/FLLLDXwbvtKPnvvYnGZZPUg42grd797dGO3qyD8Bm2+2Xlq1Zd/2YuMQSBlAM/3VSL+4pMKRwJ6VpR/dQCnwbRjXQWEz2Cey
X-Gm-Message-State: AOJu0Yxh8BnBmCh/4DZYgwZ8sxRuM8uVg8YYsqQ7TALLuWScvh5rHe6+
 7lJeYBt7eN+J0HysPbtSJ9PgyI6/mfQKlwCbN2agkkKCSgmNLgTiH0p5XAbdpO8=
X-Google-Smtp-Source: AGHT+IH/LDguxtaznqvBqHTXoDXKR1YtqV8s6Uw3ZXJ5iaYlCO/PXU8Q0KzXgYZ1uinkHqB6v8mPPA==
X-Received: by 2002:a17:906:d296:b0:a6f:5c1a:c9a6 with SMTP id
 a640c23a62f3a-a6f60dc1fb3mr131861666b.62.1718358412444; 
 Fri, 14 Jun 2024 02:46:52 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:08 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nByrzHQVmba7wlYPh/i+rKZ2wbIt+maV5ijzXe+5jvY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFnx2UWSDHo+/XWma/SEORKk1DYqhfHrmfFB
 s92YeqphpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZwAKCRDBN2bmhouD
 13HND/9ckrgPCXja3KiiMLzGorRecAp62uvkPQ6LsfsLVuRIxVjiHoY1BBKonPU6hWZAEq+Tt+X
 4jtQa/8unqFtVgfvCYPZaHXEGXZ6DLLuDD2uIuyvOuY7lH3Hw8UEq7f2ZSlkwvB/lQ6d0bPO6np
 RpXfva25J2qsdGmYRZAkcTYKzoDH1Xck9wgAC4vJjjsJodAfNuvSUhi+exREatcraSypvxBRRnM
 FDSlZQlQD+DHl39m+hwOw9I4KMUBErZu+LPP23ycIiZKZVIk4MUwW76pHHW1OyrPcgWWQsGKpDV
 7fAk76yOzQzGcT+87ZIEwo91EqkfmHob1lIFftcZXg4MbGupo+WohmuGnEmBF8zM7XFBR6CzfrE
 kHhxFb1fjy3y91+BRv61A7RIeUUSEIxGqoKHwZsgd3/nuaNszYOuEkLaCZqz38Gq9Ze2Tk03Fxg
 c/6myrMsDjdieOWmmWuAa4uE0kPzlp2s1Io22FVNjayBkBtFXx6LBSbavJAKQe8Cwn8bUzp++xM
 r5s66EvGxCCmACdoC0MnSf8ZSnXZ5N4QNP9AHBCpDEWs8ZyanwkYGJdbzcZ7T8hv39/azotgYH0
 gHWysyp8Iyi/dtlOwbsGyUtktWZHejwFVbnMm4lATDSFN/g6C7e+YKS//Rk3UWh6QHjk9w1Jlqo
 zXfuMK1rXijC2oQ==
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
Subject: [Linux-stm32] [PATCH 09/22] dt-bindings: thermal:
 qcom-spmi-adc-tm-hc: reference thermal-sensor schema
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
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
index 7541e27704ca..bfad8130a042 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC HC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: qcom,spmi-adc-tm-hc
@@ -20,9 +22,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -106,9 +105,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#thermal-sensor-cells"
 
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
