Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7EC2344B5
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 13:47:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42EB7C36B36;
	Fri, 31 Jul 2020 11:47:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F1CC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 11:47:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VBaYq8031435; Fri, 31 Jul 2020 13:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XwUX+1Y6zwoUw9ojrP+epdZ01TEQ51665ZcqVjIVZrc=;
 b=ogyDXSxTFP1b3/TpTPcCGcLRYHp0qjgIOz1A7a/SC17vZnFt4Z2G8syXylcJHcxxRvFi
 NYBpzI3rccMbIcg6fsSwCV4Ykh85EJGmXqpE5VqV0EWJKmfNvS1O5MMEb+0GOz+i0vuR
 DK2Yxl3eGAkGpe0eL15Bfd9973+Isji7pH6XUzi2MqQtPG9CB8frDdwYZ2fBBh3Z6ccZ
 5TvG+ranqChxarlpZjLq5FKv08raB6+IS43x8Qpx0x7aXz5NqUfAZGgbb1b5CZSDBhhF
 F1P1atq8zXuOXN1B4kTIf+pumUZj2pjrvN5l74ubiiA38udmhjxDNz/HjE+lCv8KdUFe 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgp665-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:47:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AC9B10002A;
 Fri, 31 Jul 2020 13:47:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AF47221061;
 Fri, 31 Jul 2020 13:47:40 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul 2020 13:47:39
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2020 13:47:23 +0200
Message-ID: <20200731114732.12815-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/9] introduce name service announcement rpmsg
	driver
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

The NS announcement is implemented by several backends, but could be
considered as part the RPMsg protocol. 
In this case it should be managed as a reserved rpmsg service and so
implemented on top of the rpmsg protocol.

This series introduces the rpmsg_ns driver that handles the name service
announcement. The virtio backend is updated in consequence to use this
service.

Applies cleanly on Bjorn rpmsg-next branch (ddd1930d6e3e)

Arnaud Pouliquen (9):
  rpmsg: virtio: rename rpmsg_create_channel
  rpmsg: core: add channel creation internal API
  rpmsg: virtio: add rpmsg channel device ops
  rpmsg: define the name service announcement as reserved address
  rpmsg: introduce reserved rpmsg driver for ns announcement
  rpmsg: virtio: use rpmsg ns device for the ns announcement
  rpmsg: ns: add name service announcement service
  rpmsg: virtio: use rpmsg_ns driver to manage ns announcement
  rpmsg: ns: name service announcement endianness

 drivers/rpmsg/Kconfig            |   9 ++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_core.c       |  37 ++++++
 drivers/rpmsg/rpmsg_internal.h   |  32 +++++
 drivers/rpmsg/rpmsg_ns.c         | 175 +++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 213 +++++++++----------------------
 include/linux/rpmsg.h            |   9 ++
 7 files changed, 325 insertions(+), 151 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
