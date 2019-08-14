Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF478D54D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2019 15:49:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F605C35E01;
	Wed, 14 Aug 2019 13:49:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E421C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 13:49:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EDkpET005599; Wed, 14 Aug 2019 15:48:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=02fgRcS3o94dkivorsS1cbke+inlHjELAELbDohhyj8=;
 b=tObPM2iI7760MF5HfbWryB8sIj0wOoiBwiT9labl+sxd3wkT99PKLhApFxGYrohWHeE3
 Hgkn+NSAHxucxOmIajmY8660hm+TR+dr41ZCvEZ0Gw3U2jiLxQFXiEuymLBsiVdHvGgs
 Y8XCudgUQnHwOvHRIrAanuCDCBe3wMPoVnUxVsxpJNDv9ksKc/BfLl5sPvb1OC+pr05d
 koNw0VT9QhCLYGgqSs0P3On/inBOX7/djb/X48FjLdRfCQM8Uhx9oGoMPcn1pGT6++oz
 LRIEGQPdAX/sd9AyKYQqaI8YA1DuFXbjTo9DuZnHXdtHWexZqv2IBsc2k5odIVY7ZL+/ vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u9k2a64rj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 14 Aug 2019 15:48:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E79831;
 Wed, 14 Aug 2019 13:48:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E06F2FFE88;
 Wed, 14 Aug 2019 15:48:57 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 15:48:57 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug 2019 15:48:56
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Date: Wed, 14 Aug 2019 15:48:49 +0200
Message-ID: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_05:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 0/4] DCMI bridge support
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

This patch serie allows to connect non-parallel camera sensor to
DCMI thanks to a bridge connected in between such as STMIPID02 [1].

Media controller support is introduced first, then support of
several sub-devices within pipeline with dynamic linking
between them.
In order to keep backward compatibility with applications
relying on V4L2 interface only, format set on video node
is propagated to all sub-devices connected to camera interface.

[1] https://www.spinics.net/lists/devicetree/msg278002.html

===========
= history =
===========
version 6:
  - As per Sakari remark: add a FIXME explaining that this
    version only supports subdevices which expose RGB & YUV
    "parallel form" mbus code (_2X8)
  - Add some trace around subdev_call(s_fmt) error & format
    changes to debug subdev which only expose serial mbus code
  - Conform to "<name>":<pad index> when tracing subdev infos

version 5:
  - Remove remaining Change-Id
  - Add Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

version 4:
  - Also drop subdev nodes registry as suggested by Hans:
    https://www.spinics.net/lists/arm-kernel/msg743375.html

version 3:
  - Drop media device registry to not expose media controller
    interface to userspace as per Laurent' suggestion:
    https://www.spinics.net/lists/linux-media/msg153417.html
  - Prefer "source" instead of "sensor" and keep it in 
    dcmi_graph_entity struct, move asd as first member
    of struct as per Sakari' suggestion:
    https://www.spinics.net/lists/linux-media/msg153119.html
  - Drop dcmi_graph_deinit() as per Sakari' suggestion:
    https://www.spinics.net/lists/linux-media/msg153417.html

version 2:
  - Fix bus_info not consistent between media and V4L:
    https://www.spinics.net/lists/arm-kernel/msg717676.html
  - Propagation of format set on video node to the sub-devices
    chain connected on camera interface

version 1:
  - Initial submission


Hugues Fruchet (4):
  media: stm32-dcmi: improve sensor subdev naming
  media: stm32-dcmi: trace the supported fourcc/mbus_code
  media: stm32-dcmi: add media controller support
  media: stm32-dcmi: add support of several sub-devices

 drivers/media/platform/Kconfig            |   2 +-
 drivers/media/platform/stm32/stm32-dcmi.c | 317 +++++++++++++++++++++++++-----
 2 files changed, 267 insertions(+), 52 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
