Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D3345E04
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Mar 2021 13:28:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9870CC57B5A;
	Tue, 23 Mar 2021 12:28:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 767A9C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Mar 2021 12:28:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NCMA7O026737; Tue, 23 Mar 2021 13:28:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=TFEaoGHubAcvTK6aBZnSgF+yw3/Ea8wZf8ITTSJeSZw=;
 b=YUhffOcZCMjghv1KUTC0P0PKD/SzaRtAlwZveZzaX8JomXbCm5I+zi8O+khx59dDNAxA
 m1TM6JsVrcYi4njCuyPIY7gtYY7REoeQKe26ZB6LgJeTTINNYytpk3PSWVDk3TVl1jf6
 3530kzFNA7CdNAJRKWuuQ8HXnxUaP7/bmTJFEBEe8Z8RoEdibDk3PNxEcc7oQVmO1NJ1
 rWyS4xB1wEX06mRNUk0dUeeBS8TUBVuZ7Jsx5bdKxaHxx5UsOzlmQvJHv+ydRANIv0is
 HLOCU1t4y6K7cnPU6wWG1jf6WbAHdU4KzHgzuN1WkDAqIwf9aNarZQbtcg6gsUWTB6AT LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d8tpfapv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 13:28:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62E0B100034;
 Tue, 23 Mar 2021 13:28:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C608824CF45;
 Tue, 23 Mar 2021 13:28:17 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:16
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Tue, 23 Mar 2021 13:27:30 +0100
Message-ID: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/7] Restructure the rpmsg char and introduce
	the rpmsg-raw channel
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

This series is the second step in the division of the series [1]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to:
- split the control code related to the control
  and the endpoint. 
- define the rpmsg-raw channel, associated with the rpmsg char device to
  allow it to be instantiated using a name service announcement.
    
An important point to keep in mind for this patchset is that the concept of
channel is associated with a default endpoint. To facilitate communication
with the remote side, this default endpoint must have a fixed address.

Consequently, for this series, I made a design choice to fix the endpoint
on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
on FS open/close.

This is only applicable for channels probed by the rpmsg bus. The behavior,
using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
preserved.
  
The next steps should be to correct this:
Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
to instantiate the rpmsg devices

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (7):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
  rpmsg: char: No dynamic endpoint management for the default one
  rpmsg: char: Return error if user try to destroy a default endpoint.

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 221 +++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  50 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 233 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 368 insertions(+), 160 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
