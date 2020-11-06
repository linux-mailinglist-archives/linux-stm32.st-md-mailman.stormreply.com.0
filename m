Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECE2A97B0
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 15:32:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 385A7C3FAD5;
	Fri,  6 Nov 2020 14:32:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B44EC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 14:32:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6EWDku022669; Fri, 6 Nov 2020 15:32:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=TqUJuC3My8Iz9+K0q9sV4IpHuACP0Xg9U709fHwKzSI=;
 b=OY+Lsz1AS7s4dhnwlpkEjjLuTq8ydXIjIn//vhe3UoUwSJXfZeeJTC5S2Vlojd1oBPz1
 gqbp8CD5Sz6ND68jsN4uAcbOpudlrjC5tcWkcv9+uQTDs14AAa15Flb8DMHPbZEjFMzI
 IlgLEPMjpEONmM+0SDuJ4LdGKd5Pfib+0C68SpvHPbjzc8Vhlbyko/TjrITfpkwRRKd3
 fkOyIXR8gmWZ+t4lBT7878Jw00whMajQBunv6t6qGmktRnU6WbPGJ9D4MG6GOH5sPNbu
 8WB9xCcoR9EnKXYzIhixweLUcV14clLSA0MvMeWKE8+UJeDD0vGYSvOIuOy6e+ryxWFn Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00evvkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 15:32:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B899F1000BC;
 Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A161D2AD2B9;
 Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 15:23:32
 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Fri, 6 Nov 2020 15:23:26 +0100
Message-ID: <20201106142327.3129-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 0/1] watchdog: stm32_iwdg: don't print an
	error on probe deferral
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

Do not print an error trace when deferring probe for clock resources.

Version 2: Remark from Guenter and Ahmad
		use dev_err_probe instead 

Etienne Carriere (1):
  watchdog: stm32_iwdg: don't print an error on probe deferral

 drivers/watchdog/stm32_iwdg.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
