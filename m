Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D09087FF
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2D59C78012;
	Fri, 14 Jun 2024 09:47:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8921C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:16 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so228528366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358436; x=1718963236;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
 b=bhVQrb1bY2rIMIMocqpcou1IIfebCocFHyWRLh2DJPpyBb69G36s68jxCaP4y6521n
 XrSpLaPiyUwShP3seqcHFfd13at06Mu/2nhET1BgLcTYVxo4xKiDpKpV8qWlDm1MUDGA
 HbzD9v+eupuA6tqUs4niIKFpyjthdExnMoHXx+y1G+mn/HI6E2kUzfeUcpwl4DAVLybB
 kxonk58cubymHK+7P128GNG6WDeWlDU0OiGH1/TnvuHMVX10LAM5/6GnJZBjirSeTgKm
 xPZGYCM74ORe1VYfeZsvEYGBXM9bHV/6/JgvXEPvk0CFEHbogN09lJlGxiCq8qE+dO8e
 F7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358436; x=1718963236;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
 b=q4RivjzjPQZmYlxyiWRqNxt14UVupMfj9CFXag2ZSQDMFU2SfwyjeXbUwJda5YLZBJ
 4yspYC2udZjxoFSjpxrw7yLuvp3QUeto2zhzhB1Z+Io+XKPjbLMJD69jyPuycN2TYgvy
 l8qK56oBuuDa2lWu4m02uHLa/oO5TaiFFPon04Hr05O/sLhqnKx2xykpXov03xS0qlmq
 NsBO47vY6dW4Ni9E7RKNvgeZqiI8VymZqJXXkMXbPMl2oGLyl0mDhPddNi0Gvrf/V9jD
 KJcBe4xmz8sRgqsGq9GALbJtLCxQ4NF+O6ttsYz2WuMHrWkKMxEo4fGCPotrIdv4dj9a
 pasw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcE3so3EC/nR76QrJAYHHxNmZWRiUapSkrV69E7mb0HRnpBHEl3S7bIiOi+lzUCjDpDLBCveWiGwWGIWchHJigo0rLHETa4vm9g34jjcXto739LREbZKkZ
X-Gm-Message-State: AOJu0YzPRr0wsT7gjfuDQrTOAkW+/eoGnPcGkcGIcTpFnlp8JanYN96A
 kxguTFoRRgzr1xLnQuXnWLoSFm1DHFKgA9uGlrdlzAbHtABa4gG4QPsyY4WFH8g=
X-Google-Smtp-Source: AGHT+IFYhCUuIW/shPa24Bm16cB64oTNa3LMl0BHr5SyTcIcKZ2BVmCvxjUSzjAK1w5nMGYHiOtHug==
X-Received: by 2002:a17:906:35da:b0:a6e:f6bd:edd9 with SMTP id
 a640c23a62f3a-a6f60dc51ddmr140028766b.59.1718358436151; 
 Fri, 14 Jun 2024 02:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:18 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-19-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFwqmuRGwyBRQ3wR18ecSX6kfmBdIXE+Ent6
 hAKRj/Sko2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcAAKCRDBN2bmhouD
 17hkD/9OxjeCJICdurLShHs5yp7HzuR740CrmJrC7McgPnyp8ztY0sSwbQvwGeRuMsaxGidE0J7
 xqY0L6Ioab0oY31XiF1QnateecuxDA9T1PBUpytt4fbqwY10Qo5yKBPBX4OBCNAvwl6BVE2Me5N
 4t7i4RblHCch1dz5REf2XLI28pklsg0B8zZIVH4GGYVP8w3Zb3cg2gpT8O2XBsi5teF4w2pPjYW
 E+yohdnJv/uikgyAzHZ7gYKicgkaA48sLZKA9i+UyrTEYxz3xdC+qIpl0SHa7U54fKUpvIuL5tA
 1ozQi0DgXwHEMJo7Zxpkx823UnjbRynt7urLGgk2Zr+mNj1itWuyxVMw9uku7tJrSwBAIPgSXnC
 1GWhPTu8jS10dmPcl8LxdQMZzbOSiV1hdWeDFvFxEXkY3DHy7EaGTkRMsSqo9jJzOpLq/OxqFSa
 1Bd+lZllAcbV4piQt3dFG2rqt2/HHqyRzp58F8D/YSexdS8VQ2cU9D+Ibljv/xuvluLhIfuoVzb
 T7/0Whyrz0JrF36X67nkYcnekOy+Htkzl3/sFJ1rj2eXxrAEZeGoootoY8/rwk/+eAUHpRhd1YM
 STNX8eI0cUshXtTfkxs52lVyh6zDP4i0jhk1mN87RJ2/sQgDita8xLImSYHC7tTKXeb/34qVmbe
 OF5UQMHSan3bk9w==
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
Subject: [Linux-stm32] [PATCH 19/22] dt-bindings: thermal: ti,
 am654: reference thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
   - compatible
   - reg
   - power-domains
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
