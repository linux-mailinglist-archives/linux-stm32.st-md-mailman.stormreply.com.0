Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6D1CA03A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 03:46:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BCD9C3FAC9;
	Fri,  8 May 2020 01:46:39 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 904B6C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:46:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r4so118825pgg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=qkSr8PCxTjLesHCIYKLjPg4DjNMUEOltWQ3xEt49V/dH3wG5Q2bFVu8h0oBVariOzD
 64FCLQtbLsFM3L2fGXIu2f3ZTV87w4JIZ4pByFeHiG0fb0e2eaLbwVSxq6uhbBOIsFVA
 o4X2O6+JRsVnyjJXUZCkalLxRJ19vJF6+ZvXy4tIUYZe3eqzhmjPxg1NFR03nYirHoGO
 OpqTL/wuA1r4/GAj+Y9d4LJ5zE7GQ+lQ0xsUWjmmOj7dJ+fpkQ5+L7+wbhfF/McwSuJp
 Vlw/LHP/qZWOzoDyAuA3DYq4M3wy/I8sbhcO3oXxbgWsWyVjfc/swSe/DlISYnfepxCd
 Vx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=do4bq+7il8o/+IZ4DWpoP8Y/z1B1NKks4kFckoNSy+IeKO2k85Iy6qKwlOwoNZCLM5
 mxRE6s7dheniLy9kDyrM8E+EZ9zeGsDCHdFfMjTaXoATqm6gF09hmfClYPErxbL1PWAA
 TPxUUNA2ARC0dPW+AyO9Oso1Mt5+AGoA7r+vQ8+2/miQPA8w3AQ82w0cIejUFh95Yf4d
 owl84TgCSttf+5PnFJu2NVFcy/ghK0AJ9jCjTO5yFzEsRAK0DRprFUxk52obn9Ci16gS
 QH/LUTaoXVF3sbGNU35ux6pauFWxLYOBUmnkByegRhDa6Eipw3cxAHjHpqwdyYFLHZ1I
 tpzQ==
X-Gm-Message-State: AGi0Pub4LN2r2WcCsxZTbih9JSYgPi+6tg5jzOQUR/msUlbDEZGRU6m7
 qPXUl1/8uOyfp2zYn98Y8Fw=
X-Google-Smtp-Source: APiQypLM2K5G2GnkqO1UGyLId9fhCM/BEPlhPv4MJCsMXb2nUR3hPIVNMI8YnRBe67fjalob4a88aQ==
X-Received: by 2002:a62:18c8:: with SMTP id 191mr242124pfy.255.1588902396205; 
 Thu, 07 May 2020 18:46:36 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id f74sm9270816pje.3.2020.05.07.18.46.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 18:46:35 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Fri,  8 May 2020 09:46:25 +0800
Message-Id: <1588902388-4596-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
References: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 1/4] ARM: dts: stm32: add I2C3 support on
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
