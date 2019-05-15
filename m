Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D91F521
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 15:12:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62561C54B0C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 13:12:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53427C54B08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 13:12:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4FD2OaG022898; Wed, 15 May 2019 15:12:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8gW4OV6hlwcWKYSJ9ubV4B9vvzQp9RHTFnttoWQRbC8=;
 b=0o/obq/MuqzQjBIOsYvfPNxULfMghhvDdt06quUJu3ztC6CxnOCJlF2NFa58K8+1gJBS
 bL6WaPiy5zoY7SvNiLVewruh4ZRaW1s5mpRt6HhFT/eXmt8lj4WkSxjtubvgxzKWePIu
 YxTDZR2P4FDl0ay0P40lWrDssNI/uuZ0/cQrTDsroBMLoKBSQvg8m6+T8bBH8SCWB+L+
 rtDD9F/3pqnm9tq77g0zGbQ8UiQubwmSNRkiz+hCxikh5aYbv935naydhyT++55XbcSa
 AXNuHUx7/6CtURTHJC72VVbj1pDHiXlK6xZVk1V+OSJMmviR0K7SfgmkZ+VE81Rtu7qN GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv00p8e-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 15 May 2019 15:12:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEAED31;
 Wed, 15 May 2019 13:12:01 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5AF5727F5;
 Wed, 15 May 2019 13:12:01 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:01 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:00
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
 <frowand.list@gmail.com>, <m.felsch@pengutronix.de>, <agx@sigxcpu.org>,
 <arnd@arndb.de>
Date: Wed, 15 May 2019 15:11:49 +0200
Message-ID: <20190515131154.18373-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_07:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/5] Add of_device_link_add() functions
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

It may happen that we need to ensure the order of suspend/resume
calls between two devices without obvious link.
It is for example the case on some boards where both panel and touchscreen
are sharing the same reset line. In this case we need to control which
device is going in resume first to do only one reset.
An other example is make sure that GPU is suspend before composition
hardware block to avoid pending drawing requests.

To not let everybody creating relationship between devices for free
of_device_links_add() has to be called by each driver and not in the core.

version 2:
- only keep of_device_links_add() and use 
  DL_FLAG_PM_RUNTIME and DL_FLAG_AUTOREMOVE_CONSUMER flags to follow Rafael
  advices
- reword function description
- try to use a more explicit property name
- rebase on v5.1

Benjamin Gaignard (5):
  of/device: Add of_device_link_add function
  Input: edt-ft5x06: Document suspend-dependencies property
  input: edt-ft5x06 - Call of_device_links_add() to create links
  Input: goodix: Document suspend-dependencies property
  input: goodix - Call of_device_links_add() to create links

 .../bindings/input/touchscreen/edt-ft5x06.txt      |  2 ++
 .../bindings/input/touchscreen/goodix.txt          |  2 ++
 drivers/input/touchscreen/edt-ft5x06.c             |  2 ++
 drivers/input/touchscreen/goodix.c                 |  3 ++
 drivers/of/device.c                                | 37 ++++++++++++++++++++++
 include/linux/of_device.h                          |  7 ++++
 6 files changed, 53 insertions(+)

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
