Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFD955E04
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A9A0C6DD66;
	Sun, 18 Aug 2024 17:30:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D791C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:30:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-428141be2ddso26906895e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002221; x=1724607021;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aiRlsM6vBlOVTpadv+7qxVZ/+NvHjXgHFTSiZbF3Lk0=;
 b=lnB1rFHAc8d355m0/VKUwkm4zMXhtqEejHOKSVlCbkPWwc5wsAhcuvGJugcNGjr4Mi
 MQUHb2bNFTc49IsmAHTs4Om0b30KFdQxVFPfAwO6ZSRJ/dJHApEFtLg9+IS9sCgCOwj2
 PdrYtOUiExpxj9gjM0o57aBNtrZkDnRvgG6E5axgmH4rWhbuWhzCC6C6FI3BkELCb60F
 TWD3VtHm7sTZKpEaLM62O2Hu61YqF4N/tSp94EuDga9+891ZK3gJmDhtk5nEx5Ek+WM9
 L2Z5PKy1dKJJkEji/k2nd8J8DVf3gUw5ez3m40H5COz+JWdVSZCMCY7gjhvifsOggcZy
 QALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002221; x=1724607021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiRlsM6vBlOVTpadv+7qxVZ/+NvHjXgHFTSiZbF3Lk0=;
 b=Y2v20a98KSIbsemmJnPHfho7j8zX22nOPYRO3xd7WaH3uOyL1wocQjz3B56zc25fBk
 qHL/C0lTezn12Ijsbkjj80jmRwus3tFeU07jtpgS5wCD00SV2tcaDf6N/KeWGQKtKvPz
 WhHp4CVvc53GdwXIKQ+SnsnkhtEy8kFM9Q9rfDK3wbNtWzKGyfi9Zcf/qsABLlziPq0P
 0l9eLa6ehXukWnJRgePBljIioNTios1aNFC4NW9JJmMmQ29MEICrguedWQUir/GtXqYA
 Onr0y+7vR7oXgiaZNO7dFrlSPA+jMULi4O68lzM5jCzx7Pr1djcORU88hq1AG4uMsMLS
 JuZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZdBS49Co3qbkGmnjJD/b5/m+9g0phTWyYH6ISz7GJnYhEBY7j0WMC6NxNa++Y4f9foDBXimyn4UKpkdC+lxHF7xKHIK4hSdbTpv4JIXJEQaFOHDEp+f6S
X-Gm-Message-State: AOJu0YzsnnCRwwvZibTOXfiUKLV7EGR8gL7oBEik6SOSZotXRfEs7Yus
 WkPkUFSJilCsrKHhubC8BouVrV5fdUxeKfqNi0vPiBIAiPT8/FlCC6vdEPi+6wE=
X-Google-Smtp-Source: AGHT+IHlDcGvSSlmSoCOZtAKT2zYd9WHqBA3yrLaM9pCakhIJQ/7iIvhr20DdpvwtiU7bWUoZXaPcA==
X-Received: by 2002:a05:600c:1910:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-429ed7b8ab6mr53592135e9.17.1724002220484; 
 Sun, 18 Aug 2024 10:30:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 18 Aug 2024 19:30:11 +0200
Message-ID: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/5] dt-bindings: clock: cirrus,
	lochnagar: add top-level constraints
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks.  Drop also redundant assigned-clocks properties, because
core dtschema allows them if clocks are provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/cirrus,lochnagar.yaml         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
index 59de125647ec..ccff74eda9fb 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
@@ -67,9 +67,9 @@ properties:
     minItems: 1
     maxItems: 19
 
-  clocks: true
-  assigned-clocks: true
-  assigned-clock-parents: true
+  clocks:
+    minItems: 1
+    maxItems: 19
 
 additionalProperties: false
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
