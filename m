Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4A7313E6
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 11:32:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00CFFC65E58;
	Thu, 15 Jun 2023 09:32:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC55C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 09:32:26 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F8I2Et009956; Thu, 15 Jun 2023 11:32:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=7FTvGFOInZeY6DQoM9GEo1BZzNU9jNs0DHdmg607YF4=;
 b=qME7t9rpEE4303bvZoAbFXYZETQhqt3DN7XsWVgXTkasE71XsacSUGPg+3hJE+ZiTRJk
 9+EuJmCmskQvzB2YNOT1/HicbCmgSIFBBY0XMMMulR/KELxqFmYEF/gz2+rQFjEJpp/y
 vBao6xoe/OCnSqe7ifadgLH9bHBA34HIqnEaHQpoG7NNROTAWc/Afm18Qj/fY5mwif7k
 xF+NsB98MBYb51e9kGYv6cibAsPl7ROZ5oohAGh1WFSIzC6HqUN+TJlrkgRMMcZzJexD
 cVRnqaOlpPYoGDT5tTNyO/GqFxoETVrtJOWsnP0sGSniHncvPC1xkhcimh3YCXbIXMC/ Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7s1maxqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 11:32:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8D0110002A;
 Thu, 15 Jun 2023 11:32:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B712521A91B;
 Thu, 15 Jun 2023 11:32:20 +0200 (CEST)
Received: from localhost (10.252.8.64) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 11:32:20 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Thu, 15 Jun 2023 11:27:46 +0200
Message-ID: <20230615092753.323844-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.8.64]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
Cc: linux-rtc@vger.kernel.org,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] rtc: stm32: multiple bug fixes and
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

Antonio Borneo (2):
  rtc: stm32: use the proper register sequence to read date/time
  rtc: stm32: don't stop time counter if not needed

Christophe Guibout (1):
  rtc: stm32: improve rtc precision

Gabriel Fernandez (1):
  rtc: stm32: change PM callbacks to "_noirq()"

Valentin Caron (3):
  rtc: stm32: don't print an error on probe deferral
  rtc: stm32: fix unnecessary parentheses
  rtc: stm32: fix issues of stm32_rtc_valid_alrm function

 drivers/rtc/rtc-stm32.c | 138 +++++++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 53 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
