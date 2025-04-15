Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5045A89EB2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:56:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E60C78F8B;
	Tue, 15 Apr 2025 12:56:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF052CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:56:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5193159f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744721809; x=1745326609;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=VTYfNWXVHiAu1FXqCkcUpLnikrAW+6vkM858tVlNBR34lMQl/FVaEKLhOb35DyuMJJ
 EKjIxSgVcUNkVV1LRZxv2tuUkAbhpu2Rbl3+YaNZ8FXcf1xROfna9Qeop+5CvQYlaNBb
 qZso+5VqjGTwcVBdlrIITe3wB89Lqgd8TITcb7NyrVbj15mM+Bi49sBFvqp9v8Rb+TJu
 JaA2hkzHg8IK0WCecNEz6OVfy/4uMD4uZMS5d8ygwUHj2uMnHNloUDtp+uFmWXSzPrY5
 HV8yjGxNj+BqQFrozLe+5Rr7CvcaUGC/Z3a31EfazjN16s3fpo9ehTuGWIt30g7daSLT
 KQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721809; x=1745326609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
 b=bJ+z1iHg9OKc9ALOi2EsKYydDwF4Hud81CG/YrFYE46OqZQdhWZ0b7XLFwMSXUH5ru
 bjK/JGzbk/j7r+BaIbf4oO24LUaMskLfxRJSqttrG0DjoRxdXWybhncaljNfBX7BDPY6
 hGtYKDFjN+oMoYKCKH9FyfKnB+GWanXgTt2jw6E5iYhPG71diiGO6blnjN9h6ggYk+yr
 eKEwrwCFPjXdfWugDDiOItlkIQOxmsA5U5TaVIp7Um6YPsF/PcBjKCmfWEXJ8kVD2++/
 cra9yXwIzQQ1fOqVuHyIWH+5dzO4JMJ5I+AFtIr0Ci9Y9yue3WX5Pu4XMJtcmSwDRhjp
 kRoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnAQO20qwFpOxsmt764+i9tilJKSEf0AumWj/8kwlJpfoFTjhPfctH70VSXwnhksGfgYkUBYxdQHSWRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXFSPnfOfIs8S2JM2NpjHNHld5CRXKwyhna9dCOJ7TrevM4oqV
 Xx9mD0LfDy9z8uaUzMaxHK4LvWPXJYnnodrb7Mvuos0c3wKDctQP
X-Gm-Gg: ASbGncvXd0QNI5qATIVWOoVuqfwkbvvcdY+mPZXJsVwwW+pvjnnRymwJw0mdDGEmPE4
 zlI7TpCIMNLnDvW1M3UqWhzMZg36qyJwf4k6hB3pbnl4vi2dl+jIHNObePSzT3NTJarCL1aCksG
 iVL22KYoJLpFY5WiYn2d24TSa+nQ8n29PvyF9It3G+51dG49JFvkVGb+mK+dV2BcSOOCqMa2vkD
 TFHRA0CPOa2NjRTqGu2Op7+fYwXvp4zIV80ade7Fc9S5S0mf/luZ8bZ5S+MCP1VI1KQ34IiVKwC
 ikqreP2uvU3nQ+3Sl8cRXrA2J3UNlXCZXoh9PXhGw4oBUIE+YqmRGHbn1ZnYhTFS
X-Google-Smtp-Source: AGHT+IHh1oHEy/id+2kXHtxdu/j3+e8kGj1u5Gw07xALuQpAX70pVHKbVNleZqFSuazAXcZb5wjYGw==
X-Received: by 2002:a5d:5f87:0:b0:39c:266c:12a5 with SMTP id
 ffacd0b85a97d-39ea5201e7fmr11010905f8f.13.1744721809254; 
 Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:56:48 -0700 (PDT)
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
Date: Tue, 15 Apr 2025 13:56:39 +0100
Message-ID: <20250415125642.241427-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/4] dt-bindings: net: dwmac:
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
