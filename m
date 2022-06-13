Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D67325483BA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 11:54:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8521BC6046D;
	Mon, 13 Jun 2022 09:54:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ECD0C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 09:54:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D2308432A;
 Mon, 13 Jun 2022 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655114041;
 bh=/UqHojcs8uVqncY+sgb/pjefqGptSVOBv3BUQXXuLdg=;
 h=From:To:Cc:Subject:Date:From;
 b=f8xQjuJDcQdWdEDLiKogsp01gDACvLS7h2Pi9f+uJfDjco9D4uQcb1HCXnbgS+S+C
 TE9Oojj7p9LBAHd5z5DfkEWgoMBPLghAl14YY7+mzTlQ0wcjvNYl/Eo7i92Fvz7hSy
 BNyUL1uU5lGN7+PX30qQo9Cw2Hb4qyrz/kjYtttwbglkuftNxDF9NosxSw/45xBo9R
 LZlne6KyFVbzGz27CJjUijuVHrhXwbDhSAeUMlm7dE8c2EvKUNWutJnUvW9ZvRqf5D
 x7raPf0pHAzuYaD5gaVaYjKeLfvaPM32RFGu8kfuXxoDGhBEh7wkNHBkCp3c0SPsIv
 tSpYt5TgAoTuw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Jun 2022 11:53:22 +0200
Message-Id: <20220613095328.5661-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: arm: stm32: Add compatible
	string for DH electronics DHCOR DRC Compact
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

Add DT compatible string for DH electronics STM32MP15xx DHCOR on DRC Compact
carrier board into YAML DT binding document. This system is a general purpose
DIN Rail Controller design.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 8b31565fee591..17366d9cf15bf 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -61,8 +61,12 @@ properties:
 
       - description: DH STM32MP153 SoM based Boards
         items:
-          - const: dh,stm32mp153c-dhcom-drc02
-          - const: dh,stm32mp153c-dhcom-som
+          - enum:
+              - dh,stm32mp153c-dhcom-drc02
+              - dh,stm32mp153c-dhcor-drc-compact
+          - enum:
+              - dh,stm32mp153c-dhcom-som
+              - dh,stm32mp153c-dhcor-som
           - const: st,stm32mp153
 
       - items:
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
