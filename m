Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 823DE1CF558
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 15:14:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D7D7C349C2;
	Tue, 12 May 2020 13:14:34 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30D77C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 13:14:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k12so21655407wmj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ucIamOxWoiikiTT7OyOk1rVSeBavTDD4mVIWBfGQ0Tg=;
 b=HhvGzsjgUcWS4ZqZpMHWKZ6oPMKgpOt/PCYx6PHdLARn1pl00Negjb8wMAe4LiENqa
 cvvCgPgIgXvxRAOJUDj7etyWlGa4OaRWWDV3azcbY99r6J2ubJUpENBOJpwniqb2C8wv
 0T6b/pFIazBufnzGCG7SFiHa4hg9iyktA2jRg/eSZ6txf1VRN9UDdShnlx9ifd7nqnYc
 ymhZ7gkbtUU4kI8m2cZ0ZfpW7dwvxgFxrXVHMd5aUz2s/IVMQAJpMtz3YeYYGrY3sCFh
 nAhUHWwBFUJaNOLcLRK1kHGfPj8bp2NROzB3CUiGno1WahODSUDWnWKNz2QwOKGnLnaF
 I1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ucIamOxWoiikiTT7OyOk1rVSeBavTDD4mVIWBfGQ0Tg=;
 b=RPj2Fr6M+jywJEzP7b0rmc4+4/JoN+VHcHOT1u02m8RfTHkQ57aYtqurR60u99meHk
 R3mp4PSpOifRYzyH45bFLQmUhs68gRcWsT05ERVBcr7oZfFzdKv1EZg81Ikd4F8uSBmU
 kqL9xx07AN9U5tivy1crJ3OSTV+gmZU+aKbbszAlF/ZnitbxDdDG1eiQQPvQGyOwQlQo
 T0JugJdIRCiHV1duvOTWd0por/qGyQNnjhK+8GNr1r5kPcLben9sDiqXcIQrpQQEphco
 Ob8Mso8+4Aht2hgeBMs3vioTCa9tUtgpBY2iiYp81JBClMDEFpGiJfwYDnftq7fokOBj
 Yenw==
X-Gm-Message-State: AGi0PuaDomOr6eJ+us72vI5dsZMTiyoXB6kjPLaacqfve3d8QyGX7Yyx
 beUlhirtxufJmV+9O/D1o/PUwA==
X-Google-Smtp-Source: APiQypJLgHGkWpi4Lcz/tiolMUMUWnpODhX3I8i/kPzrgclwoULRyPhWPJAIGGotuugAy+3zWXhlQQ==
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr39840046wme.177.1589289271434; 
 Tue, 12 May 2020 06:14:31 -0700 (PDT)
Received: from lmecxl0524.home
 (2a01cb058702ff00bc4b798f4f30d41e.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8702:ff00:bc4b:798f:4f30:d41e])
 by smtp.gmail.com with ESMTPSA id p9sm16480524wrj.29.2020.05.12.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 06:14:30 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 12 May 2020 15:13:34 +0200
Message-Id: <20200512131334.1750-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: nvmem: stm32: new property
	for data access
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

From: Etienne Carriere <etienne.carriere@st.com>

Introduce boolean property st,non-secure-otp for OTP data located
in a factory programmed area that only secure firmware can access
by default and that shall be reachable from the non-secure world.

This change also allows additional properties for NVMEM nodes that
were forbidden prior this change.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
Changes since v1:
  Change nvmem.yaml to allow additional properties in NVMEM nodes.

Link to v1:
  https://lore.kernel.org/patchwork/patch/1239028/

 .../devicetree/bindings/nvmem/nvmem.yaml        |  2 --
 .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 65980224d550..b459f9dba6c9 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -67,8 +67,6 @@ patternProperties:
     required:
       - reg
 
-    additionalProperties: false
-
 examples:
   - |
       #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index d84deb4774a4..c11c99f085d7 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -24,6 +24,18 @@ properties:
       - st,stm32f4-otp
       - st,stm32mp15-bsec
 
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+    properties:
+      st,non-secure-otp:
+        description: |
+          This property explicits a factory programmed area that both secure
+          and non-secure worlds can access. It is needed when, by default, the
+          related area can only be reached by the secure world.
+        type: boolean
+
 required:
   - "#address-cells"
   - "#size-cells"
@@ -41,6 +53,11 @@ examples:
       calib@22c {
         reg = <0x22c 0x2>;
       };
+
+      mac_addr@e4 {
+        reg = <0xe4 0x8>;
+        st,non-secure-otp;
+      };
     };
 
 ...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
