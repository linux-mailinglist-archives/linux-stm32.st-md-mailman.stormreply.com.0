Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE4748ADC
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 19:45:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D678C6B45C;
	Wed,  5 Jul 2023 17:45:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CF6CC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 17:45:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365FkKtL003266; Wed, 5 Jul 2023 19:45:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YzoRM1g1BfI9MnBB08CDwkG8AHGMKRSS788lXSXjecw=;
 b=aE2s2rAMYrl2V9Rp3K7wCgO4SG96Rny7oOj+3OvTZ/ZdHr++RMdIENMaL2l9/vR2d3de
 GhMejtuDl/MvdO7OHF/6afweuJl5ow4d6oZ9UFlA1Mutl+jjzqkilpvknILxWlbH5kVH
 4ytJsEclMIj9GZulOMI+RPPVnOy/MxEDXR1tcRRweorivYl1OAh+hdRqA/i3vheviy0Z
 BGkMPSGTrab/tw4KRZrxkWhx3SKgBTCFuevq8mHV0nwG81FOTHmmkGhxyMqzKa1EWvjD
 J7eFpnGmCAL5RN38Rparrkq95J+mHX8eNbAQGF0MUrhEbWqTeXpbFUGYCm7h4wumrd2x BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn8c9t535-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:45:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECB3B100057;
 Wed,  5 Jul 2023 19:45:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5BD2252252;
 Wed,  5 Jul 2023 19:45:05 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:45:05 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo
 <a.zummo@towertech.it>
Date: Wed, 5 Jul 2023 19:43:55 +0200
Message-ID: <20230705174357.353616-6-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705174357.353616-1-valentin.caron@foss.st.com>
References: <20230705174357.353616-1-valentin.caron@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 5/7] rtc: stm32: change PM callbacks to
	"_noirq()"
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

The RTC driver stops the RTCAPB clock during suspend, but the
irq handler from RTC is called before starting clock. Then we are
blocked while accessing RTC registers.

We changes PM callbacks to '_no_irq()' to disable irq during
resume callback and so irq handler will be called after the enable
of RTCAPB clock.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 5ebf0b8e75f9..17e549806784 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -919,8 +919,9 @@ static int stm32_rtc_resume(struct device *dev)
 }
 #endif
 
-static SIMPLE_DEV_PM_OPS(stm32_rtc_pm_ops,
-			 stm32_rtc_suspend, stm32_rtc_resume);
+static const struct dev_pm_ops stm32_rtc_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
+};
 
 static struct platform_driver stm32_rtc_driver = {
 	.probe		= stm32_rtc_probe,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
