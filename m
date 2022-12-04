Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BE641EA4
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 19:29:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7708FC65E69;
	Sun,  4 Dec 2022 18:29:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D835AC6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:29:21 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id cf42so9584291lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 10:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1gjIuLbuYm9eN5Zaq7wruCJOGXBkxk9TEVxr2ELzNyM=;
 b=msr4c6dETd0XxzdYTY6W9ZWmBlM+poak3c3oJp5hQc7K1UIwvRlM2VBsa7cprd/zQA
 jzQ/8PRGd3A+ElhWXkO6twmZZxLFir6zHwGBm8UisZjmvLN4D4jS1AzP+dMMa4+69kHx
 aX8ktNb/E2zX5YVF1PBWxMsZn2am3+NSy9M4cgd/b621JlEyPONraQ49XsXeTpFGb951
 PJZEUEDu8HMthVkriHZcZmUTppE/i6Z4FHD9CYiTEJZBX1xZB/wPCMtddQSKOx66r4O/
 bda7BXQz69llTsbmmjaT9a/tTot1p/pySV6q73ie9U99cpO0jtqXSGEjTo5u95pvaXv3
 s6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1gjIuLbuYm9eN5Zaq7wruCJOGXBkxk9TEVxr2ELzNyM=;
 b=KfsnzmSyqvnd7NLMrXKl2yqk1oW5TGXogQRxam2monH8og/WUkktIc4HMlPKmiKfRl
 YjROau8MNJ2pNQmUGv6lwgE0Hc07SVMIRSNqlGyh9rJHwrXX/ljpQUbfxHOjRpYf993I
 5yRgMGex+gvS1XHq06pUMtO9YhxrpdwPIlYxixAUesA02WK/wZtD+VPNEFKwsElJqxCh
 1L+y3RqjfNE6tEm5Sxs8uQWWw0i5K/nB4sMH3pbUvkqywK6EJoXA2fhmPMJmH5VSxofU
 o9gyxWNYGjK3Iz+0/emWwX89uDh3nScrCZU9ug7X/yd8kkTIpETzPS16Mbn4Z+ziwbXX
 lpNA==
X-Gm-Message-State: ANoB5pmTrgyDyfhEY+kVkaA+HUpL5sdynvEbgQGIvExy6EaR6ozV3tvA
 wnzyhPw+3LJfgkJQ9e1oJDQqAw==
X-Google-Smtp-Source: AA0mqf4UPCxxvMoekZXXvXot8m/zQ+q1fGTUZPaIMlMJIt4kh2HXIM0T5KqpWhb2o21ZZrh+KyfCPg==
X-Received: by 2002:a05:6512:250f:b0:4b4:abb4:c34d with SMTP id
 be15-20020a056512250f00b004b4abb4c34dmr24680669lfb.218.1670178561302; 
 Sun, 04 Dec 2022 10:29:21 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:29:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun,  4 Dec 2022 19:29:02 +0100
Message-Id: <20221204182908.138910-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/9] media: dt-bindings: cec: convert common
	CEC properties to DT schema
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

Convert common HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/cec.txt         |  8 ------
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml

diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
deleted file mode 100644
index 22d7aae3d3d7..000000000000
--- a/Documentation/devicetree/bindings/media/cec.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Common bindings for HDMI CEC adapters
-
-- hdmi-phandle: phandle to the HDMI controller.
-
-- needs-hpd: if present the CEC support is only available when the HPD
-  is high. Some boards only let the CEC pin through if the HPD is high,
-  for example if there is a level converter that uses the HPD to power
-  up or down.
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
new file mode 100644
index 000000000000..af6ee5f1c73f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC Adapters Common Properties
+
+maintainers:
+  - Hans Verkuil <hverkuil@xs4all.nl>
+
+properties:
+  $nodename:
+    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
+
+  hdmi-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI controller.
+
+  needs-hpd:
+    type: boolean
+    description:
+      The CEC support is only available when the HPD is high. Some boards only
+      let the CEC pin through if the HPD is high, for example if there is a
+      level converter that uses the HPD to power up or down.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 07cb85cac4c3..45402e03cda5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4832,7 +4832,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
-F:	Documentation/devicetree/bindings/media/cec.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
 F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
