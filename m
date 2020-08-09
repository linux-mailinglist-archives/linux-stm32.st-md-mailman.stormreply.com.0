Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520023FF48
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 18:45:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1263C3FAD3;
	Sun,  9 Aug 2020 16:45:04 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 576B5C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 16:45:01 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id kq25so7069978ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Aug 2020 09:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/7ORdIOTb173XCMu8rmzTqIYUKz1Qdd9CmYuO/q9kk=;
 b=Ckxwpo7Wwje1tHWyYkFuCPjkk8lq361qN0fZq/Ot7NowxoRWYoR1g/tnfDhAXT926+
 UJ3GFEp+yYfpWObFra7T19FkICr1y8sJzU90cTKPAzTGcjSjyecirRc0errKn7Y9RWLU
 ko/zmsSo+BfGWHCNGJ/t5OiqDo/tSbSQVC08iSWu3/bgkFhiTdePj5Da3kGmCDcN+DWt
 YhTLxhWnAxVWFjZO4nH5SActl/dxNgDwNrfWKhMP+XbsbWpvj4PO4Mv5XFFic3oCs8XP
 Y+FullCakX/j2BvSpvvC2zlRXAfZRvQPqou3fnvYi+g77K98V9klPYfJCFmbANo2/RnQ
 aTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/7ORdIOTb173XCMu8rmzTqIYUKz1Qdd9CmYuO/q9kk=;
 b=TNjTdT0xEMfWQ74r2eI4fgEqBGFTUNuUK7lRz01TnC5Cu3Q2kD9QhQWN/+C7zdFrL5
 Z443lHdEE/GR/q/Wyob8Q8pRqigEmpBjDNlqATxax/DVk/Y6BD7h1cA0S+qi1hQlJkCz
 j1DWJS5ekbEGoC6nkYkjHL9CigNSjTd1w8vLrD68UznUGM3yozL9MPQLpiNqbZMWUhBc
 F9862cn/EFTKFO7fkHgeGk3u1SdA0lL966RQR54hedWMS15rzxv8ZYTy8tBSX6diWRrk
 FvEC0I0FBKAbYR1MTupXU4jFr5OdaUieDZlb8TzwAveOlxGnmRV2yjO/Qi5CnbzTk0jD
 LP+g==
X-Gm-Message-State: AOAM532e3qkqbKg+joDeME5oMKGUBwcLGIFadpR9cgzKPMo4tLGQo2pG
 xma+o1eahfvVVCVijKxACv8=
X-Google-Smtp-Source: ABdhPJxOfdaSkhY2zLWjUeQrTFtLLw4cyiNiCGj7cslQ38Ma5YOQwE6W1HZjpC+W2K79NY+GnMaQTg==
X-Received: by 2002:a17:906:359b:: with SMTP id
 o27mr19174818ejb.103.1596991501120; 
 Sun, 09 Aug 2020 09:45:01 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id b24sm10423215edn.33.2020.08.09.09.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 09:45:00 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sun,  9 Aug 2020 18:44:48 +0200
Message-Id: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: robh@kernel.org, kuninori.morimoto.gx@renesas.com, arnd@arndb.de,
 mani@kernel.org, allen.chen@ite.com.tw, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 marcin.sloniewski@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 1/3] dt-bindings: vendor-prefixes: add
	Seeed Studio
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

Add the "seeed" vendor prefix for Seeed Technology Co., Ltd
Website: https://www.seeedstudio.com/

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f3d847832fdc..cfde16a7084c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -910,6 +910,8 @@ patternProperties:
     description: Schindler
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^seeed,.*":
+    description: Seeed Technology Co., Ltd
   "^seirobotics,.*":
     description: Shenzhen SEI Robotics Co., Ltd
   "^semtech,.*":
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
