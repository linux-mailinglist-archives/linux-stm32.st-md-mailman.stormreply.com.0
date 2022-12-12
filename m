Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79409649A6B
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Dec 2022 09:52:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4125DC65E62;
	Mon, 12 Dec 2022 08:52:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64E3EC65E6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 08:52:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC6svKu006345; Mon, 12 Dec 2022 09:51:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=88WJawgyDIxs82OD3wvGxjMlMWZLJ+s7w1VXxHdtkiw=;
 b=yznbl1sh4pi2WeCugf23IjHf93GiXa5NhufMiP0uoBwgcxiroLuHT0I+Hvl53kHf7H0z
 j6TjQh0v7svPAk35qGrQTlYw9Iq6/36xp/6fBfPAv+Xgym+0+xTYapckDEYWzBUz3gfS
 qeDVX7HI+4kj8xhWhRmQXhWCbDZH8ZaKOliTDuMzmXT3tvaggWIT5L+4W817NEWSFxtY
 f132uf591/dfFgOer//59w0BEfpC/epCXbhhlhoAIz31wnPVaQjn7Y5f+MDl89tDfRRk
 JmL+Z6JkQPxL38HgQvoeaxHRy+d7U4jJdVg62iX+/W+CZGFAVTHH9Wj8Sq8bbn0FdZhB mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcjb598v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:51:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80EEC100039;
 Mon, 12 Dec 2022 09:51:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AE58217B6D;
 Mon, 12 Dec 2022 09:51:47 +0100 (CET)
Received: from localhost (10.201.20.130) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 09:51:47 +0100
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Mon, 12 Dec 2022 09:51:38 +0100
Message-ID: <20221212085142.3944367-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_01,2022-12-08_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, Oleksij Rempel <o.rempel@pengutronix.de>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] Fix qspi pinctrl phandle for stm3mp15
	based boards
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

qspi_bk1_pins_a and qspi_bk2_pins_a pinctrl phandle has been splitted in
2 parts. Only stm32mp157c-ev1.dts has been updated properly.

Fix qspi pinctrl phandle for other boards which are based on stm32mp15x SoC.

Patrice Chotard (4):
  ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcor-som
  ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcom-som
  ARM: dts: stm32: Fix qspi pinctrl phandle for
    stm32mp157c-emstamp-argon
  ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l

Cc: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Reinhold Mueller <reinhold.mueller@emtrion.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org

 arch/arm/boot/dts/stm32mp151a-prtt1l.dtsi        | 8 ++++++--
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 8 ++++++--
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi     | 8 ++++++--
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi     | 8 ++++++--
 4 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
