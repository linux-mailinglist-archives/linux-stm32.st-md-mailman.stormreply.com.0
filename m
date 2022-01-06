Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6A4869C5
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 19:25:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBABCC60460;
	Thu,  6 Jan 2022 18:25:39 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F34E9C5F1FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 18:25:38 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id t204so4897446oie.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 10:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0GqoTWktQCAeb/b2q3miftVXfpqdRPH7Wi0Ph2/me+8=;
 b=0UB+zhrFKEQrJ0Rxft1+wtcBuDK+0cfXpIVc5uffOWXtroC4fFjqI08hur7EAzCjvZ
 AvmjucjomMTt/BUIwTo4pGR2GNB3nfnfErMN04j0vppk51dBEfHH9WHJpFibOqmEfAYh
 BRyXFRFetYoPYDy8FY/r05b7Yob7u89h0xSBvM6znAToSLf7F+uWJIf71MeEo+r9Fk4L
 1qVG0rQmDwHYl2SaKS4CSPYciQQZ4Hkgwgy5AXT2XsWZb5zPzMoF6N12NCMgTUr74+07
 QbIekAp4rzUF9hL7TDciwhAhCluP1H1ttHCGyJoHL5+LUZ5OiuMjlBwTbtSty64U+Fd7
 5AVw==
X-Gm-Message-State: AOAM530s6nbb0UL8TRPmTntK/DMD7g0OtCI4ic6rsUrWvgr3Mnb5nZij
 yJBDzMCgw7S7ZrXnN57Dkw==
X-Google-Smtp-Source: ABdhPJx0/7FuhIt5ZofcvReC3m8vHWsc5MYNpHeEWkedihlt3E7Ykuzt1p4+IbAXWN4jmADlwgW3Aw==
X-Received: by 2002:a54:450b:: with SMTP id l11mr7108210oil.139.1641493537898; 
 Thu, 06 Jan 2022 10:25:37 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id r13sm484949oth.21.2022.01.06.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:25:37 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Thu,  6 Jan 2022 12:25:16 -0600
Message-Id: <20220106182518.1435497-8-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: net: stm32-dwmac: Make each
	example a separate entry
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

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

The first example also has a phandle in 'interrupts', so drop the phandle.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 577f4e284425..f41d5e386080 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -102,7 +102,7 @@ examples:
            compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
            reg = <0x5800a000 0x2000>;
            reg-names = "stmmaceth";
-           interrupts = <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+           interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
            interrupt-names = "macirq";
            clock-names = "stmmaceth",
                      "mac-clk-tx",
@@ -121,6 +121,7 @@ examples:
            phy-mode = "rgmii";
        };
 
+  - |
     //Example 2 (MCU example)
      ethernet1: ethernet@40028000 {
            compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
@@ -136,6 +137,7 @@ examples:
            phy-mode = "mii";
        };
 
+  - |
     //Example 3
      ethernet2: ethernet@40027000 {
            compatible = "st,stm32-dwmac", "snps,dwmac-4.10a";
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
