Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80FF960D00
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:06:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FFDC78020;
	Tue, 27 Aug 2024 14:06:02 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E45AC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:05:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RD2FKI022301;
 Tue, 27 Aug 2024 16:05:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=OWUzcb7sZC3fpmb7ZiuMCd
 Jr03L3mabve5VPP9D+l+A=; b=Bf+7eYHp/Rd6NAA6DfRy4CLOpA4eynoi6fioTM
 gLOB+pHKiECfWGQsagJ/dS9VA99P/lXQcVSxZ7K94FKF0POqMkgncYpj5xIEGWie
 Xv3++IQcwmS4weOjiUh9cYnjJJKLrXwYDubhXeONcC3q3T77oNzTaFCzBH1XFj08
 7mlLIbbvE/m3XPralZxdfUbgcezz2fkk09C8d4ZE/anxkWzvegauS0cJ5vPKKc1/
 fMsPLowVNc61uU/zHs7xP/Pq8GBs8q2fhzhRewm0mLRaKZkpSnRdnkkDPUXBaXzB
 ST7hARvw9avuFin3rO/Sn5RFUs0VypZEY+kMSgA1zgm52ozg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419fb408vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 16:05:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 24F2B40047;
 Tue, 27 Aug 2024 16:05:40 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF30B26C449;
 Tue, 27 Aug 2024 16:05:10 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:10 +0200
Received: from localhost (10.48.86.111) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:10 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 27 Aug 2024 16:04:46 +0200
Message-ID: <20240827140455.345086-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_07,2024-08-27_01,2024-05-17_01
Cc: devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/9] ARM: dts: st: add WLAN/BT on disco boards
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

This series enable WLAN/BT module on stm32mp1x discovery boards.
Use LSCO from RTC to supply 32kHz clock to WLAN/BT modules.
This is done by selecting "rtc_lsco_pins_a" in the WLAN pinctrl node.

And also add RTC nodes on stm32mp25x to enable RTC on stm32mp257f-ev1
board.

Christophe Roullier (2):
  ARM: dts: stm32: add support of WLAN/BT on stm32mp157c-dk2
  ARM: dts: stm32: add support of WLAN/BT on stm32mp135f-dk

Valentin Caron (7):
  ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp15
  ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp13
  ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp157c-dk2
  ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp135f-dk
  arm64: dts: st: add RTC on stm32mp25x
  arm64: dts: st: enable RTC on stm32mp257f-ev1 board
  ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp25

 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  7 +++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 52 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   |  7 +++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 51 +++++++++++++++++-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  6 +++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 10 ++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  4 ++
 7 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
