Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDF433151
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:43:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BC29C5C84D;
	Tue, 19 Oct 2021 08:43:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DC34C5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:43:50 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id ls18so14157566pjb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=11a8WRrodjbs6jBFryNK3TjxLIaCNHB0kvSxxWVC7xU=;
 b=pkLBJsi1UWn3VAvo3wtiy8xCGLHvs5IramWPxjf9aNuWZr/PZN0ZBeAAzxfafQYKIB
 65/S1/pSkht3Qk6fsATWUUj9551mL+6Pi6bp48AAGvVu0Kp05weiKfkC1kCtp8QmDqhM
 S+WvBLlcEblTx8KTomo/BN98wGgOBvaq7tx7idEU/DZtDPhDoDPw8BK5iQgLx8Q9fGu6
 cAdpQi+souzjcE99QcLB1oXpbWBztRxNzgUK4iMvzfbIylgMmfQyFCbwB4GSoctTXsbj
 KlX6AQ12jQBM/jYSnV7b02YB6yoipyG/BlnjHRdCOVm5rLP8GP2XyPqL+MKQBvDfbLpf
 GqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=11a8WRrodjbs6jBFryNK3TjxLIaCNHB0kvSxxWVC7xU=;
 b=LosYES4jQW8jXIzkBUSqkWYB2coq8IQ2Au/8iSJHfCBs7b3apgeibyMrqL5h8TJdtr
 QhUaQou39OiFm4sSJuvpc4w9HvgRwtcCXVTn6BlSuuZVpgL3+qP3k28smJ1oK8oSl5TL
 CLlr/nrnCfEgLMKPFPaodb+2EYgWFs7/nQOgrF1w5VDntOCZPlNjpGXSw7rDxiY84S2M
 DeeoGxMJEAFLhdjA5d2sVX1lx+efNgI3H3i+CPDEp+wpabsSykX72WcYQjDvH6p2RpFS
 qJ4qGXQdeWRIlb7jHKRo7kyWkdTvtleXYQrp4w5qLkoWeDtkYCWcYoidJSuQybtwz+Ve
 rGOQ==
X-Gm-Message-State: AOAM5300Zn15h2CSR9SuEL3Hywp8+Gx44Z4GdsbxAbXLlb05T/QvhATb
 cUeXR6322OeSb+58xUK0pg8=
X-Google-Smtp-Source: ABdhPJwHL5p1H61EJ3d4KyVTH03HqMFuRWtSVTUkocgmfhLnXv0zCMAf7KKIuxNyWJClLmmjT/43Ow==
X-Received: by 2002:a17:90b:4a88:: with SMTP id
 lp8mr5020595pjb.226.1634633029293; 
 Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:43:49 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:17 +0800
Message-Id: <1634633003-18132-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 04/10] ARM: dts: stm32: Enable DMA2D on
	STM32F469-DISCO board
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

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v6: no change.

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
