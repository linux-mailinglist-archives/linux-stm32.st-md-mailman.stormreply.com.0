Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD471D760E
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 13:09:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648EAC36B22;
	Mon, 18 May 2020 11:09:47 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6966AC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 11:09:44 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id q9so4874468pjm.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ywJR2u0sxzCry1AhZGxYacIrf0h0wV/3/P70ewifITY=;
 b=lsv+ci5O3BF5pp/Fzm/71bOqUhzwDhdV6mf6dmUZaX8uo7eiJj/O+bcYSv7PKy+8ty
 F6Jd/TsIHQfj5p/2VSeALGViY//PoM9iSxbRxo/QhYUCAkBuvp+pZVb3S8A6h56MIJma
 Rw7hOJo1IldF2kRvbRkdap29xtOomIqWhbV6Bk+reqa3cq6T2Xwzee2Z0+JMiiEvlSUb
 zAey2q/StEBydV5XSapPsH+hiTMxklq/qW7VLynMmIya4v1AcpH5tRzILJLSkUgNyBnu
 UHB9dw9Q7plOKVWzHLip2o679jj2TVpXaij9RfG76b9aKjARBZkn2+ZM2oQKU4HFn0tr
 M5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ywJR2u0sxzCry1AhZGxYacIrf0h0wV/3/P70ewifITY=;
 b=MPIGsYgFPuRwGWfE+XpmsRfmKf0wgmoAlhPESvs7Qp1XMWfb89OLGQ1mBKIOB7jWq9
 X7WurM1eKLf5Ua9F5PH580/JVkCZp2a9H6T1OScGlS8f1e95HxiXBAUvT5p44MEWy2Qg
 69cc8AsOClJzpg340e3DHcJ2acANwYsoHPpI3C+QDNbMBjGOipTzEomMxoPPzPMPaxhE
 ps7pWBZNkMdxHJKih2Oq070SMqsWsDxyML+aEPoyLSPgbGzcoeyQPpI8F2+8jFbSWT84
 b0mRUOp86fzHtdvhNrFic0HDUzXvK5olhNXYxK4afl7EP/0dW1dAYlqVB5JCv3FN3aA1
 kJdQ==
X-Gm-Message-State: AOAM531Ka856VhkDCkEn1k6cxWjYSI/4j4xM6A6eIaunugpItZnV5jK/
 0n4a2VdNTWxUWLz2fvuu8Y8=
X-Google-Smtp-Source: ABdhPJwCSYCh/1rzKVFG/X/BBP7KphC+GH9RMiQtvUBzCQoZyfTGn1DBeXe1tcs+tZRW+3x1Osg33w==
X-Received: by 2002:a17:902:a513:: with SMTP id
 s19mr16338427plq.84.1589800183045; 
 Mon, 18 May 2020 04:09:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Mon, 18 May 2020 19:09:19 +0800
Message-Id: <1589800165-3271-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/8] ARM: dts: stm32: enable l3gd20 on
	stm32429-disco board
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

From: dillon min <dillon.minfei@gmail.com>

L3gd20, st mems motion sensor, 3-axis digital output gyroscope,
connect to stm32f429 via spi5

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..54c1b27 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,23 @@
 				};
 			};
 
+			spi5_pins: spi5-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 7, AF5)>,
+						/* SPI5_CLK */
+						 <STM32_PINMUX('F', 9, AF5)>;
+						/* SPI5_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 8, AF5)>;
+						/* SPI5_MISO */
+					bias-disable;
+				};
+			};
+
 			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
