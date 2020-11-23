Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 460FE2C112B
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 18:01:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EEF3C56631;
	Mon, 23 Nov 2020 17:01:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D719C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 17:01:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ANGvs7P001788; Mon, 23 Nov 2020 18:01:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=f/KXsDREsm5c6GLokNlWtQYrob45QYlRbyJ6V0lY9Lc=;
 b=CkJnHcnZtjloKJkw91/1I98HwnVOgtcAhxPFvxfrKttqk2/nBt0IQGzcZRKgWUpzUXHS
 qfNVfDj1eL/tbIkFwt0kGaHyLljOGaLnDMg/oTD1xKgS0MiB5EjM3Yi5LvR0Q0CnIECP
 iqHi8oPlePc5D3JtVOHF3N4QGOdiqjUcLlSCIPHlhy02SVrD/OEx7KIB4kLgDYAvCGyp
 j1V1WTtCgklNJJ5OHIke3g4g4UkUeEhQWIajBVsGeHJ28CIFiyjtrbmmRFT0xeM7gUFJ
 q1RtBQc6A1ktAIUqSUkYjSZf/1ujzkB1XHUaEUqVQtu30i443Xur4w83E3dIH45uks1s 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y01caexk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 18:01:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3999E10002A;
 Mon, 23 Nov 2020 18:01:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 276042BA2D8;
 Mon, 23 Nov 2020 18:01:35 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 18:01:34
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 23 Nov 2020 18:01:26 +0100
Message-ID: <20201123170132.17859-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/6] STM32 USBPHYC PLL management rework
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

STM32 USBPHYC controls the USB PLL. PLL requires to be powered with 1v1 and 1v8
supplies. To ensure a good behavior of the PLL, during boot, runtime and
suspend/resume sequences, this series reworks its management to fix regulators
issues and improve PLL status reliability.

Amelie Delaunay (6):
  dt-bindings: phy: phy-stm32-usbphyc: move PLL supplies to parent node
  phy: stm32: manage 1v1 and 1v8 supplies at pll activation/deactivation
  phy: stm32: replace regulator_bulk* by multiple regulator_*
  phy: stm32: ensure pll is disabled before phys creation
  phy: stm32: ensure phy are no more active when removing the driver
  phy: stm32: rework PLL Lock detection

 .../bindings/phy/phy-stm32-usbphyc.yaml       |  22 +-
 drivers/phy/st/phy-stm32-usbphyc.c            | 222 +++++++++++-------
 2 files changed, 153 insertions(+), 91 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
