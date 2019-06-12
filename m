Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB341E4B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 09:55:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D26DC5DBD8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 07:55:18 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72CBBC5DBD7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 07:55:16 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p1so6302034plo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ddmyf9yTEwlfHCzubut1+DzdJc/PcrZsJL5uTZc4yfE=;
 b=naECvcLA5b+ikhmyDk1YLXvhPLPCup9xIr0OEPfNZq/YqaOQKD1US6XtcnKca3PyrX
 bS4UZiBYiQmNmGgQ0PHd0Pc5zsJFZJte92oiMsouZ/6hZL5caUyz5JVsLCSMfcMwekA5
 W8GFIeuttEZGufRFlCDfOWDY6meAbjQfHmhtnqmKMl97G8fpOsIGpMdAr2Sx2or9umrH
 HGKJLY2DI7pkC2v9OSawkWU+Q8oq9CyE39MCKWWLqQEW17vncFA7PjIeEAyeF5vORafF
 +eTbVWyCkWrnw7G2YeduVn3IGEasK2w9lxkHgo8d5n/wtLwv0f3frqGhWVK86HxSmRZ0
 UgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ddmyf9yTEwlfHCzubut1+DzdJc/PcrZsJL5uTZc4yfE=;
 b=nKWbLqk3A5xSpiz4p6t6M5+jlvkiwUvY7G4jArWK+fm3I9+xBv871ohOkDC+6Uf9VZ
 1PESUwxCXnhxbi+zZ6NRBnTHBUVRyj3fVueSI98fI6DZNd2vLz/RCqmgh1f1PmgMONC2
 eFipfGlDpQn90eLPkhrSouxLUzgSZMHNFbFuEp3ox8+94PLCm7u6UoYXdv5zGvkJRXf6
 tcM4AcUCL7DFJJWcU0eW+Tv9CxVQoJHWI1qZP2HV3NwHvuJ3fpGy12CKzzG3r0Ti9s5a
 Nf4FnZjMEtONqc47z7Cfp52QuyIwpw6Uw+dNe6GkgFKkWukpA67YgWv+QZ2vKbuX2de2
 AvFw==
X-Gm-Message-State: APjAAAXqkV8ViAGgHazvI2aq4qO3RRHd9h3EWUAQ45C+l4H5Yj0l2lkd
 h3FVWC/kAMR1eXKhxRVsZzwHlWmQYpDK
X-Google-Smtp-Source: APXvYqx7tmatLIV5lw0AoibaBm7aPYmU16s1G88Rxa+htlmSOMrfzpqbjFDCivcdIqj+XjXUxs362Q==
X-Received: by 2002:a17:902:b905:: with SMTP id
 bf5mr80896870plb.155.1560326114920; 
 Wed, 12 Jun 2019 00:55:14 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:894:d456:15b5:9ca9:e3ec:c06a])
 by smtp.gmail.com with ESMTPSA id b15sm16846399pfi.141.2019.06.12.00.55.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 00:55:14 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Wed, 12 Jun 2019 13:24:49 +0530
Message-Id: <20190612075451.8643-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, loic.pallardy@st.com,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/4] dt-bindings: arm: stm32: Convert STM32
	SoC bindings to DT schema
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

This commit converts STM32 SoC bindings to DT schema using jsonschema.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/arm/stm32/stm32.txt   | 10 -------
 .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
 2 files changed, 29 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.txt
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
deleted file mode 100644
index 6808ed9ddfd5..000000000000
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-STMicroelectronics STM32 Platforms Device Tree Bindings
-
-Each device tree must specify which STM32 SoC it uses,
-using one of the following compatible strings:
-
-  st,stm32f429
-  st,stm32f469
-  st,stm32f746
-  st,stm32h743
-  st,stm32mp157
diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
new file mode 100644
index 000000000000..f53dc0f2d7b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Platforms Device Tree Bindings
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@st.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: st,stm32f429
+
+      - items:
+          - const: st,stm32f469
+
+      - items:
+          - const: st,stm32f746
+
+      - items:
+          - const: st,stm32h743
+
+      - items:
+          - const: st,stm32mp157
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
