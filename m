Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E79087FC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:47:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DE17C78011;
	Fri, 14 Jun 2024 09:47:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90188C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:47:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso360937766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358429; x=1718963229;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=;
 b=IMTj0oHqaVl0NbrVGC7xy/R2JoJCudEYLNuQ/c7qKI4gKa3fJUwsYzw5/y8rj80GW8
 9y3wq3AtXJZtrqhP0GHxeI44dXAxZg8x1NtL6FGnEHrI6ljEMbupRIgDCAhkAjChGqFa
 M9oG7snMFg+3wpMitTnYIMN5ZfryEMULpJIWzIqqmaNjDaUJ9DkrhmGDHsLorZtPJ8fv
 RDhNAx/rLABKlJHmfPe9obcBkgi2GI7H1MiAHgBPAzgbP8ktmdMIWayfrotJlxfwY/Me
 hPcJ1yYxR04aEtLtlQA7l1TxvsXgwz0+K0j062GY0Ac8p+Wqzzvr0bmDmGHsy3VF0mJa
 qMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358429; x=1718963229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ruyCgMrPfekzht/5WAzVWTMLmXSUd2VwxGSvpZZrV0=;
 b=hTW+ErbHlIN4gUobO6cENIXOMkLEbBZ8l+EuV2zxS/J1+/uTJWsRo6HfibQOE4hPFM
 xY4hU4uhEI9j9332e3kmZR0sAAV/Mdz60WKjM50bj3+QzDCGfmyX8PEXadU02f6AeByT
 R94gDDLnULBXoFNU967vWoeRC0lPhck5mw9aFnHWtvSTnf9+YC002ERSpobRqu0nU43Q
 l58S7EkWWrmU+xMuFXDtKe14XbiwKN3/JT6GWVDLAAVsRtaKbCFV5+c5bb4jDhncXavK
 ndLMteyZ8Ql70IMbPqDMSYAcB8JanbQ8RWflrJFv+J5uUDddOn0F+q5yQ6w/z+qOftqC
 TmuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZMA5hiRL/j9k8dJG7sLMA5FHBV6lwbiMbyVFZqKkmAZffLAl4VH1pUUn/XKf7OS4tOuGTdtygAk0BgSmUU5pl4lbDYBIv8iDHsR/GyKFU4iawYyr2Ksmn
X-Gm-Message-State: AOJu0YzeiRxQpbmPq4Aq6tqMdACA4gqi8E0uLl+6KE8l9c2xrXr61/ED
 1FNVOgKWsOemaBDBpiPXrCj9HAq6f1PtqlGO+NLxe+lG98/ZbjbJKqd4ZEqBIpw=
X-Google-Smtp-Source: AGHT+IGIKghrlULYLHsfLKde8CcadgZJW0YzgNbewj72+XW0ql1TiGTPFflVpMsUJxAghmYfIehKqg==
X-Received: by 2002:a17:907:9406:b0:a6f:1727:cf4b with SMTP id
 a640c23a62f3a-a6f608a7945mr189043266b.23.1718358428993; 
 Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:15 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-16-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mIeSyvnLon2ygamBuRDffzz4itb60m44w9O1qvVSAt8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFuGs5Jr4iu4ztVMLTV5UrKA/VmvClhsc3Nu
 /DgeeOEc3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbgAKCRDBN2bmhouD
 10rZD/9/pL5MAXa4cu08LXfwwna/wMuGScuABTPKkAA5rLndGvqQlFBBRMSephHRwgqXqp3Ifsy
 5/CCaVDAhKCkQSZ7NO0c7N/nnrmVH6VumgINouVuooUF/4kkzOqHy0Ps7bPuuX9QpkT3RY9wRLE
 46OwqjthHWuZc//DYekmQaF/L0qSJEk3SSJKGFVansCiaRvv0vLvluIIputqAPE+5A70K37ZVNR
 /Frtg4VKlW2yjKKwAjwvEmnU/KSO1gx5pg4fCsJwfJKoMqJbVrjPQgjH/08LIcfE4HCFesRhr01
 753qIZ+Zsp8tvJJ0I5W4fBh2Ycur+VCwGfHZNQN/D58/eRl64Rdlfriw2/Uns8Tt6gsabgnorj+
 mkIBO0w9/zygKNIJWRaL4AJTgYVLViyH5x9axMJvhcl4pNb5zE/ddX0PGivIvwblBrQcWTgdG4A
 FSTY2l4LvCmP1li68LdkKwt/pFW+2nj5LqhjXkXWLfUU8MAK+fO6ZuRILsYXJQX+5H6+Me5YoZH
 JMvprdk7NXkgNJa2Xcbrfq6/eTGzZypopRcxFn4T2nWjQ0SzNVZj4tetdcp8HOVXRUjb/j+JNW3
 42jZg3DaQZdvo7oUunA54ox/aRO7TB0R4xS7pxtdbMgf/pgqWTbfWEFsWnhgItUJjpazn9rqRnQ
 e9qS9o8tU4rOHag==
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
Subject: [Linux-stm32] [PATCH 16/22] dt-bindings: thermal: socionext,
 uniphier: reference thermal-sensor schema
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
 .../devicetree/bindings/thermal/socionext,uniphier-thermal.yaml      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
index 6f975821fa5e..8210b7079721 100644
--- a/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/socionext,uniphier-thermal.yaml
@@ -14,6 +14,8 @@ description: |
 maintainers:
   - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -38,9 +40,8 @@ properties:
 required:
   - compatible
   - interrupts
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
