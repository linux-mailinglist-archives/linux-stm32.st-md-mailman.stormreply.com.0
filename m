Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46AA916A3
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 10:42:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FB09C78F61;
	Thu, 17 Apr 2025 08:42:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1EE0C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 08:41:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso303782f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744879318; x=1745484118;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=W3wLsUSeB/jVo+a8I1IXfy2FPQUoeuxs9f55zJpT+HROb+uNsQs/REg//sOaC+Dnsq
 dPe99bFPJbC9k4CXl9rdt0psqTLnEppB4KaM3DA+pppdoXMuig++jrceXwLQYWrnx8KQ
 TKJALn56mrV95+oy2cWQLVobH9cLzhIT5MaXChe79xJaxnhkdhw6TPHJrpHiyDDGv2wI
 0iB8Nal5rs2NaZQG6weNMu4Hxs2zxB7/nDRwBbn45VYpubslTT5/mBMDOV3UuLPfNfA0
 ZggCrNsi24R5mV0if4hJELQNeOUIlE45KdYvYqoq0C8urxIUfSTxho2tX7bHEwyzNz+8
 hwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744879318; x=1745484118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=Zf2iY0BJI/Cj9w9rq4Np/Sx4RIhPIKieh5ZXDTSgFPUFiN1tmnZxUBmRIyVz0scSL/
 9hvSMzDKviSa5v8eknWUqiycPzW+KmFi0++fVtQzsg8GAs5ByhhxvheUvTbgRHN58rvE
 4rjXHmu6vG3M01EXfDZM/sCybpGri0rH8J6oKcIjgXgElqa7pj1PUucV6UiUwehus4m9
 pHNh/C3e7ooW+gdya1AhI5bYuByfAecTFEMx52dFSovKnZOZPoeR2ju2hN0s+jVYXBw2
 ftvsBQDudpglocjyV/UYy0zOu547SIRyOC6pyvmXZiF4Bmz84olaTnX3+6SodY+hJ0AH
 Ld/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYBVbGjYV8jCs2/IsU7Q5tGLH3j668qKFZw3WPNNeGIl1duHH3jvmkIedwWju65O8mxtPdhRFKSH0uOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/SWnYDz6vFJRjdgJvE1hG1BYLgacYkFlVmO9Rps2oGMTd58if
 aOgKCO/FnqXmctMCVhwCDRRk02EfMdRpsvcLWe57TnAYQUr59lSF
X-Gm-Gg: ASbGnctuTSiNqKJL/xi/Z1t20wf2kUjvR3+7kuG7xnITFvuW1+EpElEHEj5+NzlwVWV
 nRZ5mefWshek77uNOcSMLJsg3+E6sxKVWA6P4aYXeqKQtZIwFf2j14BNCU7sXotbe/aagm5hhtk
 2Yrs8YCzf+6lHw9ZhTw83t3r8WyQ1+eDrmBp2MMEBJVrCRzjH7d7otiCzBM9OopQVQo1B572mxY
 tJmTz0sgkCoMearkZ/kPxcDB1RoKjZbXDzZvuQXgwdtUjhwHzD/bShmQTMXmRXbsjRNESDCtFgt
 5tmIblw5AOek1NbdgkR4DIvNSf+OdhvTNU0ZQSakbzqNpWwa5XG94LIQ8HDTTwd8
X-Google-Smtp-Source: AGHT+IHgPKXoeOtA0iIqRJCI/YC2Q+S8g/TGS8VwA4DAmEhyGIU1Lls6vFCmEDBaic4nvV7UL9x/mA==
X-Received: by 2002:a05:6000:1449:b0:39a:d20b:5c25 with SMTP id
 ffacd0b85a97d-39ee5b2f6b7mr4334968f8f.26.1744879318069; 
 Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
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
Date: Thu, 17 Apr 2025 09:40:12 +0100
Message-ID: <20250417084015.74154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 1/4] dt-bindings: net: dwmac:
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
