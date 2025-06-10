Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52539AD3B2B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 16:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07EB8C3F943;
	Tue, 10 Jun 2025 14:33:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 741A7C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 14:32:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEan013925;
 Tue, 10 Jun 2025 16:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=xDfYRyarrgvvh2wy//yUSD
 fOPipUMyzMYfOpAjRJTT4=; b=shhGGg9fg6nZp0bUBgZ6LA4w/T2bgVnrGKl7My
 Jcz/lZxX7qoPiLbSYEdRNYhZfUm+tCbcw4eiC9To21hJ8fGTou131GXJKLV4369I
 Qh2G0li0wZQhqJ/wKsDEHzf/nCedmOtH7cpFDmYV8Eh9MGQQQYSoJgLav3TcPBdx
 v4oh9cAiuDKx1PUyP3yFylItiVPrUQR75Qg0GQ/FfY5JmoC0gq/80aCaqR1KNtD5
 Dsiz06ANiJWCNuXoMINxlYLT0zYM+kT9u4hVTrZdUPlxzQgeviibbhfT8TnWTAqp
 vFbN7tSOD/H4k3mWGeg8zzJBYUHkcj5eNGjBgMDRDraVoj0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahmnmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 16:32:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 588874005F;
 Tue, 10 Jun 2025 16:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34C16B36E48;
 Tue, 10 Jun 2025 16:30:46 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 16:30:45 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Date: Tue, 10 Jun 2025 16:30:37 +0200
Message-ID: <20250610143042.295376-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF,
	module support
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

This v2 is a subset of the v1, split-out to simplify the review.

This subset:
- adds support for irq affinity,
- adds support for Resource Isolation Framework (RIF),
- allows compile the driver as module,
- adds entry in MAINTAINERS for STM32 pinctrl,
- minor cleanups.

Please notice that the entry in MAINTAINERS already excludes the pinctrl
driver HDP that has a different maintainer but it's still under review in
https://lore.kernel.org/lkml/20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com/

Changes v1 -> v2 subset:
- rebased on v6.16-rc1,
- added include export.h required by v6.16-rc1,
- change in Kconfig to avoid default build on COMPILE_TEST,
- added entry in MAINTAINERS,
- Link to v1: https://lore.kernel.org/lkml/20241022155658.1647350-1-antonio.borneo@foss.st.com/


Antonio Borneo (3):
  pinctrl: stm32: Declare stm32_pmx_get_mode() as static
  pinctrl: stm32: Add RIF support for stm32mp257
  MAINTAINERS: Add entry for STM32 pinctrl drivers and documentation

Cheick Traore (1):
  pinctrl: stm32: Manage irq affinity settings

Stephane Danieau (1):
  pinctrl: stm32: Allow compile as module for stm32mp257

 MAINTAINERS                                |   8 ++
 arch/arm64/Kconfig.platforms               |   1 -
 drivers/pinctrl/stm32/Kconfig              |   6 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c      | 135 ++++++++++++++++++++-
 drivers/pinctrl/stm32/pinctrl-stm32.h      |  19 ++-
 drivers/pinctrl/stm32/pinctrl-stm32mp257.c |  15 ++-
 6 files changed, 168 insertions(+), 16 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
