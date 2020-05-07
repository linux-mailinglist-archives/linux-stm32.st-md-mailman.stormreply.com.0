Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C91C87CC
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:14:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 505B3C3F93D;
	Thu,  7 May 2020 11:14:58 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 944FBC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:14:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q124so2369771pgq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=P9xzAJWNtpjG4GM5U3Le0oR9S0hAuJPJAnKqdXJxjdBeAlU1kK9ev60F6NUlFWuqSf
 0jR0DjkY/COxzCP/1kz2MeVCJdzwdTcmdWGw81XdGgJVtt34H3FIuNPSXhOCggQ3nL2F
 1KXAfLZC3Rk5FnOJmARCEQn6HwPsItMdYj7Pm7vqfeHaAyItsyxtSfS9ACuy5H4kZXRm
 CgTfXnAFJDztw6upni3fz8mYsHoITdYwUTNHmrZL3bepyA85Y2Q/hYu+yurlLFsdBw2y
 7NEWb/9tqQjNx848PhgqrivnMNVlP4kxUVXzb/6EOHyEIJoIeFadl37qPNiBFxNM2tZ7
 wbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cweRr9cAyY6zAkbWBKWMpZ4+w4vWexg4Pp5+tOHzveM=;
 b=fjFz+PjfhHyUPjvRQYqui5G7PqPotxOt87aQFD/48Z52tiQZ0xr3ryOMjdwnXlUPGU
 juymjXx2CIC+9gO/qjfbOBdi1ge9l/ActARmhZFXlhCy1XuVk1mFyUlcV9eWXuHrag5D
 sOJC/D0xw99w//Z3UMIx93tou0AkB+W19WWQpIDfdyuHqYfL2bxQJJEit5JU93uHhxjb
 BItP6OLJY95Bc1fNEsfhaU9AfTceVle290OpyhhAaHIIHUuC9Qnzxst17AKGOww2J7os
 sY17WyiK9wqYRqaY3VT8ZaoICvLVx+jZJla6loNo6NrRGZki0/A3KBbqy14P65sujlfT
 xmlQ==
X-Gm-Message-State: AGi0PuaVNz3tFWN2DnqTGyjaxzRwrZSFYWOpoo5MWeJ6PfVi17sfN2mp
 YWRKH7i0SZoU4JmZEaOqdcA=
X-Google-Smtp-Source: APiQypIvZeaFF5cDEz/4tLTjZNOm0OTb5Djpyxeum+11V5wTG99AuLzfa25c+QU6BOGUSiCcWz+bBw==
X-Received: by 2002:a63:778d:: with SMTP id
 s135mr11615957pgc.238.1588850096044; 
 Thu, 07 May 2020 04:14:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id l30sm7304041pje.34.2020.05.07.04.14.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:14:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 19:14:46 +0800
Message-Id: <1588850086-24169-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588850086-24169-1-git-send-email-dillon.minfei@gmail.com>
References: <1588850086-24169-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 1/4] ARM: dts: stm32: add I2C3 support on
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
