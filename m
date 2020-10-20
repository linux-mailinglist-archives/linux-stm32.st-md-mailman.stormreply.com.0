Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B22938F4
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 12:15:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD7D6C424B9;
	Tue, 20 Oct 2020 10:15:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB93C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 10:15:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KAD3eZ016724; Tue, 20 Oct 2020 12:14:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=QH3MEFBpMSyEp1w1GatIGdJIwQdyJvG4fsxVWSDhhVg=;
 b=FlQQ0HBeTilfW8wgG5E6Ew3dIJhLICwQ74ZSvbTiMf9dmDCjvnVQ+U5XmtGsscvwl88d
 WitrT5EVRQja/lfyuZ6JfU7s6GjZwf24vGW6lxwI+jKlj53GLyjod1XzccfQRfJRqGjR
 2IEVlG076ocjeX6enr36i61/wUjnUcJA9F6A00zcPOUbd1X3RLgNhhIGZVzJ1bPsy/K8
 F0P9xIoqKv5lI5DDVqGNn+smCTiwwJCr0W68T+SMolHdCGgLidG/g3Kb+Czifjn7qS48
 3KFSKRBVPr52jmm3/p8/m+WgYaa1xwPjl8WzlTvMErZRizk3i6rFIDxjW6nE9KRncBBr rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8axk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 12:14:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77CA0100034;
 Tue, 20 Oct 2020 12:14:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E13D2C4CC5;
 Tue, 20 Oct 2020 12:14:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE1.st.com (10.75.127.1)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 12:14:51
 +0200
From: Hugues Fruchet <hugues.fruchet@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Oct 2020 12:14:47 +0200
Message-ID: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG1NODE1.st.com
 (10.75.127.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_04:2020-10-20,
 2020-10-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>, Alain Volmat <alain.volmat@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 0/2] DCMI BT656 parallel bus mode support
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

Add support of BT656 embedded synchronization bus.
This mode allows to save hardware synchro lines hsync & vsync
by replacing them with synchro codes embedded in data stream.
This mode is enabled when hsync-active & vsync-active
fields are not specified in devicetree.

===========
= history =
===========
version 4:
  - Fix typo in commit message

version 3:
  - Fix bus_width print to %u as per Sakari comment

version 2:
  - As per Sakari remark, revisit commit message and document
    BT656 parallel bus mode in bindings

version 1:
  - Initial submission

Hugues Fruchet (2):
  media: stm32-dcmi: add support of BT656 bus
  media: dt-bindings: media: st,stm32-dcmi: Add support of BT656

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 30 ++++++++++++++++++
 drivers/media/platform/stm32/stm32-dcmi.c          | 37 ++++++++++++++++++++--
 2 files changed, 65 insertions(+), 2 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
