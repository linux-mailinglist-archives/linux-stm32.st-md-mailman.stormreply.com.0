Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A65CF5FE50A
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 00:13:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 578EFC64112;
	Thu, 13 Oct 2022 22:13:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CBA2C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 22:13:00 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 22BCF80250;
 Fri, 14 Oct 2022 00:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665699179;
 bh=Swfy0gFOl+unhotQmbb1ygGE8XeTWqMe0AbLQNmRM0w=;
 h=From:To:Cc:Subject:Date:From;
 b=vgU30Q9MCHAoNAao0D3X6bkvHdRoCjqDkNT90wGinlMH7Xazmhd5nJYA5M0aZ+oXg
 Hz7mPiylJhcQ2PEgv9/AfXgNrL96ivXaUy9vb/UmDEwxxD6twuZG6jtVzljgoGmGVH
 bBSxyLMrQ5EFCMzdueFPk45a2fit8/YiaPJcGRbaZo3beGYQqmOzMEWcY/v8F9xUbD
 kap1mr3YdFNKSGy8F5nN1SlRvsI2ApwqQkPvq7IPzO9F4lpEFryyHBR/Io0MLEwkM4
 JZ9yYUcM4mxGHkKXNYcGnhENdxLLcIinSif+AHm29+iO/knIyDl/DCvfnnxiAlsvlm
 Qs+4nl/Pp6VGQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 14 Oct 2022 00:12:40 +0200
Message-Id: <20221013221242.218808-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
	pl18x: Document interrupt-names is ignored
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

Due to inconsistency of existing DTs regarding the content of this IP
interrupt-names DT property, document this such that interrupt-names
is not used by this IP bindings.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Yann Gautier <yann.gautier@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: Add deprecated:false to interrupts: description
---
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 1e69a5a42439b..1c96da04f0e53 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -95,7 +95,9 @@ properties:
       PIO (polled I/O) interrupt and occurs when the FIFO needs to be
       emptied as part of a bulk read from the card. Some variants have these
       two interrupts wired into the same line (logic OR) and in that case
-      only one interrupt may be provided.
+      only one interrupt may be provided. The interrupt-names property is
+      not used due to inconsistency of existing DTs regarding its content.
+    deprecated: false
     minItems: 1
     maxItems: 2
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
