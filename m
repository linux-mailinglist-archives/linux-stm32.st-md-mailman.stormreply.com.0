Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A315275E3A2
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jul 2023 18:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69441C6B45C;
	Sun, 23 Jul 2023 16:22:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD85CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jul 2023 16:22:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D32960E2C;
 Sun, 23 Jul 2023 16:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF1BC433C8;
 Sun, 23 Jul 2023 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690129362;
 bh=77r49RSSQhAozO3HusyMgOJivNEdF2Oycm6v24MDK60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LbJaNcSBqDv3TqTL9DOpOFtVQAvmOZDNAcpGCIvWPiAC2ss+7LaTuU60MqlD3oTgS
 9zdjwsNlMnz6VUppT+/I9iJyH5BjziWnzaae2/gm//cQwmkfhqPnjGNY7KcPEq2+ZS
 rgWhVRJaUs/QPnBKydu23WlOGcwokmagkMVqM/4YxcDEXm1irn67kRre/lpUYbbLSk
 tSJxCz/v6imyZGVT0Hn2/ZJYVroskvzK3TxOwHQT7M8l/+t1+OW/hdKSeDmDRpgby0
 9HcL5rXrCzFT7VhH8g3m9QOQco33FQC+fw+ReDl5VuxORDQg2D3IIj1REb9QY6L4v5
 SnGealjZlXjLQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 24 Jul 2023 00:10:28 +0800
Message-Id: <20230723161029.1345-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230723161029.1345-1-jszhang@kernel.org>
References: <20230723161029.1345-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 09/10] dt-bindings: net: snps,
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

The IP supports per channel interrupt, add support for this usage case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index bb80ca205d26..525210c2c06c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -101,6 +101,11 @@ properties:
     minItems: 1
     maxItems: 2
 
+  snps,per-channel-interrupt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that Rx and Tx complete will generate a unique interrupt for each channel
+
   interrupts:
     minItems: 1
     items:
@@ -109,6 +114,8 @@ properties:
       - description: The interrupt that occurs when Rx exits the LPI state
       - description: The interrupt that occurs when Safety Feature Correctible Errors happen
       - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
+      - description: All of the rx per-channel interrupts
+      - description: All of the tx per-channel interrupts
 
   interrupt-names:
     minItems: 1
@@ -118,6 +125,22 @@ properties:
       - const: eth_lpi
       - const: sfty_ce_irq
       - const: sfty_ue_irq
+      - const: rx0
+      - const: rx1
+      - const: rx2
+      - const: rx3
+      - const: rx4
+      - const: rx5
+      - const: rx6
+      - const: rx7
+      - const: tx0
+      - const: tx1
+      - const: tx2
+      - const: tx3
+      - const: tx4
+      - const: tx5
+      - const: tx6
+      - const: tx7
 
   clocks:
     minItems: 1
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
