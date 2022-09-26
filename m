Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A65EB477
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 00:20:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3F9AC63324;
	Mon, 26 Sep 2022 22:20:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9392DC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:20:08 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E752884DED;
 Tue, 27 Sep 2022 00:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664230808;
 bh=xWEC88ICC5eG700pHkzVgesYgd4fAdZif8lZwc/23q0=;
 h=From:To:Cc:Subject:Date:From;
 b=NK4VO1uRR2+38kXs7pfB4ID8oJI0ZIQ6aJH9TeEQNXAQSj6O0aSBj/8sfRuIs3lMc
 Lv4FvjPk4unKDQUT9Pf0Ue9m/k0UAnGyaxKYi1nDwWaWPShZFS09Hk55BWYlMSX7Yg
 YsFRwlXUqmASg2n37H3TnQNdiFDO6KDMQo6lfAKty8C6bb86h5ivIaPL9NrJxnd/pn
 ychwmTpXdnyxjP64D6eAlvodK1S8uGvTuaxhXw3UGpaoTPiXvlFiOaNdY3dxZAbV/w
 v0Wh+fQzOPq154JLTn1qMtp2bPqP5CxpKl57FEsnHEubkS3g0iNHnB/T/2ssRktsXE
 NhXDZJB+lba7Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Sep 2022 00:20:03 +0200
Message-Id: <20220926222003.527171-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
	stm32: Fix st, fmc2_ebi-cs-write-address-setup-ns
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

The property st,fmc2_ebi-cs-write-address-setup-ns should really be
st,fmc2-ebi-cs-write-address-setup-ns (there is underscore _ between
fmc2 and ebi and there should be a dash - instead). This is a remnant
from conversion of old non-upstream bindings. Fix it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
index 6b516d3895af2..a1f535cececcc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.yaml
@@ -156,7 +156,7 @@ patternProperties:
         description: This property defines the data latency before reading or
           writing the first data in nanoseconds.
 
-      st,fmc2_ebi-cs-write-address-setup-ns:
+      st,fmc2-ebi-cs-write-address-setup-ns:
         description: This property defines the duration of the address setup
           phase in nanoseconds used for asynchronous write transactions.
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
