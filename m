Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C085F383AF3
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 19:15:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75193C5978F;
	Mon, 17 May 2021 17:15:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 249EDC58D7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 17:15:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HHFrua027859; Mon, 17 May 2021 19:15:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=3YrjTadT9YWcH6wHOszJ5jLmN9ANFDbrODygbqL4WIg=;
 b=8SNQh+6e3f4sn2BSwQrlNKujkEIfxUjs0EY8f4dEU4IV6DM1fl6UFo/i2H4V12mEeAIR
 qzrJcipdThuq/pP1jQ8AzxHR8ad3bbR8hQZrZc5DvFajILrMmp/L62s2C1lPvVNk+G6B
 R6nSZHCEZAlGaHcxdbVWzg9ZKo/uklxEgqemSBhvo00lZ7iLIBpag2hbZXNWR95nXtES
 pVuwCGzWclx3fCKMBxq2tk51tvLBbuqMpFllVj0f12NRI6u9koNTKXAjj8uNR5CzhJw2
 lP5PUDA5COR7ZCDbwYQfQ3KpdONxBlNHg6+TwXX/2V/TmVMoSaQntJjT3rtCjRa28eCw 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38k5dq63xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 19:15:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B7DB10002A;
 Mon, 17 May 2021 19:15:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CC402237C3;
 Mon, 17 May 2021 19:15:42 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May 2021 19:15:42
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 17 May 2021 19:15:27 +0200
Message-ID: <20210517171531.21205-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_08:2021-05-17,
 2021-05-17 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 0/4] Restructure the rpmsg char to
	decorrelate the control part.
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

Main update from V3 [1]
 - suppress patches related to the creation of a rpmsg device for the rpmsg_chdev. this will
   be sent in a sperated patchset.
 - add patch to clean-up useless include of rpmsg_internal.h file[3].

This series can be applied on git/andersson/remoteproc.git 
for-next branch (dc0e14fa833b).

Series description:
This series is the second step in the division of the series [2]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to split the code related to the control
and the endpoint. The code related to the control part is moved in the rpmsg_ctrl.c.
This split is an intermediate step to extend the controls to allow user applications to
instantiate rpmsg devices.
    
Notice that this patchset does not modify the behavior for using the RPMSG_CREATE_EPT_IOCTL
and RPMSG_DESTROY_EPT_IOCTL controls.
  
The next step should be to add the capability to:
- instantiate rpmsg_chrdev from the remote side (NS announcement),
- instantiate rpmsg_chrdev from local user application by introducing the
  IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate the rpmsg devices,
- send a NS announcement to the remote side on rpmsg_chrdev local instantiation.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
[3]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210429080639.6379-1-arnaud.pouliquen@foss.st.com/

Arnaud Pouliquen (4):
  rpmsg: char: Remove useless include
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 184 ++-----------------------
 drivers/rpmsg/rpmsg_char.h        |  51 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 215 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 293 insertions(+), 181 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
