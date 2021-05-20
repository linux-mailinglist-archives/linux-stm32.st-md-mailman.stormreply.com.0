Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207B38A9D6
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:05:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0295C57B6A;
	Thu, 20 May 2021 11:05:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCE90C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:05:52 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so5251442pjt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GLGGQfl2zXFsccd/mr0oP139J15xn0Blxr/cx91Xd1M=;
 b=sep2NJZySqc16Z7h0JLim1OgBCyiF/Kd5UGwhx4Dy8Paia3Q0KZAXin+ZWoZysY/6X
 CI04pPq2AhXoLSJB1+RyKHmObdy81S4BfwyuYXwJLEyAk+yQlj9DtrzB5YRgbWBrNGqD
 auIWeQ+Y1a7LEcrmG3S+Ts226SoQgVJPbr1OFl+aPyz21jKcvA2EERzTgN7I/nLK1lT4
 wB7OF6RLpJz4EKH8C7amR1sbtShKUy79MB+Jev++evuf6NnZm7GsgYzZuzePn6BJRQro
 deLMuyQGp9rNzx6CJTAYt1yQwpH3yNleOnIKDchlco8pjCWGZ3RLvsu6hc3GJv+5FHrz
 6riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GLGGQfl2zXFsccd/mr0oP139J15xn0Blxr/cx91Xd1M=;
 b=n4qMN03AEwuO1u1Q2N/F5Es2Uie1jQAFH+Ap/AbK5N/a/M33bRjaFzXxNkGAkt7ejF
 QfGhc6eUI/XLdyQiBVuORgQOKSXxgvkqXy3TomaRVmbili0BqxafV/ojJuBQCymOsyrB
 uDGOAIkZBAfSfaIYaK9/PFPqiIGnP91Q9VegOm/lpdbgdIYnBHVdrMf0yOdM7XibSWk6
 XAkIxNX+VDKWXdn1r30Nr8QoP8Y1SZyjqlk/B13Spqy4G/XT+8HXIKrPHZ5HbneBuja6
 lZPVVAJ2L3lqQMUbhsxo6NKNZ9SCNd7+gnIhDjnd+JLGNFgVskQCtM0uMS41NFXkSA6v
 OUKQ==
X-Gm-Message-State: AOAM532OLE9YeEQqcFQHDMDFG4xAvaKUju6JvxF9Z4/zn5rS1na5TbVA
 hduzNPgUiTHnTYYTyOLAjAg=
X-Google-Smtp-Source: ABdhPJx8T9pnitbWBnKS183vbEq4rXMFbi8xW6C3PzRCVZBkhv2ideHXgWVdIntE4IGSl5tUaxK6Bw==
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id
 h4-20020a170902f704b02900f4228d4dcamr5327214plo.26.1621508751436; 
 Thu, 20 May 2021 04:05:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:05:51 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:24 +0800
Message-Id: <1621508727-24486-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/7] ARM: dts: stm32: Enable DMA2D support on
	STM32F429 MCU
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
 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index f6530d724d00..2cd1506027b3 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -799,6 +799,16 @@
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
