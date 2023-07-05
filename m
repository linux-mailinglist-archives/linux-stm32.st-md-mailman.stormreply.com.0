Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F0748ACD
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 19:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92E46C6B45C;
	Wed,  5 Jul 2023 17:44:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89810C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 17:44:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365F3qX0010377; Wed, 5 Jul 2023 19:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=YUgd+kLtuoT6+D/S4yEnkLsPb3DToCAxmS/mQp6zeO4=;
 b=MjoeysbdbysRFmNCxDSaMrC6hSVYitjPEn+kF9lp9LLlRKt97BaJ+/AWH2rM7weXYp5d
 lopm3QCUUl7U4/wwU3hTTYEDoZrkgyNhVcynqsff/ahfZc6E21RuPxTDjX1NtI2/XM7+
 Ygt7LbIbe40QzwJAKqRZJFRkJIJeQ5Q1aA63mopnAl1eEN1KAG/FOqBEr035v9jtUM4P
 n+cVACaL8Iq29TUgr/KpiNzCMP56G7hNKtNCEuMQZri+3Qtb4WrimCUK+09X3aOEQmm/
 GSC/8Pg17UQGzs8XC70VAPLV/Q4exR4DPW63otLEbJCaP21MBnXpI597SOplhRQnS3W2 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn7wp2bsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:44:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8FDE10005E;
 Wed,  5 Jul 2023 19:44:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0558252250;
 Wed,  5 Jul 2023 19:44:02 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:44:02 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo
 <a.zummo@towertech.it>
Date: Wed, 5 Jul 2023 19:43:50 +0200
Message-ID: <20230705174357.353616-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
Cc: linux-rtc@vger.kernel.org,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/7] rtc: stm32: multiple bug fixes and
	improvements
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

This series implements some bug fixes for theses issues:
- typo issues
- register read sequence issue
- irq during pm callbacks issue

This series implements also some improvements:
- don't switch to INIT mode uselessly
- improve error printing during probe
- improve rtc precision on stm32mp1

Since v1:
- Exchange "fix issues of stm32_rtc_valid_alrm" and
  "fix unnecessary parentheses" patches to optimize this series.

Antonio Borneo (2):
  rtc: stm32: use the proper register sequence to read date/time
  rtc: stm32: don't stop time counter if not needed

Christophe Guibout (1):
  rtc: stm32: improve rtc precision

Gabriel Fernandez (1):
  rtc: stm32: change PM callbacks to "_noirq()"

Valentin Caron (3):
  rtc: stm32: don't print an error on probe deferral
  rtc: stm32: fix issues of stm32_rtc_valid_alrm function
  rtc: stm32: fix unnecessary parentheses

 drivers/rtc/rtc-stm32.c | 138 +++++++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 53 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
