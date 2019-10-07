Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B61CE557
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 16:34:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0DD9C36B0E;
	Mon,  7 Oct 2019 14:34:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C744C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 14:34:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97EVeYl021701; Mon, 7 Oct 2019 16:34:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Z6JwJ7BA4jHWAT0HHOYTMuKD4KHqxvNFYvDntJKt8Cs=;
 b=ztBt+TDuhXSbnwSv2ZtYNw8umrUsXzzT28B7eT7txWClmlqFX8U9d13MZfm3mADgPVI0
 pyIWyQfGi3xA/E9bQamRyIpj+MhZ6ogzVFyq7eIe4RyYPwNGy4NiuxiZsTCWBeapien2
 /R8CE2yAekiUaTD1zBX/NRoSC+APC3aZ1wes83NZ3fVUAwN1tH19PMqWWMriO07gbD+P
 0y15Myl2QNpR0Lk70a7kvnJe6Xa5aJ//eSlcsV28P2RDUl6UnJ3qx/47b9H7Re15t0Hr
 4WZ8Xq7UZI1TdYPoDf/x5KmSmc/Kv55It80+dWBVtlvp5OSQNlPwhkpfIAJoL0MJWeMx 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0jw3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 16:34:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20FAB10002A;
 Mon,  7 Oct 2019 16:34:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E51362B4929;
 Mon,  7 Oct 2019 16:34:04 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct 2019 16:34:04
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, <arnd@arndb.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Mon, 7 Oct 2019 16:33:58 +0200
Message-ID: <20191007143402.13266-1-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/4] ARM: dts: stm32: Add fixes to be
	compliant with DT validation tool
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

This series updates STM32 DT files in order to clean some issues seen during
STM32 device trees validation ("make dtbs_check"). 

Regards
Alex


Alexandre Torgue (4):
  ARM: dts: stm32: fix memory nodes to match with DT validation tool
  ARM: dts: stm32: fix joystick node on stm32f746 and stm32mp157c eval
    boards
  ARM: dts: stm32: remove usb phy-names entries on stm32mp157c-ev1
  ARM: dts: stm32: fix regulator-sd_switch node on stm32mp157c-ed1 board

 arch/arm/boot/dts/stm32429i-eval.dts   | 2 +-
 arch/arm/boot/dts/stm32746g-eval.dts   | 3 +--
 arch/arm/boot/dts/stm32f429-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f469-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f746-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32f769-disco.dts  | 2 +-
 arch/arm/boot/dts/stm32h743i-disco.dts | 2 +-
 arch/arm/boot/dts/stm32h743i-eval.dts  | 2 +-
 arch/arm/boot/dts/stm32mp157a-dk1.dts  | 1 +
 arch/arm/boot/dts/stm32mp157c-ed1.dts  | 3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts  | 3 ---
 11 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
