Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E99F81E4
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 18:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 872B6C78027;
	Thu, 19 Dec 2024 17:32:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 762FBC78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 17:32:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJFYDm7028720;
 Thu, 19 Dec 2024 18:32:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=9grDHNlPqw1x/CKbQq0D6Q
 lOnJq+PsfKbzn8Mv8RRsE=; b=aapFnS/aIeAZgDgpUzKtvkbzsAkFpxYnrUWJom
 bcxKl0qtlg5B4+VeABJLbnqj8Ti3DAh74KHS8jXeWWTLXW04BT62XC9AgCG1d6cW
 GCWAFKxVREu7eOfxqnZe7EVu4lGUXOIW7qmlgVMbQcHLoPoeq96JGYq9+V9Ka2eT
 haBYbjIVkUlV30/SzRPAP12NjetPYhhUATg+7Ku8KRi6C8M5NZ6qNfAAMh6BY7iL
 UwjSvEvAA5XzN7NduRAI7SdYh2dNVGUY6M34xQpv/yMa3TxQEcmIn/5tvIucWbwc
 XNtq2nmU72sz+dIl2CGOLJAC+8leX520kRC+XMfnvdrxR3Sg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43mp8b8dmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2024 18:32:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5213440053;
 Thu, 19 Dec 2024 18:31:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5938E285168;
 Thu, 19 Dec 2024 18:29:57 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 18:29:57 +0100
From: <patrice.chotard@foss.st.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 19 Dec 2024 18:29:27 +0100
Message-ID: <20241219172934.3010875-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/7] ARM: config: stm32: Disable useless flags
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

*** BLURB HERE ***

Patrice Chotard (7):
  ARM: configs: stm32: run savedefconfig for STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_COMMON_CLK_STM32MP in STM32
    defconfig
  ARM: configs: stm32: Disable CONFIG_SUSPEND in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_ADVISE_SYSCALLS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_IO_URING in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_POSIX_TIMERS in STM32 defconfig
  ARM: configs: stm32: Disable CONFIG_GCC_PLUGINS in STM32 defconfig

 arch/arm/configs/stm32_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
