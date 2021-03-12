Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 820753385C4
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 07:25:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A3A3C5718D;
	Fri, 12 Mar 2021 06:25:09 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A43FC5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 06:25:08 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id o10so15213322pgg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 22:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DbiM/HSzZZ4GI01XA3bmT/NtzjcaG6At7TJMeyRi268=;
 b=kfnoYzxJyQsGQs930o9zjPIkVNdy8UqKB0m4fz/eL1sWabAQXHRCaevIb6Egk4HYWP
 Y7G+sloPPvSWY50jOt036lGYJzLI0iTGffdFbNli6mAh5doJh1e5Dln/MpJfrY4Tu7lp
 SBGiGMLwrQhlxFmbURWr3E0UzUvKhSU8cVhdQ8OjNfaVH4qpGcVhfmggdLsHLxkfRU69
 SlQPyg0ah8dAseYuPHvGmJt+mF90Fe/PiirQEQT+BYk+xAq0s7JnFIALln6HdHYLETJ4
 dPCmrSRkxP5BvHGk+JNt+096ocZXD9kTXCZ/lIY82TwhIOGrTmif09isqZ4zFJCuaLt1
 vkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DbiM/HSzZZ4GI01XA3bmT/NtzjcaG6At7TJMeyRi268=;
 b=kKIqQGIu4v10XdtzIMlyy+1i/3gXK1rezmsP+54EKByUvgy+oAGCaFxO8QvjxFCs72
 Cs2NGiz/UyVTq675kvnLVPkvp8WxTZ3BNkQ5eVHGIHiAQwub+yfUXHA3EwU5AKqvwGQU
 tUYBcIZBHKollT5KgbeKVL6cyFO0k5Yo9i6nUgr3P9x24HsdkP+q3uW/9t0cJKgxc3VI
 yEt9npwL23X6/nmjPWhBl5bw+z6N6IYzDNAWGNG/rRrQSrfrOtPUEWyBRV13owBKWpCd
 rPSPRPabxHG1YecmIHrV7JwU1wnXUwyCx16EQ3COOvouszcm7DtahaJtP+uwozy9UkVo
 adCg==
X-Gm-Message-State: AOAM531wMV0CbLNv0bscx1BVaPMMSksju1yHdjYchuDdcshRGasmAdIG
 jePzRYxUr/fkt0HAdF/W99g=
X-Google-Smtp-Source: ABdhPJyevqSj5NqnClRsZ57pwxDoj08fTSg/6sAIzVoEMDnSjCaUc7k9Ay3ZVDGHcDGMXWlL5klGeQ==
X-Received: by 2002:a63:a512:: with SMTP id n18mr10488698pgf.198.1615530306718; 
 Thu, 11 Mar 2021 22:25:06 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm4048406pfb.157.2021.03.11.22.25.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 22:25:06 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Fri, 12 Mar 2021 14:24:34 +0800
Message-Id: <1615530274-31422-9-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v2 8/8] pinctrl: stm32: Add STM32H750 MCU
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
v2:
- add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
  have same pin alternate functions
- add STM32H750 to Kconfig description

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
@@ -1966,6 +1966,9 @@ static const struct of_device_id stm32h743_pctrl_match[] = {
 		.compatible = "st,stm32h743-pinctrl",
 		.data = &stm32h743_match_data,
 	},
+	{	.compatible = "st,stm32h750-pinctrl",
+		.data = &stm32h743_match_data,
+	},
 	{ }
 };
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
