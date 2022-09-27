Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B05ECCB3
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 21:17:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5372EC63328;
	Tue, 27 Sep 2022 19:17:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B75F9C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 19:17:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B425C8484A;
 Tue, 27 Sep 2022 21:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664306273;
 bh=K+LdwArTrNbcDaYPteiwwtTntyntBS6HKK7G0dgHUlY=;
 h=From:To:Cc:Subject:Date:From;
 b=Z04jZNIeVlKtVNezCZi6BehtR9o+Z7RJ3KiOo/wRacIFHP5YI3nVn9Kgeq+KebO52
 HnDgTxFlPAblTPW71U3fL2513IuJ55LKldiTBldFgm7kbFbzkmD3fpWrUPYmyAxanM
 aCyPHEWIxjeWF9Nklq7WfiPljEmweT8c2hMVkMz0WnBn6vrDpbq8mSZ8VnUm1FxGD4
 0o0WxCUw3aiYDmdzVgYbx1Oj5gCV3bpF9J2BMd3FDePR4K0xLVxjSgfeXpSsEW7Fr5
 uziedMXhr1iKdH3xM0Ug7KwX8wNSsSylV0VesOF8BPvII5dhfApgKJHZJHnK5MtULg
 bwxUojrKwpm7g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 21:17:34 +0200
Message-Id: <20220927191736.299702-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: arm,
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
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 1e69a5a42439b..a0ddf6495f85e 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -95,7 +95,8 @@ properties:
       PIO (polled I/O) interrupt and occurs when the FIFO needs to be
       emptied as part of a bulk read from the card. Some variants have these
       two interrupts wired into the same line (logic OR) and in that case
-      only one interrupt may be provided.
+      only one interrupt may be provided. The interrupt-names property is
+      not used due to inconsistency of existing DTs regarding its content.
     minItems: 1
     maxItems: 2
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
