Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E3657D5EA
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 23:27:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79D06C0D2C2;
	Thu, 21 Jul 2022 21:27:48 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 297D5C03FD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 21:27:46 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id h145so2365320iof.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIOd09IsCLkkz0R0g/f3vsUbwuWE429fl7X8V0X7KFU=;
 b=G4aSVodrBsKxFE7dCGXSb/6f1DGMzXhCSHCv7bSQ3h7Nkr7GP4A99PZhV4mrb3h6hd
 TN3vIs+GwgHdOAUEn2ZbLORj8bUH6ORkSOC3FTqRo1iEgacDng0+XvXQuUYcDULoLMpi
 9KtKWZsHhg9clWGxgbEKXhsVMlsaOkVlEimLnkLv9CKK+WocETFFPJEfBQY/aUvUEi6q
 QQG3qXzmmgWWJa33ttMDKB/z21TmsYvNOwgd8H4XRO7wqGsrdVYb+ETs/bTdT4AYO9/s
 uqHjCyq+bOqtuwvRjZopNzetHzv40m2rw8fUCv0U+U9qE8cRU/k4HqoVoCZ7w1tUd1Le
 QxWw==
X-Gm-Message-State: AJIora8/X5igjo95FByQmcTfIwhBX4d86sg0OfPQ90ncMSSQ0l6PBDrA
 ANIcL+bqxZkhljTNhnYYrA==
X-Google-Smtp-Source: AGRyM1sHh6EMw+CzWVb3mUQlXlPlqrr85rzuYjaxydZ6Ep4VAHBlwBUshbCF5t75FbvVlUPNFXlL9g==
X-Received: by 2002:a05:6638:50:b0:33f:17b9:be63 with SMTP id
 a16-20020a056638005000b0033f17b9be63mr251290jap.92.1658438865054; 
 Thu, 21 Jul 2022 14:27:45 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a05660208c600b0067bf99ea25bsm1285859ioz.44.2022.07.21.14.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 14:27:44 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 21 Jul 2022 15:27:15 -0600
Message-Id: <20220721212718.1980905-2-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721212718.1980905-1-robh@kernel.org>
References: <20220721212718.1980905-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: arm: coresight-tmc: Add
	'iommu' property
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

The Coresight TMC component may be behind an IOMMU which is the case for
the Arm Juno SoC and some Qualcomm SoCs. Add 'iommus' property to the
binding.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index e0b88a71356a..cb8dceaca70e 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,9 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
