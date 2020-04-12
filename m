Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D271A7458
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 09:10:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF19EC36B0F;
	Tue, 14 Apr 2020 07:10:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFD02C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2020 18:09:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.50.0.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E80E4206E9;
 Sun, 12 Apr 2020 18:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586714998;
 bh=BUxT5IqaNvB9TgDMR7VN/qHcX2xgt0z3BHmRoAVi8ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tKZgTR5H9n/+i9uvei5y+H4cpl7/P9LBuQV/mbHcvLwYjnhiUvBzUgKziqmln0BMf
 WMtSvMLCAXeyZryxOSU5YTztOHiOm75PVTsi6C8yxESQTxhFRuDVfYk9Uf0/68c/DM
 B+ujRUPVFg89VKeOKHTM6wPiy+vAQohRPyOCk3b0=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Sun, 12 Apr 2020 23:39:22 +0530
Message-Id: <20200412180923.30774-2-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200412180923.30774-1-mani@kernel.org>
References: <20200412180923.30774-1-mani@kernel.org>
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:10:13 +0000
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: Add binding for
	software flow control in STM32 UART
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Manivannan Sadhasivam <mani@kernel.org>

Add devicetree binding for software flow control in STM32 UART
controller. While at it, let's also fix one schema error reported by
`make dtbs_check`.

Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---

Rob: Still the `dtbs_check` validation fails. This is due to the
`linux,rs485-enabled-at-boot-time` property. I don't have any idea on how
to fix this.

 .../devicetree/bindings/serial/st,stm32-uart.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 238c44192d31..ea5797a1b403 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -38,13 +38,26 @@ properties:
     description: enable hardware flow control
     $ref: /schemas/types.yaml#/definitions/flag
 
+  st,sw-flow-ctrl:
+    description: enable software flow control
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  rts-gpios:
+    description: RTS pin used if st,sw-flow-ctrl is true
+    maxItems: 1
+
+  cts-gpios:
+    description: CTS pin used if st,sw-flow-ctrl is true
+    maxItems: 1
+
   dmas:
     minItems: 1
     maxItems: 2
 
   dma-names:
     items:
-      enum: [ rx, tx ]
+      - const: rx
+      - const: tx
     minItems: 1
     maxItems: 2
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
