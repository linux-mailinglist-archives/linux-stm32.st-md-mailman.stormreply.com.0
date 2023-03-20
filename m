Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9B6C1350
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 14:28:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3126C6A612;
	Mon, 20 Mar 2023 13:28:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FBA6C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 13:28:11 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1peFYZ-00065i-1h; Mon, 20 Mar 2023 14:28:11 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 20 Mar 2023 14:27:53 +0100
Message-Id: <20230320132755.2150384-9-s.trumtrar@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
References: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [Linux-stm32] [PATCH v5 08/10] dt-bindings: arm: stm32: Add Phytec
	STM32MP1 board
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

The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to
1 GB eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 13e34241145b4..4af5b8f4f8032 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -155,6 +155,12 @@ properties:
           - const: seeed,stm32mp157c-odyssey-som
           - const: st,stm32mp157
 
+      - description: Phytec STM32MP1 SoM based Boards
+        items:
+          - const: phytec,phycore-stm32mp1-3
+          - const: phytec,phycore-stm32mp157c-som
+          - const: st,stm32mp157
+
 additionalProperties: true
 
 ...
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
