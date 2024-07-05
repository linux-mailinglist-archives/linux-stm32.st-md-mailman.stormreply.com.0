Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8650928837
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 13:51:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 588F3C71282;
	Fri,  5 Jul 2024 11:51:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A878C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 11:51:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5896588605;
 Fri,  5 Jul 2024 13:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720180279;
 bh=9VuZ9JjG0OVOyH6QxkB1cOF/woKql5YBbDjXiKC+FtU=;
 h=From:To:Cc:Subject:Date:From;
 b=JXZimLhhXVEhDPIyZXLbse+6Xijhic69NeFNlg7mPwu4gn8X1qjsvgNIOkJDkEi7q
 l/KiXthug0hHLFyTfNCZP6oWTxJQhiO3F/TwUwqlmKjPPxLDXdQns9on62nw6nS4Xh
 qDBiNBlclDBkaO2XFmcbYfUC629bhS0TPYXLZX3amGjTkU9uwYItwvIDFYEgGQ7cMM
 pEmisgSkj4cDBeknt7U2QPCpqJPLOfgdauNzaOLlMgIzPdueiHy8bRq0AUmH0fJ8Lw
 sc+U3OMGEB61eWC3Kcdx1k4hON1gN1//Zom0zDt8wbkKjbGp9t+QP9IQRNtZXdOFq7
 zaexxOoSM6HEQ==
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org
Date: Fri,  5 Jul 2024 13:50:31 +0200
Message-ID: <20240705115052.116705-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: [Linux-stm32] [PATCH] dt-bindings: watchdog: stm32-iwdg: Document
	interrupt and wakeup properties
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

The watchdog IP can generate pre-timeout interrupt and can be used as
a wake up source. Document both properties.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
 .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index 6b13bfc11e114..86bd39d508500 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -36,6 +36,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  interrupts:
+    maxItems: 1
+    description: Pre-timeout interrupt from the watchdog.
+
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
