Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C56CA909
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 17:31:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62C37C6905A;
	Mon, 27 Mar 2023 15:31:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D68A6C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 15:31:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RBq7UQ015391; Mon, 27 Mar 2023 17:30:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=NDwSsoDBiRbxH/ftqQ+RHeKYD8ZjHWglAr/pS89OLKE=;
 b=g1GnXXuYAPy3651z2icetYdqHZ71hnmPEzeiIpkDM3iv15TdISOniP94GxTXyqy1q65T
 Ro9ohYovC+/+g6fewYGL5lzx1P8dUAnTOb6TOa+yA1Mh/ISdQiK+aaEEyBjK+5jPkC3f
 X7+r62uP4a6pTEG3yZf/gD+5Svp0MCCkpNd5KmSR5dpKX3MlW1T6C3r4UDVvz/3XuB+T
 z6+OSNhuzfejx/WLH9YI7VBh1QaTEXgUe3bd8BOcLo5FzV/OZm1rb+eCNy1co2SPrNnd
 wcrTZ0QM+o8XATXDxuWV65jrkwpIdRJ9DE/lKNDxMv18351Al5/O1GaPnPmL9hnQ5Kni Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsr5c4te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 17:30:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D42B10002A;
 Mon, 27 Mar 2023 17:30:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B07B721A206;
 Mon, 27 Mar 2023 17:30:46 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 27 Mar
 2023 17:30:46 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 27 Mar 2023 17:29:41 +0200
Message-ID: <20230327152948.274743-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] ARM: dts: stm32: stm32mp15 various fixes
	and add stm32mp13 usart nodes
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

On stm32mp15 device trees:
  - Add USART1 scmi clock
  - Remove duplicates serial aliases

On stm32mp13 device trees:
  - Add USART nodes in stm32mp131.dtsi
  - Add USART nodes in stm32mp135f-dk.dts

Valentin Caron (7):
  ARM: dts: stm32: change USART1 clock to an SCMI clock on stm32mp15
    boards
  ARM: dts: stm32: fix slew-rate of USART2 on stm32mp15xx-dkx
  ARM: dts: stm32: clean uart aliases on stm32mp15xx-dkx boards
  ARM: dts: stm32: clean uart aliases on stm32mp15xx-exx boards
  ARM: dts: stm32: add uart nodes on stm32mp13
  ARM: dts: stm32: add pins for usart2/1/4/8 in stm32mp13-pinctrl
  ARM: dts: stm32: add uart nodes and uart aliases on stm32mp135f-dk

 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi   | 129 +++++++++++++++++++++
 arch/arm/boot/dts/stm32mp131.dtsi          |  97 +++++++++++++++-
 arch/arm/boot/dts/stm32mp135f-dk.dts       |  42 ++++++-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi   |   4 +-
 arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts |   4 +
 arch/arm/boot/dts/stm32mp157a-dk1.dts      |   3 -
 arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts |   4 +
 arch/arm/boot/dts/stm32mp157c-dk2.dts      |   3 -
 arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts |   4 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts      |   8 +-
 arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts |   4 +
 arch/arm/boot/dts/stm32mp157c-ev1.dts      |   9 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi     |   6 +
 13 files changed, 298 insertions(+), 19 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
