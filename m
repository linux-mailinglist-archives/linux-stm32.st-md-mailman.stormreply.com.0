Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA95B9D868
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F0BC3F954;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5894DC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 15:34:19 +0000 (UTC)
Received: from sven-desktop.home.narfation.org
 (p200300C597296be00000000000000C00.dip0.t-ipconnect.de
 [IPv6:2003:c5:9729:6be0::c00])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.simonwunderlich.de (Postfix) with ESMTPSA id 2C3DFFA130;
 Wed, 24 Sep 2025 17:34:18 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Wed, 24 Sep 2025 17:33:09 +0200
MIME-Version: 1.0
Message-Id: <20250924-backoff-table-support-v1-1-20e50fbc59de@simonwunderlich.de>
References: <20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de>
In-Reply-To: <20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=se@simonwunderlich.de; 
 h=from:subject:message-id;
 bh=pa03GJbD9ITiVTNCYJUKaELBwKC4tTy/GDvazBnS/g0=; 
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlX+BO2r32Wpik86WrpXv24J/tZ3wr++VP/RENf8/vp9
 tU/a+bWd5SyMIhxMciKKbLsuZJ/fjP7W/nP0z4ehZnDygQyhIGLUwAmIvOFkeGXtXli1vo18sdY
 OhVb/s1bfvGhjcivFdz6/Lu4jJuPuSxnZHhyNfHJf/cNMVufTbuufjRYIfLr8/PtSS4vamz4zHb
 dO8UNAA==
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:36 +0000
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 "Sven Eckelmann \(Plasma Cloud\)" <se@simonwunderlich.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: net: wireless: mt76:
 Document power-limits country property
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

The commit 22b980badc0f ("mt76: add functions for parsing rate power limits
from DT") added filtering of the power limits based on two properties:

* regdomain
* country

If either the country or the regdomain matches, the power limits are
applied and the search is aborted. If none of the two is defined for the
power limit, it is a global (or "fallback") power limit. The last
"fallback" power limit in the list will be returned when not matching
regdomain or country was found.

The idea is here to allow to specify "overwriting" country limits in front
of the list - just in case a regdomain is shared but a country has
additional limitations.

But this property was forgotten to be defined in commit 2de6ccebe0e7
("dt-bindings:net:wireless:mediatek,mt76: introduce power-limits node").

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index eabceb849537c418650697da86682ef04c979193..f8f72f3f1b1dd185b4797be38b87c621ef3eac08 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -151,6 +151,11 @@ properties:
               - ETSI
               - JP
 
+          country:
+            $ref: /schemas/types.yaml#/definitions/string
+            description:
+              ISO 3166-1 alpha-2 country code for power limits
+
         patternProperties:
           "^txpower-[256]g$":
             type: object

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
