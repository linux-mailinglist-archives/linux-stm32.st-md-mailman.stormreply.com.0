Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ADA8B6E6
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 12:40:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A666CC78F81;
	Wed, 16 Apr 2025 10:40:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F1C0C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 10:40:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3776220f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744800025; x=1745404825;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=J170pU00IEsL3VhgiGwxhmVgxN5yQR7kfMcy6S3BF2peSB2da8HfJ0jf9Ad0GPAoaI
 Bhiv0IIKBeh0JCuhVABo7ryxJSz9r4CYpH0J2Yx2vGOBjhfkcEEAd+UUI9hqrv/DmYsM
 ZZeeB/ZjetPdVOONF+gDuZaySDVC9mlC/oKXLdI0RQE4/fEl+j75QJVBVm+E9ZAX/nWd
 oxip0GhkfGzsNeHK0L6qophW1zWrf688YPIfGo7dzwX1QdH08GAihJDStSGoyhF/YSFV
 B0feGm2npwWQvxvWJq+3kH4NAm7mUbKWTQjBZEkl2Zl9ngy/9Y6u1+aKsU8ZzpMZDjex
 4ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744800025; x=1745404825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=lGPu9WEhIM1/0mYP05c/C5rSNrQ5j+ID7xTvQNPJwoLyXjKq2JcBvJfjilcdoDyK6G
 UZUOJkgbRtvQBw2SZSWg7YuhJWNc+VTzg2Oam1aWI8yMB4/Olw3L31eMdYwq61M+wsh6
 0RSO07NqrUfsXt41o+KfEB5uIVzGKnhNKx1ZQJI0X4jRg9EUdbfOUzOJakHzFyf4oEFq
 zz/kKeIcphEIxkd1DRPMpGxU9bAj/SXX386gVy17FxNrpcLN3YtX125p3d1/TCOVuFmg
 j+Az6vA5asDtwmJuIS1VbIh8lnOX9L3p3y/08ON/1xpxtI7g9dW8j0kOHUzhzVMJ2feu
 +Gmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvhTz5prOKree1YUxCb7mRUXhwTaPPHr2EWT0cnmT/b589QtXGryhIwtdHUrsUxXCjBQDbpjLIzQVbpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9t1YWT2X3ot55FLaIPtIs0ho0fDGlfsvn4SWu4co5D/U1SHo1
 xxMYOyU4IZWTFGHXIx4uPnjF9HJ0/gNC1f7tek0+7mjxhSe913Az
X-Gm-Gg: ASbGncvdK68RDzHBoUphuCMJ7XlieMDyuB7fQcpNFUM3wZ42LjMRyrpvwNVrQ+6INN7
 mfMF5EnZ1Q3yqIRKDx4X70rSdGIPUzGv3nfyjHLZqxfMcSxia7TrP/k5aey5pNkI0GEWzSxzHsj
 /f1PkhwCKwo+fyaOJyzIOQ3wvI0R8NXFEa9BU6h+Di6++SMxOuzhbqPHEFmvPkoakvgTBRGZXTH
 79eEis8nYNsRnLgvgYksQa06DGNVmaJh7N+ghGGCyOAFJo3s7rz1FA7GYdg515iV/xXeaMwV5C8
 IkYTmVHzlwDBpWq11pAVOHH8RtS76FiprWtafeYkLlxJwhLFGR3GEsxA3pYS/RsqCdA8cjqua2T
 h
X-Google-Smtp-Source: AGHT+IHjVa5WDXcZCkMbAi3WRxmtcXMiaUdkFnUUCMfrR94dmm4AfGyFddim6DuqjvutFE0yMpkmTA==
X-Received: by 2002:a5d:5f49:0:b0:390:eebc:6f32 with SMTP id
 ffacd0b85a97d-39ee5bade02mr1377171f8f.48.1744800024211; 
 Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 03:40:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 16 Apr 2025 11:40:12 +0100
Message-ID: <20250416104015.47788-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 1/4] dt-bindings: net: dwmac:
	Increase 'maxItems' for 'interrupts' and 'interrupt-names'
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 11 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/V2H(P) SoC, which features the
`snps,dwmac-5.20` IP.

Refactor the `interrupt-names` property by replacing repeated `enum`
entries with a `oneOf` list. Add support for per-channel receive and
transmit completion interrupts using regex patterns.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..4d4fcaeca8a8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -114,19 +114,25 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Combined signal for various interrupt events
-      - description: The interrupt to manage the remote wake-up packet detection
-      - description: The interrupt that occurs when Rx exits the LPI state
-      - description: The interrupt that occurs when HW safety error triggered
+    maxItems: 11
 
   interrupt-names:
     minItems: 1
+    maxItems: 11
     items:
-      - const: macirq
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
+      oneOf:
+        - description: Combined signal for various interrupt events
+          const: macirq
+        - description: The interrupt to manage the remote wake-up packet detection
+          const: eth_wake_irq
+        - description: The interrupt that occurs when Rx exits the LPI state
+          const: eth_lpi
+        - description: The interrupt that occurs when HW safety error triggered
+          const: sfty
+        - description: Per channel receive completion interrupt
+          pattern: '^rx-queue-[0-3]$'
+        - description: Per channel transmit completion interrupt
+          pattern: '^tx-queue-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
