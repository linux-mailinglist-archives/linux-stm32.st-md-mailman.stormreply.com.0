Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A72ABB9D866
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 08:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32871C3F957;
	Thu, 25 Sep 2025 06:07:39 +0000 (UTC)
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD95AC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 15:34:20 +0000 (UTC)
Received: from sven-desktop.home.narfation.org
 (p200300c597296Be00000000000000C00.dip0.t-ipconnect.de
 [IPv6:2003:c5:9729:6be0::c00])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.simonwunderlich.de (Postfix) with ESMTPSA id 1DD0DFA184;
 Wed, 24 Sep 2025 17:34:20 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Wed, 24 Sep 2025 17:33:10 +0200
MIME-Version: 1.0
Message-Id: <20250924-backoff-table-support-v1-2-20e50fbc59de@simonwunderlich.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962; i=se@simonwunderlich.de; 
 h=from:subject:message-id;
 bh=uBaOvLBEYw6cM2ZE3ZNKPKFL8pnovauxKrJogvIVOw0=; 
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlX+BOtF5cppdqdDdoyofRg+lKtvE7HAw3X+VLevNlsm
 HZFmaOqo5SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjCRG4cY/hdccZZcEDKZzd1i
 jtnl5YdLrc+8nzpLtOkYc6tI4Qb2V7cYGS5y3dyhsV/hUGbVxIo089urX009qrkgVeD11Z3qv+q
 U/dkB
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-Mailman-Approved-At: Thu, 25 Sep 2025 06:07:36 +0000
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 "Sven Eckelmann \(Plasma Cloud\)" <se@simonwunderlich.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: net: wireless: mt76:
 introduce backoff limit properties
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

Introduce path backoff limit properties in mt76 binding in order to specify
beamforming and non-beamforming backoff limits for 802.11n/ac/ax.

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index f8f72f3f1b1dd185b4797be38b87c621ef3eac08..0b06455ce955c38b324efebf8c7762bee33b57f6 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -215,6 +215,66 @@ properties:
                       minItems: 13
                       maxItems: 13
 
+                  paths-cck:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values for beamforming
+                      (1 - 4 antennas, single spacial stream)
+
+                  paths-ru:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff values for 802.11ax rates for
+                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
+                      and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
+                  paths-ru-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff (beamforming) values for 802.11ax
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
+                      4T3ss and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
                   txs-delta:
                     $ref: /schemas/types.yaml#/definitions/uint32-array
                     description:

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
