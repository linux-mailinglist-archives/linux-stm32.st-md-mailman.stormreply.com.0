Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD41B1273
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 19:02:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 903B8C36B0C;
	Mon, 20 Apr 2020 17:02:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE660C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 17:02:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.46.94.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DF512145D;
 Mon, 20 Apr 2020 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587402144;
 bh=fraYpNQInSieEMwqioocy3rdP0VDN1sVShjt3tsDnu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CClwiXgV2eJ8HfEUWRwnUNVbGvxJteBm6rbSMnRi7/h8yMF6IFYUzLyD1R3seKA8O
 ySK3I48g2JrAu6uN97+uedncaTzs5U3EtBWfjKC+XRdK8a5CoehereIixskjxFEDlt
 RFHzVaN29QlTqAET5ZNca5b3c1s+E9WP+xN+QCfI=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon, 20 Apr 2020 22:32:03 +0530
Message-Id: <20200420170204.24541-2-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420170204.24541-1-mani@kernel.org>
References: <20200420170204.24541-1-mani@kernel.org>
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: serial: Document CTS/RTS
	gpios in STM32 UART
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

Document the use of CTS/RTS gpios for flow control in STM32 UART
controller. These properties can be used instead of 'st,hw-flow-ctrl'
for making use of any gpio pins for flow control instead of dedicated
pins. It should be noted that both CTS/RTS and 'st,hw-flow-ctrl'
properties cannot co-exist in a design.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 238c44192d31..75b8521eb7cb 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -48,6 +48,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  cts-gpios:
+    maxItems: 1
+
+  rts-gpios:
+    maxItems: 1
+
   wakeup-source: true
 
   rs485-rts-delay: true
@@ -55,6 +61,14 @@ properties:
   linux,rs485-enabled-at-boot-time: true
   rs485-rx-during-tx: true
 
+if:
+  required:
+    - st,hw-flow-ctrl
+then:
+  properties:
+    cts-gpios: false
+    rts-gpios: false
+
 required:
   - compatible
   - reg
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
