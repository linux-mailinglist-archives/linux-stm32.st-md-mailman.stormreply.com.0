Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F357A959
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 23:50:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A599C640F6;
	Tue, 19 Jul 2022 21:50:08 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 444A7C640F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 21:50:07 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id r70so11804613iod.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 14:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uc8dTbCs7ii6OtIpUoNiWI+bZ2IGfa5Sn9yPhzaCkic=;
 b=MZVMcGTbDc9QsdQkWxzPIK0in3CjUtnIAjD3i4CdGPyDon2ZUmvonk116CXbalcxkD
 kYP3kJ7biuPt7ARqKiiBG6kUA73wyKVu4BFJspaIMwOqFr6ZcvnYQ+fE2RM1S/uFCHsy
 pGtXXop2LIaMfwBOA1xwAVIdK/F8O4331roqxz4VEY1MinEiLPiTHJIRF4aBoIY14anZ
 9SexNSXWBdZ1vFUE8lkItstfqLkcoxzsZrv3MW1Qn7/Tnn3HIHJ3oddaZ1at9EX+YGTN
 lcmpERrYCL6vfG+d0M+MP+aNu+VcB8gnFyRkLytGbQmSQBqCCPZdc7o4WIqAlnOUvJ7v
 tAOA==
X-Gm-Message-State: AJIora+m88Dn+R1BpQZ7dQ23m/+8XsY6heRBHwFYGnUQgSYnnxbWsgyb
 00b66xFrnp6/PGEYzFYYXg==
X-Google-Smtp-Source: AGRyM1sSjCNPW0y8claL4HT40MMZy1QtSqugJ1KONdXeSON48IRYgp7p0MLK3JCLiUcY4Abp5Db2Qg==
X-Received: by 2002:a05:6638:168e:b0:341:5b82:a46f with SMTP id
 f14-20020a056638168e00b003415b82a46fmr9722732jat.201.1658267405972; 
 Tue, 19 Jul 2022 14:50:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id
 z8-20020a05660229c800b00674c8448c3csm7811758ioq.6.2022.07.19.14.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 14:50:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 19 Jul 2022 15:49:54 -0600
Message-Id: <20220719214955.1875020-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: Correct 'resets' property name
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
Assuming actual users are correct, this error didn't show up due to
missing 'additionalProperties: false'. Fix the name and add missing
'additionalProperties'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 335ffc1353b5..d35dcc4f0242 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -59,6 +59,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
     properties:
       gpio-controller: true
       '#gpio-cells':
@@ -68,8 +69,7 @@ patternProperties:
         maxItems: 1
       clocks:
         maxItems: 1
-      reset:
-        minItems: 1
+      resets:
         maxItems: 1
       gpio-ranges:
         minItems: 1
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
