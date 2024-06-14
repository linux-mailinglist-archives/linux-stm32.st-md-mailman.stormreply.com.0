Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280B9087E9
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 11:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D582FC78013;
	Fri, 14 Jun 2024 09:46:38 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 840BEC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 09:46:36 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a6f09b457fdso180768566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718358395; x=1718963195;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
 b=Jm62V3jmDoQWJ4l6E9/ZSXZwXQs6MtVHJibHQlFbqMG3b+tGIuVJev2BnsQSgDWarb
 H9RJXrwlY+qpbo6QuUGaufp7o/at6Lw/SGkU7qobaxs7Poqzwk0t+znFLhAhM72gTXHJ
 t2fNHkBHSUd63houBs2vr1n7QmN+E2x/jxWHEHoh0sZ4gBbnKf3NW7zvI8tK7CiQzKnG
 fgArKkgVb+8uIwKEIdb4S83t5ZPnypes3o9dqyQeOE61FcZ1Awi+ZIHzfvgdwDr/M+wK
 kTcuyq5X50LQRIw5AMw9K+NeBH2DzkbyxebL7vsuBZsIGIgWp8JJaH8e11SIPFYDjDN4
 jN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358395; x=1718963195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
 b=Nx9Z73hvjMzMPkc1m/F56XleruYndtQ2Nhpymcfi6Dnts+eisOADg57W04B9ownq4q
 G+l57phzQ6xENVpb9OGQgXBu6eX2Mvars1SBEKMNbuQZNsthwoPqsk9WeVlXIpz6gP8w
 9uh1A0YHBYo9KtsZOhrPx/srXUjFSoyq9puT7SPaFVRAnvD3TLyeP6YMg2rKkA7yPqmE
 tItMG0kSrO9xhM3nb/vEsGK9DvvRwZsoDXdtDURKNIxFWwy3VzalLlNunPZ4l/4nGSrp
 wVc8YBcGHex2cK8IofVhsMEPlIi/6YXIADwSrr0VmuBT7TmQ3SiAzLQsm/LKEeejzECe
 9B9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24z+xzsgf0nwFUAnA6TSiDjyU8KAdMVytVhcaz8NA1kqojoxv7j6HQf/OJ7gUtPv0ZVtht3uDEOaI6OU2+DfrUp0E9m4OQbrb4rgh+BTTzdmfHYFRBofd
X-Gm-Message-State: AOJu0Yz93ObnvzZxkYCxQzjbBIiodBuEnptSsOjmJtTY05kDqgqaoueS
 IEv2UVJqCLGhhWfXGPI2bne50/KWxpSjNVVgpmWSSOndn22ylPfcOiw3W/sSOrI=
X-Google-Smtp-Source: AGHT+IEIIi7f/khX+DL0ElnKeXbkTkqu3Do2h2qNKYCQfUhMKe+WvRGDBSKEB/3Hlft5tLx5w1488Q==
X-Received: by 2002:a17:906:ecb8:b0:a6e:fb9b:6769 with SMTP id
 a640c23a62f3a-a6f60de5fd6mr154292066b.75.1718358395585; 
 Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:01 +0200
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OL1bThiSTDRnxDnX7dUSElkuAerpOnM4wbDcCD9Dzlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFhz93LdRptZhTU1GW4iGarOwOO5EBiFYLFd
 wFDJHK7K/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYQAKCRDBN2bmhouD
 18s9D/9LP9unfX0MSkgXF8TFjscV8gcBK408X/8oxDWBhIrJxkLZCwMssuTlysHZ2OYfyKJHsGx
 G6Y1+icUV6gklZsPxjJ03/jABHwNj3xRb9AQPOwWQ62xpX/+zxQNNaEcW6AKyNmY90EgCBRRrwx
 +zhCuMur8Gg6isM+gl3qHVZsMSALb5gwAMQDe3KP7A2Sno1hJw+giAAb3KI6FtfvevD2XtkMgab
 x1xdWHM5YlOGmNi6acFw/2dtzcokVRiNbkNGuBpupXWq+vZL0n0mPr26qRUOIGhKqt/t5xQsemZ
 L+Mr4ASMWruC2cyuxRkPN6WXiOqU2PWSej9kVH8O1xuNjE4e/PQHH91KA761ii2PhPs/7y+OwqF
 pctdv1ol8AqI0F3yHRz/o1pCSJ8swPRC9vEXoLIwXfRYvwqouz1kVDofMzUcA302kDb5yZk+EgG
 9KCfyKlubN63juUO4jfkwe2WzfAcEXpi7GKMv5Gky8SLAPPRYoGewIbSvc/Zog++OvMxg+kMDGp
 +C9mjIWV+rrT6bt6c5KjBkE/42bqZ5THaEoLUfgzGuhP/PUHKyI5JxC3F+owxWNpfB7kDtFeA3z
 Yk0Am2y1AAsjqTGzDLnMJpNuFIZZoghdpcYJXcGJPZk+cauVsVa4n9fxRsSpvMdZFo6Fl7Qrb8i
 h+5fgjivCVGsZIw==
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
Subject: [Linux-stm32] [PATCH 02/22] dt-bindings: thermal: amlogic:
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

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
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
