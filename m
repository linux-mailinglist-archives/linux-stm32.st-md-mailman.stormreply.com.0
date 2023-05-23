Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BB70D8A3
	for <lists+linux-stm32@lfdr.de>; Tue, 23 May 2023 11:14:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF6A4C6B44B;
	Tue, 23 May 2023 09:14:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D283C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 May 2023 09:14:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N8hPnv005594; Tue, 23 May 2023 11:14:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=XmHMQaJRJX0BXYt12UAF3Sq131TqARKd7zKapQdfyRA=;
 b=tAISfMZXmHxSr5jd1zPTV9vesPfaw/Ho/yT/NYqUJIacAa7jMjJ2e946IhQiZF9TndHQ
 a8AcxIlC6/Qm/p53CUBtoPZynA6pv2vYZ/AQLyIPo11xj1zxrvdsUcEwbb7SBDLVYHbS
 6sqZ/vCV1dUQkNAXhvOgd59T50NathIQZGNawdTl/udqbUR5YKnH3utHuXF2qG6o69wz
 Yn9dYukl4/uhY0w16bG8KPH8gax8DGPgASfH+yt5jgAlq4VlUEmjYMm8estFSI0/WcI1
 PyJ/ffzYjSDDPBs85srNaYNuIl2XuA56la3WIIkOiMTbK2evsPCR8DrScjxm93wCTeO3 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qpnj1gbqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 11:14:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C646C10002A;
 Tue, 23 May 2023 11:14:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B448A222CBA;
 Tue, 23 May 2023 11:14:15 +0200 (CEST)
Received: from localhost (10.252.31.43) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 23 May
 2023 11:14:14 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 23 May 2023 11:13:46 +0200
Message-ID: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.31.43]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_06,2023-05-22_03,2023-05-22_02
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH 0/4] introduction of a remoteproc tee to
	load signed firmware images
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

This RFC proposes an implementation of a remoteproc tee driver to
communicate with a TEE trusted application in charge of authenticating
and loading remoteproc firmware image in an Arm secure context.

The services implemented are the same as those offered by the Linux
remoteproc framework:
- load of a signed firmware
- start/stop of a coprocessor
- get the resource table


The OP-TEE code in charge of providing the service in a trusted application
is proposed for upstream here:
https://github.com/OP-TEE/optee_os/pull/6027

For more details on the implementation a presentation is available here:
https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (4):
  tee: Re-enable vmalloc page support for shared memory
  remoteproc: Add TEE support
  dt-bindings: remoteproc: add compatibility for TEE support
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  33 +-
 drivers/remoteproc/Kconfig                    |   9 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/stm32_rproc.c              | 234 +++++++++--
 drivers/remoteproc/tee_remoteproc.c           | 397 ++++++++++++++++++
 drivers/tee/tee_shm.c                         |  24 +-
 include/linux/tee_remoteproc.h                | 101 +++++
 7 files changed, 753 insertions(+), 46 deletions(-)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
