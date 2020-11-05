Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8B2A7AFB
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 10:48:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF3EC3FAD4;
	Thu,  5 Nov 2020 09:48:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE57EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 09:48:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A59lJK2028659; Thu, 5 Nov 2020 10:48:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Mjl4STNOOLMuMfiM6VyfN1wo5XxL+uNG4rl8O9UFK6w=;
 b=rk7lCapr4f6cTEOJOOYbIXOJbuDsfgcQU8tNdPH98cWl2LlU+3FvTE7IgML9k/MBQ+D+
 fgW+0B1xvE2sfoGoH5pNmAAefdFqkzWYVsku15RmszBnKTXF2wvwdi0ll5D8tje5Rs3+
 XzTHBpuVSF9grpPKcXPIj6Dxtxt3Gfahfzf4xIV/ZC2mX5SNAoN0wtrpYbbGz0kzkH42
 Myqff814ZNK5YXd6slXsgVhNE/apZKlv8Yt1rTYDljjNQwYZfXB5jtnW5PCH81PVHj51
 eXlJmxj/K5VdORmY+keZ6Osa+KMrATQ7w9sPhng90Fax2ePgYKhxvdyJ87CoijQ33tu/ 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h031yray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 10:48:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F607100034;
 Thu,  5 Nov 2020 10:48:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A1F52365FE;
 Thu,  5 Nov 2020 10:48:13 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov 2020 10:47:31
 +0100
From: Lionel Debieve <lionel.debieve@st.com>
To: Russell King <linux@armlinux.org.uk>, Alexandre Torgue
 <alexandre.torgue@st.com>
Date: Thu, 5 Nov 2020 10:47:30 +0100
Message-ID: <20201105094730.8320-1-lionel.debieve@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_05:2020-11-05,
 2020-11-05 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] ARM: multi_v7_defconfig: add STM32 crypto
	support
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

Enable crypto controllers enabling following flags as module:
CONFIG_CRYPTO_DEV_STM32_CRC
CONFIG_CRYPTO_DEV_STM32_HASH
CONFIG_CRYPTO_DEV_STM32_CRYP

Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index a611b0c1e540..57eafa2d7775 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1133,6 +1133,9 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
+CONFIG_CRYPTO_DEV_STM32_CRC=m
+CONFIG_CRYPTO_DEV_STM32_HASH=m
+CONFIG_CRYPTO_DEV_STM32_CRYP=m
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
