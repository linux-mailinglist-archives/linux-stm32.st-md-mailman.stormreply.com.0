Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9FB3F9F4
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 11:15:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0ADC3FACB;
	Tue,  2 Sep 2025 09:15:41 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58B5CC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 09:15:40 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afcb7a5cff3so92380966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756804540; x=1757409340;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m/8bnMdkcwBrzdormqUmLTK3k80g92+lN3p1s60KZ+k=;
 b=JEaqqZ47VKC7k//vy7yz6sZuVK58aAOJ5CCyIzgJxnK2Mns/u0+XHniWaler1v10wu
 ods/Ts9V1rFJeg9ATrl9d/AkhsVtkJ1qMkHAZdfWRi8p9FPAFLpDqY9wK3BOehfzhumz
 wALr3OiGOUD0aMH7BTSccKRdjbgbKekZG92sPzs0yUHUeVnZX+8iHCYeuneEy8cID6OM
 nSeXNw74MbdLiDGY20OsZXcBpk4FDVvma8dheD8O3IbLdMVkmASycZEHq36fPDoNGj2p
 wu2Ksle89+VvvCZ5oOtubvPzzKcEmydmHxOfK9Jb4PN2KvQ+Lxob3kQQmDqr3KnGmfjv
 U41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804540; x=1757409340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/8bnMdkcwBrzdormqUmLTK3k80g92+lN3p1s60KZ+k=;
 b=Ep6HmSJxdJqOAugaEFLvyLTYzOkT/gv28lUegiPDmhFngvdsjhGxujdd7/WQH4NmB8
 2LX/xRybGJ4XzHeKi19cMptzKuQ6cowEZAWvzMKVwWK0THMLgyRghnBQfwilPF9uqPCe
 ggGm5CjNRHWJ6X9yYHtvlUTZZ2irVoLYCWerUdJ9wuwtDUUxA4klobzo98slqR5YgG2w
 uENhHzY18D2/FwjboNtCpetDgSI6q1HJJcW9qsurTxu+VuXnakgv0cLsIAoipu2XA1l7
 wS9zxOfDZyP18AkGn4citmokiuR4ighX+oPOGY+kvEeB5qlzsfyIVPjCq0tOyzG4E2JS
 Y0cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9xHKGtri32l7X5GZCm8o8Po+eSG2amFdZlQtaElwATM9RkXq6uVAQN7YxVYVplC2GDRjAx/2NugNaAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwbCSfx6JdbvN9/zj/Nr1xRccy9RJ/gOp6MyzSOVOh88aHs5jzu
 xC3JXS9MkJdZrDveCBlr3crLJY6En0Laioour7wOXGimQVsoF/nHyWV5E/o4CkZYhl0=
X-Gm-Gg: ASbGnct58FqGXxzm3CoEg7Zk5lP2ajmvh+oJp48fOtClQ96vTPjHjpQZrbkibWhCUgN
 B2E94FFXjWVviVLWKZCSdBfHmQvZk6DGighQxVDqYFEawVYZLx948sGxnHqm3j3oKTKNPdGjdZG
 PiJ+rL7MnOEF1X26r4L7N78j4+9QBb0FtHGuW2vXjQuLmpxHVSb2FXcqWOXiMWcz7QKuG7vBN9L
 JWmgbzS1RQuTx7QH8RFDwf/AwpR0b0LuqjTy2SJTOr7JNa13OQYU3DZhEiokDiv0JBSTi2Oc3Ky
 hw+xKNYnDJoXegDqRpWnjnwKpSAZHQE5lI+7e6HOqH5oQtnJJBniGsDjJ+WhJtVPp1lEzDwOR9q
 gUyyedhKNogZTXZI2HW9uj5/urwh0S7f5JM8AxDlkRuXNfwU2VLARLW0=
X-Google-Smtp-Source: AGHT+IGsSFPfLqX1TSTY7vx9/w5ZifFk746DiQHROlsIAv27SMqvJyUuB9Px6z4DG9dMMXNer8ncTw==
X-Received: by 2002:a17:907:95a2:b0:b01:989f:46d0 with SMTP id
 a640c23a62f3a-b0198ae8b17mr566468666b.11.1756804539611; 
 Tue, 02 Sep 2025 02:15:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccb15sm877008866b.98.2025.09.02.02.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:15:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue,  2 Sep 2025 11:15:27 +0200
Message-ID: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=omOLYYYjh3z0DVh1O46NQbX5aRk5HswOved29mAUMag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotrWu6Rq20SlnUGOaA358hH5nv1fnKm5T701YM
 YgxMdCPxreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLa1rgAKCRDBN2bmhouD
 100DD/9FY3aTCBs5BXmVSlnhJDkPZWHvDYOPI4Ae46T6toYdFe0oHBCT1ivV3pDoDGSKU73VZdG
 4E82JAx/MwQyjQ4F4iyK/iN6J1wXAQ6i61V+oYGoyKS+lR4eroU9Dx8odZXyXbdyVq3lU3sO+MG
 TDML8f+YKLY/tOdjh+vJcUU+n7Ipf9HjXQKFVmWNzWlcopnWLu+hCztmEm523MO/p1nwr7EbwzS
 AE+Q93zwfJEIQvKPuS9HS1E/MCAEVvrv+j8hvLkvmDxui+woZc/NUr111q/CmX1NgYQVyjmtExN
 /BwHQi0xOsvXemvA1ABLngFYG/dTIRx8KEfwl6pEKcqZj6MZrsUok0KLHgP0q0yP0RJEGikumsY
 mXQV/LE1skdf/aP0YwXf/b6CQ7zUG+u7gs7mGvZhYthkIhPxlmSbMsX/+TsZYDGTLu/qSfQYuT5
 WVsC78X2Hv5kVCE3+9mfwv4cuAU8quFWeKWOzdzIvNMX63WhjHv+91/WFpl17WfG6XXdGSlgztf
 R5hp2f+n5jEtt0OlSWeRqSWMezS3EsPt0fbsgR8Jub4XEpAM22Xh5X9nBqMYS2HEBd+j7hbvtib
 2d7ORY8wvGFU4MGzahiBEwPT0rO4qhj4XqcoWUECr78rM46doe2LQeEOP2JfNG/jl5b4jREKBwl
 30tClks5II7F44g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: altr,
	socfpga-stmmac: Constrain interrupts
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

STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constrain for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index 3a22d35db778..fc445ad5a1f1 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -62,6 +62,13 @@ properties:
       - const: stmmaceth
       - const: ptp_ref
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
   iommus:
     minItems: 1
     maxItems: 2
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
