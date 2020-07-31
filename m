Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B18234550
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 14:11:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E85DDC36B35;
	Fri, 31 Jul 2020 12:11:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9956C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 12:11:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VC84VN026410; Fri, 31 Jul 2020 14:11:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BIDMQCn2Xt/p6Gejfis8MlD0wl710CqmLRL6yrznlSo=;
 b=NjZrhuVARUXQ7waNuEutUIWyLyVS99XZC6odY3M9oXy6TIbcM5O0sBs8w6iUCFDrrfvq
 aROlVubV8C80rVYojfkHIOnq919Pr9l0okOkDu+YKNt6sasIOAFPx7UEQUWCY9gANG+h
 xMQpuIdqYtw3pN1U9eJsAPaMFHtJALP5wAWNx3AschSEdrWn/XRrCTW/cpZCd3u7OOO5
 CB6GIh68MWkgq3Yuswbn/98zrX3TO3TwqNY9DtGsqgIpGKW0CAZ6hXHvFysx+XSmmvJ9
 Pyw9rq/pW4hHhYumIRU2JPPMaeS8QR0mD0Q4PA0XUW5KIM7rv7hq5NcDP8f+8l5C/UG4 +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagvnd0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 14:11:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2811410002A;
 Fri, 31 Jul 2020 14:11:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 128512AE6DD;
 Fri, 31 Jul 2020 14:11:00 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 14:10:59
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 14:10:30 +0200
Message-ID: <20200731121043.24199-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 00/13] introduce IOCTL interface for RPMsg
	channel management
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

This serie is inspired by the RPMsg char driver. The RPMsg char driver
provides interfaces that:
- expose a char RPMsg device for communication with the remote processor
- expose controls interface for applications to create and release channels

The purpose of this series is to decorrelate the two interfaces:
 - provide a char device for a RPMsg raw service similar to the rpmsg_char
   but that can be probed by a RPMsg bus on a ns announcement
 - generalize the use of the ioctl for all RPMsg services.

1) rpmsg raw driver: rpmsg_raw.c
For legacy reason, I created a new file instead of modifying the rpmsg_char
driver. But the rework of the rpmsg_char driver to only support the RPMsg
raw service could be an alternative
Few differences can be found:
    - The rpmsg class has not been implemented. The associated attributes
      are already available in /sys/bus/rpmsg/.
    - The eptdev device is now an RPMsg device probed by a RPMsg bus driver
      (probed only by the ioctl in rpmsg_char driver).
    - The associated endpoint is now created by the bus no more on the
      devfs open.

2) RPMsg control driver: rpmsg_ctrl.c
  This driver is based on the control part of the RPMsg_char driver. 
  On probe a /dev/rpmsg_ctrl<X> interface is created to allow to manage the
  channels.
  The principles are the following:
  - The RPMsg service driver registers it's name and the associated service
    using the rpmsg_ctrl_unregister_ctl API. The list of supported services
    is defined in  include/uapi/linux/rpmsg.h and exposed to the
    application thanks to a new field in rpmsg_endpoint_info struct.
  - On the RPMsg bus probe(e.g virtio bus) an rpmsg_ctrl device is
    registered that creates the control interface.
  - The application can then create or release a channel by specifying:
       - the name service
       - the source address (default: RPMSG_ADDR_ANY)
       - the destination address ( default: RPMSG_ADDR_ANY)
       - the associated service (new)
  - The rpmsg_ctrl uses the same interface than the ns announcement to
    create and release the channel but using the driver_override field to
    force the service name.
    The  "driver_override" allows to force the name service associated to
    an RPMsg driver, bypassing the rpmsg_device_id based match check.
  - At least for virtio bus, an associated ns announcement is sent to the
    remote side.  

Know current Limitations:
- Tested only with virtio RPMsg bus and for one vdev instance.
- rpmsg_device_match does not allow to match a local endpoint created by
  ioctl with a same service requested by the ns announcement callback.
- Current implementation of the release makes it possible to release any
  endpoint, even not created by the ioctl. Should we limit the release to
  the RPMsg channel created with the ioctl? 

This serie can be applied in Bjorn's rpmsg-next branch on top of the
RPMsg_ns series.

This series can be tested using rpmsgexport tools updated according to the
ioctl update and available here: https://github.com/arnopo/rpmsgexport. 

Arnaud Pouliquen (13):
  rpmsg: introduce rpmsg raw driver
  rpmsg: introduce rpmsg_control driver for channel creation
  rpmsg: add helper to create the rpmsg ctrl device
  rpmsg: virtio: probe the rpmsg_ctrl device
  rpmsg: uapi: add service param for create destroy ioctls
  rpmsg: add RPMsg control info structure
  rpmsg: control: add driver registration API
  rpmsg: raw: register service to the rpmsg control
  rpmsg: add override field in channel info
  rpmsg: ns: initialize channel info override field
  rpmsg: virtio: use the driver_override in channel creation
  rpmsg: control: implement the ioctrl function to create device
  rpmsg: ctrl: add support of the endpoints release

 drivers/rpmsg/Kconfig            |  17 ++
 drivers/rpmsg/Makefile           |   2 +
 drivers/rpmsg/rpmsg_ctrl.c       | 314 ++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h   |  18 ++
 drivers/rpmsg/rpmsg_ns.c         |   1 +
 drivers/rpmsg/rpmsg_raw.c        | 364 +++++++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c |  37 +++-
 include/linux/rpmsg.h            |  15 ++
 include/uapi/linux/rpmsg.h       |  17 ++
 9 files changed, 784 insertions(+), 1 deletion(-)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
 create mode 100644 drivers/rpmsg/rpmsg_raw.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
