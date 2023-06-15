Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACF731376
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 11:20:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7405C6A615;
	Thu, 15 Jun 2023 09:20:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8248DC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 09:20:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35F7tDqF022612; Thu, 15 Jun 2023 11:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=fV+MUTfMQZ55uq32Wxz0qSm4NPFewZXzm6azDpLbunA=;
 b=d5BrOOap237y2IVKM1DsnNHEdGbytRp34z96fcvZ1wj/lBTH2wUneTU+XxmbBnebqGxa
 Du7fWNtpHN2orZJHljU4Ztu1HqT8uwodqf98NiDlRq+7/gTugrbUnDXPUsLENY5He6JM
 uoTGN9AlzuttVyr/d/ocBJ5Lp+bVWdlg44UVTZH1Bs/vsdBpZip7Uv8Zp5o/CRjfwx0v
 8eWIvNa3WAI8qeQR/s8Ky294KDQwg2z/RlanR3WLkE7oU90LYWrKbMfF4OnhKE+KOu/b
 lxZEM0ub8cVCYd5DIK6PqPQP7oaXdru0Q9mdH7BS9MPj54/V8dNIsuVx4Jghf9/1Vllf 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7vkfsqb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 11:20:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7DB510004A;
 Thu, 15 Jun 2023 11:20:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8CF121A231;
 Thu, 15 Jun 2023 11:20:07 +0200 (CEST)
Received: from localhost (10.201.21.210) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 11:20:06 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>
Date: Thu, 15 Jun 2023 11:19:55 +0200
Message-ID: <20230615092001.1213132-1-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_06,2023-06-14_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Xiang wangx <wangxiang@cdjrlc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Update MMCI driver for STM32MP25
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

STM32MP25 is a new SoC from STMicroelectronics. The machine was
pushed by Alexandre [1] in his tree.
On this new SoC, the SDMMC peripheral, using PL18x/MMCI driver
has been updated to v3.
The driver has been updated to manage this new version, and the new
features it supports:
* FIFO size increased from 64B to 1kB
* IDMA size alignment/mask updated
* New block gap hardware flow control
* Delay block updated and dependent on SoC

This series was pushed on top of next branch in Ulf's mmc tree, as it
requires feedback clock update patch [2].

[1] https://lore.kernel.org/lkml/59f4a900-34ee-d991-c350-265d38e7c862@foss.st.com/T/
[2] https://lore.kernel.org/r/20230613150148.429828-1-yann.gautier@foss.st.com

Yann Gautier (6):
  dt-bindings: mmc: mmci: Add st,stm32mp25-sdmmc2 compatible
  mmc: mmci: add stm32_idmabsize_align parameter
  mmc: mmci: Add support for sdmmc variant revision v3.0
  mmc: mmci: stm32: manage block gap hardware flow control
  mmc: mmci: stm32: prepare other delay block support
  mmc: mmci: stm32: add delay block support for STM32MP25

 .../devicetree/bindings/mmc/arm,pl18x.yaml    |   6 +
 drivers/mmc/host/mmci.c                       |  35 ++++
 drivers/mmc/host/mmci.h                       |   8 +-
 drivers/mmc/host/mmci_stm32_sdmmc.c           | 149 ++++++++++++++++--
 4 files changed, 181 insertions(+), 17 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
