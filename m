Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A2B10A3D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jul 2025 14:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F905C32EB0;
	Thu, 24 Jul 2025 12:33:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECEE4C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 12:33:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OBYXDI023834;
 Thu, 24 Jul 2025 14:33:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=sqXMGBHlqKjqzJ5Uc1Wd79
 zCDuysqgTw75+tS95tfVg=; b=L0kMObykL85QFNblKq7i/emOOIjVASM+0GP3bf
 OZPA6MaVRzfKHEeAYXnk62xPnzdhv2y06FUfKOA8sMPUcGXpp/8xg8VuSj9r0g5c
 ccrI+DbWmOzFFi1E4CJ4fZEhNQ6GZpcFTgBTsyu3K6ozH/cSjQXMuA/zkHWnq5RW
 FVxDEZbVr899jvyjONW47gXBAhfAEGoYHFAwAqXvjnAbRzf5AKmFM1ztqLO0J7Ii
 KNf+n806Bu/RsTmv5l6Vl+Dp6unql62e3U8joruODm0BtdC0vfKZccm68unwOKRK
 9iwn4b1nVOlZaOjO0mmp+GF3qN59qDjzDYK4Fs/n05gVC71A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4xgp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jul 2025 14:33:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D41340044;
 Thu, 24 Jul 2025 14:32:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04A915E2FFB;
 Thu, 24 Jul 2025 14:31:39 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 14:31:38 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 24 Jul 2025 14:31:17 +0200
Message-ID: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJUngmgC/x3MQQqDMBBG4avIrA2kEWnpVYrIqP+0A5KGJEhAc
 neDy2/x3kkJUZHo3Z0UcWjSv2949B2tP/ZfGN2ayVk32qcbTMTOWQ/MsqPMISQjzE6WleU1jNS
 6ECFa7ueHPLLxKJmmWi/w3qndbQAAAA==
X-Change-ID: 20250723-relative_flex_pps-faa2fbcaf835
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=gatien.chevallier@foss.st.com; h=from:subject:message-id;
 bh=4FAUw/jtnxHapOktpghfP7Z0CEuQ7323akubFkWFyg4=;
 b=owEB7AET/pANAwAKAar3Rq6G8cMoAcsmYgBogiepus5bsLZjIQ054I8ikw2Hg1ohSh2Wm9N6g
 /9R/6648pSJAbIEAAEKAB0WIQRuDsu+jpEBc9gaoV2q90auhvHDKAUCaIInqQAKCRCq90auhvHD
 KBMQC/Yi/2t2mlpIQKBnp5ZrjZ0p3wScXMAyboypYOMAqKvH6vOef5EkkWIbSdfjczmfxBlrEy+
 Lg1GqErsxW0M3uRIqV02awfKoCxo72WbFiJvKDYFLaRrQLVgTTnd+dzF9iyDfQR8JDOJ/DZKT/0
 52yfZaQw7tjitIT2tTrnbSzZnpKTcTkDkYhqXKva/hMSO+iTWQlTZLc5QLgMUSOsQZg8gi62bBv
 6jQAQoqIM/T4sDhKvGW//Xg6w5TQNC+tfskYyBtxtBBI+lq9nw3UIWPnjR1Q2RH+uI1ruQGCpxx
 BqsfXTABNYY1GMmYsia+pdrakXZipOKe3Jk4t4ECntK4NpWpJ087k0sdtGkFjQotPL3B5Y5p7OC
 /jZfbJ2vWZu5H6Qp0CkzHhLHJby7w8y5TqVneP3hQaa1PslrV8Ir9KxswU6F3wt+Wf4nOvZai+2
 xZYxZ6ICMKpeBrRJqq1Pjznlpf7ZCl3rOtVMcQlO4GSyzWRRMO4gNnAdQwb1/WmBjmkw==
X-Developer-Key: i=gatien.chevallier@foss.st.com; a=openpgp;
 fpr=6E0ECBBE8E910173D81AA15DAAF746AE86F1C328
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: allow generation of
 flexible PPS relative to MAC time
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

Because passing such an argument is tedious, introduce
STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
is added to the args to the stmmac_ptp driver.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered before and after setting
STMMAC_RELATIVE_FLEX_PPS:

Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period

After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Gatien Chevallier (2):
      drivers: net: stmmac: add STMMAC_RELATIVE_FLEX_PPS
      net: stmmac: select STMMAC_RELATIVE_FLEX_PPS for stm32 SoCs

 drivers/net/ethernet/stmicro/stmmac/Kconfig      | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 13 +++++++++++++
 2 files changed, 23 insertions(+)
---
base-commit: 8aad37d16cffb6c0940d9b213456a2733a786f57
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
