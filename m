Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E165E433150
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:43:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A93E9C5C84D;
	Tue, 19 Oct 2021 08:43:46 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6FE8C5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:43:45 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q5so18699874pgr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8KHGup7Rpu6QrYrymBE1Zjq70+Yty5ooxNn1hTc6qIk=;
 b=fYShuE0Y8HhsmW0xrkpC4XrkGoUBnf+34kxtCIAra4E+VKNJ8AgNyj3E/u3ObIkES+
 GvG7fowi7pUvv6XeRsZ1BVWgJH1e+YbCVwq1VxIzvduTt22WGlUxBIHTK4ddPaOBalJl
 63jZPxXVb0kcoqSJ5SAdI7eMFeJvC91GDrI46opjQx9FzyumOBevM3mn8eNOn8vcCzlL
 nGttdz9HrGluNqJepukh2PIlkUYMZiSfBFA1YWYSkImovV6byim/AQ7O3sdb+1fhCp/V
 bJzAeLVi7jP6QL8OfydnG7fBpF4+OPuELCKmgelG8XaUUJOM7fMXr9OVCph9Gh0/FGQf
 fApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8KHGup7Rpu6QrYrymBE1Zjq70+Yty5ooxNn1hTc6qIk=;
 b=RoZnMeSDHuhXpqQr6rxhVGnp2AFf9EPN/19FtHbJq83rji6Y69IMZiJZr3c3BfHNUZ
 mp3r6KH5tccNvXa2ibSmRAyQrxbM+4xkZIpMS+vSdlK4S1kUrBLZq3rX2LA7S6iqexcy
 q9Q2s+hORrd1QyktJvVV+qIhydLRX4jrOdpZW0ooo6dxjHn9aVclsn5PYMf3vx1eidxj
 5ptRlhGu5rNVkJjOHwytjq7SUEaWa49n9OJjJ7i9NaKosaij7m6XejAnDs5c37cf0CCI
 vk3wuftyKRiTMQBdVrZR64sCoyM32yi6OM6UbMaiaaUXfnOXwd7VzZuoHI1182Qyi76V
 /v0A==
X-Gm-Message-State: AOAM531ZVT+3VqRbf0ia2ECeP7q7XvRoxOUFYoF6pVIjNDTPrel7R5bf
 a3vIyCgikMxO2pekYgfe1XY=
X-Google-Smtp-Source: ABdhPJy7/unRPgOuTDXgHc4DcSGF2Mul2NmVpFRCzLO1l8unixtr5OXI8I2y8rZALj+g6tMSZ6d3Xw==
X-Received: by 2002:a63:d2:: with SMTP id 201mr27681869pga.400.1634633024391; 
 Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:43:44 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:16 +0800
Message-Id: <1634633003-18132-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 03/10] ARM: dts: stm32: Add DMA2D support
	for STM32F429 series soc
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

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

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
