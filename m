Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD28C25D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 22:55:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7521C35E02;
	Tue, 13 Aug 2019 20:55:32 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A081DC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 20:55:31 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id h21so662186oie.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 13:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRcjRzXsLYZcKkMeLECf7vG301P7B0XZvNn+RUsuARg=;
 b=kny9GzeBGIovqOEQ4MOQJT6vsRYZgFk4icS/77K1bqDfX8w/YkiH/XBY1fSaxagQB5
 5ExipAVnsWgSeVS6g9mNsndPPbKSS9WzMMs5IsxDWXb1uf5EFww9P9nT2+ZYv4Z4GT2h
 HCyg1WBEPzje6KLuk4CSOWs23mCksKZcCtYrtoFIIYUk3Wdk9qgTilIAbl3V19TA2kVC
 30T2o8sSpx5JiA8W84Uxoaj4ZgR2rtESD9cmdX/FgsDrGiIECwrehHrVAhrAnLaixu1l
 rdNt9O/CWAKbAwCPFGl78JaKYLSabAGtpDzAbZfu0TFDabke++cNbiM+1UdAi1rQkw02
 nDmA==
X-Gm-Message-State: APjAAAV/E2yrI803lHa0+FQvBOZXcHaHKV5wQfFgvJ3GIDCJBBQ0zwHv
 +bPMgY9O84QTf8UaQgA8Aw==
X-Google-Smtp-Source: APXvYqxjYk48K/xApN8bRzF+K+cyfVT+7GZOGNiswrJt4E2UxIRabfgvTQ/6FwmQTxYes48I9p8I+g==
X-Received: by 2002:a02:7121:: with SMTP id n33mr45263919jac.19.1565729730148; 
 Tue, 13 Aug 2019 13:55:30 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id
 m10sm204917375ioj.75.2019.08.13.13.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 13:55:29 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Date: Tue, 13 Aug 2019 14:55:28 -0600
Message-Id: <20190813205528.16651-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: Fix 'st,
	syscfg' schema
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

The proper way to add additional contraints to an existing json-schema
is using 'allOf' to reference the base schema. Using just '$ref' doesn't
work. Fix this for the 'st,syscfg' property.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I've got some other fixes queued up and can take this via the DT tree.

Rob

 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 91d3e78b3395..400df2da018a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -37,7 +37,8 @@ properties:
   hwlocks: true
 
   st,syscfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: Should be phandle/offset/mask
     items:
       - description: Phandle to the syscon node which includes IRQ mux selection.
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
