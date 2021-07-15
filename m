Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A203C9B86
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D499DC597B1;
	Thu, 15 Jul 2021 09:25:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49A1CC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id u3so2903502plf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
 b=aw4ENVWZQ1zX0VvMNM8DIFs06jP6E2MUjh9j4QMKqeZlUbZ3n5wFLj22beW4CBOIW9
 6wbvUVXLtg+1v7Bi7fw8B+YhPKRFm/3obCUjKOzCjhM5Am90MfChfk7NclX4nhXBIQ3S
 VINKW2kpgpn4dJ+6GqNByZyXIwGwr6luGqQ/KjCzBJ7OPbAck20qUuE8yoHOmrxEi7tl
 piGUUT5LY1XAEV7eaHZu73tJT+hWrl+l1dAfh9olyrt6xasy4NK3yiHRRIYY/WWhLQ3L
 2WUW9eIbXsw54KLTYuAYCn5WhLAoBBgOq3jiyF/UXEAkHEPJaBHLo/txOFaaFBQQbkHU
 WC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
 b=jci2vFU8o1aD8Cr7DgisPCpyX1W8vOPweYSPV1rztUFYJIRPqSu/MGKE3RKUgM1Ohd
 mJ54JPNJHkvlhQjvNAIzwvv4binOJTHolCSHsdz2aqMmnsO/DAfr7BQOp3GLljtd7vtG
 oikIDpnj+1uFVA7c05l8cxSfuRss8vh3/Y6UF5rkOtd9tSsaONwnTvW6u1oMYDk9pgqc
 VxZaxhYBOCGw/4KmAH9RI4g6wnU3QgzhDQVR5WyL5PsQJkFKTnp3UVxEVsQGm4aGkQLS
 mmrb65BX/vB5qcTbDqBeUNss7iSejU9f5V0i7TE4q3kG+zFV347FixIb96HzCvT5EC5O
 EHHg==
X-Gm-Message-State: AOAM5337BHWGnerQYOZcrJSGbcpjAyrkaO6xnm7cmpNhYW6FgLPXofTF
 Cp4wx5OEbYhTccMvS/qPi4w=
X-Google-Smtp-Source: ABdhPJzGHmcpLCFnW1tT+X1on+iZik+M4VSuDgwoUBt1NqomIQwJJCgeRxU0xl56bWUfRLSsk7elWg==
X-Received: by 2002:a17:90a:5306:: with SMTP id
 x6mr3383252pjh.59.1626341137920; 
 Thu, 15 Jul 2021 02:25:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:23 +0800
Message-Id: <1626341068-20253-15-git-send-email-dillon.minfei@gmail.com>
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
