Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594D251D7A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 18:52:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E19C3087A;
	Tue, 25 Aug 2020 16:52:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4E6FC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 16:52:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PGkqni009695; Tue, 25 Aug 2020 18:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mRxpgvYHHmYunvL/dN1QJuAEVm0K612wf/w6woNwEks=;
 b=e6yhRWcDdRkm6q9Em2x9JA25JfzH/eJYwLA1cL8oCPOJPvEMiUE3jV94n9vYmuLJhTv7
 HU+/9VYE4PjC9TgyYAjn7Jr8XeU2EAQhvfhwW1BTHGjP4juE6tk23iiiLJE9TPJNRbWI
 oniyPoj7emnFHKN42RNQP6M1DE19XlaTau6MjW2T6Fg/F9gNFZaYayApT1Cy8kW2KgE1
 huxuoEesy2TttOmzOlTgNEHptuvwHMhAOE3RTw4GNEQxxTFX5g5SSaQnSFeqJ15/w6yX
 BLtedrJVxII+Y0VBypSDb4kpnhXigu2f5WWWH6fFd8xGAZuCRkhH868LE3an2npNih2t kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 332t8fpmnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 18:52:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3A2910002A;
 Tue, 25 Aug 2020 18:52:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B52432A5E44;
 Tue, 25 Aug 2020 18:52:12 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug 2020 18:52:12
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 25 Aug 2020 18:48:59 +0200
Message-ID: <20200825164907.3642-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_06:2020-08-25,
 2020-08-25 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/8] introduce name service announcement
	rpmsg driver
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

Applies cleanly on Bjorn for-next branch (ca69dba7f13a)

Main updates from V1 to V2:
- Integrate Mathieu's comments:
  - rework the rpmsg_create_channel and rpmsg_release_channel error management.
  - merge patch "[9/9] rpmsg: ns: name service announcement endianness"
    in other pathes.

V1: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327257

Arnaud Pouliquen (8):
  rpmsg: virtio: rename rpmsg_create_channel
  rpmsg: core: add channel creation internal API
  rpmsg: virtio: add rpmsg channel device ops
  rpmsg: define the name service announcement as reserved address
  rpmsg: introduce reserved rpmsg driver for ns announcement
  rpmsg: virtio: use rpmsg ns device for the ns announcement
  rpmsg: ns: add name service announcement service
  rpmsg: virtio: use rpmsg_ns driver to manage ns announcement

 drivers/rpmsg/Kconfig            |   9 ++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_core.c       |  45 +++++++
 drivers/rpmsg/rpmsg_internal.h   |  32 +++++
 drivers/rpmsg/rpmsg_ns.c         | 174 +++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 213 +++++++++----------------------
 include/linux/rpmsg.h            |   9 ++
 7 files changed, 332 insertions(+), 151 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
