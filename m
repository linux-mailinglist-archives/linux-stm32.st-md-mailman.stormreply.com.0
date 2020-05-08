Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A261CB0C2
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 15:47:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2506C36B10;
	Fri,  8 May 2020 13:47:02 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2EE3C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 13:47:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 50so1386728wrc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Ie6+UuDf+byXPXqX2PqIi5x7CCl0W8NA5IcDm5qQXXA=;
 b=m6+WB7dkD5OY5SUi5lv4lAQ0mBcKHk146e1QwqFyiJLMV7m2seti2PPWrL7Mtg7jPO
 fXjmH/Vnwq/PvdNM4rnRQR2Tdqjfrj3LFUvE//ja5RmUll82j+lwt5OjJNUex+3tSuvB
 vdD4nx5w3ghYDD5wcoyKT9xS1a8iGCzZbYjXujuK8CbZnH5rGkqLhUfHhQC2/gQThxjY
 noNtQ/LLD6fvKiZkWu0yqgqC2AfhxNQmPFSnGMZNEjjDAEFNrPpG9xyYEcjTe4HXV4OU
 iv5bKD2VV9yDVTDx2E3g6Hze2Njrn0R7oUPj520tNshk0RmsY+buEld6wKdQOZL7oXfA
 vJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ie6+UuDf+byXPXqX2PqIi5x7CCl0W8NA5IcDm5qQXXA=;
 b=nSbmDvVtssxq1X28+DyNobBTMTLg3eNav0rXKkW/XZe8IVKBMFig6yO5exma42FSpt
 V4gr/avaJom4aWt+RdFdrsXV5EMpFBakscUFn+OP56N5Ot5DyvMBU8JEjumXSABLrQP5
 n6swc1u6qtqGgehkFhomNmI7DVaiWa7jhPU0F1SuSxJ3jjo45anauDjgmkqVOm5j6cLN
 D8ZoRnCrHAM1DhAk3o7kZDWhaunkw6MpTTTF1dCxp6EG6zux1rE3wZd/DfpdIK0Qgfzl
 YEXJUPXzimsEi5yhZlCsk/hfiExEGeJAkVuJqChTm+8A9gRl4DuRs4tIdjbvi69I+lLr
 lCtw==
X-Gm-Message-State: AGi0PuYR8MBLSx6BrtWdiabc49nDMRL02Vi+s9t5NiM+66Uj2Iv1vtQa
 V12jFOzqFeOb9wLxSOzYGzX7nQ==
X-Google-Smtp-Source: APiQypIPzHLCqcPpkTXMRiOcVbMkzFJd/j8pltNsJ1oUqIBWiQl4ZEevMtSVlfhwuPrcT/Rvkqk3Xg==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr3018508wrx.113.1588945620266; 
 Fri, 08 May 2020 06:47:00 -0700 (PDT)
Received: from lmecxl0524.home
 (2a01cb058702ff00bc4b798f4f30d41e.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8702:ff00:bc4b:798f:4f30:d41e])
 by smtp.gmail.com with ESMTPSA id p7sm3189464wrf.31.2020.05.08.06.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 06:46:59 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  8 May 2020 15:45:27 +0200
Message-Id: <20200508134527.26555-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: nvmem: stm32: new property for
	data access
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

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

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
