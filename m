Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177CBC08FE
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Oct 2025 10:11:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E609C3F945;
	Tue,  7 Oct 2025 08:11:38 +0000 (UTC)
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EF5CC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Oct 2025 08:11:35 +0000 (UTC)
Received: from sven-desktop.home.narfation.org
 (p200300C597021AE00000000000000c00.dip0.t-ipconnect.de
 [IPv6:2003:c5:9702:1ae0::c00])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.simonwunderlich.de (Postfix) with ESMTPSA id 55A69FA182;
 Tue,  7 Oct 2025 10:11:34 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Tue, 07 Oct 2025 10:11:15 +0200
MIME-Version: 1.0
Message-Id: <20251007-backoff-table-support-v3-2-fd6e2684988f@simonwunderlich.de>
References: <20251007-backoff-table-support-v3-0-fd6e2684988f@simonwunderlich.de>
In-Reply-To: <20251007-backoff-table-support-v3-0-fd6e2684988f@simonwunderlich.de>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3956; i=se@simonwunderlich.de; 
 h=from:subject:message-id;
 bh=JmHhqGG89jO2WbYbTgMaIlIgIBZxFYzyAwDnCRUHBlo=; 
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlPTuu+idRU67z180mKioCT4VH/1EdOHvJrlC3SPqpIN
 XzS2b6po5SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjCRS1GMDK9S9V2ePS4wvPVt
 8T6/3YUptzZe7FbYvejzJNYuh36VTHaGf/aP7cVCDredkss+HSu91kPrUJ9c5ev92zb+7l9z58y
 ZFzwA
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 "Sven Eckelmann \(Plasma Cloud\)" <se@simonwunderlich.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH mt76 v3 2/3] dt-bindings: net: wireless: mt76:
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 82b224c2f6f7..ae6b97cdc44b 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -216,6 +216,66 @@ properties:
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
