Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5B992D57
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 15:32:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21726C6DD94;
	Mon,  7 Oct 2024 13:32:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97CA0C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 13:32:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497CkqjW013725;
 Mon, 7 Oct 2024 15:32:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=0Uy4D/ioMUiMzIiIOi6IbE
 9dbO4iOUOot3KiGq4Gkrk=; b=FQYoFP41RtoIJO90BLw2X/Grf321yhfVuPrZTl
 cHp0TUNwE9zJYVsJ5oStKFPUGTSCDijVj1Ayt07KLKoZspChvZL6Kjv1IQA86oX2
 79dkxzFDu+//TCgJK4KoDQLr6aL6yvfOkHkRk5DrbWexAqs41/VjQZxe+zqdJQS9
 nPJiwVT1cEv8Bm9qmCXVcTpw0dElnibnWLPSog9ujhNgjpV1UzPG7tqNDJHh7QLs
 JgIew7YTxpO42uye0pZbjtOyy02yXOqTKDjsMA3A4JRaUtVZP/v5w1GaDMbW6v2Z
 UUW6ZqysHBUlVFt8v9RFjC0DI8+mVQqoiEWondGsSeiZ0mCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xs194nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 15:32:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AED624004A;
 Mon,  7 Oct 2024 15:30:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B74C279E77;
 Mon,  7 Oct 2024 15:27:45 +0200 (CEST)
Received: from localhost (10.48.86.225) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:27:45 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>
Date: Mon, 7 Oct 2024 15:27:17 +0200
Message-ID: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] Add support for stm32mp25x RNG
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

This patchset adds support for the Random Number
Generator(RNG) present on the stm32mp25x platforms.
On these platforms, the clock management and the RNG
parameters are different.

While there, update the RNG max clock frequency on
stm32mp15 platforms according to the latest specs.

Tested on the stm32mp257f-ev1 platform with a deep
power sequence with rngtest before/after the sequence with
satisfying results.

Same was done on stm32mp135f-dk to make sure no regression was added.

On stm32mp157c-dk2, I didn't perform a power sequence but the rngtest
results were satisfying.

Gatien Chevallier (4):
  dt-bindings: rng: add st,stm32mp25-rng support
  hwrng: stm32 - implement support for STM32MP25x platforms
  hwrng: stm32 - update STM32MP15 RNG max clock frequency
  arm64: dts: st: add RNG node on stm32mp251

 .../devicetree/bindings/rng/st,stm32-rng.yaml | 41 ++++++++-
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 10 +++
 drivers/char/hw_random/stm32-rng.c            | 83 +++++++++++++++++--
 3 files changed, 126 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
