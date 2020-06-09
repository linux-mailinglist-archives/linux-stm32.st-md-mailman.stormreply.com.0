Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5981F3C4B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 15:26:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51690C36B22;
	Tue,  9 Jun 2020 13:26:56 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FD7C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:26:54 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id b7so1045255pju.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QusMWrbVSqNCA9Vj6aVV3k3Kx07QkMMqYu7loEdqwck=;
 b=fdTB7MiXAKj536SYnUoaU2XnrBKccvOxlmMo0FYNsxJ494eIqCV91FnPLC6TKV9KeX
 36yyhi3hv2ehmccAqefo+n4Iwmqk10/MZAskfd7KQA4T/xKZtKR+37gxo51Sgc3+kkTK
 9ePFnkGmZuMKRHLfjr4+pAReM6TaqymTY0oOwk5BSzC9CyGw0qui2cqCwoAcX5EaJ5sW
 ennahvOHPUvZ3ZQMO1VfUlJGN3qWILZ9CzXu7k02jljs/URFtnTJujP02iR5qrtUQm4h
 S53RSwb0BPAyG4mRi+JO1q6MuodDHapZWbiNr4VRJ77x8xQXDf+xsw/BSnHkMMNzWgYv
 65mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QusMWrbVSqNCA9Vj6aVV3k3Kx07QkMMqYu7loEdqwck=;
 b=Gpys5j0H5gBF++cQq4ILuvrTR9xPQdhXLY7fGMb/91y6tFeKleUooDxcjO1XsqkJsh
 NvLyJNkBKI3tvpVGdImdCPR9EPVH1Wp2fhw4h9XKyYvLs9eza9n1COfivnFOuwRQv7RJ
 nDKsosKWS275hTF4cySMFKGr+gtXoG0Q0qwN+JKnskXPPLF0VX91sLkj2w9M8jMvXlCy
 +Tmo/hOxg9N9Mv9Gr9evXlnQiMBQxzmAaJFk6lm6DiK4ULrtQZuxUyVUYMW2xgUT/YNt
 wmfWy+ynk8Qq/17AP3/UyvdKE+D9MQhbChJ5GU2oT4NdQfTv5wXa2rNiRSLodhukp4IK
 +1ZQ==
X-Gm-Message-State: AOAM533Np+qBGtEUZyMV/fNi/q/Fkv67j2jRoBAPcezHggMlgFpYWi61
 dTqDF2SceMZT6Hiv1EqEN0U=
X-Google-Smtp-Source: ABdhPJxLW798RDJ9H+z390Fk/HHj5jev6sBdN99n9t4PT7es6sgvxXULvn01EU+O/ObGIuIiX9qmjg==
X-Received: by 2002:a17:902:b08b:: with SMTP id
 p11mr3449660plr.324.1591709212554; 
 Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
 philippe.schenker@toradex.com
Date: Tue,  9 Jun 2020 21:26:40 +0800
Message-Id: <1591709203-12106-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/4] ARM: dts: stm32: add I2C3 support on
	STM32F429 SoC
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

This patch adds I2C3 instances of the STM32F429 SoC

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index d7770699feb5..257b8431dece 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -402,6 +402,18 @@
 			status = "disabled";
 		};
 
+		i2c3: i2c@40005c00 {
+			compatible = "st,stm32f4-i2c";
+			reg = <0x40005c00 0x400>;
+			interrupts = <72>,
+				     <73>;
+			resets = <&rcc STM32F4_APB1_RESET(I2C3)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(I2C3)>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
