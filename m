Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476F7E1CF9
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C081C6C85A;
	Mon,  6 Nov 2023 09:08:31 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E25E2C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 15:53:25 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3b2ea7cc821so4666673b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698854004; x=1699458804;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f5ijsHSrTzTaxlFkHmCRGPyrWJzfsbcZIn4Auv8liUM=;
 b=LFC0K7lEC3clw3ScmS5329zNvAR0YLc2btLfFmJGg3kb6vI4++YHGlY1Fuq2s2KquG
 6cVGJy2f/KV3tejuZ2tu1rtW4u0GjUI9MxgHRAbbcCAbJWa82H9qgryIyLZFOx7g8COs
 uDBVhYecn805eEe0+2SmPeRh0gsABj/9K/lCIj0yVzWgtMZiXOzVU6sPdRYmHv/pMrvN
 tvOd/NQGMgVtOTMX2gW9KwG0LH1v/mQJH1QNfD2mDmysooSK9/fGNRN/rKxf+Rxoanbh
 1hr5O8VAisJmsU/5ETR7X5WvO4WGNPBLryEkZY8tVTB2Cn67/IFD3ICA4dGHf7GFAAc8
 Qkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698854004; x=1699458804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5ijsHSrTzTaxlFkHmCRGPyrWJzfsbcZIn4Auv8liUM=;
 b=mDJaU/nXgI2ewstK5lqZZ3T5hI5BSFzruuZ6unwq2SwwX/dQmEmPzRJoD8N6ht+F1F
 hEvfSblxst/byyv1fl4V3/zuIyxpRKLTwcySq7eC+jIWE7V3ggmjFj0ogMrLNEwWMRJp
 Lu4nnmr9jOyIbO2AHw6rdfkLJVv68PWDnS3VsHYaNQBDPv1bBxZSDs/aIczxucc+KqJ6
 0hm202XbJrAGNVlVX8c97ytttzm+x9QRkyam7RP/i4FrUfPLCrVjNIrb/hNpuz4/zrES
 w50nTXMQza2mAt0RANg7ZcA5QiXR/Rf3yZaHbPSPjVHI96nHvlNwracosIfg/E4wVaF3
 ftKA==
X-Gm-Message-State: AOJu0YwVO5HsZEi7wk/l47vWgQK1lRwffodY2vxqv/DbOM9HXkXSCcwN
 2VtZSGsSj28MvGdpnNIrlg707H4HBtfzloobHy8=
X-Google-Smtp-Source: AGHT+IHmmkiKXyy1l5dnqihVt3MujYnYJ9NEfXdzQwBgQiBgEoWkDDo9dz27bVWORqna0JEi7yol+Q==
X-Received: by 2002:a05:6808:698:b0:3a1:b28f:814c with SMTP id
 k24-20020a056808069800b003a1b28f814cmr17366198oig.1.1698854003784; 
 Wed, 01 Nov 2023 08:53:23 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05620a0c8c00b00775ab978009sm1549551qki.36.2023.11.01.08.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:53:23 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  1 Nov 2023 11:51:54 -0400
Message-ID: <20231101155153.2767482-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add STM32F746 syscfg clock
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

The syscfg syscon was missing its clock, therefore any attempt to
read/write it after clk_disable_unused() silently failed. This was
preventing external pin interrupts from working if they were initialized
after this point.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f746.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 4942753d011e..cce6ab0e4617 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -501,6 +501,7 @@ sdio1: mmc@40012c00 {
 		syscfg: syscon@40013800 {
 			compatible = "st,stm32-syscfg", "syscon";
 			reg = <0x40013800 0x400>;
+			clocks = <&rcc 0 STM32F7_APB2_CLOCK(SYSCFG)>;
 		};
 
 		exti: interrupt-controller@40013c00 {
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
