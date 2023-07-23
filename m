Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BA75E3A0
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jul 2023 18:22:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FE9C6B45A;
	Sun, 23 Jul 2023 16:22:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58478C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jul 2023 16:22:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5949960E83;
 Sun, 23 Jul 2023 16:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2245C433C9;
 Sun, 23 Jul 2023 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690129354;
 bh=M4Eba7JQy2lgUhZ/eOWiOdfCqNDYEzVkATepNOkg4FI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jOvbnl2BUJle/h5pYPzr+kYVhkMejvSw3/GGZqULllNFjpbhOMDD1SMaVNkTB9fhj
 TozGaLLcoKo23M+pz7O9iiz6EvOKeMlWszMxYcHFUBdH+efkSbQrg6Guale3QRTVez
 0EJVtpGFJJSZFcnTzGHeAOj4BqFpIZ4jYNrzF9sp0p2N2uDjAbzjNCJl/TfJzcoyYQ
 HzGoZ+V2wDZKYuJQbTMRBltvJ4DrYUFvFHWSKr3S7xcal9Txjw3M2u13KL6Xu/Tu3G
 A0ULSwyzR36AYWwvKsKFbSdosjkAHWCcCmO5m7RSxXcoKA2b6tJY4vaeg285pA+u3y
 FfPCLgeoLv42g==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 24 Jul 2023 00:10:26 +0800
Message-Id: <20230723161029.1345-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230723161029.1345-1-jszhang@kernel.org>
References: <20230723161029.1345-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 07/10] dt-bindings: net: snps,
	dwmac: add safety irq support
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

The snps dwmac IP support safety features, and those Safety Feature
Correctible Error and Uncorrectible Error irqs may be separate irqs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..bb80ca205d26 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -107,6 +107,8 @@ properties:
       - description: Combined signal for various interrupt events
       - description: The interrupt to manage the remote wake-up packet detection
       - description: The interrupt that occurs when Rx exits the LPI state
+      - description: The interrupt that occurs when Safety Feature Correctible Errors happen
+      - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
 
   interrupt-names:
     minItems: 1
@@ -114,6 +116,8 @@ properties:
       - const: macirq
       - enum: [eth_wake_irq, eth_lpi]
       - const: eth_lpi
+      - const: sfty_ce_irq
+      - const: sfty_ue_irq
 
   clocks:
     minItems: 1
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
