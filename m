Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1A9087E7
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC752C6C83A;
	Fri, 14 Jun 2024 09:46:38 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80541C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:33 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso311282066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358393; x=1718963193;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=avklu/LU82jj+cALxmDCOm5wOmtJui6AiuCC9bJewDI=;
 b=sE5/kWX/cgLv50EmqLTjBf9gxXOwmtQN78+cLjid2l/Vykw0zRywspjVI/7ydI33Sw
 C/H0oe2gwG+cEFHdokILynRco6UIQklb4GJZKBZd1lHeuei4/3hW9lQ7bP1ZKliiY/CL
 yfeujpFT5QBXXPoOW6BmwikdKwD/4yQf0KODzpgEZ683YQq2q3YdG9IRF38+NXWgzNK4
 PHUA7Nbb+/bdf6f5asbchHUZKinTPyztkDrlLuQKyFEnHhgbsyytAKBsYEkH42XZeJyM
 z+sAO0JRaPHKXF4nTCX/hG+HbHf8Zgl1bauK+tNLwIxP15ESzdYfHTpzEX9fCAMDGplo
 S/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358393; x=1718963193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avklu/LU82jj+cALxmDCOm5wOmtJui6AiuCC9bJewDI=;
 b=W8XnnYYTeOs6ZUABlV3G5pYq7/048u3o3hhL8VluRDuo7VlLoSo5JkNbIjiq3CP5lT
 VPIr5nbDbXkLa6mhTerl7Qh14t82ISI9fiD6dCOSCZlCiuI2XuQF8qX6pxWLuRs/tPwM
 qZtrROZo8mYuIwLsyfVFXtgmdMoBvWVqn17TKUOZGvH7A6SRT9u1ciMyMISTcyxatD2d
 QWHjIxhSYHDXUUyoWd/wngASUTsLUwcLLNMRHYHbIbE6WGdDvU3ak4pmje6CVuXUrCLT
 ccfFtphMlFAaOgBD7o3HyuCkE7I1IP3YQHb46nnRkDPGn9uA+VtHVrcs8zx8KRyBaeoP
 45cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtUd5jnNZEwbqpuoWI65sIf4Cj3hGOlFLmXZdLS1GWAuc4azX89oECpTlbw+rm2z7myRlKiYRtgoG2gNYXD2WVOfKE72Gr611qP8YHy9DfFQP5DZdDmtAS
X-Gm-Message-State: AOJu0Yx6RojR6KSy8Co2uUx7UIR+PlCDE9xlxAaAzd211Duy+ScFQcps
 fvM5sCRHjw7l73Hhvfzu6B1mgSkN84oS45+FpfWB8EJ7X1bANG/7OQ+mqnzNZ6o=
X-Google-Smtp-Source: AGHT+IHc8zNmRNPYWsXhCA7MoKknrWARGiqEErjEA7EPJiugC3+uCcXA6vzUtvvo+0m41kAXSMLaxA==
X-Received: by 2002:a17:906:4f08:b0:a6e:2a67:7899 with SMTP id
 a640c23a62f3a-a6f60d40d5dmr130599966b.35.1718358393130; 
 Fri, 14 Jun 2024 02:46:33 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:00 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-1-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o/ohlTOc9KfTRaCPoCM7PQRM1DXdEoNuRz6NEcHjNQU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFgD+j2f0+0l+ZGzVoLt+GTSfmeFZ0/xFupz
 gM/exa+G2uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYAAKCRDBN2bmhouD
 17UWD/9rPKTI+tMaPQFTlp5uhC2ZDUXtE+aHbXinp1xfhtKaGmRXZPjkC65fY77bv7i6yQRv6gt
 /fKHWgHUfbeZwaa8sLIoWVjNidarMXil19RyBVVS/TUZFDeMWnwjS+fm9iXKBUfRnpMOa62TU2L
 kkmSUExzh8qJR94p9QbOi9X7YjUrb+tLj9qSxHZCpOJ/Tdz9zxla8stRMJOk7zk3ngsxw0I54LY
 /kRWdB7QRmRL9feq2bORXU69Cx0/+IBI6OVYGgJgd47ZledM5Et8RdHsqpmRAGIdHsX56i6cvDj
 GvicuzQdYQdru//vJhKlbkaBs9r4hB2ytrjZlnPAupY4zBvVtemJlddl75Vp4oD9xZAWBk1UfuK
 03b3zwfPFtXs5BevCXwZbKrem/YxQ6hPUbqJK3mAjXEltK+Pewe41nrPZvc0H21JDLVZyAM5CJp
 cbmIwvpjsbfRK34Si4EHtZlToTQe9CrK/mWbJqZbSSes1wvnu61YYbpR11HXj4DweUK+XMhKcUk
 RITKeqd9PUnTBvThlRPuhVi60hSRoAhu7LuVwJGyP9P0c1Y1B4FTe3hJRjveJ+5JqrUpXFe9GRf
 BtwKCcHO6ds3Kt953XlQKlzs/QRPAPvl17NBePvebpKqc8Eg1YIbWfof/OGSbv5cAgmGm3xm2kD
 K+P00ork5CoDpvQ==
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
Subject: [Linux-stm32] [PATCH 01/22] dt-bindings: thermal: samsung,
	exynos: specify cells
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

All Samsung Exynos SoCs Thermal Management Units have only one sensor,
so make '#thermal-sensor-cells' fixed at 0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 1344df708e2d..29a08b0729ee 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -61,7 +61,8 @@ properties:
           TRIMINFO at 0x10068000 contains data for TMU channel 2
     minItems: 1
 
-  '#thermal-sensor-cells': true
+  '#thermal-sensor-cells':
+    const: 0
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
