Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F56C97D4
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 22:44:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FC26C6A5FA;
	Sun, 26 Mar 2023 20:44:56 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6225EC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 20:44:55 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id eg48so27834891edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679863495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rg7TxcKJoIFSkaCwotCW72pcnT4TJez67v9vLQ/IrGU=;
 b=U+UTXMMVn1I0vIb7JbhI533OPUghGmmVjN7T2j34vRiMiBVyW4+/nCIxsz2JhFQY8H
 y5702uE5WzEV8hZXaJcGeWAVNv8zTSfrYXShWORa+xFrQE/B/ia0nfG+MRFzDH5+/btO
 qI8vbw1VRM91Mnv4RV9AQctI0GzLgn5/r9XDfiIPGsqRTk7lJ3pgTCeIqsCSDMFJ0kCu
 TXV7I0pLmW/zfaqpWxwKJ+M4HLkO4ClV6sl6g6i5CYJxX5njwZ9HLx1HvBI6PgIpwgYm
 bVegUVHuMLyZN6YVVpX0CnGrpZRabRm9usFepaeQ7G9DGvDrmcY9k/n/VfLvPUX6C9hi
 Lz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679863495;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rg7TxcKJoIFSkaCwotCW72pcnT4TJez67v9vLQ/IrGU=;
 b=TwPHGWwzypz39OkCDlhUIYeNjyO8bJoamewfFDvPngXbEEdHrK6Jetqw0katAawnNH
 RmoOQo217HiXcl4H29sYGXi6pclXzYaDRIUgcS4wuw9Xa66ekMxysD+NsoBdwS2RD3/p
 HCnFioRqR1AUieD95IonEwy6OgHimb/s+QDeU/qa7q+qKC1Ym9H/oUKWN5gwU9HFuoWU
 zGVrKNWolXFcJOq8F1K9KvsqDs0eg9PLjU0YFve837vLHxakqjSzwfCAobn6o44Ns6J7
 PRdcPdn2FP1XXc1grWjUCJd8jBSsFnEsJVGBitMCSpBTiDvM6QGNeI7kegzDX0VCV2n7
 lQBA==
X-Gm-Message-State: AAQBX9dcl+WSNSG/oJX7LfmIdTlft+Q8uf4E7Vt//OGWSQGwl2ihnzL2
 7E2EOSinwRqGhyh8/O7JWs1wJQ==
X-Google-Smtp-Source: AKy350Zi4XPrE6pUIOEiX7g+AIp96m/eMZbCeuwMUcSEy8TD12/vN4JpsMygF2r/RriEcGd5dog4uQ==
X-Received: by 2002:a17:906:4e1a:b0:935:20d8:c3c with SMTP id
 z26-20020a1709064e1a00b0093520d80c3cmr9918182eju.61.1679863494832; 
 Sun, 26 Mar 2023 13:44:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6b51:4748:3f3f:ffcf])
 by smtp.gmail.com with ESMTPSA id
 t27-20020a50ab5b000000b004c0c5864cc5sm13954621edc.25.2023.03.26.13.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:44:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 26 Mar 2023 22:44:52 +0200
Message-Id: <20230326204452.80751-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32mp157c-lxa: drop invalid
	simple-panel compatible
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

"simple-panel" compatible is not documented and nothing in Linux kernel
binds to it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index cb00ce7cec8b..407ed3952f75 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -73,7 +73,7 @@ led-3 {
 	};
 
 	panel: panel {
-		compatible = "edt,etm0700g0edh6", "simple-panel";
+		compatible = "edt,etm0700g0edh6";
 		backlight = <&backlight>;
 		enable-gpios = <&gpiod 4 GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_3v3>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
