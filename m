Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E59102E3
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5D8C78002;
	Thu, 20 Jun 2024 11:35:12 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8302AC7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec4a35baddso1747431fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883309; x=1719488109;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ucm5uoyXbWeiBfyorFJ2TTmyVLZllZQAufxu5LXpC9s=;
 b=R+ZSgzYq4uWsr1IDZnl/M8Iaz24AS/VoaUXxGdr/47lfJ+1+ZPS6fwDV462aoVxyEW
 NfN8gTRcFds+e2r65cnuLG4II36keJYWFV9mJ9ytp7cDhNtHsF99tgFp/nb5TqNeu6Ya
 A4PHMoFtK1PswD9VT/cS/eC68Q7mTeXE3nZhnCQkoFX9hS5nvAbiSL1SRHiBYGg9Dprd
 7srC42SQwqGVRqC54QWXFOsoeJJPOZdicD+FBBVj2bTn9hyV0me8LhpRAA49k6CzvlKO
 LPPbwLx/g9UUuzeRjvTAusX0btOyeBatv16gpKClNqnRTB6Ig19RHtM83kA4QtK6z2n1
 r+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883309; x=1719488109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucm5uoyXbWeiBfyorFJ2TTmyVLZllZQAufxu5LXpC9s=;
 b=YPM5d+h3xb5H2mu1Yhzc1KiXPG/B9rO/eYBhTzjzqJDZTlk0JH5q6kNnxwdRW0rNAm
 6wScAhydqRHFt1L3hyuD/dsFoffxSqmWmMx1ZOprKQ+RDEZcXYuPqQ8D66EMOeQkGfSZ
 ofPvHIDEipOgXXrWw1cRrYshdcNAqLAJLgBTY/lYJrCgvgMHFfquqO2riKE1s/thVJfW
 9C2UhroSeVcgEzMR81NdXkdWPUTqjnLXflVXYIu029r2ZMb+vqjWNQX1JsTpK1rYggCy
 H5rVk2tFITHxnZ8aa+czAOufyMNf0rBfPKlhVxS3mV82jjx+wZBqSL0JeuIt37npSdau
 GVWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN5q9sQ+fMMWq1x9RvFd+demnfrtN8FiGzg4OkCe0UT8JhtU5NSakMUQugDfmDdpVOmQf69mhmWubMHOQTSEgqIxx/uvr+yNyADI5Vc+wOjoDxZ6pZN3Ku
X-Gm-Message-State: AOJu0YwoZkQRgChL183oxA9reh386j0uWO+mShxPqXC5yUrBpxx8LRQ+
 vjzoIUtyT5c2+btuYOPzYwV80wCWWxziR/VyuUvdz/EMXaedThdCPuCWMcB1LcI=
X-Google-Smtp-Source: AGHT+IGCiIDIoYSisVXo+ZB+zS0aVSEEsBqiNcTjA1lAiqVyjloGPunGlLuMfIiyiuCdUmat3EsNeg==
X-Received: by 2002:a2e:2c1a:0:b0:2ec:1dee:4a2c with SMTP id
 38308e7fff4ca-2ec3cfe5a34mr31845791fa.32.1718883308821; 
 Thu, 20 Jun 2024 04:35:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:50 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oOZv8tGbYc82cA/I5ucBrkQYLVo4QrwMB1ASBg/dOCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPgSEMSR1DQFgpOr4nndNuYpTz1w8LwEmDS4
 0mTKxKxfwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4AAKCRDBN2bmhouD
 13PCEACPHog1fCP0NY2sMndBJdes0p4yAslPX9rTELMCOS5n5DPp637Do0m7jFjPFSaIDm3iPvs
 RksgCvs1gc6UMZtaL5lq02z8khB+ZrIyy2eNWUKoEKOTHkGqoNyiup6iyvZ5IPCl79R3Uu2Vuyc
 WgpJF7yIUkSWoLj+eqqrsiJK1rmDQu/H6QySDOa34JPLbE4e6oEgRVgl7+4sGvuu/OwFTILGYTd
 1De+1y75qaSe/BtA3H2EOfD39VJB4vDmRLnoDqWPd5BM0gQ+hApp5SwfTWYfFhrTsx2BUxpFfdp
 Rm/GKg61tGmvzgRIiyKvxv+jmYlEOjPQk2KAukH2uuIhZOrLGTCFgLYypk6phoJKezXfYIa9CIY
 Z/xaQDuglH6wtkcFVjWu94Jp3QurgG/mn4/TtKFPRjvWTcJzt/AaWQ3wDNlXuombZYuyrOvqCRj
 BPKybgVc6k88Av0AK9GbgcKqpzL1aJzk+3OsDcupIf9v2gyKLnCh63r/ruXQgE/tZDtwxY6IvmK
 1hicnz637diRzjdPPurY0OMN91Rl8uv67j7Xi5yJexUmFE7yZHRYQ+pn09lY/lXqBKYoTYnCHJp
 7/cj8xOfunNb24z4rm29nnaJ60CpvQc1a63gaQQ2q/8YnetFezeHwhYpyNHUUG9lv259BdHD+e3
 WsXEUhMwdoS6FpA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/7] dt-bindings: i2c: google,
 cros-ec-i2c-tunnel: correct path to i2c-controller schema
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
Fixes: 1acd4577a66f ("dt-bindings: i2c: convert i2c-cros-ec-tunnel to json-schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
index ab151c9db219..580003cdfff5 100644
--- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
+++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
@@ -21,7 +21,7 @@ description: |
   google,cros-ec-spi or google,cros-ec-i2c.
 
 allOf:
-  - $ref: i2c-controller.yaml#
+  - $ref: /schemas/i2c/i2c-controller.yaml#
 
 properties:
   compatible:

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
