Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9318330903
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 08:55:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72547C57B78;
	Mon,  8 Mar 2021 07:55:57 +0000 (UTC)
Received: from ms9.eaxlabs.cz (ms9.eaxlabs.cz [147.135.177.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C2ECC57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Feb 2021 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; 
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=8wPT4Fm48tx8LmVMJofADhT1X8gmYD2rnn9e/GVcaI8=; 
 b=DAA86fc2l4F9PgbnBHiDCmOFqfsgbk40nERbUwxTJ/aQJF4QQ7Vy6R/T9Fq05piUaSUIrsBr1ObHawdlhdj3shaXI6AuaQK79snC1Qvrc03FPXBakdU+lEBcxsRs62twvdzVQiLYIA0siRsPkcQzw8JCQVWYhbbh+VUbULrwsUc=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lG2fg-0005pS-Ed; Sat, 27 Feb 2021 17:42:26 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Feb 2021 17:41:57 +0100
Message-Id: <20210227164157.30971-2-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210227164157.30971-1-devik@eaxlabs.cz>
References: <CAL_JsqK8+M=Vg0PiDXP2f1LrEp4hSVea6piAASMGu1H=pxme6Q@mail.gmail.com>
 <20210227164157.30971-1-devik@eaxlabs.cz>
X-Mailman-Approved-At: Mon, 08 Mar 2021 07:55:55 +0000
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Devera <devik@eaxlabs.cz>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Le Ray <erwan.leray@st.com>
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: serial: Add rx-tx-swap to
	stm32-usart
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

Add new rx-tx-swap property to allow for RX & TX pin swapping.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 8631678283f9..45f2a19997da 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -40,6 +40,10 @@ properties:
 
   uart-has-rtscts: true
 
+  rx-tx-swap:
+    type: boolean
+    maxItems: 1
+
   dmas:
     minItems: 1
     maxItems: 2
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
