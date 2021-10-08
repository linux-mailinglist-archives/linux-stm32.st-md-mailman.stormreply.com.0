Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0054267D4
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:30:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63CBDC597B4;
	Fri,  8 Oct 2021 10:30:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF847C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:30:35 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id oa4so6510044pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t3NdgUxFuRWErDfaVwf7s4lHqmvHQTxX2pad0GzH++k=;
 b=TprIH9OfnpHAcfh6ZMb95W60Cp7uyvwy0doxNpqJ6zxsuc5gAfs76dgey+H4nJPUui
 Xq+ac0GYw0U/+YqNmBPgBOutsB9MkSP20AgbkIVKYTA6SeiBT2i9m4F9/LWrxUxrlesf
 HWD84TP6H3yrajJ9H5u4RwEkBEJKMX025sZjy/Za4CQ050UW7KApfsnFYJnLP5ac/hp4
 Yv2V7YMW/xEuZ1IMsZMNQjBwvTHfkQ9ZlvEC0lPEmg7GagAlMY/WlI6St68lpSFrv9l/
 PIckAKgmnzoCwQ1uDVj1J0GbEhlWvMeYOB8sG8GIThEGWI+QBwPv95MEVTi6UIJw0LCb
 voiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t3NdgUxFuRWErDfaVwf7s4lHqmvHQTxX2pad0GzH++k=;
 b=jGE12myQUzySx3ovNvw6gY89s/+dukEHFU4koaKD7+eRsh5KW3MnfIvYubi0OQ0e2s
 IE7CIjM7iJ9JqSFrZtzjUWCDnXO7k0xlJXhIN8k9I0913gdYwqNGpFmW+PxQaSvAlMiq
 Iu//joodho0hOjYlpwCgjCmxDsy5Vg++FQJkJQHwudOkxCJrQafkrQ6gDKjnBTK6SVGu
 11P0g23klz6mp2OLaOBC0eESzNQMmHQwkeLTaUJwCfE7ELOY3/4GLbbpqvhXWZNoE60A
 ZFzehJx0h84jHD77Rk/EqPaoQ7cjnVJfZazXApHOrCulsYp5Q3+teU0+jkx3u6PMdrV3
 woOg==
X-Gm-Message-State: AOAM531pa+R9tsnALe4RjhFwTdiYUE2ZlaGU8NydZ7ly3dtB+u5fYijb
 asDO+9WOho0cu5Gyfidvlwg=
X-Google-Smtp-Source: ABdhPJwLu4QWPRED0QHuGLIFNuWjH8syqHtuYJR1SdJbHmLU3c/Mgbqg9CXiGOiRThAOVfkutJ16OQ==
X-Received: by 2002:a17:902:da85:b0:13e:f80f:4e19 with SMTP id
 j5-20020a170902da8500b0013ef80f4e19mr8642678plx.26.1633689034585; 
 Fri, 08 Oct 2021 03:30:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:30:34 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Fri,  8 Oct 2021 18:30:07 +0800
Message-Id: <1633689012-14492-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 3/8] ARM: dts: stm32: Add DMA2D support for
	STM32F429 series soc
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

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: move the dma2d define position before mac.

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..1d8be5e7c8b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -743,6 +743,16 @@
 			st,mem2mem;
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
 		mac: ethernet@40028000 {
 			compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
 			reg = <0x40028000 0x8000>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
