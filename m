Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A20E52126AA
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jul 2020 16:47:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45E99C36B27;
	Thu,  2 Jul 2020 14:47:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0117C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 14:47:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062EhC3O028153; Thu, 2 Jul 2020 16:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WcS8twTIG5eRGz7Og3l5v3D19BLaLWfcJ+xCR6Mo4yE=;
 b=O7pej85UNCDZlwiv5nXnUmn4lKrz1yFPgwZlzPPtmOskPPw8jIaPcPt8IEz1wfw9agxH
 nnLYhQfTEjMGFaAtYY5Cs0BlBcRrgSN2MkSVGV3GqRgZRWUyDlmESP+l5YhZpnz+b2Rj
 HiKqCIv5JY6wY3WDuWtsTQRgfpJirGvfYXEbCGtF3eews9lZRa2mWzgpLuJ0YdmPVFTt
 hG5HymVbP5HCVpfMtGttl19tswvv6QRm92U3+QW9cOGKOLJeXQMitHo2JjZj51XNR9ZN
 bZWNWtI7vmf6e2smitlMgYkdtbDainju/iJN+cJ0to6CaaosnwREYrjEwzziGwRSV1XS 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwgs7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 16:47:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9703100038;
 Thu,  2 Jul 2020 16:47:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 324C72BC7BE;
 Thu,  2 Jul 2020 16:47:39 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul 2020 16:47:38
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Thu, 2 Jul 2020 16:47:03 +0200
Message-ID: <1593701225-13451-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] i2c: stm32: add host-notify support via
	i2c slave
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

This serie replaces the previous 'stm32-f7: Addition of SMBus Alert /
Host-notify features' serie to only focus on the SMBus Host-Notify feature.
It should be applied with "[PATCH] i2c: add binding to mark a bus as SMBus"
from Wolfram which defines the newly introduced "smbus" binding.

Alain Volmat (2):
  i2c: smbus: add core function handling SMBus host-notify
  i2c: stm32f7: Add SMBus Host-Notify protocol support

 drivers/i2c/busses/Kconfig       |   1 +
 drivers/i2c/busses/i2c-stm32f7.c | 110 +++++++++++++++++++++++++++++++------
 drivers/i2c/i2c-core-smbus.c     | 114 +++++++++++++++++++++++++++++++++++++++
 include/linux/i2c-smbus.h        |  12 +++++
 4 files changed, 222 insertions(+), 15 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
