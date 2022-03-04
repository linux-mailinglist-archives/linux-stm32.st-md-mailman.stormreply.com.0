Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D274CD1AC
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 10:55:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 079DAC60496;
	Fri,  4 Mar 2022 09:55:07 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B3B1C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 09:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3924D1F46486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387706;
 bh=e4C8wnAcuL8k5FwceR/IW4yZe9+rSJuGVPXQwJtpD1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUR/YCFlNX2e6vMy8tlrinUWThnwSawU1hOBQWS4mR9lrCsnEdKiPotxuyZSznHoW
 CuxSxQ+db6rQ/SknV8SZF4B3iV0XwDiQ7VKqxVuimOTDAJJRV5uJqj7oJHy/typqbs
 qpx0Sm0URGHzD99/nutjEt2AYZ+C+5/7Fx2C+EHp5+2Tbvo6kGuF3qeLb0rOhmHpe2
 VC1LRjx5/4DaxeSzPCai0uD5191p6KeXqNX7SEkK9ilbpTBR93J2YtkmYUVWUdHFWi
 mNNw6yzpAgEawpwBqgjcOp6pwzn+NgIfg3vjuZ7S+mec55/ePOaFn6I9Jh5C6wNXX3
 bCMDOHNO63iMw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Fri,  4 Mar 2022 10:54:57 +0100
Message-Id: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: display: mediatek,
	ovl: Fix 'iommu' required property typo
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

The property is called 'iommus' and not 'iommu'. Fix this typo.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 93d5c68a2dbd..fc691d00c60e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -75,7 +75,7 @@ required:
   - interrupts
   - power-domains
   - clocks
-  - iommu
+  - iommus
 
 additionalProperties: false
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
