Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C183228394
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 17:22:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A2DC36B2A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 15:22:43 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0728C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 15:21:03 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id ga4so22007529ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=Wda03GT1kLUZKx6XiHGQWkJ8oovNFoSvac/RNxLY0dRCc9Ex7MFTykiVGOr6g1cYIz
 8W6P/7J5zILoKpIDFBn7/tMyrlVP4KVZIkpRiCotzXU39lP8i6VstOJIq5YrNxdcFBff
 nE5eQg8k2a42+icZuLTufOsfcJjDfOA974arJ75VBVDFblqAE0DvEVwQVz++9btRFtCn
 BSRSNIEVDK6tY1iGQCqMPQi7YmvoCboaHs4ODrt10KPx3lTizXg6JKAkfvJ7Edtd5pPK
 nEjRrvomS1rrLAFD0St4GFU9yseLSBQgEt8VGYjqMsm//6ml0RhorAov+cTFcoNT44sA
 OZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=gUBQKJoTk/89PBasTUx3eVo3cD1bJZ9YYgDh8HsBhm4M8FuHsCnrAgRbNva51U9pPq
 qWoPYB6F1zZGbpiSyjONebEGum/ci6qLX1YuT9ZfoGSY7rESs14/HE/NxmlbCvvKNQ7Q
 5gX5DnT9oTtPSwY2Decu4IQc+3jKP3/J7yv83EtN1hVU2atG1miqUHjSCV4vGKl7gO/x
 ENBOgLDuD7iuvbxqmVNTRis3GDSOH4+R6ja0KPlXZy92AWVL1mUbSqH83QCRZazxlsxG
 +/QUW5Ni+QChUjCu+jfoNYUrcEBP8+dwlXzrqmXXlHdw5hCJyXngd5xc+xo7Ji8Fpl1b
 tHPw==
X-Gm-Message-State: AOAM5335wVFmxZiwot5sh/R45J8fIlGmugCcDAvz34FW/tWwwYS5cpx3
 pYXXCcywAzqplXkcO7j03ig=
X-Google-Smtp-Source: ABdhPJyrp6isiaaIr9nG0cnRhonPmQ5H1ZVfdtX2W04YIAlxyAxj8uwojDguD+DjbG+cG1Ouhgfc4A==
X-Received: by 2002:a17:906:abc9:: with SMTP id
 kq9mr26310856ejb.493.1595344862703; 
 Tue, 21 Jul 2020 08:21:02 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id se16sm16802826ejb.93.2020.07.21.08.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:21:01 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 21 Jul 2020 17:20:13 +0200
Message-Id: <20200721152015.11608-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:22:41 +0000
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: vendor-prefixes: add
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
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
