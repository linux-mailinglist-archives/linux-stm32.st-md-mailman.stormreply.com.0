Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E197815126
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 21:40:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F773C6DD6F;
	Fri, 15 Dec 2023 20:40:54 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0DAAC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702672853;
 bh=gbMqiSFoR5LPx4Im1XNHPktHQYnQ4AzMO0qHDjq0wBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJR5bet0x6ovqtlM5pgefNb4uk2jqKyyRxO1JRRMDNoqjstTe5BsBH7/dECMy2uH3
 tjeqz1ymYbt4/Vi83HBKlzNN/LjkW3IyZPkPFyjkXiZxFz6SkPkXhnAoeuT3lS5a1a
 ++gZDds7RE5lMoIdqllqEl+61+tWjQYq5PW+eBxYjWXJVyMeDAltV79iCf3ws0bJUB
 JqS1cIrp1i8cmW/4D8L2o8XrbU9ovfYI86NIH59A4oJbDQ/bKF87QObiL4QpcRyvxs
 4K09sAK15xStomieLR4f9CaIGT5P8zyoId0dmUgi94i35/SwMZfGOKW3rFztRE/lRh
 onym6JmRWsk9w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1233B3781FE3;
 Fri, 15 Dec 2023 20:40:53 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 15 Dec 2023 22:40:40 +0200
Message-ID: <20231215204050.2296404-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/9] dt-bindings: net: starfive,
	jh7110-dwmac: Drop redundant reset description
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

The reset description items are already provided by the referenced
snps,dwmac.yaml schema, hence replace them with the necessary
{min,max}Items.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 5e7cfbbebce6..d90cb82c1424 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -55,9 +55,8 @@ properties:
     maxItems: 3
 
   resets:
-    items:
-      - description: MAC Reset signal.
-      - description: AHB Reset signal.
+    minItems: 2
+    maxItems: 2
 
   reset-names:
     items:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
