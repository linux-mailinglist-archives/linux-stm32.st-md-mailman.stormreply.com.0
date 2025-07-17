Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F3B1487E
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4624DC3F940;
	Tue, 29 Jul 2025 06:48:56 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE84CC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 06:33:32 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H3JZgc002491;
 Thu, 17 Jul 2025 08:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=9+83B+YVA2IQexnB34FIHC
 dUO9DtPuBnRUPeGm8YfyI=; b=zwpw7zysfZNtRoySikCC+q234YX5RB8Bc8BzOF
 cDtWT+fQfA6T7aEMcOYsHie0mGFDvC0iM1PnRYzbDJz8VmPFGg/EiKdo8e/mp2bZ
 cHvBfFD3aDp/3cZYcs92yl/WIA/jPd7Y2xHOTAJlk7s6ruhI7djq2pszUgTkxJY0
 HbGVr9pHp5ACw82ZsuUgbNQZGE/B+bdndLLupIUGgMBisYqFn9DXvWjPoh90kn5L
 2gbaODDtV+2B7JYH/xvuUt9KlbWmwngjhpBg/tJRo6uYRHSIWeYaK4JgAVa7jE3u
 Wi/lgjE8r6ZI/vVh8CdCGqiPlQpi/YCHGvpFdKOcJ03c6sGw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2np3eca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 08:33:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A6D564004C;
 Thu, 17 Jul 2025 08:32:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC0C978C56E;
 Thu, 17 Jul 2025 08:31:10 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 08:31:10 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
Date: Thu, 17 Jul 2025 08:30:40 +0200
Message-ID: <20250717063042.2236524-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state
	helper function
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

We have the helper functions pinctrl_pm_select_default_state and
pinctrl_pm_select_sleep_state.
This patch adds the missing pinctrl_pm_select_init_state function.

The STM32MP2 needs to set the pinctrl to an initial state during
pm_resume, just like in probe. To achieve this, the function
pinctrl_pm_select_init_state is added.

This allows a driver to balance pinctrl_pm_select_sleep_state()
with pinctrl_pm_select_default_state() and
pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resume.

Christian Bruel (2):
  pinctrl: Add pinctrl_pm_select_init_state helper function
  PCI: stm32: use pinctrl_pm_select_init_state() in
    stm32_pcie_resume_noirq()

 drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
 drivers/pinctrl/core.c                  | 13 +++++++++++++
 include/linux/pinctrl/consumer.h        | 10 ++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)


base-commit: 5a972a01e24b278f7302a834c6eaee5bdac12843
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
