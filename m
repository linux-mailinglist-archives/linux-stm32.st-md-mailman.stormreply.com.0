Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678A430F78
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0937C5C848;
	Mon, 18 Oct 2021 05:05:14 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12FBEC5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:12 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id t184so1846524pgd.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i+sN0ln4C4CZnDhAWrKWfVyRpzPY9us3huE3UGBGxOk=;
 b=GA/+tUwIAFZw9zfAkPz2n2mTpy7fhEf/ZEfbho9GEsH4qTlBcyuwiGxOPCkMhXuiip
 qLtQUzg54RLkVN8DaUo6czVWX+sEuOl5sOJNvhoaVnjppoM2mWprPzEBuGc4NSPUGb5p
 8fKrkaZA8+9VGuFX8JDP1FMZicboxY8l85BSS8HmidPyb0kBgqc0pcXwQetqX75Qb8+p
 YZ6pjxN98Fe1H4wyYOmZDH72v/3s1gcXpu29CkmMrqqzNs7yawwRuvyUllZIse3tvWiq
 bYcRfRF2MfQTK9uLGlsonwhjByScNQMa0udxwK+vWJE34Y8W3tz5BCfoyqsF4vz96Jnj
 D7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=i+sN0ln4C4CZnDhAWrKWfVyRpzPY9us3huE3UGBGxOk=;
 b=s6/hZybOTRiJEGFVrGErFbXbxE2ftiIIKpSfOGurVmnHoI4gxRwYuOR/XTq8GrjvF7
 USjWMmknB544oWsQ3ozAj066ZLYHXgoGolrrl7BXurQTWV7k63hLkpTEZtASxwxkpQfV
 CAgHe8mKq9DNCcHzzofjr9ihMfSefZLy4aIhctkbbxoYHffSj8MmHpjYg8MwKwp/nZZk
 6C1Bmh9yXEt1ZQy0Uc5LvBKgENWRIWloxGk671bzSsY5TynqU9NhVI4zlp2BCOQpb1Ng
 EuVwrC5KHB3xvxw+4QKEwarPrY/tX2BFieLrm3WlOrJAi2dmi6bLTr2/3hbzLOP73hV6
 EnzQ==
X-Gm-Message-State: AOAM531uOsUqnmzS1IZFJ2Mhi8/5KXmwD5zVvkSe678WVWqt+oIG+/Ay
 kd6CTzBC/mR4vPykRqo4CaU=
X-Google-Smtp-Source: ABdhPJzn5dqT+V460e7yLsF03hsg22p2zuEuoGOLx7suc9Apu5B98gpcvGZK25W9D/puTO8HTh4TSw==
X-Received: by 2002:aa7:8497:0:b0:44d:24ce:988d with SMTP id
 u23-20020aa78497000000b0044d24ce988dmr26405902pfn.18.1634533510768; 
 Sun, 17 Oct 2021 22:05:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:10 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:41 +0800
Message-Id: <1634533488-25334-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 03/10] ARM: dts: stm32: Add DMA2D support
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

From: Dillon Min <dillon.minfei@gmail.com>

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v5: no change.

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
