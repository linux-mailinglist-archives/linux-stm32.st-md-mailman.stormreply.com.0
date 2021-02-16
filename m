Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2A631C6F7
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Feb 2021 08:49:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F6FBC57B63;
	Tue, 16 Feb 2021 07:49:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473FAC5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 07:49:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11G7lqVF020502; Tue, 16 Feb 2021 08:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=wzSj/5knRM9anl9sAZxKpG9mFEEMIEUZ596ktPuU9Uw=;
 b=s4uFnnyQ0TSSU/VBdAuZzsO3vIGNDUhTp0Qo8zvfgc5ICVDLGH3NizfFwnStv8+JfeQh
 J37BeYODkyDSbuG0HqTMzh+HFvzunyJiW9Oiu3LFmZA6m3y6wz7f1CRuZqzKPXkE3LJP
 ilOIyt8E5+JfADYPyE+VNIWDli/UODHLpzAjbUg5hXY2V2qyUEkXpBkc8t8vdGQSi9E0
 j4JCZ58DUwtCYIzYsct4/JNOzvQoTsk0G6o7xDCHMy4fevEADPg00a1v2irrPXU31Kne
 Cvyr+ODT86SZO6LvLflkL1Ck7/VbRME/BA4CH8+XFSGEbFBB+s3U6S0p0UGdvRMqQt8w Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547ekwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 08:49:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11FE910002A;
 Tue, 16 Feb 2021 08:49:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0173121CA8A;
 Tue, 16 Feb 2021 08:49:39 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:39
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
Date: Tue, 16 Feb 2021 08:49:26 +0100
Message-ID: <20210216074929.29033-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_16:2021-02-12,
 2021-02-15 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
	STMicroelectronics email
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

This series:
  _ Update st.com to foss.st.com email for some maintainers.
  _ Remove Vincent Abriou as STI/STM DRM driver
  _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer

Patrice Chotard (3):
  MAINTAINERS: Update some st.com email addresses to foss.st.com
  MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
  MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer

 MAINTAINERS | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
