Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4276E36DC
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2019 17:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64B7CC36B0E;
	Thu, 24 Oct 2019 15:41:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68F55C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 15:41:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9OFeiOd016236; Thu, 24 Oct 2019 17:41:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5GqthLgqhaAzShH8zaBmjjPSD+4duGM3kB0LVJm2wdM=;
 b=rfrmgTXYSKrNqGmBMBo2Ndrn3pWz45+X8NieyZZEei24nzJU0TzAtOoaf2jQx9RhxS9K
 ITc0oW8vh+l1O/Rp9etoBmcL+SehcgsDWRvLONBVDlsj0Wmyv97SDctWu/Nfpeoar7CZ
 HF2OnMe4AHe7bTb1XdKUhmZhM4FTN7VOK425id0LYPqIBZbPDdR2R22igdbx78PwTyMB
 KkDunPSmGe2ecVaVjXij6q16Kz3vLeTzNSJy7nC4T3svZO5nQgLc1ADksGzmMvDtoVK5
 PqU0vgEQWk/kWE75wIkVYkwbVXBinzK/Ug+GnjJwx5jPAdNRXcDgV8WKUNuIpbaMj1m8 zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1tp5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 17:41:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC59110002A;
 Thu, 24 Oct 2019 17:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B16C92C6E5F;
 Thu, 24 Oct 2019 17:41:25 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Thu, 24 Oct 2019 17:41:24 +0200
From: Pascal Paillet <p.paillet@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 24 Oct 2019 17:41:21 +0200
Message-ID: <20191024154121.8503-2-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024154121.8503-1-p.paillet@st.com>
References: <20191024154121.8503-1-p.paillet@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: p.paillet@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] regulator: stm32_pwr: Enable driver for
	stm32mp157
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

Enable stm32 pwr regulators for stm32mp157 machine.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 drivers/regulator/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 3ee63531f6d5..ed10f4f46fdf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -875,6 +875,7 @@ config REGULATOR_STM32_VREFBUF
 config REGULATOR_STM32_PWR
 	bool "STMicroelectronics STM32 PWR"
 	depends on ARCH_STM32 || COMPILE_TEST
+	default MACH_STM32MP157
 	help
 	  This driver supports internal regulators (1V1, 1V8, 3V3) in the
 	  STMicroelectronics STM32 chips.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
