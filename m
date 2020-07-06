Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D632168EE
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 11:23:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF77C36B2A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 09:23:49 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A64DC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 17:34:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e22so35764991edq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2020 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w85FGsskHQRhzaiqM+JZGmGetxz+LIcW62VKFwk5McU=;
 b=pH/LmHobS7hL/45j4qh+7Ykh+Zu0U6JG9fJZS2yOgKqC/MQrhvGuu8eTvQtpWZwQ74
 V2F89+TQxbNl7Ntu1Waax7R91qdBV8TMDFAFirvHDr5ar7Wf6T4rl3E+Yrf8tB6RrUBX
 Bb3Vsxe020UJrNbHRtPU3qn2KsLs5xH7iqO9kpMwrRkbE+JaeUcCUxiKKAYETPHSPuhB
 MjMf1oKcetZziqnxUoAfSoKA3sobZyBCjyR/hPLpDbiCRnDqZB/Q7DcrUDRijEY0U3Vb
 TROt6KiPq+aUcGZ5NPoW5oxlQr+J4HSirNsTbTMF9D8mF6siiunj+iUhHBT0mA6GfFj8
 2K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w85FGsskHQRhzaiqM+JZGmGetxz+LIcW62VKFwk5McU=;
 b=Y3CLcDpE7HWQAIcQQWFodhS5HD4je5WmuEOgdQnqomov3epOBHwQ1qYqhwver125lb
 DgFjDzAwbpHFdU5/sCkSzYOqpQjdX3BAF7ramLR9E4U6pvHEbgTnEYmDy/7qmztvCni9
 1zS4I5yXnZDrbLdQT5B60nZA3WwAN5TDxfIrrCROW+eT86Rhj2YedidgUgcmwYLh3tp8
 wLQVutp+XXvCsXkZIw/E+sDnElJdOOyH5rIMHb7gIHm0AxTjoN0gMTzCkz4/K/qdOouE
 yOUWU/KNrX+LfaZSKGHqgo6cLPfhyDc1t/jRB0XC247PZ2Un2Ul8clxiazk0JrQExtkG
 eGag==
X-Gm-Message-State: AOAM531B4FvybbYR0Ke8xza5+GgiZYpa/vQsXrzEl6erLgCmOec98GJb
 LBrXkw17AVy/p3HjCtx19tU=
X-Google-Smtp-Source: ABdhPJy4/3XaG+1BN5v1+8nPRey1HgvdRd9Wo2LQRqUjb7BHCQ7PfBhwKRWXTWZs9CaMbHYPc6lqjg==
X-Received: by 2002:a05:6402:21c2:: with SMTP id
 bi2mr56590150edb.296.1594056889023; 
 Mon, 06 Jul 2020 10:34:49 -0700 (PDT)
Received: from localhost.localdomain (asp78.neoplus.adsl.tpnet.pl.
 [83.26.227.78])
 by smtp.gmail.com with ESMTPSA id y22sm16556258ejj.67.2020.07.06.10.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 10:34:48 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Mon,  6 Jul 2020 19:33:47 +0200
Message-Id: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2020 09:23:47 +0000
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: vendor-prefixes: add Seeed
	Studio
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
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..7dd03b3e9d3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -902,6 +902,8 @@ patternProperties:
     description: Schindler
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^seeed,.*":
+    description: Seeed Technology Co., Ltd
   "^seirobotics,.*":
     description: Shenzhen SEI Robotics Co., Ltd
   "^semtech,.*":
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
