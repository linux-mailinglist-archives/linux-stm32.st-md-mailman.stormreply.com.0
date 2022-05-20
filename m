Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CF52E76E
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 10:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F54C5F1ED;
	Fri, 20 May 2022 08:30:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84209C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 08:30:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K3ZQ3p004615;
 Fri, 20 May 2022 10:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=hneNV+UTX/MQsnnJ1NOLYhI1GUf8ZaFIZymZJDulI7Y=;
 b=bVSQ9bpLAesU4gdQU0NY7YC9ypuO98FoqvhNOA2l0Rhf5a3s228zScK5H/gq2trCQuc3
 oqSJPMYWZoRd4EEYCDCMV8rgHfCBZ4lhThMhnF61btFjxfFjBVczQEa726hgc0pmOy1M
 Y84p0AynckK6gqePolG0QuO9NW/TXm7WHmPhgnTFTwWj79PVZIbjbrjEvkz51tlj9CGX
 oDfoDXfZ8/edYsF0cRzfFBHV0C6ps7//j6tyXfCS92a6Ry/gqX8FrFUT93t81GKlhVPM
 LHXXO0JMDnsdgfhhRw/u2vSa5O5Od7/clCS1TbPkhBNkuv3zY8NulMdUilILWY3MvYyv kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s22tjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 10:29:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF853100038;
 Fri, 20 May 2022 10:29:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8EE1214D2D;
 Fri, 20 May 2022 10:29:56 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 10:29:54 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Fri, 20 May 2022 10:29:30 +0200
Message-ID: <20220520082940.2984914-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Deepak Kumar Singh <quic_deesin@quicinc.com>,
 Chris Lew <quic_clew@quicinc.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC PATCH 00/10] Introduction of rpmsg flow control
	service
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

This series proposes an implementation for the rpmsg virtio transport
backend, of the signaling API proposed by Deepak Kumar Singh:
"rpmsg and glink signaling API support" [1]

The aim of the series is to offer the possibility for an endpoint to inform
a remote endpoint about its state, based on a software flow control[2].

For this a new rpmsg service( with a fixed address 64) is proposed.
It is responsible for:
- transmitting local endpoint flow control information to the remote side,
- informing a local endpoint about a remote endpoint flow control.

For the rpmsg virtio transport layer the service is negotiated thanks to the 
virtio feature flag: VIRTIO_RPMSG_F_FC

Notice that this pull request introduces new feature in the rpmsg protocol,
So it has to be aligned with OpenAMP implementation.
Pending OpenAMP pull request is available here:
https://github.com/OpenAMP/open-amp/pull/394


[1]https://lkml.org/lkml/2022/1/18/867
[2]https://en.wikipedia.org/wiki/Software_flow_control

Arnaud Pouliquen (8):
  rpmsg: core: Add rpmsg device remote flow control announcement ops
  rpmsg: virtio: Implement the announce_remote_fc ops
  rpmsg: Introduce flow control channel driver
  rpmsg: virtio: Add support of the VIRTIO_RPMSG_F_FC feature
  rpmsg: virtio: Implement the set_flow_control ops
  rpmsg: Add the destination address in rpmsg_set_flow_control
  rpmsg: tty : Add the support of the flow control
  rpmsg: virtio: Set default dst address on flow control

Deepak Kumar Singh (2):
  rpmsg: core: Add signal API support
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support

 drivers/rpmsg/Kconfig            |  11 +++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_char.c       |  56 +++++++++++++--
 drivers/rpmsg/rpmsg_core.c       |  47 +++++++++++++
 drivers/rpmsg/rpmsg_fc.c         | 113 +++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h   |   9 +++
 drivers/rpmsg/virtio_rpmsg_bus.c | 111 +++++++++++++++++++++++++++++-
 drivers/tty/rpmsg_tty.c          |  50 ++++++++++++++
 include/linux/rpmsg.h            |  15 ++++
 include/linux/rpmsg/fc.h         |  51 ++++++++++++++
 10 files changed, 456 insertions(+), 8 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_fc.c
 create mode 100644 include/linux/rpmsg/fc.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
