Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF6691A1E6
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 10:52:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D65C71289;
	Thu, 27 Jun 2024 08:52:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16624C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:52:15 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R6suEc025136;
 Thu, 27 Jun 2024 10:50:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=UEPDtkwS6mWQxqmVu+aQzn
 Nw+twWmzwbU06XGY49NsQ=; b=BUUDFCyWmif/XpmyOVTOfW0kNwDNQ/AfzhHnwS
 GwvCmHFguF5wM0+QycdeniiC8hwLqKzLuXiqEMh9P/gBnSV/Mj97TXgaGj7aXO+Y
 Z7gUoa8lX9zsPgoIvjATGV9F/2JIo9caF6oVWKsD3JVJ07AfiwJhGSpONwoU/cBr
 09qqkoi9iTruFfzL8WK7rygh+Dk+aYR9KDY7r7YwYuGqt0apM2hQyWz9mpKm3RBf
 JC+dJOm7HE+eiH5iyZEB5RVhpj0JPB3duA80y4drfG1595Zb+bYn9yRxJ2r9O830
 4TbbDGSMmCzbkYo1XHGilnP1n/EZkb5gJTveG3QQq3qLY+yQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860tbfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 10:50:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B238E40054;
 Thu, 27 Jun 2024 10:50:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 686BA2138E3;
 Thu, 27 Jun 2024 10:49:26 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 27 Jun
 2024 10:49:25 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Thu, 27 Jun 2024 10:49:15 +0200
Message-ID: <20240627084917.327592-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_05,2024-06-25_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH 0/2] Fixes for stm32-dwmac driver fails to probe
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

Mark Brown found issue during stm32-dwmac probe:

For the past few days networking has been broken on the Avenger 96, a
stm32mp157a based platform.  The stm32-dwmac driver fails to probe:

<6>[    1.894271] stm32-dwmac 5800a000.ethernet: IRQ eth_wake_irq not found
<6>[    1.899694] stm32-dwmac 5800a000.ethernet: IRQ eth_lpi not found
<6>[    1.905849] stm32-dwmac 5800a000.ethernet: IRQ sfty not found
<3>[    1.912304] stm32-dwmac 5800a000.ethernet: Unable to parse OF data
<3>[    1.918393] stm32-dwmac 5800a000.ethernet: probe with driver stm32-dwmac failed with error -75

which looks a bit odd given the commit contents but I didn't look at the
driver code at all.

Full boot log here:

   https://lava.sirena.org.uk/scheduler/job/467150

A working equivalent is here:

   https://lava.sirena.org.uk/scheduler/job/466518

I delivered 2 fixes to solve issue.

Christophe Roullier (2):
  net: stmmac: dwmac-stm32: Add test to verify if ETHCK is used before
    checking clk rate
  net: stmmac: dwmac-stm32: update err status in case different of
    stm32mp13

 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)


base-commit: f261aa15b2ca73d4f9dbb8b116b16743237edad9
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
