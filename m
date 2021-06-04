Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6D39B5A6
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jun 2021 11:14:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52EF3C57B75;
	Fri,  4 Jun 2021 09:14:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70628C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 09:14:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15496stS028635; Fri, 4 Jun 2021 11:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EohvLLi/iGWwChJWs40a6J2SceXgPMqxbBWZsq2O7Hc=;
 b=GS1IIk8GSTX7QIDj+6dqIk/oizRBSph9varKDyYKW4+MyM7CJc2a42WRiSTj0IpIhdUW
 ZHY7pijSePDe5Nkou/h2BevQMmLH9fSguUVbJ5znlo1uBaCtQRqL6dz5LkiO2rN+1WaB
 sWUEKx6Ij6ydPe6ZbMNIwi/gyzUgOHPPBvgjcUdo+0N895fmVGq3OYuqQNJNDMwb791A
 2SErsnwyYI2oK4ST8kU24maN+IavY/VKKb4nmN0hHVzqTXiGEEyB8rLC0Ywmb1RnNhmy
 UpJFcmeHBwahqc6tL27XGSnS0WA3LwUl6nfTOmmq/zyl34N68u+rbhM+j76MFcE2PrIw eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yg960gr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 11:14:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D07B610002A;
 Fri,  4 Jun 2021 11:14:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0793216EEF;
 Fri,  4 Jun 2021 11:14:16 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 11:14:16
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 4 Jun 2021 11:14:02 +0200
Message-ID: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_05:2021-06-04,
 2021-06-04 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/4] rpmsg: ctrl: Add ability to instantiate
	rpmsg device locally
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

Purpose:
  Allow the user space application to create and release an rpmsg device by adding
  rpmsg ioctrl to the /dev/rpmsg_ctrl interface
    
Aim:
  The current implementation is based on the enumeration of services by the 
  remote processor to create a new channel and instantiate associated rpmsg device.
  There is no solution to create a rpmsg channel on user application request.
  If the rpmsg char driver allows adding a new endpoint over an existing channel, it
  does not offer the ability to create a new one.
  Adding the IOCTRL to instantiate rpmsg channels from the user application will allow
  to dynamically create and destroy rpmsg devices. Some examples of use are:
  - activate the service at the initiative of the application,
  - remove the communication on a specific channel before entering the suspend mode,
  - creating a temporary channel for debugging purposes.

Concerns:
  This implementation is very simple but allows the user application to create rpmsg devices
  without any limitations.
  - A device can be created even if there is no match with the driver (and it is difficult to
    check a match with module drivers).
  - It is not really possible to add a counter to limit the number of devices, because a device
    can be released by the remote side.
  
  The question is: should we add protection? Notice that there is no protection for RPMSG_CREATE_EPT_IOCTL.

  If this is not considered safe, another approach could be to create an rpmsg_ctrl API to add controls.
  This API would be used by a rpmsg driver to add is own user controls, such as creating/deleting devices.

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[1]
  - to test the ioctrl, a rpmsgexportdev tool is available here: https://github.com/arnopo/rpmsgexport

[1]https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793

Arnaud Pouliquen (4):
  rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL
  rpmsg: ctrl: Introduce RPMSG_RELEASE_DEV_IOCTL
  rpmsg: ctrl: Add check on rpmsg device removability from user space
  rpmsg: Add a removable attribute to the rpmsg device

 drivers/rpmsg/rpmsg_core.c |  2 ++
 drivers/rpmsg/rpmsg_ctrl.c | 52 +++++++++++++++++++++++++++++++++++---
 include/linux/rpmsg.h      |  2 ++
 include/uapi/linux/rpmsg.h | 10 ++++++++
 4 files changed, 62 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
