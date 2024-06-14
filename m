Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E59087F1
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26301C78011;
	Fri, 14 Jun 2024 09:46:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C87AC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:48 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a63359aaacaso290902966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358407; x=1718963207;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=;
 b=p7e7bS5sMypjU/tz45mU3QZzAgK6TccTdOu5fsibqqJMiYoTC9VJaFwM4B0zWLb8h0
 0YWFdoWZFb5sr3SogCGJU7XVfJ0CeKZZfajq2F6JA/T1kfB8YnkPRk677QfTsVwW0C1P
 gv/G0ysHzZha4hY3D/y/0MiO4W2EZo2YPHdV59bJB6keaoHKHGWVIEwQOpxh3gQ63B5a
 /EwLh1NJDzO9hxkQIRtAypeMqWSC6xE6yK+gZzVKPMmDksvEX9Xd78yazYiHDe7eCvfg
 Hpt8l6p9C0K+AyloVgXrrq1k7NcEkAxeucaPszHvT04EfyzYth1O9Fhw2FkFQqInwvr2
 SBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358407; x=1718963207;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKBoYa2/x1W/F2+Gsm9S8Q8Wa9Z25/AVKvuUTKGCttQ=;
 b=lEdog1o3GKkcGyih73SAHDz7DNlhSMB5Up6/mglUMYQrNsQuc9LMC4Uib1mi+dl2gk
 VRm12CWEzILr2zczvZEN8/h5u3HYyzNQAMUkBAbqTrxAOT1MxZ4D5hLy8zGLKpSpKNE/
 xkTp2OhODh5+7u+5lPOe+SodW1Ysnt5gmVMS7tpSsD5g7hwCAaWU8VdnkCK6EkL5XfyA
 +0mdGVraD+gv3Sd3y3ACp3EtCtSdPjra5EyxW3Zre+yIuPjCt5nXB0SU7a8npqo5owvo
 IEVYfphsIfNHr3XHXo2twdyqQfpKCM2NnxNEs0Ih0fYjNDGHFfwxolVA8NVNp+YsTGfS
 mtfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1dB3+IMTU94fyKDvFHno/0NwS4RpmlhxdpHSkMGKElkzjsxapZs6sllbLSCiNJekAMZwYZVCeHhHTLAlNT0hLWaNXF5cDO/eghm6JoK+/XUQI3vxWT3r2
X-Gm-Message-State: AOJu0Yzs61G4caPD7oqKaJyQ3V/NvVuDvHpAFeQ1DqJBRu/237jwIb0C
 iA1eQUk+VQWByc7yusWYD8oaT3InvkTrG2rxPaWlB0zNJiTLlW9VE2qLFcK8iaE=
X-Google-Smtp-Source: AGHT+IGNlFyay8kOem24vdynFYgywyyZVSux+W6+RqwMfDi8eHKZ4ApmtC0R5UYkH/YsJbtiKWjL8g==
X-Received: by 2002:a17:906:c24c:b0:a6f:5c34:34e3 with SMTP id
 a640c23a62f3a-a6f60dc8a06mr152321866b.62.1718358407588; 
 Fri, 14 Jun 2024 02:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:06 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-7-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fPJBLqgC7318fFf2Al8T2+5gAe2h9ujfD/RlTMTvaWw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFmNf1yVZUqHe6ObrZYM4xsaIvMyiTnGv16X
 8eLBmKrFhKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZgAKCRDBN2bmhouD
 10HqD/9YU2o2Db6RJtFXb6VGo0dUKqGzbKYA3Mdmk1MVN+dZ7Wy6EUb989MBdxWjjNljpO44Du2
 UknQbF1FcW19LKcDSAIX0ES2dU3P4VWocs8UO6zgFVOQBHWGUa26u9u68RmEyBP1ilQsqwVpjco
 kPJM7HbNEWxxbVMRrrx8TNpz9QGSWje4itnmiFUrw/wOWdqhi7fMij1Ru5a9Uw9SNRDmpiEExUE
 8aFQ8gO/dkIQOxdGbdhTMQNBwhud8tdMaNjnplec9i2iO246I6sde5KAJGmMlCwj5FAYu1edvv7
 fGe9B97J/X2ZrqPYYGInyYquT4lmEwgS1aEBcff0AK3RXm7LqQrzMOSnCUvf4xIMWo/eS5kY37v
 yBHyqQ3+B96ONbFWpXUsCJc9xFQS2ECzvbW+v0HM+ieI5tN/TAOZUDbLK/cnM18QhISO5H8U92q
 ej2R0T1/+55GLp6ZgOPU5yX+RZgzFthAc3eRibixzjFvCldYJUGQXIDWcKVfq4aOI2YVugjpyVZ
 s7Dfk491xtZzep9zpwKR4UTrMcEHdjcIH0aiMy0zxq1SKo0H9+bXWE11SZgA1DD9Rp6OPdK60+I
 09YqIgW6C799e75K2VYN6K/uDMmrQmys7pmrtJfEIJIdU3hcXV9mlxNLyPGUEEn7jEgq6ZpAvsg
 PTevguPNxftPhXw==
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
Subject: [Linux-stm32] [PATCH 07/22] dt-bindings: thermal: nvidia,
 tegra186-bpmp: reference thermal-sensor schema
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
 .../bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml       | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
index c91fd07e4061..978b9e6ab8a3 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
@@ -20,11 +20,7 @@ description: |
   node. See ../firmware/nvidia,tegra186-bpmp.yaml for details of the
   BPMP binding.
 
-  This node represents a thermal sensor. See
-
-    Documentation/devicetree/bindings/thermal/thermal-sensor.yaml
-
-  for details of the core thermal binding.
+$ref: thermal-sensor.yaml#
 
 properties:
   compatible:
@@ -33,10 +29,6 @@ properties:
       - nvidia,tegra194-bpmp-thermal
 
   '#thermal-sensor-cells':
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: Number of cells needed in the phandle specifier to
-      identify a given sensor. Must be 1 and the single cell specifies
-      the sensor index.
     const: 1
 
-additionalProperties: false
+unevaluatedProperties: false

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
