Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87422B6D4
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 21:37:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC2DC36B27
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 19:37:56 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED42C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 19:37:56 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d18so5364569edv.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=cGHFjlpd9fFxJoTHprdv6bxx7jEzuQfyVGo7hhnORgret3eeD02uMscYszAG1w+6oD
 Ye4gl7/956XvDvUdQHQhlCmY3XjGmUiRo1Gn+ayf/bRyLqZ26rfRyGWcMureVHazph74
 1hKIha1snTai6b2WGSUYSqA01CJixfgnygSjXypsUce32AOcM7JhNtZR+Wrb0SjPNTDR
 VLsAE66PhLX4T0+tW14BKHJO3kNEgd/A2gN8xhp9Ga0sx7T1xmgPnjnTaZcE9/L+hmNW
 VgS+4THVcnnlqzq7HEJNm0nmFrwlNpD0kqO4/eH20DLJoiL9byGCin/ww9eGxjbDrfxl
 f6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnSVvBPLgxOr7Okxa4+yFdbMwIKkVndKbRuepRfY/Zs=;
 b=pdoTs5GpHpbO4accf/9fh1cxS3LKOqoOK1iJPpJ5wNaQRllVPv7XdotqndghgOu3Re
 kdzWvX2aA80kvif5YvFqiAq7Gs6nhJ5+bjAksNY+l7qz/6RFsH016klzq7gmsHsoxAr2
 YhpllIZktQG6GL1o28N9G53LhDIN3YUo51HbdTjZP0zjlDj1VqlmYdsEWt9pWX4bjV8z
 /0qvlLgYDPhGlMa5AMj1s2rHdutnNj8wpJdPDhfs1yQ4PnL4f8e8+rFHTbgi6xBdkMfR
 p0GZJcBesmhXjgsChpeshngtRq0cEd3oGayLUSKCk7whKLVZprLt7izr/FAYvDfoBKag
 lp6A==
X-Gm-Message-State: AOAM531JDQ/HWtWy2mv6s3/m1f0QE9rq+CJ1N+wTgsmrAyv4TAGFgP5a
 pnVoBNxHyGUr/BBcvIF37AU=
X-Google-Smtp-Source: ABdhPJz0Q1XaTDnhZogjytSe3cUi83UxpYnapEIh7JfyZjShqQ3Or7lVzyvtbZvsrUp+F6uOqIrJ5A==
X-Received: by 2002:aa7:da0c:: with SMTP id r12mr3743912eds.109.1595533075477; 
 Thu, 23 Jul 2020 12:37:55 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id o20sm2655719ejr.64.2020.07.23.12.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 12:37:54 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2020 21:37:35 +0200
Message-Id: <20200723193737.190291-1-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 1/3] dt-bindings: vendor-prefixes: add
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
