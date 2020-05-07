Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50481C83BB
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:46:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DBB7C3089F;
	Thu,  7 May 2020 07:46:56 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 587EBC3089E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:46:55 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x15so2621739pfa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 00:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=Bqxfo24AfFYXWhsN8GHnujLuoVkBpk+oLN5n/pKhY1B/kTAZsV4QlTI/+64OgJd7me
 /3GbM2TCKbKKs5H0kBqmM/lnyfr9O1RVWszihBOglb3thtIhJhcsvO0cuaevmIsigXdc
 AvG+O3NOWCh8NEyKHb9rrPLijMLpT2UVpR3OtJax9CXsSrfustfDX6lSjq7KY+lxg8aH
 cRYpX6Ay58EqICKpIAqzfQGh+rA6W3MSlwo/Gl8PisC8qnqo5nBQPZ6Vs295kRAD8EEu
 ru29YLo93QVo76QU8igeajEgubBaI0bCFrxP9vYIm1WQw+gIC21E0CRyu41/mtzKfcMM
 c0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=fDBQVdQLUoshgAlkp4jDzeK7Tp7o8OvIKNWiUhAjuB6ti6xASSTnSGmgQ8kBiMCaOM
 6NGlE0B0LNc4GfEy+dpg42IntZcDcSiBu29djDkwD7WweAETwKyrHYRVwEo6X0iAbQpQ
 qgePoSlvmvVDv2WCrQFxsnHNE2oKOns3dRy6cWDO3NwoHCK5SP7wxeETvwcSBtY0OA1y
 S2mdwPc/a9c9spLZHWPbLWQZlEfdwFntbwSTERtoc+YJZHpKfcnfipyWbymlHJylBxVT
 JuSt14lbIf+39vnHeIvfnEr58CunaCt64IsyLl+oiEQQWdvvQPmKfWYM3WBn52f2SW9Z
 qMVg==
X-Gm-Message-State: AGi0PuZpSwDQ2qdiE+TApmEoG5KaExQs09aQ/jCJgYv42nDBdkbpuWkM
 onRNNRYA01YDNoO01SdelBg=
X-Google-Smtp-Source: APiQypI8VrY230e+hhO68sFDKpYBvjJ1jP2UrGvK+1FaFovSdhtxYdf0l+gaPRquhoaquZMZUdgkeQ==
X-Received: by 2002:aa7:9429:: with SMTP id y9mr13001101pfo.8.1588837613949;
 Thu, 07 May 2020 00:46:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id r26sm4127943pfq.75.2020.05.07.00.46.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:46:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 15:46:43 +0800
Message-Id: <1588837603-14206-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588837603-14206-1-git-send-email-dillon.minfei@gmail.com>
References: <1588837603-14206-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/4] ARM: dts: stm32: add I2C3 support on
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
index d777069..257b843 100644
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
