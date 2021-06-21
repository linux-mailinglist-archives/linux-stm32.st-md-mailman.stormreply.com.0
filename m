Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93B3AE981
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 14:58:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37860C57B53;
	Mon, 21 Jun 2021 12:58:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56776C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 12:58:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LCvdmc005554; Mon, 21 Jun 2021 14:58:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=xZenHtyJUIK3Jd8YfDY8+5e0esoKzch1be763fqXWKY=;
 b=EltBVEyjIMOpwbEfiFBW0M6nIoNwnIOOlQDSdt6qp0QzWCCLLdC5wqbKe1Ie4/V6zMgK
 yBwIdedLhYJ15J9Yd/y0n6mWPF9/av2eW/MYpYeX3T1EC6sh4mEeBihWfbgx2xusvp+6
 eIINUQdSzL+j1nF+MO+I4zAO+/ULg0m5GQKwxBL39UwdNUEHL7666mv1urFEWwgEwHxo
 ZyH0UZGlasT6+yFwYFeNrbPFzXRx1VhnLse8VKAL7l/ONjORIbj/fQedoSBMM6mY4p0b
 vPMNWgFX4o7u856BO3ePXR0hdKYxg1VYrxUkISEERDmE8D1dAg3TQGvqcRjkbxogooYx ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39amg22dsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 14:58:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1739100034;
 Mon, 21 Jun 2021 14:58:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF0F22B9C4;
 Mon, 21 Jun 2021 14:58:10 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun 2021 14:58:10
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 21 Jun 2021 14:57:59 +0200
Message-ID: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_06:2021-06-21,
 2021-06-21 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/1] rpmsg: ctrl: Add ability to
	instantiate rpmsg device locally
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


Delta vs V1 [1]
- Squah patches 1/4(rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL) and
  2/4 (rpmsg: ctrl: Introduce RPMSG_RELEASE_DEV_IOCTL).
- Remove the rpmsg device attribue to check if a rpmg device can be released, choose to trust
  the application (a similar trust already exists for the bind/unbind interface).

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=494021

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[2]
  - to test the ioctrl, a rpmsgexportdev tool is available here:
     https://github.com/arnopo/rpmsgexport

[2]https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793

Arnaud Pouliquen (1):
  rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls

 drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
 include/uapi/linux/rpmsg.h | 10 ++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
