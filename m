Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47DCBFEB8
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 22:27:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB9DDC35E3C;
	Mon, 15 Dec 2025 21:27:08 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EC77C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 21:27:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF732419A7;
 Mon, 15 Dec 2025 21:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BDDC4CEF5;
 Mon, 15 Dec 2025 21:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765834026;
 bh=ksO7t38lHNhsA2pzzobpl6s+Z69+v/dzbkND9pR8gN4=;
 h=From:To:Cc:Subject:Date:From;
 b=oFjaieZf5e2XHuOqzdwVYbvycw+ge2R0jF1QOMKdAkV+s2YNgyHAi5+XA0ZgQi3Fw
 JtQlscIa2D12MTvsnGBxVanJZRi4jpCbVrIjKSRPztFFoI9oOOhfIUHTYFEaCvUVWN
 C/x8st5nzeJwFlCJADf3yc1jR9yF3t9oBgUOQB+t5nLICg03Yd8K9YbxVIEfosKR0e
 OigtU8Ie90RFCnshKgXHjxaZZ8weRhizWVSGGvs1XEJbF1CdSP0+Wywxf6jVhxZjkh
 n6YeEGjt/MrHBMbt97NdkCbfMsBXB4l2LbqV/L+NFxtDGS+FRIM6v1XXkSURK/aM28
 YAqm1NWbrIIoQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 15 Dec 2025 15:26:59 -0600
Message-ID: <20251215212700.3320634-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: bus: stm32mp25-rifsc: Allow 2
	size cells
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

There are users already with 2 size cells, and there's no reason to not
support that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index 4d19917ad2c3..c6280c8c54a3 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -54,7 +54,7 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 1
+    enum: [ 1, 2 ]
 
   ranges: true
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
