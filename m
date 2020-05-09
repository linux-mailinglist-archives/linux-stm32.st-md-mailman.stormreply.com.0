Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2C1CBE3B
	for <lists+linux-stm32@lfdr.de>; Sat,  9 May 2020 08:58:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 695EBC36B13;
	Sat,  9 May 2020 06:58:36 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF742C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 May 2020 06:58:33 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id f7so2151551pfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 23:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1+50jpOtQ+yabtvOjIxdeqHbLW4bp1NAnAuKLsw1+do=;
 b=sOlIWa+ptEVcyXiLC/Bxln73BJva7q/80JuA5nMyFbl1isr96GlpRnuLTiIRXGrMvZ
 DBAeaHNoUDtcQUdx/w7pWDMhCtmoHwKGJM4udILbfyd/Sz10R3mBs0h4Ib3hos9TRIXh
 FnT/8XPlv9svitcANdJtArVywaD8oHJbX2QbjXHTm7WU2bX/iuorbNc22YS6L4DjcBKP
 PAaCuTDpQvv53QDfPqZddlPjWdtE6iAHjhOJGlIPlNERtF9zLgJNcgB+dHUawVl0Ta+B
 5D7oeM98d+YhAWeaB6r0qs4zI95n51fa2YMxrCAaYMfT9BmeFjqkN+H7SKPJb/czRjZh
 ue4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1+50jpOtQ+yabtvOjIxdeqHbLW4bp1NAnAuKLsw1+do=;
 b=lLaCRfAX414xyUQ97O1y97Ysq+z3yLhyYgi9p8YkTgn1rMga+iQTDRujuLeuXzQ0BL
 7wJsfvxEP784/HVAp2ycgHS1w+VDYDbLMBYrLqXtJ4EHmTCChQzvxQjyu4KukS2tI45q
 6S9VFIY0DmbQn9NzQT3jm16xQA/Y6gkVL3r6fEH3hym96GrvpRSZGlg5XXrNOHZzx713
 U8Laoo04F/AENdgomKRxPo/iYuL5raLshkDWNFBq7slZmfPiU7wnNfLNvIFI7D8Zs0F0
 3f0rUS77PaLF7dASZ9i6iRFrJjLwZgTrqEcPrzeJDYVxekyQ4n23/LBDqRH7f0DLXaKe
 p8+A==
X-Gm-Message-State: AGi0PuY2FmehToMatWdyA588rv8ExJrr43W3n0bTtF0UfL77w7vV15fm
 x6eUKrC/6xixmSlf22e5KNs=
X-Google-Smtp-Source: APiQypInpnXmSjjXJsppu2FYVV/nnWDkxAp8QyIQOIObhx4wp1sle8YpOuNdgiBAcaE2pnKKmuwEIA==
X-Received: by 2002:a63:175c:: with SMTP id 28mr5011956pgx.44.1589007512399;
 Fri, 08 May 2020 23:58:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id w192sm3811572pff.126.2020.05.08.23.58.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 23:58:32 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Sat,  9 May 2020 14:58:21 +0800
Message-Id: <1589007503-9523-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
References: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: Add pin map for spi5 on
	stm32f429-disco board
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

This patch adds the pin configuration for ltdc, spi5 controller
on stm32f429-disco board.

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
