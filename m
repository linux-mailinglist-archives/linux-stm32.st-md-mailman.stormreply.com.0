Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 344643B8F62
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jul 2021 11:04:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCE26C597AE;
	Thu,  1 Jul 2021 09:04:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0CE6C59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 09:04:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16193GPo018054; Thu, 1 Jul 2021 11:04:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=PuCgOMVS+k9BdyTGiSWcQ42Ozxz0XMx82mro7FoPaW0=;
 b=r5apYu81ioi0MukLfvhpZ3bS2I5fl0+xuml7HRydVg7OKOkrvbjFyZXCyEh5BNTJhEB0
 SDYK2QSZIz4usYoPBXekIXT2UnL7G8y3KV1lm+mLzcqEzAjt3Oa6qgPwj/dAv0SFOX1P
 sPyE0FJNp6e7J2gBkcI19IkjByf9pViDhr6XBut9ootxo3h9OctFmZaZ+RiSH+u18ejw
 O9L+kfm8RdI9oWwi9K47zC0sbk7mXVxax0tHILysgPpRp+pVxEMva7fx97t2XWKuNBBx
 PPgaROttSyxSQCYAyRfuEpJ5DFiGL95zE1YOPeBaBjo3lh8X15cOLo5iPLBVMgwd5JzO hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h9qe8j4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 11:04:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E4E810002A;
 Thu,  1 Jul 2021 11:04:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 705702138C8;
 Thu,  1 Jul 2021 11:04:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul 2021 11:04:21
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 1 Jul 2021 11:04:09 +0200
Message-ID: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_06:2021-06-30,
 2021-07-01 signatures=0
Cc: julien.massot@iot.bzh, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/4] rpmsg: char: introduce the rpmsg-raw
	channel
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
  Allow the remote processor to instantiate a /dev/rpmsgX interface relying on the NS announcement
  of the "rpmsg-raw" service.
  This patchet is extracted from  the series [1] with rework to add rpmsg_create_default_ept helper.

  
Aim:
  There is no generic sysfs interface based on RPMsg that allows a user application to communicate
  with a remote processor in a simple way.
  The rpmsg_char dev solves a part of this problem by allowing an endpoint to be created on the
  local side. But it does not take advantage of the NS announcement mechanism implemented for some
  backends such as the virtio backend. So it is not possible to probe it from  a remote initiative.
  Extending the char rpmsg device to support NS announcement makes the rpmsg_char more generic.
  By announcing a "rpmg-raw" service, the firmware of a remote processor will be able to
  instantiate a /dev/rpmsgX interface providing to the user application a basic link to communicate
  with it without any knowledge of the rpmsg protocol.

Implementation details:
  - Register a rpmsg driver for the rpmsg_char driver, associated to the "rpmsg-raw" channel service.
  - In case of rpmsg char device instantiated by the rpmsg bus (on NS announcement) manage the 
    channel default endpoint to ensure a stable default endpoint address, for communication with 
    the remote processor.

delta vs V2 [2]:
- Fix typos.
- Suppress useless check on eptdev->rpdev, in rpmsg_eptdev_ioctl.
- Add the Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>.

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (7486f29e5e60)
    + the "Restructure the rpmsg char to decorrelate the control part" series[3]

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=505873
[3] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793



Arnaud Pouliquen (4):
  rpmsg: Introduce rpmsg_create_default_ept function
  rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: Add possibility to use default endpoint of the rpmsg
    device.
  rpmsg: char: Introduce the "rpmsg-raw" channel

 drivers/rpmsg/rpmsg_char.c | 120 ++++++++++++++++++++++++++++++++++---
 drivers/rpmsg/rpmsg_core.c |  51 ++++++++++++++++
 include/linux/rpmsg.h      |  13 ++++
 3 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
