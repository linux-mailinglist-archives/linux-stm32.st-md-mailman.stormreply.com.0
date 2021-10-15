Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B742EE12
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 11:47:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A988FC5C844;
	Fri, 15 Oct 2021 09:47:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B0EAC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 09:47:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F8WEgK020108; 
 Fri, 15 Oct 2021 11:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=QMJybJFM+KLDBRVWUQYg6J/4AWICb2XMbuf/J8bxJWk=;
 b=JgVrE461VqFuUQLgFZd7ds6PbsNEobjn2bJ5UWYI6sVgyuSZXY70pXvY+uJcaFkNbqU6
 JkiZOGxDRwLqHUi1dnKV/4iNfBSY5WvP9qTEMotuIZZ299Mpo3zoMQZCVOldZCD3vL4G
 udNjxyzJjjVU+OJI93H6jQDuaDOuwUH04oewFbmFj/2PuoOtXdv+0/uqvRq+lZFJUN6z
 F2CIG712YpLZ+6a1jL1sSkqcjcHnk/Y0rKL0Fzrvy6bLiFbjaTIhC9Lt3yBXEYptTbOZ
 1pJEIoxzAViUuLoAL9KMtQIvgCbW+YI8uoyJ/SxeICWWyqCnZcdDjsRPcF0Ti+9R5LLM fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bpydfb096-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 11:47:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0635310002A;
 Fri, 15 Oct 2021 11:47:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFBDD21ED3B;
 Fri, 15 Oct 2021 11:47:25 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct 2021 11:47:25
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Date: Fri, 15 Oct 2021 11:46:59 +0200
Message-ID: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_03,2021-10-14_02,2020-04-07_01
Cc: linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, Suman Anna <s-anna@ti.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v10 0/2] Add rpmsg tty driver
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

Update previous revision [1] based on Mathieu Poirier's review.

This patchset introduces a TTY console on top of the RPMsg framework which
enables the following use cases:
- Provide a console to communicate easily with the remote processor application.
- Provide an interface to get the remote processor log traces without ring
  buffer limitation.
- Ease the migration from MPU + MCU processors to multi core processors
  (MPU and MCU integrated in one processor) by offering a virtual serial link.

An alternative of this proposed solution would consist in using the virtio
console:
The drawback with that solution is that it requires a specific virtio buffer
(in addition to the one already used for RPMsg) which does not fit with remote
processors with little memory. The proposed solution allows to multiplex the
console with the other rpmsg services, optimizing the memory.

The first patch adds an API to the rpmsg framework ('get max transmission unit')
and the second one is the rpmsg tty driver itself.

Applied and tested on kernel V5.15-rc1

[1] https://lkml.org/lkml/2021/10/8/726 

Arnaud Pouliquen (2):
  rpmsg: core: add API to get MTU
  tty: add rpmsg driver

 drivers/rpmsg/rpmsg_core.c       |  21 +++
 drivers/rpmsg/rpmsg_internal.h   |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c |  10 ++
 drivers/tty/Kconfig              |  12 ++
 drivers/tty/Makefile             |   1 +
 drivers/tty/rpmsg_tty.c          | 274 +++++++++++++++++++++++++++++++
 include/linux/rpmsg.h            |  10 ++
 7 files changed, 330 insertions(+)
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
