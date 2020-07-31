Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5632347C8
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 16:31:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1621C36B36
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:31:12 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21CE4C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:31:11 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id bo3so8999418ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoBgP3OEfZo1S+W2OL+antn28vvn8c/8vKe/rfz3jjQ=;
 b=SK6F+t/JxJcgV2SCsOGQZE+MfXDB7UoxryEUzRShs9Ek7cGT90QdiCHOwbK/7/yzoY
 i4QAWLp9WOmPzuPx7a9TD5yqyqGzYuSZqstAuIN6xVCZzko2yUCXh6fk5PgCk/VAZa43
 XZotn1ECSLVYb7Pzav44xNNPa3Bh58Q5oRWI7Fp2qIPEuUgqQDH1wHpEkW6gY5B9bAzp
 FBkPbWql3XUWg5fcnyGs9GbJ655X/79WY2wKH2Rhw/JikAsRTYWFltd5Ox0oHDkISBDr
 70XG6Fw1ogKGrDInyv2WHlDbM3AcHcBaZnL84sH5f3yRlN9ykHfmDAN1e753NSCeUpCZ
 4JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoBgP3OEfZo1S+W2OL+antn28vvn8c/8vKe/rfz3jjQ=;
 b=Tee7U1QMQwQDIvzj8uOrD12a40n3z+8iHDrmVMXUsAfj3TRM5P+Xyue8KQ1laDZitm
 HnWwLlTiYvvGPm5ex+Qe1N8jLYwdlF2+QUgKlIx6UooGUzSaiBDwaeivX3mYcjI+sGi1
 RYViTMgyk9nzxMLvkeelCiKXQaLcZPZwaBAvY2w5XlNpADRCH8mxf7dDzbOvwUfuxk+0
 x7NV0SxauuzElfMvVYpGy5jMDggdKBnzljU3JlItnke/wmqc+zkuhdmx2ry3mmYI6NMj
 uQt7/vOsY8ra4tBQVwh/7Uxa5doprvlIn9T9sYW18vKIv4y7a6R++7nmbx/JXGEX8rin
 uoMw==
X-Gm-Message-State: AOAM532CFD4hKt+3r7F4J2+n8mNb6AAdTzGxknk9386S+mOcwhRsMjJ4
 TG84dTKJI0XPTewQz0jumlc=
X-Google-Smtp-Source: ABdhPJwbdjNlbrDerhlhZ8Q37dyLhQem1aQxCxoJK+A2ZFDSqrRmTzWNJ42F39j17QjMiuTv5xX8yg==
X-Received: by 2002:a17:906:1911:: with SMTP id
 a17mr4066941eje.431.1596205870759; 
 Fri, 31 Jul 2020 07:31:10 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id t19sm9749213edw.63.2020.07.31.07.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 07:31:10 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Fri, 31 Jul 2020 16:30:52 +0200
Message-Id: <20200731143053.44866-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200731143053.44866-1-marcin.sloniewski@gmail.com>
References: <20200731143053.44866-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 2/3] dt-bindings: arm: stm32: document
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
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 790e6dd48e34..3b318fe15194 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -50,4 +50,10 @@ properties:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
+      - description: Odyssey STM32MP1 SoM based Boards
+        items:
+              - enum:
+                  - seeed,stm32mp157c-odyssey
+              - const: seeed,stm32mp157c-odyssey-som
+              - const: st,stm32mp157
 ...
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
