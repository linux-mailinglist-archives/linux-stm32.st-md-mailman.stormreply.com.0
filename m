Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448031DA6B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Feb 2021 14:30:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2516C5718D;
	Wed, 17 Feb 2021 13:30:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64099C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Feb 2021 13:30:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11HDSWZ2001051; Wed, 17 Feb 2021 14:30:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=bs5hl1wFsAOJu6X9Hycte2PvBsx11N4FQTR9gCM28rE=;
 b=Rq+WeZxfJKEzCW5WAxI7Pq9xij5zduCIl8/NEiPqAI4XeupiO0sBxkFlWfosF+yWkM6m
 /wHvgEanq68ssinIUGXqFCKNai3WKh6YVlAUZZkSgm7OEeqQI3sjWM2zDYLAxWcq1Byp
 676gwijN38/TCnmIitNy/v13uCqYpA711go8NMJVL0anWDYfEWHg36MR9dBn6c8WIZX9
 6FewH84Z9pyBK87CZVwNwnpwfQnKnsQkaHTUhFSl0vHgCNJezNil0+06ABR4MN62Wyzj
 /dFeHqsRa2hCAiFFBuBePQK1MY3PwZ02Rqt1r5ir2rOR+fq2FcdQ94f4pM1g0gkss66N Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p4sffbv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Feb 2021 14:30:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A08F10002A;
 Wed, 17 Feb 2021 14:30:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16BAD2370C9;
 Wed, 17 Feb 2021 14:30:47 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:46
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Wed, 17 Feb 2021 14:28:49 +0100
Message-ID: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_11:2021-02-16,
 2021-02-17 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 00/16] introduce a generic IOCTL interface
	for RPMsg channels management
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

This series restructures the RPMsg char driver to decorrelate the control part and to
create a generic RPMsg ioctl interface compatible with other RPMsg services.

The V4 fixes compilation issue reported by the kernel test robot <lkp@intel.com>

The V3 is based on the guideline proposed by Mathieu Poirier to keep as much as possible
the legacy implementation of the rpmsg_char used by the GLINK and SMD platforms.

Objectives of the series:
- Allow to create a service from Linux user application:
  - with a specific name
  - with or without name service announcement.
- Allow to probe the same service by receiving either a NS announcement from the remote firmware
  or a Linux user application request.
- Use these services independently of the RPMsg transport implementation (e.g be able to use
  RPMSg char with the RPMsg virtio bus).

Steps in the series:
  - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 5)
  - Enable the use of the chardev with the virtio backend (patches 6 to 10)
  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices (patch 11)
    The application can then create or release a channel by specifying:
       - the name service of the device to instantiate.   
       - the source address.
       - the destination address.
  - Instantiate the /dev/rpmsg interface on remote NS announcement (patches 12 to 15)

In this revision, I do not divide the series into several parts in order to show a complete
picture of the proposed evolution. To simplify the review, as a next step, I can send it in
several steps listed above.

Known current Limitations:
- Tested only with virtio RPMsg bus. The glink and smd drivers adaptations have not been tested
  (not able to test it).
- For the virtio backend: No NS announcement is sent to the remote processor if the source
  address is set to RPMSG_ADDR_ANY.
- For the virtio backend: the existing RPMSG_CREATE_EPT_IOCTL is working but the endpoints are
  not attached to an exiting channel.
- to limit patches the pending RPMSG_DESTROY_DEV_IOCTL has not ben implemented. This will be
  proposed in a second step.

This series can be applied on git/andersson/remoteproc.git for-next branch (d9ff3a5789cb).

This series can be tested using rpmsgexport, rpmsgcreatedev and ping tools available here:
https://github.com/arnopo/rpmsgexport.git

Reference to the V3 discussion thread: https://lkml.org/lkml/2021/2/4/194

Arnaud Pouliquen (16):
  rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
  rpmsg: move RPMSG_ADDR_ANY in user API
  rpmsg: add short description of the IOCTL defined in UAPI.
  rpmsg: char: export eptdev create an destroy functions
  rpmsg: char: dissociate the control device from the rpmsg class
  rpmsg: move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: update rpmsg_chrdev_register_device function
  rpmsg: glink: add sendto and trysendto ops
  rpmsg: smd: add sendto and trysendto ops
  rpmsg: char: use sendto to specify the message destination address
  rpmsg: virtio: register the rpmsg_ctrl device
  rpmsg: ctrl: introduce RPMSG_CREATE_DEV_IOCTL
  rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: introduce a RPMsg driver for the RPMsg char device
  rpmsg: char: no dynamic endpoint management for the default one
  rpmsg: char: return an error if device already open

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |  18 ++-
 drivers/rpmsg/qcom_smd.c          |  18 ++-
 drivers/rpmsg/rpmsg_char.c        | 237 +++++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  51 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 229 +++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  10 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |  37 ++++-
 include/linux/rpmsg.h             |   3 +-
 include/uapi/linux/rpmsg.h        |  18 ++-
 11 files changed, 469 insertions(+), 162 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
