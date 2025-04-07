Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31174A7DD03
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 14:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4501C78F9E;
	Mon,  7 Apr 2025 12:03:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD881C78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 12:03:27 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3476857f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744027407; x=1744632207;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
 b=cJZWY1mgdu/Yuu5LsQanP+v3cHiA3wzbfmScaJYnggSVLs1sH8BNmb/uEmMd1D+Kur
 GycoiRf4gPUGIbRmrdbZnHt1u4fWH+jlemjTXxtIM5mRbWSvviOkvNT1+zclgn4z/6tt
 eAldSUe7tUOFuq5c0Hwgkjv++GHk8J4ZCGpRiP+MXUVbdYPtnBWjfeXAvIczrfZSM9wd
 YJWI28FUruCgdLz1VT1Ql97sqR31mU6JWReygsgx0zNBBqpmqZC/zyFjzGkgE/s7joMe
 ANshTxJA4zc4Ay6lcOWWTWmDHLFj1ynCbmw2GrkBhU4DcLVZRS3xVuW2kbG4KmnxexV6
 OwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744027407; x=1744632207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fG6cklCkHNYJxMIIK0GDMVqFSaYHTVH2UbG4fjsK7gc=;
 b=L0u11O6a4NPOAvbyz/g93C4BQp+cJXi6e06PmAAGonBmJDTgKHFYZ7i9RaZxNKX022
 OBaFGoApHH5aR6DFPpJmKMijp6u+y+htGE/bcteiUgSnzt7pxSm+7sNyPwWhxoc9era+
 yaXK0yclK1EFLIg5unWHeo/9dA4q9NCFqusPobtIwHxHvr5XqSPJ9i5660OJ0lMRrC/n
 UJKgkudOOqOrNQ3dzjg1iEKRac7AkfhP1zjBIvcHS6v3yY2sidswd54vchuxwdRKrGUh
 QuG2rW+xiOMMHhTLgCGT9ePoh/kp4SP1C8HIGY/2Gwmh6gVKyeR3UwaelUcmMXBTOav9
 SFTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfZ7cVsbyL3iBC544ycpR6FFb0skcFhHhP3X6bemPYGwgfGIK8enfKmwMvGRwqgKp5uRKbO8OwGvl/5g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdE7NFIdx/Ay7kd9nRkRujehZiqmf5A66/ZRnekxRz4Q6vsd+8
 k//WePgVSWZ+ZtiZsu7/T8TvAOJufqHhmumt4YLnLD5sUpDJGGJv
X-Gm-Gg: ASbGncvk0HSV2TOmFAom8+OUznlNK8mL2Wz1K6eG5LTBX/nZpprHvytXTzZzv24XzjF
 BvOUk4JdYcNHiwiPWF4jTzvBOyygZTBwNKqxap4BpBTyy6WnGBHkviHYAkIZLCb1RjTiY9c5B3t
 PKlj0Vu6lfK/ecvz7kkZEcrK0h7DLo/X5hNT7GkA50nKw3h6wiUVuSS4EaBSMhXBMAJaEX0zh2T
 WiNm4A8vwg74002hTVdmRJdfsvhOdpfEiJZ0KPn2Ft4XcspKXbEs8wK6wM04U2fhonlrA5xSeDZ
 ASvfNYgmxuQ9O3uccgZcVoO309SbcJwadWRqF16Mk84wOSsf+CNBJDLXJRY2Rot8VeNMLw==
X-Google-Smtp-Source: AGHT+IEbZIVKSwKGcZGaZkVGFNqeu45TBBjhVhTZoMPStlgPwCbQmNhtEp6XGXu00ZWclskzPkReog==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id
 ffacd0b85a97d-39d0de67a97mr9832691f8f.38.1744027406917; 
 Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d943sm11986976f8f.74.2025.04.07.05.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 05:03:26 -0700 (PDT)
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
Date: Mon,  7 Apr 2025 13:03:15 +0100
Message-ID: <20250407120317.127056-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 1/3] dt-bindings: net: dwmac:
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
v4->v5
- No change

v3->v4
- Fixed maxItems for interrupt-names property
- Added RB tag from Rob

v2->v3
- Dropped adding `additionalItems`
- Moved interrupts description into interrupt-names
- Replaced enum with a oneOf and added Rx/Tx regex patterns

v1->v2
- No change
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
