Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA89087F7
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F4B5C78011;
	Fri, 14 Jun 2024 09:47:00 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AE10C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso224492366b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358420; x=1718963220;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dDzTOCTa4HJwR4/y3cSITmAiI012UOCdoAFLWrMKEdw=;
 b=p+4SMUQAsU3IMgR57yk9Uq8B9mH5KpItV3i3jwVA8bdsNSrE4PBF8vR6aJOqMUtO/e
 4UrUjKF7QqLc5oG+FnU0UexhxgJN4HpOWBu08ugqoAo1QNzDg/uAOrGtwd4hmlIIxsLb
 JBjIt3oJkIoS5We4IOGfJ8DrIWb06ZKfd18bvheJihDeg/kyTaSnaSbM7+MofGZ2TcLv
 KWVuJIllilCES5tLmZdHeOhVqDdVm9n2HmNIHrnV/jt8RWpfELDUMq+xiPAIcNFvIrBd
 fqv1qIPg+HB0hk1Vz+a4LMxTOW82ikWXGtNOV3hVDmm9aUVSPjXNLzZlRMXegaSFJoeW
 phrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358420; x=1718963220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dDzTOCTa4HJwR4/y3cSITmAiI012UOCdoAFLWrMKEdw=;
 b=YfWxC7aTwM7F3EUL4Nm22FabyTAddu0w75NN2RpMieBTdLI4Q+2dgrsL5Y65c1Gntc
 Zszj+yngKxG9J4yBzdmO9b9hBGwoB08TjTh0DxBuj6zqupq4hyYkFEBUgLsNlNvieaZ8
 PlFGXZnixN1f9fFYF6LkXHqlJmtgJvnxDf4Db74KwKOT1s3wOeaqkKB7cJBrMLQ8D1U1
 djlPyjOWbJCic6NMdvCO93vqUZiXC2wtj8nMvHkxUql+K4J3QV+AzzCkenvn/OBUFhyg
 puzrDiypnOICMQdbZhL5ot+8qMQUfyjx7bug50xQ5K+IPgQDkFAvHX/dB5hIBjckwnBM
 FjwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJPnUFEL8gb0AKfQJSLMK4+pg6BNMVQqqq6PF96SdXr1DJYrdenuWiSNMM2svCQbygrkh3AXNMGj+oG6+9pMNUR60hfQ9fCV70ScMC/QQeEbj5+0r7F0Xh
X-Gm-Message-State: AOJu0YwZySoBqfaG1LVk0SPX4GnR8C2FU6cekm+AkCiDzzCx+GNduYWs
 2j5nzPZc6Cls4ZvXb4uXoiBjrUcMfZvFtc5t8yn4A66uE97TYX1qUbJF7uUg8N8=
X-Google-Smtp-Source: AGHT+IHhkyg88ZBx9XhMDtFiqgUV4Rag8J/EJOgSqpavN3y+auOUjMfbZQ27USxrJdLN7rF9YSoJ6w==
X-Received: by 2002:a17:906:710a:b0:a6f:10aa:9c3f with SMTP id
 a640c23a62f3a-a6f60dc8929mr154328766b.54.1718358419616; 
 Fri, 14 Jun 2024 02:46:59 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:11 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-12-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6K88OrzUlGKwU/OIT91fDcYr84l9rnvsFelXhKUGuj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFqsowHNS9EMEGb3wL4geaYGfXVspaQAvTpg
 JsPzU2j5jmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRagAKCRDBN2bmhouD
 1z1kD/9IUCDeffbNBN9bpMVJ0DiYXdqHjYtE0sxmsol/oMd2LeKdcEW91r1jkcXS67PrsPsJugf
 2wnYoYHmD/cihlX6pZcYeGos7YlWMhbiK1QmxDz7j5+f3b5D437pOJLb+THCJZkZWUBPb5YpmZs
 pQkwaxDIGiULmQrWDb6vQA/6+urQZWCUxTB+CAfQykgBgiJB7yoY9HKFugY2P82OMPZHw4+jws/
 I6XeZbxQaXRuMsn+Fjt/eZz2aVocpoq0Q1LftcrMLw0Gmn7fovh3SPdabv3b8ISxzrxTG4qm4EO
 8yUQtBc5krW4nk//Lj3kKH8LBQZ6a6nQqoLgVEm21HtLYFKDqw1BBW8aBoLV04Hga5YUBkkgLUt
 fe0e1gqURCIYhU2TpPrjABlwgbidr6MDQOTVrUd4GQGTO9eYZg/rgVMHTG8y7KLUqbjzou0tBj9
 zOwgcS+XOPtTEW6vccmPPz0BRKP0F+K1BqR7DWw8c1RMqGHDuJuYpftHMRoOx/ATTPqlBG6VT6M
 XKANnL2u4BxCUH+oCpM7jVyL8JYdU2G6eXA9jXZE3lAEj3n2tNY2hyYKlK6Vl8WTu8WgIah3d+O
 FtirAA9jo7GtIKGUvNIaOysrzg6yGFS5m1Ioes5P5iGPW/fPhF+llIcTwhmH6symH5XfIq0Wxr2
 vmHgozeGpKX2Yag==
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
Subject: [Linux-stm32] [PATCH 12/22] dt-bindings: thermal: qoriq: reference
 thermal-sensor schema
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
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index d155d6799da6..1876fe9555d6 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -9,6 +9,8 @@ title: Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     description: |
@@ -68,9 +70,8 @@ required:
   - interrupts
   - fsl,tmu-range
   - fsl,tmu-calibration
-  - '#thermal-sensor-cells'
 
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
