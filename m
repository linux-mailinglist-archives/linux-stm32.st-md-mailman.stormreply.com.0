Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA6234A63D
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 12:15:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 509C5C58D5E;
	Fri, 26 Mar 2021 11:15:42 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A17C58D5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 11:15:38 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id w10so57808pgh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bJm2ylLmMokI00w8ehr07VS3lbjTqezFF/dbtRH1gMU=;
 b=qYMWPg6y3yfZTWJdbs+M8yjrTQa4u+bTqn65LtFAHgkb28m46IG6JCjFPdYa33Gx4o
 9EdcXMkLGRU/y7mJD7WAD3b/726QoFpw/ag3lAj0SYAgoY76oxY86E3XLAx42FzsqZE8
 XMM8LOY10QqAYlXOjXohVr8pmSV9FjARs6uOCdJTTs/RbZnlIWnyyIqWdcjmqiIkbInE
 AfPxryslLhe03kSPO4EAtVZowx8ezkDDgQern3Z6P+snO4kTTv0tQPUTO4oBYtyFatNR
 M6W5/GuFpXoHT3ec89gtEjymC+JpVuuxBo7HfRudSvRmzIRgEIG0n4xL03z8hO8qGWOF
 b2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bJm2ylLmMokI00w8ehr07VS3lbjTqezFF/dbtRH1gMU=;
 b=j4DZuZJbsNcuix16rXO8ket84pp6crzba+tUQqap+AueitnBX1K6TLnQLEIc+vtxTA
 2zjWdYEBCYG+4xK/Q+fEvrQKP0Hg/OFzr6HR+5RP6NEzO0qroSaU8/8sFsvnq2AL6ksd
 +iuRXw700GUi++zfBJRykPApcjnXH2kP05KeO2PZ0WXCXqAIm0QhHPNo46v9r7YvjEPq
 0EFpzBbyZOLSrcELmbmTphYeXH5Um1kMgvxImXlSoxRAijvWzEMcs0/sFOfG1oThdCvH
 2Utpz3QWj2ZworTSL2Lb9BBmmy1MPrarFdytS79ow2xEOvNamVn8RWQ5VqPfzrvmdZ7r
 l1uQ==
X-Gm-Message-State: AOAM5311W9x5ETy+yeLdtGNV2MNo92TbWb8VecdlJnbsT3+1JLNRCuZl
 8OSAgl4YobyyycCMaa9k4o0=
X-Google-Smtp-Source: ABdhPJzP55PHzHMDGvhOF3VjKRhU/ux4MZF4RBUmgCRBH+8oz1Hp1T3uYNnZU8+C+ELudGgTOflLYg==
X-Received: by 2002:aa7:990d:0:b029:21d:7aef:c545 with SMTP id
 z13-20020aa7990d0000b029021d7aefc545mr12257039pff.77.1616757336833; 
 Fri, 26 Mar 2021 04:15:36 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l3sm8108414pfc.81.2021.03.26.04.15.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 04:15:36 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com, erwan.leray@st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Fri, 26 Mar 2021 19:15:01 +0800
Message-Id: <1616757302-7889-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
References: <1616757302-7889-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v6 8/9] pinctrl: stm32: Add STM32H750 MCU
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

v6: no changes

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
