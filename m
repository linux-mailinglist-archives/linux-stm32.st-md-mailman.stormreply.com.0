Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 322674570F8
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Nov 2021 15:46:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D03CCC5EC56;
	Fri, 19 Nov 2021 14:46:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A90C0C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 14:46:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ9Rxvf001985;
 Fri, 19 Nov 2021 15:46:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=VyawpOikAjal+OntL+ZK7zDW8TQF0Oiu89Xcyi2QlCc=;
 b=cKLiIjc4RMe13oiXJtZ9CfR3wfH5vIG+0LFBXczpnPE1vkIuy4iG6BoKPkXGVZK6mSn8
 mc1MyLNNhadbeONjSUEevd9GMtuizkflJBYTBC27rrlY8lQaQp3F5F3JDByjwWuUFncJ
 6z1HK6zcMpT8w6We4zuW8khJ70GxVc1k3zj/OwWbTUe1LrXxAXKdE7pWDioKjTP3OykJ
 H5WM3xjSL+0MkcjrEg3MjUnOx9borJIdZfWyuxWoDJmqHGY5WDULvvC8koFVe02mGq7Z
 5SghnQpRG6SLdcvRoGVOjmn3lvSh9EVb3bJaqMkkS7ejHOImMGWEYjogmq8eRKzqqlya yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce1knc8jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 15:46:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8343910002A;
 Fri, 19 Nov 2021 15:46:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B371231DF0;
 Fri, 19 Nov 2021 15:46:41 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 15:46:40
 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, <arnaud.pouliquen@foss.st.com>,
 <fabrice.gasnier@foss.st.com>
Date: Fri, 19 Nov 2021 15:45:42 +0100
Message-ID: <20211119144551.7577-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/9] ARM: dts: stm32: merge spi and i2s nodes
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

When a STM32 SPI instance offers I2S feature, two nodes are defined
in STM32 SoC device tree to support both SPI and I2S.
Merge SPI node and I2S nodes into a single node, to avoid
hardware description duplication and compilation warnings.

Olivier Moysan (9):
  ASoC: dt-bindings: stm32: i2s: update example
  ASoC: dt-bindings: stm32: i2s: add audio-graph-card port
  ASoC: dt-bindings: stm32: i2s: allow additional properties.
  ARM: dts: stm32: merge spi and i2s nodes
  ARM: dts: stm32: rename i2s node on stm32mp15xx-dkx boards
  ARM: dts: stm32: rename spi node on stm32mp15xx-dhcor-avenger96 boards
  ARM: dts: stm32: rename spi node on stm32mp15xx-dhcom-drc02 boards
  ARM: dts: stm32: rename spi node on stm32mp157c-ev1 board
  ARM: dts: stm32: adapt i2s node to spi binding on stm32mp15xx-dk

 .../bindings/sound/st,stm32-i2s.yaml          |  9 ++++-
 arch/arm/boot/dts/stm32mp151.dtsi             | 39 ++-----------------
 arch/arm/boot/dts/stm32mp157c-ev1.dts         |  2 +-
 .../arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi |  2 +-
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  2 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  7 +++-
 6 files changed, 18 insertions(+), 43 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
