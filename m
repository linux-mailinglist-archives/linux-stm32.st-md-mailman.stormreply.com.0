Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 937D25B690
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 10:15:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B48D2686F
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 08:15:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5D0FD2686A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 08:15:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x618AURR004719; Mon, 1 Jul 2019 10:15:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4HCnvTeET6w7JHg2LO1bt6ZsiU0ocB/xdZVHYiG9rFI=;
 b=GHW6645O6fXZFwxeACFbUizFjN2xzSQ/fT1WP22K35T2QBWXIxRswFIbY/Gicog7yd9+
 MipX/Kz8DePJL5H40MejpIksdnXf1VxftXIgbNpJNwuuujLjuv/R2cPnSAIFvLD5XXDt
 PgRsTg4V6FOUkilsbNhyObODsNAk/zWROs4Iw4+gmmwLx7naRBdxmQy+t4MMZPaZkn+Y
 8yYPEDrj8k9245W4SCXEsw0SQY7cNSRX24iQjYiJrSlv8+Kp7ZgXoTv+6O5aXzmdUBzb
 1Dnt80cUK6MysfLVm0UJ2eGMJIlkAS4A67jx931w5OY9X+ZDYUZ3QHQUHQ5pmgmfNYhD Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvhkefh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:15:02 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBAC134;
 Mon,  1 Jul 2019 08:14:35 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B47AA191D;
 Mon,  1 Jul 2019 08:14:35 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 1 Jul 2019 10:14:35 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <alexandre.torgue@st.com>
Date: Mon, 1 Jul 2019 10:14:24 +0200
Message-ID: <1561968865-22037-4-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
References: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_05:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] ARM: multi_v7_defconfig: enable STM32
	booster regulator
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

This enables the driver for STM32 booster regulator found on stm32mp1.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6b748f2..230e7e0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -568,6 +568,7 @@ CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_RN5T618=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
+CONFIG_REGULATOR_STM32_BOOSTER=m
 CONFIG_REGULATOR_STM32_VREFBUF=m
 CONFIG_REGULATOR_STPMIC1=y
 CONFIG_REGULATOR_TI_ABB=y
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
