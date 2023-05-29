Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E9714E2C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 18:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33821C6B454;
	Mon, 29 May 2023 16:23:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9B79C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 16:23:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34TBPIIZ020224; Mon, 29 May 2023 18:22:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SEnLjI1iAJ0BEpP1paBgUZKIcQgTv9KF2fDW8DrAk08=;
 b=wjl3+33EFWOfCJDg/PSwDBVR+ARSFhtCo2KszAdTchx9mjj6ulZ0+Egil7JdNdfyUS4l
 /MbCvlJDY+KUdNcFxYLHGPhxeAopmggqHj8CkOGybXB+A6pQFoSzDcMUDyOlfkXFX9wO
 XbYgJO/hoBIiYxEza/wAsGpup/eDn3cHQMuIxUhq3Bb1kComt8gSnTLFxI/vuPRL1Jm5
 qC5FP4p9HRV8Hx+OTu3crtrlhzbLretp7ToAyifRyvCfFKLcS3b4umNN1XYavZ7pi5Kc
 aHPHPUCwa9GFZFsXgQ1ePZ0D6hjP0WRLjI16CFsfuQUZL6k8mp/BtYrgQ58SDdXUgdsm GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qvsnnhxd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 May 2023 18:22:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF3AA100039;
 Mon, 29 May 2023 18:22:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7DF6235F07;
 Mon, 29 May 2023 18:22:47 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:22:47 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, <soc@kernel.org>
Date: Mon, 29 May 2023 18:20:34 +0200
Message-ID: <20230529162034.20481-12-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/11] MAINTAINERS: add entry for ARM/STM32
	ARCHITECTURE
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

STM32 SoCs based on Armv8 have been added to the STM32 family. Those new
SoCs are maintained as legacy STM32 MPU.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..06759396e220 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2849,6 +2849,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-nex
 F:	arch/arm/boot/dts/stm32*
 F:	arch/arm/mach-stm32/
 F:	drivers/clocksource/armv7m_systick.c
+F:	arch/arm64/boot/dts/st/
 N:	stm32
 N:	stm
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
