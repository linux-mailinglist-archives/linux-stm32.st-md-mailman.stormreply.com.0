Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0A308B9
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 08:39:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14738C5F1E9
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2019 06:39:27 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AEF6C5F1C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 06:39:26 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g9so3590028plm.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8Zaxe7WowXS+tN6OY6tghQ3pLhHizFEDpbSLAZpdnRg=;
 b=N4TnIUkxiVbXVBUuLUyXc77DqUW0yRp/CDgiP4Z3u4EhJO7EcOHsLbxtQjS+sBGPYk
 P5m9ONZByW3aWJc1Pd4cPu4Yt4x+jaHMS1NOf/T5sH/XAm4BtSPCPu2B2mKUFbGtHUuP
 kCzDxGG8ixvoBg1pp5neHY4V3l3CIOmNL/sKSU8MsH8HmAgI1+KsCmNrrfhdFTl+4V9d
 MjinZVMfc+KC7xWv5zaXrdPI5kuBCANojdGvZOF9E2LqzGPwmp2mT9+OwgCgEFoaqSV1
 +I+PDnJcuTWe+vKFct/t7hqJmjkvY9vb3Af9xihu+v5G2nHP7GOUPd7mLK5l0J0DfveY
 ac/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8Zaxe7WowXS+tN6OY6tghQ3pLhHizFEDpbSLAZpdnRg=;
 b=ZIH9GJu3xumcrtriJCXsjqg1PCVx47Xo7jqk5DY0jBhfdIDflv4YQ0jlp3vodUqis2
 smd9InL72YV9NmpXNrrbrhd1aqpviraVLhXBvQRMyN66ud4OYUzBNmRu1UxCwGKIYJw3
 enRcjAEHrltJHgJiUOuxNalWM7uBJbfAZ/CGQpLrcM1JB7l7F/qgLopBJjEuZO8QVl8N
 D7UCShXD3jm7IncDsNZGV7RYzGU3kQhMYNeTedmnqNKD2xs1dIQByKYlK/69OdJ6Ux6g
 9rB/1PGnffXsgdPhG4brbrLQ84BH9UebdNM1s+BUXT532Vk1pEbnK6v7MbZbsYaHCwQ9
 ghrg==
X-Gm-Message-State: APjAAAXDfnqHsSQEDh/KJgSrRk4wgbvb8RUC3vq+tNYTao0DbswzSsC0
 vNcDryGqZj7atcYykuSIpld6
X-Google-Smtp-Source: APXvYqxYW8y1jCKVZRirPI/B5luN9o425I5N7LJBpsnHfKuxOaZcxylkOO38lbFHQEddlwRGmLlemQ==
X-Received: by 2002:a17:902:2869:: with SMTP id
 e96mr7152214plb.203.1559284764503; 
 Thu, 30 May 2019 23:39:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72cb:ebf2:a51d:3877:feab:5634])
 by smtp.gmail.com with ESMTPSA id y12sm4644158pgp.63.2019.05.30.23.39.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 23:39:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri, 31 May 2019 12:08:47 +0530
Message-Id: <20190531063849.26142-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/4] dt-bindings: arm: stm32: Convert STM32
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
 .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

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
