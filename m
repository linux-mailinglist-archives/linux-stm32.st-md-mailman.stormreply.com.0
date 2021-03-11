Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886D3374E6
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 15:04:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B0D8C57B53;
	Thu, 11 Mar 2021 14:04:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00CB1C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 14:04:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BE35fq014991; Thu, 11 Mar 2021 15:04:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=v8txream0i2iNYejsg6TwbWegioUuHjMWET/Z9cj2U0=;
 b=2lrcpMoSt+DsfNpeZAc4o2SnY8THHwIWnQCjCrZv2CjNLaszYqCmWVEUgqKRW7WXvdWS
 8zRIhfCDMgeG0NhI0dqawmWUXkVYjcrsHU9W/o8zymqrndUUUsgR088rFpp/LEcUu0KC
 JdMnexn/Ha3xU9tOWY6i+RGSO7j7eAPp4w+AbXWKuwsMCblYMTHZD0uBsJLLHbYw9Kgs
 MpbUldZeJBfsMhHlPT7PjQDiBXia+MjO4rKYKbw05Vw335zk9pu2VEJY5SBZcnPhTh2N
 SgHt5JxRIZQQawQMusNq6GZ1Es0acMMH+oZl94hBJh5ydO09Z7u69EH8mFSEx4teNl21 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y76hy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 15:04:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EAF310002A;
 Thu, 11 Mar 2021 15:04:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D913245D4C;
 Thu, 11 Mar 2021 15:04:24 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:24
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>
Date: Thu, 11 Mar 2021 15:04:07 +0100
Message-ID: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_05:2021-03-10,
 2021-03-11 signatures=0
Cc: linux-arm-msm@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/6] rpmsg: enable the use of the rpmsg_char
	device for the Virtio backend
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

This series is the first step in the division of the series: 
"Introduce a generic IOCTL interface for RPMsg channels management"[1]

The main goal here is to enable the RPMsg char interface for
the virtio RPMsg backend. 

In addition some patches have been includes in order to document the
interface and rename the rpmsg_char_init function.

It also includes Mathieu Poirier's comments made on [1]

Patchsets that should be the next steps:
 - Extract the control part of the char dev and create the rpmsg_ctrl.c
   file
 - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices


[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (6):
  rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
  rpmsg: Move RPMSG_ADDR_ANY in user API
  rpmsg: Add short description of the IOCTL defined in UAPI.
  rpmsg: char: Use rpmsg_sendto to specify the message destination
    address
  rpmsg: virtio: Register the rpmsg_char device
  rpmsg: char: Return an error if device already open

 drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
 drivers/rpmsg/qcom_smd.c          | 16 ++++++++
 drivers/rpmsg/rpmsg_char.c        | 11 ++++--
 drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
 include/linux/rpmsg.h             |  3 +-
 include/uapi/linux/rpmsg.h        | 13 ++++++-
 6 files changed, 108 insertions(+), 13 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
