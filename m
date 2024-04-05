Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8189C760
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C61EC7128A;
	Mon,  8 Apr 2024 14:48:27 +0000 (UTC)
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DA0C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 15:29:04 +0000 (UTC)
Received: from [10.86.249.198] (helo=asas054.asem.intra)
 by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
 (envelope-from <f.suligoi@asem.it>) id 1rslV0-wSFIBV-1Q
 for linux-stm32@st-md-mailman.stormreply.com;
 Fri, 05 Apr 2024 15:29:02 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri,  5 Apr 2024 17:27:54 +0200
Message-Id: <20240405152800.638461-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0370 (UTC)
 FILETIME=[FC3A11A0:01DA876D]
X-smtpcorp-track: 1rs_V0wSFmUV1Q.EuiBjfSQVDX-9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330943; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=PPveenjhvhYMsU4A99FqUOwm3FtKhb+PERao04VTYEk=;
 b=gym0o3GveOUMnR3i3eliEgGi7ULsxlN9N09gQFOp0Oh2mB4MzWC3AavRAyOqM1YwCL5tX
 naLpae4QcXrJRnDdyJlbqY3ZFyl9lwNwcUg5dM3/Fi3jvHTLiUCM1PsHifsWUMI4NtWwtc/
 WbYtzc95MvLUGmqhWoHfNM59/BB9hor6rvMSeF9EO0IIxKA3i1T8ZKAVjN8kdeJBI4+7BLv
 W9fRulckqMKi0XD8HmTp+eJNJmGXZD28+U9Lq4ToSbPzzCcY4zNs4WmlAWOCcydKr6U4t+v
 J6I7DdIMU0X4rUBMQZDIWkSPRxmFMReUpLM4OO/OPPmuOAEApPow40VzKNeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330943; h=from : subject : to
 : message-id : date; bh=PPveenjhvhYMsU4A99FqUOwm3FtKhb+PERao04VTYEk=;
 b=UmwHsHDCbCqZwOR0T12CJgvyaB8iecjCiL364dlB+goKHbm9ik83X8SKe5F2xiVtPwIps
 YW3o+5II623iLhltG+YjMDjjZnBJ+A30ArfnWYHOkyVnPm7Q1obNurIvXM5eu76cbYm0aVH
 uJIx3goC+XXC78pJs/CRrjncKH5eMVTIvldtPMBaMD+hoYY0IA/nyRSwcW2MNl8o1ruRVXO
 WqM+Sl5MRaiu8mSBxRtNaSv+dfrVFC1eAOZNb97xpRIZzMZ5T/QHna6+ER1z6XCIQN0GKEC
 LalXbzu0/l/XYl+9ke7zoRlZXSUxAxGm/i96RVccxIH8alUrTQjnRhWhOSOg==
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:25 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Remove stmmac tx-sched-sp property from
	documentation and DT
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

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

This patch serie remove this property both from the "snps,dwmac.yaml"
documentation and from some device-tree boards files where was still used.

Flavio Suligoi (6):
  dt-bindings: net: snps,dwmac: remove tx-sched-sp property
  arm64: dts: imx8mp-beacon: remove tx-sched-sp property
  arm64: dts: imx8mp-evk: remove tx-sched-sp property
  arm64: dts: imx8mp-verdin: remove tx-sched-sp property
  arm64: dts: qcom: sa8540p-ride: remove tx-sched-sp property
  dts: qcom: sa8775p-ride: remove tx-sched-sp property

 .../devicetree/bindings/net/snps,dwmac.yaml        | 14 --------------
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  1 -
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  1 -
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |  2 --
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |  2 --
 6 files changed, 21 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
