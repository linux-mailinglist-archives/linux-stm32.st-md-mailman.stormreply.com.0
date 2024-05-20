Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B029F8C9E87
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2024 16:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 708D5C6C855;
	Mon, 20 May 2024 14:01:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D72DDC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2024 14:01:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KDtKnN018364;
 Mon, 20 May 2024 16:01:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=/eWZVhr
 f80If0Zu1V4FcVn5XIUfeeeYvTullFqKWqvU=; b=xNqjhzzMZ0EpV3j+0L2WojM
 vfYR+H6ZE3j8r0HKFHK1FlGd8CHsdqS8epSHMIeq5ZOlbQJmJBo0b03hmFVsfm1S
 HyId82NCOKuudcy7bH5x9gP7CYmpzSkmEpssEkraWxRXo8A53JnfdkyTgPmxJjHW
 6vmdqz8tukQwNVpLlF27xDuAlAXdXAjWpLoubULMldK+wdcVM9gD8wJCmsTKObm7
 QICSkm+yUzNd7wuZBv208r8AFgcc8d9Ms2hMh9jOS5GBJ4ttL/MpDrBHp7TIfJWP
 D77eAg7C7QuVZnVsIamf4jZ9CMbmrXg9gtSfLWPf4QeX5j7uwe7NkdZ59HRpWUA=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n337bnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 16:01:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D9CC4004A;
 Mon, 20 May 2024 16:01:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F02D8222C81;
 Mon, 20 May 2024 16:00:35 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 16:00:35 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 May 2024 16:00:21 +0200
Message-ID: <20240520140024.3711080-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] arm64: dts: st: add usart nodes for
	stm32mp25
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

STM32MP25 got the same serial hardware block as STM32MP1x but with two improvements:
 - TX and RX FIFO have been extended to 64 bytes.
 - one instance more than in STM32MP1x series (4x usart and 5x uart).
 
STM32MP257F-EV1 board has one usart used by console and one usart on IO port.

Valentin Caron (3):
  arm64: dts: st: add usart nodes on stm32mp25
  arm64: dts: st: add usart6 pinctrl used on stm32mp257f-ev1 board
  arm64: dts: st: add usart6 on stm32mp257f-ev1 board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 41 +++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 72 +++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 10 +++
 3 files changed, 123 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
