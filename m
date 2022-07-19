Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9457A96B
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 23:51:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 930AEC640F6;
	Tue, 19 Jul 2022 21:51:35 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 781D1C640F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 21:51:34 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id x64so4593114iof.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 14:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uljj5MmXlYXK2K1NyL8aqQUp+7bgEAbnVce27GY0DdY=;
 b=kzHw1HMCeX7OoGIRiHz7r07A7Qgd+29gZ3BCM/uCA17KixMyxBq6LCytow+zbxISv0
 grVEg8DTtvoguRjhM+k9NnsO9fRY1rymQzahWbn+zycKZ77rTOH7Dh0KrWKclxJM8L7a
 ybyea/VgY8qEdcZCfyuekzbzlTaDmjF/yX+Tl1eXJoFvEKDn7gXya9mTE9ptXwge9ooB
 nkd7nca9KnNYBJpFCqMeGHgkERhbIX9jTVk6eqO6PhsMgUYkwKBmKctGGZkJUT0yLeco
 lLIIuVfDJTPsi2jsvCvucBya5jnn/2zlXNKkN31czJRJZT9YWJbigNmiZ+RDITZSuOWA
 aAPg==
X-Gm-Message-State: AJIora98DjUQYpJEzs0gZaCgqtUOBKJ02dDXrH/wO/TQ2SQH5/ge5fUh
 VLJf9Wiqcf5V1InGW+vo5g==
X-Google-Smtp-Source: AGRyM1sRs6EyfwqSDyGC0ktRY+m63qPeGrFUDEqOmtSv4Uq2SP67KzCW8IJGDeGx96KzZjM1q1abfg==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id
 h7-20020a056638338700b0033c9f9e5a17mr18432803jav.12.1658267492959; 
 Tue, 19 Jul 2022 14:51:32 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 y18-20020a056602049200b0067c09fd0b53sm3674183iov.21.2022.07.19.14.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 14:51:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 19 Jul 2022 15:51:25 -0600
Message-Id: <20220719215125.1877138-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: mfd: st,
	stm32-timers: Correct 'resets' property name
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

The correct property name for the reset binding is 'resets', not 'reset'.
Fix the name.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
index 10b330d42901..4baa2b746814 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
@@ -33,7 +33,7 @@ properties:
     items:
       - const: int
 
-  reset:
+  resets:
     maxItems: 1
 
   dmas:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
