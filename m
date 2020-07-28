Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16292230319
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 08:38:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E0DFC36B27;
	Tue, 28 Jul 2020 06:38:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3BD7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 06:38:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S6SICR018009; Tue, 28 Jul 2020 08:38:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qmwJq+3D0GJBCPkFrePoSga3huVJSD32b8tD9JrjayE=;
 b=uUHsgiAxcAanxVtP5Odl9kdz1oPfAkJWPq2wW1/g/KbENSD2L1SHsBTMmRvUWlzX913R
 t+cY/ypnzs9W1YsQYWOd1KDX/dvTc3B+pdtGhkU+xwmpW+CZrSx6MMbymGbXXtjQbhA+
 rfJuLslFm2PqncFsHlB/pZxvZ4sdjIIjZcV/2jKYGWkZFi4fXtnoEwFCS1UNVPoZRKAL
 t5TikiJbCLp9XzjwDyfE+hDU7xFKGGHB51RxUK6ETf3SNAqLOJa6d7YVNcvySsjjLt8w
 x07wbRpVDV+LvHKggX+JFUGSjzXC1kNTiGuWCPHZ5IrjNl+jZDVe1HOFpDudacnyWGin ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71vqg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 08:38:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C51E610002A;
 Tue, 28 Jul 2020 08:38:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4FFB210F96;
 Tue, 28 Jul 2020 08:38:32 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jul 2020 08:38:32
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <hugues.fruchet@st.com>, <mchehab@kernel.org>
Date: Tue, 28 Jul 2020 08:37:56 +0200
Message-ID: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: linux-kernel@vger.kernel.org, yannick.fertre@st.com, alain.volmat@st.com,
 hans.verkuil@cisco.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] Error handling fixes in stm32-dcmi driver
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

This serie implements fixes in error path of the stm32-dcmi driver.
As part of it, it also fixes the way video device is handled in
order to ensure that it is only created when the attached sensor
is well initialized. (current implementation leads to having a
video device always created and but never deleted upon removal of
the module if sensor initialization is failing)

Alain Volmat (2):
  media: stm32-dcmi: create video dev within notifier bound
  media: stm32-dcmi: fix probe error path & module remove

 drivers/media/platform/stm32/stm32-dcmi.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
