Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A6228395
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 17:22:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4449BC36B2D
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 15:22:43 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64A27C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 15:21:12 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id dg28so15560353edb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=fQ5/kloZEXGKN8xHu+TWTKF25LJoYXcWQ7Mc/nVPI2IvVhkhf25DKVx1SXkuCpai55
 SYPYZlZVrchP4Xz62mZDo/i8y7FXf8BcXBPG6LPV/PsXRH+gz6kxQloXTKiF3HCRmQwF
 nLs14Hvz4Ko637i9AcBO+muu/cvtE2146OvgMeTGv2KCpRtO90asdFV7+LrIVyBmqAZ9
 6zBE/aHapseRbRI+QW50dAqiTgKeyYf7QDEDd5TSLzSXZf8+aJ/cE/MeZ0XbeawX63wZ
 wQ38EapQlb0M/TfdxvQnTL1Gy8/RTBYJ+ye8g5dGpPNaeVmNVQjNHWCo0wvh9joDPeKl
 kQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=cyyHBteMgnoSWnzvV8x2kgGuunvXMUB2Iu5CdGyarm4d0jME6HdVJTcR3H+1ttFQo3
 xNxKDO1rPjMqPSPNGjiJXnuuQek+maB9HDlm+8A7bgCMoh/IjReuETQIppvNHKFr/XDC
 2qxDFfiO8Dwvxbmkhj153cldyvUBP4plT3tXi2qSjOZAtCdTV+RDBt25XaCCp+3lCYfQ
 hpZdLedssj0rZjGKSvenjO3DP30ziiThMTxRopRUHXNfqPlKmRRz7bHiYN6iDa1LOqDK
 UkxWSxL4ZX1Lbtn5XOABx7G2mOq87yWuVJGRQoVGJqacxmfwJ7yUVfMCFdXX0nJLNR6/
 u2Gg==
X-Gm-Message-State: AOAM530GMjrNvwns8Kk2FJ39PTPGKvoc/ssBl30psAXaIXbjwE8cfIOC
 kMmykqoSDZeWtxzLrgtaMK8=
X-Google-Smtp-Source: ABdhPJyxNu5lPrX8rGROYm8KYk23OlCWfkj84wbmE76k1loIEP8t5DPH8bt3ik9lCDGZMpx0kGzsRQ==
X-Received: by 2002:a50:e617:: with SMTP id y23mr26380738edm.47.1595344871972; 
 Tue, 21 Jul 2020 08:21:11 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id se16sm16802826ejb.93.2020.07.21.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:21:11 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 21 Jul 2020 17:20:14 +0200
Message-Id: <20200721152015.11608-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721152015.11608-1-marcin.sloniewski@gmail.com>
References: <20200721152015.11608-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:22:41 +0000
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/3] dt-bindings: arm: stm32: document
	Odyssey compatible
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

Document device tree bindings of Seeed SoM and carrier board.

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 790e6dd48e34..22b9aaa75eee 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -39,6 +39,8 @@ properties:
           - enum:
               - arrow,stm32mp157a-avenger96 # Avenger96
               - lxa,stm32mp157c-mc1
+              - seeed,stm32mp157c-odyssey
+              - seeed,stm32mp157c-odyssey-som
               - shiratech,stm32mp157a-iot-box # IoT Box
               - shiratech,stm32mp157a-stinger96 # Stinger96
               - st,stm32mp157c-ed1
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
