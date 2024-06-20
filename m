Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE09102E4
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 13:35:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5424C78013;
	Thu, 20 Jun 2024 11:35:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C36FC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 11:35:13 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52c7fbad011so967393e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718883312; x=1719488112;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xM531uJKzclciaU1onR3kjOex5SXkuzDDuoHCNY3Hn8=;
 b=Lq7e4PCiOYARfVeDrkmx44og/Sipi8qD+AwtZg+LJRnXU43sLZfmbVqqDKMt1q+fM0
 Ucsmfjbeyf+QoNu+wzQZZDTbzVNmGMlnEcdzOaOeR9lZDtYDb8Jb7HqjoiXkoAFrtF3H
 6GtHjDJbpppfTS/tduE3tWbSKYW+MvCK/tRIDe1ZJqotszslUUuVB/lv6hzPPApQPqx2
 iUiwkUI005+p5+d3KMM3/aqOOrqeyVBg8fE6gzMPRv1Lj6tsngWXyG6BE8g3sAPOd6P9
 8nxlVCEDcS2xtwA3KojKYTAtq8rMu63gKWSNDcyC3/lHC6DhfYjM1hvtIZhEyMCLVcEK
 YUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718883312; x=1719488112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM531uJKzclciaU1onR3kjOex5SXkuzDDuoHCNY3Hn8=;
 b=gG6NspHFXWWNyqWNX0jcASmaoQn/Mu5buREmz2iTaz/BxkSQ67FVycoNvw9elqL6D5
 Hx2IR8IKafxjHkMw1NzAfdcJXYETXY1C77qtixAxbyGHWt+2/MPLYZ65kGwuZHuHP1lB
 QYUIamrA1m8wuqM1QfEfUX4nbbMERlDciS6+1jaUnaVLC/5uRLyCDtlLSEk0BjzZFLjM
 ypYzbWL7J3CHXa72ymtTidTxNVqoIkp0evYP4hTBzqzBIyCBio9eN7nBCwHnIeqbnKYo
 85LsKWSsUxhKnEuOEREQf1YRymklcrRdr+/GYg0NVxUzA6fZCNVTVsNJKQYl9KL8kYx0
 sZfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkeI30wj1oElfam5/9ObnsSVnd2D+HHVtXutMhb7sgEmDDjwHxW4oIPO24y/VJ+LidiG97XhaiqDKWWdQxUKFLuLRbZIkkjKHdVTa2x4KAnDDBYbR9woqb
X-Gm-Message-State: AOJu0YyziNUATgWRojW/RaEjJIV9W/zXj2UgeGbz/XLkRQV/szLG/yau
 s6gAAEs/bfG1upp3yY6BFekIpgoldWFYM+/rqKwz57ef3DK9gPr/gbvI9e7gXMg=
X-Google-Smtp-Source: AGHT+IHN5p1ZhBCkLLOHlujYFLWxyfZ388elBT4mBsOwQE+cyOCwyUR/18lU0uOjM07vFGaliodC2A==
X-Received: by 2002:ac2:5974:0:b0:52c:8009:e0cb with SMTP id
 2adb3069b0e04-52ccaa62705mr3195772e87.41.1718883311328; 
 Thu, 20 Jun 2024 04:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:35:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:51 +0200
MIME-Version: 1.0
Message-Id: <20240620-dt-bindings-i2c-clean-v1-3-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VIAAR+9ZzNdiUd9DXoAU508RTOlGXzHJZLY4QqsPl/Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPgL4PDnH6nsfCQcGgJAY5MlNNW76Ds1lu5y
 OPz6nu6bhuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4AAKCRDBN2bmhouD
 14QyD/9IW4X9J32ciR8sJIyc1S/ErJP2y4Ut7YRY30iCO0p0sVYpL+voJZxZwR4SWhHXbIDj1MW
 4Ugj3M8nl1A2hWMzkv1OHWiBKD1kwljUwJTN9xnA+LywlE/t8QthKvVNMhHoeuYgHJf/pl0+UDS
 u17iyCx48aBjMd4RU7ov5Vro99N0ZWSOsEYUja9hj/YaX549X++4U8KGUDkmprAoqkV2yx0zlUK
 ulC1CBzolDDdimVmrToG8wElBIn4zhxPg+mfYV6434DdwuGvCSfHIHqaE/pFQ9/jNZqOAdVUuBZ
 ktFHWj+AAL7MpekoL26H43StDHEfwnsGHinZ9sfn7EZftE9GqEGftoI7+tmXTPcv9LbVKPsdQrQ
 FWWch6WWj52ChOeZXOo3iCVxIuOA9LIAhz0vU2zo2kcDpmW2f5Vl+vJf/ljJExxuEyjjW9i4iBQ
 8DwEA43O+Ck5HwYROJsUalOde0DRyy7DLfj9o9oJsd1csbNHx6nTn6ibc8xXAH3ssdSVmLDkZ/v
 To/ESiX0sOgECYD8M93I8s0/XFfqZ3Vc2/ss+WYu54j1xcx0ioKkxO5qtABKMWHGQHBekxyKYjZ
 fR/FXSpokYqtkLm6Pwx9zoZwfWe1tHfcnh5rtmHa7xeamqS3Hi8v02dUX91kfQAIPmNjKC6c4rV
 +UTW99U9R3cDwzQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] dt-bindings: i2c: atmel,
 at91sam: drop unneeded address/size-cells
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

The reference i2c-controller.yaml already defines 'address-cells' and
'size-cells', so drop them from list of properties.  Drop them as well
from required properties, even though i2c-controller.yaml does not
require them, because I2C controller could be enabled without any
children in DTS for user-space usage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index b2d19cfb87ad..588478862bd1 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -36,12 +36,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   clocks:
     maxItems: 1
 
@@ -72,8 +66,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - "#address-cells"
-  - "#size-cells"
   - clocks
 
 allOf:

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
