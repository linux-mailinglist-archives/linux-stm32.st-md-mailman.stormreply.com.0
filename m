Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB44869F0
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 19:30:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DF1FC5F1FD;
	Thu,  6 Jan 2022 18:30:51 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1626AC5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jan 2022 18:30:50 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 g79-20020a9d12d5000000b0058f08f31338so4078074otg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jan 2022 10:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jO+eguqfmGf5pi00MAsfJ6vjkTO2C4qOS/bN4M0iDpw=;
 b=kfPjvTvgksgywYpNUUyXqjxX6hZ2ZhFTfwlQJV0KF6hMWdV0xt+xWzFC7aoSOut3z/
 xlo13pW5qTn/zrjmY2rwmL/yeJkgAaYbmW3recoh6VPr2mW+is+jUw0iVHqe43r/OLHi
 yxx8N6Bcug0Logk+4mbk3AphdYuojUQUmgcUUfd30ZDJCaLytxXrS0oYxaBgZVKz+VBd
 AAYA4KZg9m5kWuVuFoeUkKGmea7KZ9zHwJ5VCDxAXI9OXSN+fHhUtgLvM4LD8lO22+6T
 4DexEu6S1Dnhyt8NcRq4dRGP78ApDVShmbUPKammL9FrC2s2jzXGIiWgIkTxOxZft+W4
 DCzA==
X-Gm-Message-State: AOAM533HH+8dds6wMOb0nvSuqSULfVStAJIEQm/CcLppxTJ080aMAFCS
 1C4RkAuWLH+3MFD9EJ910w==
X-Google-Smtp-Source: ABdhPJwRHmskJrvolKwtpLzlY7qGfudTL81YkdkwIKjkAYmdjppy/ap0Pp1Ye0/aRlf02WmvHRa6gA==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr7228971otj.100.1641493848891; 
 Thu, 06 Jan 2022 10:30:48 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g2sm472767oos.47.2022.01.06.10.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:30:48 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Date: Thu,  6 Jan 2022 12:30:36 -0600
Message-Id: <20220106183037.1443931-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
	stm32-i2c: Make each example a separate entry
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

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index c07289a643d8..46b62e1c9273 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -112,6 +112,9 @@ examples:
           clocks = <&rcc 0 149>;
       };
 
+  - |
+    #include <dt-bindings/mfd/stm32f7-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 2 (with st,stm32f7-i2c compatible)
       i2c@40005800 {
           compatible = "st,stm32f7-i2c";
@@ -124,6 +127,9 @@ examples:
           clocks = <&rcc 1 CLK_I2C1>;
       };
 
+  - |
+    #include <dt-bindings/mfd/stm32f7-rcc.h>
+    #include <dt-bindings/clock/stm32fx-clock.h>
     //Example 3 (with st,stm32mp15-i2c compatible on stm32mp)
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
