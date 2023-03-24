Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 100776C81D3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 16:52:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0194C6A60A;
	Fri, 24 Mar 2023 15:52:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 548E9C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 15:52:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ODPbF0010697; Fri, 24 Mar 2023 16:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Orov2Wj71gacCKJm+kuTZX9w05ghZJAYYdo65KlDR6U=;
 b=dXuunBoeV3rDenyDeLj1d7MqXKatlyVXIhcOvKuJE6w3bgHh6ovABIt1BGOy/WX6pZqK
 5qhzS2RrNWjHeg7FaqIRFVw3NUflyT5DLSnHGw1HnxXCMgxoi0Emdxj1wbtKovjIn6hl
 BVATwUfN5pjXQLhnDV/MptPg5Ng3s8H4vbDzsz1ryYGmW2KF/PGxW2KiIQ69GLqDmDqt
 e16Le86MvX11l3yFV/TBoJkwte5cvNq4avfdcw7Q4hUM7c+x+7kn3ZREe56mHiHgmb7B
 koaSm/kHhinZF7iBgYf+OxwpPdeDxhnC1j6vqvo5GzLS613MPoIRLud69n+W7kTT/JLe nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjcdunb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 16:52:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18BB5100034;
 Fri, 24 Mar 2023 16:52:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F33C6217B88;
 Fri, 24 Mar 2023 16:51:27 +0100 (CET)
Received: from localhost (10.48.0.175) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 16:51:27 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <krzysztof.kozlowski@linaro.org>
Date: Fri, 24 Mar 2023 16:51:03 +0100
Message-ID: <20230324155105.826063-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/2] depends on ARCH_STM32 instead of
	MACH_STM32MP157
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

To be able to compile the driver on all STM32MP SOCs, we move the
"depends on" on ARCH_STM32.

Christophe Kerello (2):
  memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of
    MACH_STM32MP157
  mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of
    MACH_STM32MP157

 drivers/memory/Kconfig       | 2 +-
 drivers/mtd/nand/raw/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
