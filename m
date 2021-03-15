Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A380633AF12
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:45:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68CE8C57B5A;
	Mon, 15 Mar 2021 09:45:31 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 109E2C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:45:29 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 16so13710458pgo.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ep4oDr1hglklL7K/WBO42zrmw7RgFyDwJC2jJIwneMg=;
 b=CY0QFw48sP9XRK0pge5CLUvMCuHUxO7IkJKsEmkPNDbnFpuSc77oOs5XrPzrxrsi5D
 8I5DLUt+5/SG2KmW2gfB4RjFlBq5XVZ/PFQksIzTA4U/xS1sxqA68A6ACFh+mJq6RMNv
 ol4gTZyWcMO3ccOex712CdxB2x55bUB2k9z20rnqx800xoNH3+AP8bXXppGnEykVf3Oz
 iEyKqmAihUI2p5NuV4LvS7jmt9pPU8WY79LlwueaZ4lbbmCJSs310DntYdI7AGcymajh
 QkeitNg4nBMdgJNFexsqr9MFPAPFdNUXBv3mW5i6WEjivm8NcwbbNmp/IfR9z4po8LbU
 S2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ep4oDr1hglklL7K/WBO42zrmw7RgFyDwJC2jJIwneMg=;
 b=qApQSTcfQWnJWiSgmIB4dfdfptZaHclZTKOBSgSEvOzOso7j2zRxo0mFWARqmEuOZu
 JA7+Ia4gqA/+5lSPGLMGR9az1xl8slKhPgtNRvev0G8yPEmqjv/wTrlSOftUasQqUdmz
 o7EeBIV8fM18/0LUDgbntQHNzb6iEj3aPO2weK29jaMBlo0R+HMO6Zsi3C8bu89ruKYl
 GX2/iVflzAQDk14xoFh1z5Z3GCUxewN5SlwQfrNp1TJ1kbYm1uwHn1gizB4JGix77buO
 eX1UPzmvZvcZvfnTFJeqV10ZVR9Ot8DEYPWLNnnJG1DQuW96fEg6kcbjNAc3Xq11BEIy
 tWZg==
X-Gm-Message-State: AOAM533w/S+p0YfJMU3s2l1ofj6fqukdO3svnT3JFxDwlgHLDqncFrOc
 g62XLri37EuZyt9frZ03K/Y=
X-Google-Smtp-Source: ABdhPJyrPUV5QT9n5Vkw3w86SxR6jp8X5ZjJvYUSAFfYyVOOLONK+/ghx0cPcD4gq2GDhDbR/HNORQ==
X-Received: by 2002:a63:6981:: with SMTP id
 e123mr22900109pgc.423.1615801527715; 
 Mon, 15 Mar 2021 02:45:27 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.45.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:45:27 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:55 +0800
Message-Id: <1615801436-3016-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 8/9] pinctrl: stm32: Add STM32H750 MCU
	pinctrl support
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

This patch adds STM32H750 pinctrl and GPIO support
since stm32h750 has the same pin alternate functions
with stm32h743, so just reuse the stm32h743's pinctrl
driver

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 drivers/pinctrl/stm32/Kconfig             | 2 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index f36f29113370..fb1ffc94c57f 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -35,7 +35,7 @@ config PINCTRL_STM32F769
 	select PINCTRL_STM32
 
 config PINCTRL_STM32H743
-	bool "STMicroelectronics STM32H743 pin control" if COMPILE_TEST && !MACH_STM32H743
+	bool "STMicroelectronics STM32H743/STM32H750 pin control" if COMPILE_TEST && !MACH_STM32H743
 	depends on OF && HAS_IOMEM
 	default MACH_STM32H743
 	select PINCTRL_STM32
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32h743.c b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
index ffe7b5271506..700206c7bc11 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32h743.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32h743.c
@@ -1966,6 +1966,9 @@
 		.compatible = "st,stm32h743-pinctrl",
 		.data = &stm32h743_match_data,
 	},
+	{	.compatible = "st,stm32h750-pinctrl",
+		.data = &stm32h743_match_data,
+	},
 	{ }
 };
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
