Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683A191732
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 18:07:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22FF6C36B0B;
	Tue, 24 Mar 2020 17:07:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B467C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 17:07:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OH3jR9026290; Tue, 24 Mar 2020 18:04:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AMCtPG8q5sasMVUMMcu5hxbwZnpMXqy+87NMHQ6HtMc=;
 b=TFbdkIj/oir8wIc3oJ4N0mKD4OLm15n0J+VIEdPEpBP492raYFUzY+o7hV3wHD4p7uGG
 MRX1QNBsGgBk1QoPSSIp+0GCrREPMJxKnxrOwe5mlXrRsmPqWKAvqe56946hxvObo1r0
 yJRXnmm/leXXkIvF+G9q3QKfluC/t1i3wLn+KQ/7LvE9Ctj1xctS80A8GFu78OhEk2nd
 2/wKTngb9oDvk6kEn8dzkxHGWcLSVKXgW/RKtLIrwADiAM2fgnnRAzr4pesZLpFbU9Zy
 e3bymWj6K8F0bPFivdBS1vIN6nw40BeiVtHi3dJw9h5FYGIP4HLGBXfkQyHS3PDg8+4T hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995gsvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 18:04:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 214A610002A;
 Tue, 24 Mar 2020 18:04:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B43F2BE24B;
 Tue, 24 Mar 2020 18:04:57 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar 2020 18:04:55
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
Date: Tue, 24 Mar 2020 18:04:05 +0100
Message-ID: <20200324170407.16470-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_05:2020-03-23,
 2020-03-24 signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 xiang xiao <xiaoxiang781216@gmail.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v7 0/2] Add rpmsg tty driver
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

This patch set introduces a TTY console on top of the RPMsg framework which
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

Previous revision:
- the patch 1/2 ("rpmsg: core: add API to get MTU) has been discussed in a
  separate thread on remoteproc mailing list:
    https://patchwork.kernel.org/patch/11333509/
- Previous version of the patch 2/2 (tty: add rpmsg driver) available here:
    https://patchwork.kernel.org/cover/11130213/

Main delta vs v6:
 - Pack the rpmsg_tty_ctrl struct.
 - MTU API acked by Suman Anna from Texas Intruments company. 

Arnaud Pouliquen (2):
  rpmsg: core: add API to get MTU
  tty: add rpmsg driver

 Documentation/serial/tty_rpmsg.rst |  45 ++++
 drivers/rpmsg/rpmsg_core.c         |  21 ++
 drivers/rpmsg/rpmsg_internal.h     |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c   |  10 +
 drivers/tty/Kconfig                |   9 +
 drivers/tty/Makefile               |   1 +
 drivers/tty/rpmsg_tty.c            | 417 +++++++++++++++++++++++++++++
 include/linux/rpmsg.h              |  10 +
 8 files changed, 515 insertions(+)
 create mode 100644 Documentation/serial/tty_rpmsg.rst
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
