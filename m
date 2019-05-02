Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092F11ADB
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 16:09:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 132E9C6C396
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2019 14:09:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D7E9C6C394
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 14:09:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42Dwv1S002402; Thu, 2 May 2019 16:08:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FVkWMnd5QCZrrAZpQ6NJ9/fjWM/X82CadAEL49V6JPA=;
 b=wZBkWjE5k8IvrxC1KUp/YkYcWWIIqHvhFnML8yz3oiWf3SBqTXDTiNcd9Jcbzqdl7009
 HCH1HYj1BtH8/JvK9PnUvWcH8L8/0SXlHAQJ1yM2OE+6mTrTxk2h+m3HJVrCQRUZywJT
 gFEli0QAc0QiwD17pDBLZV03ai98fMj/GC7kzG1wObEusnqNqN1/l/xhawdW49SBZmOc
 UILLM31en0Vm8iMhHQdr4wRhoQEsmNkTT4FHsk2V1Y05Awc+JQbBKwLszqvsTXU/Qam0
 z82vZYyqjB0rbye3La8XPRQR7C9LzUukDUX/5qD+014i9ZtXx34w+QdphgOUUM6cD75x lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcry0q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 16:08:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEDE641;
 Thu,  2 May 2019 14:08:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 787462730;
 Thu,  2 May 2019 14:08:48 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:48 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:47 +0200
From: Ludovic Barre <ludovic.Barre@st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 2 May 2019 16:08:43 +0200
Message-ID: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_08:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 0/3] watchdog: stm32: add dynamic prescaler
	support
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

From: Ludovic Barre <ludovic.barre@st.com>

This patch series updates stm32 watchdog driver on:
-use devm_watchdog_register_device
-Guenter's recommendation about return value:
set_timeout return 0 on succes, -EINVAL for "parameter out of range"
and -EIO for "could not write value to the watchdog".
Set of reload and prescaler registers are stay in start function,
because the stm32 watchdog must be enabled to write these registers.
-adds dynamic prescaler support

Ludovic Barre (3):
  watchdog: stm32: update to devm_watchdog_register_device
  watchdog: stm32: update return values recommended by watchdog kernel
    api
  watchdog: stm32: add dynamic prescaler support

 drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 42 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
