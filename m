Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E222B6D7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 21:38:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07056C36B27
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 19:38:04 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C13BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 19:38:02 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id br7so7623710ejb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=QkMxynTHFSOlrYHV37e2/babhMJB67VamqWrafseHoTuw3Ae/Q8QekQWsGF2kOS60b
 +jvJWhvl777kQyPceA92HNij6qOMQ9a564mJ79S+1az5XMvyA1F7SARy+Ojjs8nkNj/o
 AFIfG+r4Uta3/cbY7J+1VrXCyTMCfVz93KeMYk+8U/VcQPQzbq1fxQQtJeF9RISJoNC3
 I+Liw3A8PYYoxwJEMGJ8VRxUSwRnQ8H4KOmbrIrQ1EP8wbFzx3O8/ceSMyDPtpKNcROl
 kdXQclxlz/Xa1JkPNSGvW+Yn/xqf8Zf6SYCDCr1mc4wN1YI6A1vb8Yv08k9xybnpLRvV
 A2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9aNpNKaa3hKIU8fbCISqJpdam9Hz159Xkk+hYct4wA=;
 b=f7qOf4jnxFIUubB3qNCjcSrlbHU7F56M7NnYazrt8ETMQsnVOrW1Q1p+loXtl4IMYP
 RodURkGLsRHfD5ybTI3cWbzGxileuNBne2wm+RM21B05WoWUNSAmnWiODVk6EyUCHrUq
 CXYGT/Ra1ftk+mYs+zp4fPXBPtpSNrubjYSrMSYAbpSySIyvRoNG/WKXaZeUW1v9ygiX
 O4uoOHDVjXKvVg26xv7mDUq4a+82xBv/v1D+7KVCs+eq3TGphVgv1o/Y47wnIseKVJ68
 jxnVxr8V3OHPAhszEi6SG40Het0Np1zn7CKRava4nA3ECV+pzggJ/FQfmYFjRGSf8ESn
 ge8Q==
X-Gm-Message-State: AOAM530Wzhq4lWobjui4ZERiRAEp+Mhov76cdFghJw1g1Wu8wztTZpuA
 pCVWRQiT5hbHBNqYm63/ap0=
X-Google-Smtp-Source: ABdhPJy2sXNkWdJWkhZX5v9NVxeNJIf8aQTzdZtj5AK0CtAVs57Kz2V0BehmkljdmSZk5zYeAmpoZQ==
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr5518734ejk.531.1595533081769; 
 Thu, 23 Jul 2020 12:38:01 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id o20sm2655719ejr.64.2020.07.23.12.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 12:38:01 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2020 21:37:36 +0200
Message-Id: <20200723193737.190291-2-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723193737.190291-1-marcin.sloniewski@gmail.com>
References: <20200723193737.190291-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, marcin.sloniewski@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 2/3] dt-bindings: arm: stm32: document
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
