Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F2219CB
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 16:28:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42960C5B66F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 14:28:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDFF5C5B66D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 14:28:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HERpQb031441; Fri, 17 May 2019 16:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PHl9sPgHer9rFMqdEvzOj0lO4FTuuyduSnOabIiiXhw=;
 b=p5t1gmwqmGxokQhFfCkrI7yiriG0RYbcNo5rx3HMUGvFayKfcjfgd1p7piaE4dmB7St1
 672RfK5+QYYksRFpt0IT7oKXoQ3XRc+coG4Zi0WPbxiNADvigpVhP62/7EcPxqWc04xl
 R0CAF9++5wW0CefUZZLO0MBvqXkHqQ3ksQzqUv0vH23VT+J+DR8K1geM0xYs/QCmCHnW
 hqxAxjYMtCFoWd/Y/aZb6ieD95kMdoalFUU4d3hVK99SD3Ppus5RdODqhk/yWCWT5I2S
 kL6xugwNFjI0Ehd2Ly5aSPeu9v3ZVn2tcxX1Y3kQpK2yoE3jr2FaSj4qy6siDNXc719K xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9get5c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 May 2019 16:27:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D12A23A;
 Fri, 17 May 2019 14:27:56 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA5792C9F;
 Fri, 17 May 2019 14:27:56 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 17 May
 2019 16:27:56 +0200
Received: from localhost (10.48.0.131) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 17 May 2019 16:27:56 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao
 <xiaoxiang781216@gmail.com>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 May 2019 16:27:44 +0200
Message-ID: <1558103266-1613-1-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_08:, , signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH v3 0/2] TTY: add rpmsg tty driver
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
- Provide a console to communicate easily with the remote processor
  application.
- Provide an interface to get the remote processor log traces without
  ring buffer limitation.
- Ease the migration from MPU + MCU processors to multi core processors
  (MPU and MCU integrated in one processor)

An alternative of this proposed solution would consist in using the virtio
console:
The drawback with that solution is that it requires a specific virtio buffer
(in addition to the one already used for RPMsg) which does not fit with remote
processors with little memory. The proposed solution allows to multiplex the
console with the other rpmsg services, optimizing the memory.

The first patch adds an API to the rpmsg framework ('get buffer size') and the
second one is the rpmsg tty driver itself.

History:
-V2 to V3:
	- suppress error return on rpmsg callback as not tested in rpmsg framework
	- change some flow messages level to debug
	- add missing out of memory checks

-V1 to V2:
	- modify message structure to allow to data transmission but also
	flow control
	- add documentation file to describe message structure for remote
	  implementation
	- add dtr/rts management
	- disable termios modes that generates non optimized behavior on RPMsg
	  transfers
	- replace rpmsg_send by rpmsg_trysend to not block the write
	- suppress useless spinlock on read
	- miscellaneous fixes to improve robustness

Arnaud Pouliquen (2):
  rpmsg: core: add possibility to get message payload length
  tty: add rpmsg driver

 Documentation/serial/tty_rpmsg.txt |  38 +++
 drivers/rpmsg/rpmsg_core.c         |  20 ++
 drivers/rpmsg/rpmsg_internal.h     |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c   |  11 +
 drivers/tty/Kconfig                |   9 +
 drivers/tty/Makefile               |   1 +
 drivers/tty/rpmsg_tty.c            | 479 +++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h              |  10 +
 8 files changed, 570 insertions(+)
 create mode 100644 Documentation/serial/tty_rpmsg.txt
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
