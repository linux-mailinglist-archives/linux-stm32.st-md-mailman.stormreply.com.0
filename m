Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00C77E557
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 17:41:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3015C6B472;
	Wed, 16 Aug 2023 15:41:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B640C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 15:41:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 799F564DD3;
 Wed, 16 Aug 2023 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E34BC433C8;
 Wed, 16 Aug 2023 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692200506;
 bh=d0jes+KrJeiWl6LJI3nrjoLh3/r6+H9lE5veVs3+NN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KEEdMxD0b9PLscPEqG8w/hUc7DEM9kbhfjd2v65dvGQMUN+FT6pldecS8L+DOR+4Z
 ZzV1WITkzhou/COccdDVKQaO6FsfchN4yjW8OyK7ExzfS/gezDhNDxYDEBJMn1q7Ae
 ksbxbvQUeu6h4UQSKIsYvRodgiXk/7OOBynz7rquDOboqsadS8+74KJsqnvPDBWuUx
 ezNr+/AuEIl7IpxWAsMAWK/pgBb01lTBdpFCV4XibHAB2i9ybfqGEh/xKs62e5VKCd
 dD8F/40VkeZ3xdz5OiYImXFWgQyIBwLKMEULzp03OXhsRAQcT8HuaOfqf8TkOhYYpO
 13RDrc08fcksA==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 16 Aug 2023 23:29:25 +0800
Message-Id: <20230816152926.4093-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230816152926.4093-1-jszhang@kernel.org>
References: <20230816152926.4093-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v4 8/9] dt-bindings: net: snps,
	dwmac: add per channel irq support
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

The IP supports optional per channel interrupt, add support for this
usage case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index b8d01bba6e1a..a916701474dc 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -103,15 +103,51 @@ properties:
 
   interrupts:
     minItems: 1
+    maxItems: 37
+    additionalItems: true
     items:
       - description: Combined signal for various interrupt events
       - description: The interrupt to manage the remote wake-up packet detection
       - description: The interrupt that occurs when Rx exits the LPI state
       - description: The interrupt that occurs when Safety Feature Correctible Errors happen
       - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
+      - description: rx0 per-channel interrupt
+      - description: rx1 per-channel interrupt
+      - description: rx2 per-channel interrupt
+      - description: rx3 per-channel interrupt
+      - description: rx4 per-channel interrupt
+      - description: rx5 per-channel interrupt
+      - description: rx6 per-channel interrupt
+      - description: rx7 per-channel interrupt
+      - description: rx8 per-channel interrupt
+      - description: rx9 per-channel interrupt
+      - description: rx10 per-channel interrupt
+      - description: rx11 per-channel interrupt
+      - description: rx12 per-channel interrupt
+      - description: rx13 per-channel interrupt
+      - description: rx14 per-channel interrupt
+      - description: rx15 per-channel interrupt
+      - description: tx0 per-channel interrupt
+      - description: tx1 per-channel interrupt
+      - description: tx2 per-channel interrupt
+      - description: tx3 per-channel interrupt
+      - description: tx4 per-channel interrupt
+      - description: tx5 per-channel interrupt
+      - description: tx6 per-channel interrupt
+      - description: tx7 per-channel interrupt
+      - description: tx8 per-channel interrupt
+      - description: tx9 per-channel interrupt
+      - description: tx10 per-channel interrupt
+      - description: tx11 per-channel interrupt
+      - description: tx12 per-channel interrupt
+      - description: tx13 per-channel interrupt
+      - description: tx14 per-channel interrupt
+      - description: tx15 per-channel interrupt
 
   interrupt-names:
     minItems: 1
+    maxItems: 37
+    additionalItems: true
     items:
       - const: macirq
       - enum:
@@ -119,6 +155,38 @@ properties:
           - eth_lpi
           - sfty_ce
           - sfty_ue
+          - rx0
+          - rx1
+          - rx2
+          - rx3
+          - rx4
+          - rx5
+          - rx6
+          - rx7
+          - rx8
+          - rx9
+          - rx10
+          - rx11
+          - rx12
+          - rx13
+          - rx14
+          - rx15
+          - tx0
+          - tx1
+          - tx2
+          - tx3
+          - tx4
+          - tx5
+          - tx6
+          - tx7
+          - tx8
+          - tx9
+          - tx10
+          - tx11
+          - tx12
+          - tx13
+          - tx14
+          - tx15
 
   clocks:
     minItems: 1
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
