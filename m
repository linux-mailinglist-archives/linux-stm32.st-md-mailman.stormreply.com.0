Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF336EBA6
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Apr 2021 15:55:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14E27C58D60;
	Thu, 29 Apr 2021 13:55:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E5C7C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:55:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TDpqlU026627; Thu, 29 Apr 2021 15:55:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=798sGlkNn2haxzb2XBlJK5YccN6Miljype3MfgmLqlw=;
 b=P4fVCv2IUblfERDP8yWruFlCP1dBv5UgJSHStETzUro7N2R2O8d4dYCcJhiZOLz+EYgx
 sleRf6Sfic5We5eFxgiQuzpbW+JYZW2ok/e1MQ2BJbzUVjW4b0b5tI1JNhHHRVBHbUTM
 UjRfKEjyYpcEnyfOldWEk/0NcIki7L95NoNpbQgUlhBUmaYxKJLrdhndMZLTlYBwdq7U
 wygiWflsyHYmDQfzK8F7MVcjrQJ5KuBQ2uh3aCRhRa5TwFgoUKFh64GMgxt7o+ZPK/Uw
 wPpRi9SCO18fRvV8URFFc/wdgPurVbKytYhg09h1xyiNBaqWStLfbg3g3BObKgcYYvvt rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 387qp5b6g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 15:55:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50FEA10002A;
 Thu, 29 Apr 2021 15:55:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 413EC212FA0;
 Thu, 29 Apr 2021 15:55:33 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 15:55:32
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 29 Apr 2021 15:55:01 +0200
Message-ID: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_07:2021-04-28,
 2021-04-29 signatures=0
Cc: arnaud.pouliquen@foss.st.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/6] Restructure the rpmsg char and
	introduce the rpmsg-raw channel
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

Main update from V2 [1]
 - Management of the endpoint creation/release to handle it for all the use cases
   in the rpmsg_eptdev_open and rpmsg_eptdev_release function

Other patch updates are described at the end of their commit message.


This series can be applied on git/andersson/remoteproc.git 
for-next branch (dc0e14fa833b) + "rpmsg: char: Remove useless includes" patch[3].

Series description:
This series is the second step in the division of the series [2]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to:
- split the control code related to the control
  and the endpoint. 
- define the rpmsg-raw channel, associated with the rpmsg char device to
  allow it to be instantiated using a name service announcement.
    
An important point to keep in mind for this patchset is that the concept of
channel is associated with a default endpoint. To facilitate communication
with the remote side, this default endpoint must have a fixed address.

Therefore, for /dev/rpmsgX device created during the instantiation of he "rpmsg-raw"
device, the endpoint creation/release is not dynamically managed on each FS open/close.

This is only applicable for channels probed by the rpmsg bus. The behavior,
using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is preserved.
  
The next step should be:
Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
to instantiate the rpmsg devices

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=466357
[2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
[3]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210429080639.6379-1-arnaud.pouliquen@foss.st.com/


Arnaud Pouliquen (6):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Add possibility to create and reuse default endpoint
  rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
  rpmsg: char: Return error if user tries to destroy a default endpoint.

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 223 ++++++++++--------------------
 drivers/rpmsg/rpmsg_char.h        |  51 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 209 ++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 350 insertions(+), 157 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
