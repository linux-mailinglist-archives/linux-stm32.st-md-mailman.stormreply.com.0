Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B8869DE3
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:39:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC54BC6C841;
	Tue, 27 Feb 2024 17:39:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E191C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:39:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RBiGf2022677; Tue, 27 Feb 2024 18:38:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=vv7xjnx
 3S8lRZ/RtrOHHgb66VqkumPKVgXrCY0yTp0k=; b=Kltus1ML//jRWONW930Dvyl
 M2OQWMQ+qoVnp9pisuMzLU8kmx9Vp/gsJrhM33MmzFLZknFkYpk1cypDE4BudfaN
 LcRbFl28niKIBTEERV7NHwXdspuDXR6H3ZQdActZVOEyzhC0iAmXjIm4K8Wg/azj
 bPf7aC5nlei2eOSLomgpHIG8thdvZDec7hymLi93UoboXa8h+0MDiFzYgn2HTiQt
 VxDKZyJBej2ZyDjUOhrLTbwCyRsGt7bzEDHZZA3APH4oNr1ktLM7E/Hwd9X3Vv3S
 WHTUC3ZrKZ1/41QPLE5A18mO0A0+TiSwVXppsbiye8UqW/cAMJZqAOW50tF3Ycg=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4csbf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:38:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6BFF640045;
 Tue, 27 Feb 2024 18:38:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D3B742AD12D;
 Tue, 27 Feb 2024 18:38:17 +0100 (CET)
Received: from localhost (10.252.26.109) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 18:38:15 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <william.gray@linaro.org>
Date: Tue, 27 Feb 2024 18:37:52 +0100
Message-ID: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.26.109]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_03,2024-02-27_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 00/11] counter: Add stm32 timer events
	support
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

Improves the stm32 timer counter driver by introducing new signals,
e.g. counting frequency, and missing channels.

It also adds support for interrupt based events using the chrdev interface.
Two event types are added in this series: overflows and capture.

Up to now, stm32 timer counter driver focused mainly on quadrature
encoder feature on channel 1 & 2. It was limited to timers that has
the HW quadrature encoder.

With this series, all timer instances can be enabled for:
- Quadrature encoder on channel 1 and channel 2 (when supported in HW)
- Simple counting on internal clock
- Capture counter value when rising and falling edges are observed at
  channel 1 to channel 4 input (number of channels varies depending on
  the timer instance used)
- Push overflow and/or capture events through the chardev interface

Changes in v4:
- Introduce new COUNTER_COMP_FREQUENCY() macro
- Mainly update two last patchs, to address William's review comments
  (details in each patch)

Changes in V3:
- This series has been split [1] and renamed.
[1] https://lore.kernel.org/lkml/20230922143920.3144249-1-fabrice.gasnier@foss.st.com/
- Watch events tool patch applied, hence dropped from this series
- Refactor / split several patches
- Keep original signals order, to avoid breaking existing user space
- Don't adjust number of signals: adopt static configuration. rely on
  error mechanism to manage diversity across STM32 Timers instances.

Changes in v2:
- counter fix and improvement patch applied, hence dropped in v2 series
- mfd patch applied, hence dropped in v2 series
- revisit watch events tool (mainly command line interface)
- add one patch to rename STM32 Timer counter
- various review comments from v1

Fabrice Gasnier (11):
  counter: Introduce the COUNTER_COMP_FREQUENCY() macro
  counter: stm32-timer-cnt: rename quadrature signal
  counter: stm32-timer-cnt: rename counter
  counter: stm32-timer-cnt: adopt signal definitions
  counter: stm32-timer-cnt: introduce clock signal
  counter: stm32-timer-cnt: add counter prescaler extension
  counter: stm32-timer-cnt: add checks on quadrature encoder capability
  counter: stm32-timer-cnt: introduce channels
  counter: stm32-timer-cnt: probe number of channels from registers
  counter: stm32-timer-cnt: add support for overflow events
  counter: stm32-timer-cnt: add support for capture events

 drivers/counter/stm32-timer-cnt.c | 461 +++++++++++++++++++++++++++++-
 include/linux/counter.h           |   3 +
 include/linux/mfd/stm32-timers.h  |  13 +
 3 files changed, 463 insertions(+), 14 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
