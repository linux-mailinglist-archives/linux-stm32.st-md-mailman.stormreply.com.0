Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 519856DF24D
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 12:56:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 030EAC6907A;
	Wed, 12 Apr 2023 10:56:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AF21C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 10:56:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33C8bJZs002789; Wed, 12 Apr 2023 12:55:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=fn5gTDlxJJOoidDGzjzz0yoRj+FjfSsHO8ABQBnX10g=;
 b=kdtzc6y3PvcJBlr8+RzYMR4b69aOlpFXeC1UDAYzx55jdsJJCKqgeKxDS1aCusgfiIeJ
 yxvdQQ8f6ldNPyAPP/sNb/od50K9yQmHaRWX8ZpPr1ikT24TeCyq+zyquELp2h3CoZh5
 vWeZOQZ8Fg9WuDf8Nf0CR1g70+gPBQXzt0cWHFxavuozdk4aSuT1D2dbPCl/E6ESaj6D
 XHZqt9XP9gVA+Sv99ioopKYXNdqbXc4R3cilHSHOyvhGWixfRupbQIJBtLBlU0Uk+ih3
 HOLLJ4m2joDU7EI8cn8x5cfBzM/8PsRMVsc0/cFjUAwGQdrf+sWkUDXP8xZZEM0F3xR8 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pws9u15ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 12:55:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E09010002A;
 Wed, 12 Apr 2023 12:55:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 976472128D0;
 Wed, 12 Apr 2023 12:55:56 +0200 (CEST)
Received: from localhost (10.252.10.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Apr
 2023 12:55:56 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Apr 2023 12:55:40 +0200
Message-ID: <20230412105542.1231131-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.10.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_03,2023-04-12_01,2023-02-09_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH 0/2] STMFX chip init couple of fixes
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

This series fixes the behavior of stm32_chip_init function in case
of errors.

Amelie Delaunay (2):
  mfd: stmfx: Fix error path in stmfx_chip_init
  mfd: stmfx: Nullify stmfx->vdd in case of error

 drivers/mfd/stmfx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
