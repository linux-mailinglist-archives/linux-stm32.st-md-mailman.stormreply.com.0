Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9D1B261F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 14:33:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D68C36B0C;
	Tue, 21 Apr 2020 12:33:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E90C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:33:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LCO4w7004143; Tue, 21 Apr 2020 14:33:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jg6lQEENULGmAuBll1sz812Jd5LCwX8WfZpvOP07m4Q=;
 b=ZC3vU05/6gpJisoqUzvDvG77Q9M2KnQbI9MAiWeu/eAvhvTR7w6w20IYkB1nhamAu8Up
 /mK6G+zHEGSP57wZ/ulBMj6XQONpOFCWYP96mompds3ENj1+2AXC1dqLkcaPOuxh7YVe
 H+5MWTY+xCPg8dGjhqZkqAX43xYvha/Y/21qQo5yWpn6v8MLexP/hcVkIdb8xjLQvojN
 J/kpirKdEzMWwd/AdZtzkOtz6bdiclpjGknw4nTvB0DqN9D05spESxf8mpkihOOBoY/Y
 Olk1RS9G2Uq1JLu0rxFNE6EMqSdRB2TDRU8ocYNZjv4OfFI5nAnB4fRh9da4N2sMAEtY yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8rap8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 14:33:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E84810002A;
 Tue, 21 Apr 2020 14:33:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 179772B0FCB;
 Tue, 21 Apr 2020 14:33:10 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 14:33:09 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <hminas@synopsys.com>, <balbi@kernel.org>
Date: Tue, 21 Apr 2020 14:32:17 +0200
Message-ID: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/4] usb: gadget: serial: add supend resume
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

This series handles an issue seen when doing basic testing using ACM or SERIAL
gadget functions like in [1], and using the DWC2 gadget driver. It occurs when
the HOST has suspended the bus before testing, in this order:
- On the device:
  cat /dev/ttyGS<Y>
  Dmesg error log is seen on device side:
  configfs-gadget gadget: acm ttyGS0 can't notify serial state, -11
- On the host:
  echo test > /dev/ttyACM<X>
  The bus resumes, but the serial link isn't functional.

So, implement suspend/resume callbacks in gadget serial drivers to handle this.
There is a precursor patch in DWC2 to enable submitting usb requests from the
gadget resume routine, once in L0 state.

[1] https://www.kernel.org/doc/html/latest/usb/gadget-testing.html#testing-the-acm-function

Fabrice Gasnier (4):
  usb: dwc2: gadget: move gadget resume after the core is in L0 state
  usb: gadget: u_serial: add suspend resume callbacks
  usb: gadget: f_serial: add suspend resume callbacks
  usb: gadget: f_acm: add suspend resume callbacks

 drivers/usb/dwc2/core_intr.c           | 10 ++++--
 drivers/usb/gadget/function/f_acm.c    | 16 ++++++++++
 drivers/usb/gadget/function/f_serial.c | 16 ++++++++++
 drivers/usb/gadget/function/u_serial.c | 57 +++++++++++++++++++++++++++++-----
 drivers/usb/gadget/function/u_serial.h |  2 ++
 5 files changed, 90 insertions(+), 11 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
