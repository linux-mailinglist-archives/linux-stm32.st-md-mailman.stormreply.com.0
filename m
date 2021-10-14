Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCF42D6F7
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 12:25:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FA5FC5C838;
	Thu, 14 Oct 2021 10:25:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A442C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 10:25:29 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id r2so5070534pgl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ipMUO+N8Yq3/DitDfDXQzCUb18T3JUMsKhUaY8JPW7s=;
 b=A0TDd8zSvipUpKepUiq1ZLP4UIkFs0SKwBbgCmFzjpY6a02yQ+cmk+GmAGzUc/B9c0
 6ZlfYPuxLNjiLpEfzyywzqtaM4fzZocJ6vvFU9SV/sxOnaH/Klm9JtddgqHm0OUy7+Xg
 9BRrwbKuPF0huQZGM2q6F+AcZzWtKjn9GSkrVFZevDNwFkynX66GvsHeztThDid2NEKr
 wbQKH2xR0g2+NXrHY21+BWdI0Muzh1lREh5xHIyIVWwB1w9xqz2ywO1mivXBimIumP+O
 9rzrSbyMtTfBxts6Ylq3xslYXOY2pCu6mCxPrY2NwZ4pUhrSsFs7DBw5z2IMheGs5wAo
 4okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ipMUO+N8Yq3/DitDfDXQzCUb18T3JUMsKhUaY8JPW7s=;
 b=V/UQJCXEXTsdPNCdrW/53qPM2qMTVnFPY2kG1Pn27Xxt/aHa162C6KvnlxjuUzV5nk
 jy8VHsPPqt0SCd3zUgUCIditD2OF1rqa/i4sBudoSXotuxA2jE5sDbrHhVCn940TTE0l
 rIuRg8VPc1VXojIgWoro0G6bU68eR6oFGp+f48Fq7YRuf5QNdjCXhs+cVM7pRBcGKd53
 9s7BWobbSmh9CO9k/WY7M8hXiy4Xtd5HPFRApKfBACi/b713kqdoJW7EU+MOC3ufrcp/
 SuOpN2O3POOi3Sbbfr4LEkrLXhK8Pc3QrdkTs1emopReuHz9LoeMLw+u5WHjMJkmODX2
 r42A==
X-Gm-Message-State: AOAM532DWVcfxXPb1YDx74hEC7skswFiLiB/zBxguG1E7rizYJ5iRYEf
 enAJ0PDkrG2xX0R/Pnh2xaE=
X-Google-Smtp-Source: ABdhPJzcYMkMOh4NxKsESGdglutAm5a/C5ijlMs3/PFBuNzuFu6Wt2iRWEgs5NgnxbGz271ALy1BIw==
X-Received: by 2002:a63:ef01:: with SMTP id u1mr3577722pgh.336.1634207127758; 
 Thu, 14 Oct 2021 03:25:27 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 03:25:27 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Thu, 14 Oct 2021 18:25:01 +0800
Message-Id: <1634207106-7632-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 3/8] ARM: dts: stm32: Add DMA2D support for
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
v4: no change.

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
