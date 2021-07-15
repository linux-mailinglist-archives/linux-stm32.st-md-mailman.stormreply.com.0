Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B023C9B61
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:24:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 248D2C597B1;
	Thu, 15 Jul 2021 09:24:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64966C597B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:24:54 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g24so3418556pji.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
 b=UbQFlnT/VEzwxNn/8UfNBaI9DH5IsAzm7C7btpyoodAGqpgHGifPlUOcHd9lX1A5vZ
 J96bqre8YCxLPUPgLB7qGGjD4k1zRGFLqRGPbHvG8PVTwMulyY+FP7b/idh+0WX45UJe
 /sKrhqLKK5Y4IAho394HhCe+AKSbaB2MbVsXIhYNLNaJqpUP1QAMp6+xlNtXYYfMb4Su
 1vvDmJUlpvqBSoG1vSiOVQGYAtadGcimM7kfOdyDYlZA7QB085b8buxApuN7+4VJ7cKJ
 npI7lbDhaHT/phvmIYij1cx5Dfv/lWHEum/x77ZILPB4IHbxDheMiuI7uLJmeHyqHg1w
 LhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
 b=M0AA87OgCgzsE9rdMjZRYWM2ivB/KY9i8DwBHgAUEW8f5KzpSp6UF1RYDJhjaIvq2U
 VqzyeDbgD4HuCudIJ/5f7UF4qOLFRWcr7T6hHr84Jgl7zB3uaiV1P2LxXk5mc6/kCwiA
 y2hPN8vWG7Eo6bd5R9hImxL05V3a0Uu6jZ/Powr4wOHizu4pqKJu7HCgvw8zCuY9YqLz
 rzr3UTzj7xZFUE3tK6jJZuz8LQSxY5hOC+wf0OtTZ5MvmTOSUn3BWj7VD4udkJ5sANkg
 Ipzz+I9rGpV6eozvpyG6SBboxpc2SmJEjbU4QYS99aYQGOE+omwFij2SrNRofvXdOVUJ
 NsYw==
X-Gm-Message-State: AOAM5333zWh0RpG1EzsJJOn4etZJAVIPwvu1SRFrH78Boz62MFrCndAK
 +3geji4YPZ9QzCo4ngoSBhA=
X-Google-Smtp-Source: ABdhPJxdVjWwXUqUJ1cQCSZcWLgwAKdNFOfLW61IC+slO0gxQDMBRbtlzy8RUwnb/275zXsHWrj2ew==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr9262416pjw.102.1626341093065; 
 Thu, 15 Jul 2021 02:24:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.24.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:24:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:13 +0800
Message-Id: <1626341068-20253-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 4/9] ARM: dts: stm32: Enable DMA2D support
	on STM32F429 MCU
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F429 MCU.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..a06437f2210d 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -791,6 +791,16 @@
 			status = "disabled";
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
