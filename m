Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFEB3DDD9
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 11:19:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AA3BC3F94D;
	Mon,  1 Sep 2025 09:19:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00015C3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 09:19:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5818dWle030842;
 Mon, 1 Sep 2025 11:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=M23uVWJiYeTrr1JS3uWWgf
 1JteN+eMtkrHNZo9t3Nsc=; b=T7hBZMHGpHWX8yIcx4pkx4yXc0Gvci0C4fZ8Z/
 k6FZBtMm75DcvF7uyHfLZwnr/TDkl5lNA+oDzp0l7J1c3bbNDzlz4uYiBI1YF9Vw
 DHoze1NMr2Q1fM1WbxAOwm+QTj/1o5NCrm5OpfmTKooFBU4FnbPHnqDc2a7kumne
 j8Bqs6I9IttmDIcKECxxicqZFNrTWB/xYcFDoDFZi/VCJP1eqpoKAFVOFRAF9as/
 gmPpvKebOvlBJ5u/e3qMYyfb4AA0da5XAcll/rDdDvvoaT6Pe07CeR168Lg+yFTf
 9cJBotYpCwvGbeBUnimJ27c1D6uls5eO/o0RKcqEX9BKGxcA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmx690q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Sep 2025 11:18:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 831924004A;
 Mon,  1 Sep 2025 11:17:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 873B776555D;
 Mon,  1 Sep 2025 11:16:36 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 11:16:36 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 1 Sep 2025 11:16:26 +0200
Message-ID: <20250901-relative_flex_pps-v4-0-b874971dfe85@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGpktWgC/23NwQrCMBAE0F+RnI3U3abbevI/RCTGjQa0LUkIF
 em/G4ugYo/DMG8eIrB3HMRm8RCekwuua3MolwthLro9s3SnnAUUoAoClJ6vOrrEB3vl4dD3QVq
 twR6NtjUqkXe9Z+uGydyJlqNseYhin5uLC7Hz9+ksraf+7ZYzblrLQiIZXSkixKrZ2i6EVYgr0
 90mL8G30cwZ8DJY2QIVKFOqfwM/Rg00Z2A2KkImaqg+avg1xnF8Akh6th1GAQAA
X-Change-ID: 20250723-relative_flex_pps-faa2fbcaf835
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Stultz <jstultz@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/3] net: stmmac: allow generation
 of flexible PPS relative to MAC time
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

When doing some testing on stm32mp2x platforms(MACv5), I noticed that
the command previously used with a MACv4 for genering a PPS signal:
echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
did not work.

This is because the arguments passed through this command must contain
the start time at which the PPS should be generated, relative to the
MAC system time. For some reason, a time set in the past seems to work
with a MACv4.

Because passing such an argument is tedious, consider that any time
set in the past is an offset regarding the MAC system time. This way,
this does not impact existing scripts and the past time use case is
handled. Edit: But maybe that's not important and we can just change
the default behavior to this.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered:

echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v4:
- Export timespec64_add_safe() symbol.
- Link to v3: https://lore.kernel.org/r/20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com

Changes in v3:
- Fix warning on braces for the switch case.
- Link to v2: https://lore.kernel.org/r/20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com

Changes in v2:
- Drop STMMAC_RELATIVE_FLEX_PPS config switch
- Add PTP reference clock in stm32mp13x SoCs
- Link to v1: https://lore.kernel.org/r/20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com

---
Gatien Chevallier (3):
      time: export timespec64_add_safe() symbol
      drivers: net: stmmac: handle start time set in the past for flexible PPS
      ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs

 arch/arm/boot/dts/st/stm32mp131.dtsi             |  2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi             |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 34 +++++++++++++++++++++++-
 kernel/time/time.c                               |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)
---
base-commit: 864ecc4a6dade82d3f70eab43dad0e277aa6fc78
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
