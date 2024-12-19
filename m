Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD79F81EB
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 18:32:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40C3EC78033;
	Thu, 19 Dec 2024 17:32:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 446E2C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 17:32:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYBXY028696;
 Thu, 19 Dec 2024 18:32:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 XP8tGry8QPhC+d2CSlQqWf2Cwz8m/rsIKfC4H6XstXY=; b=WcayoApLWhXG7+z1
 vS6+avtmgpT9mhJA+S5pd2Q1066j7T69GwoAx6Lv9YzHD8rOF0jE4m5DfaFUr23l
 CdVfHpTV3cEnnAdMDPubzRhYtTjAIu0bMW4OeDtvgCdMJcavd162zczyt8iApDNE
 biRi3kN2GxiCDS+iN4xUD739JkrStnNSnzSgQj/2saV5zUfnBfzECMObYoQpDQCW
 33IIR5SnPvY/ZN0VMGQewozP+Fg4SDnXxAftagyDj/A9TRgJp/MeXShSV+Ga9U4n
 iqMqZ6Lx+jdSrjX/h9iko9lMDzyIi/YNylj5lJmBu4CUEie5v9/MxuZowBI6Y2lr
 VqROeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 18:32:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 520BD40052;
 Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F860288B47;
 Thu, 19 Dec 2024 18:30:00 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:59 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 19 Dec 2024 18:29:31 +0100
Message-ID: <20241219172934.3010875-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
References: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/7] ARM: configs: stm32: Disable
	CONFIG_ADVISE_SYSCALLS in STM32 defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Patrice Chotard <patrice.chotard@foss.st.com>

Disable CONFIG_ADVISE_SYSCALLS in stm32_defconfig.
It will reduce the kernel image size for these platform which
embeds a low amount of memory.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/configs/stm32_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 0fc411e7d87c..20fa929e2f9b 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -12,6 +12,7 @@ CONFIG_BASE_SMALL=y
 # CONFIG_SIGNALFD is not set
 # CONFIG_EVENTFD is not set
 # CONFIG_AIO is not set
+# CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MMU is not set
 CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
