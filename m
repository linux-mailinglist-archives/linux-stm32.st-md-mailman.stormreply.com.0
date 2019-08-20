Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C726E96305
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 16:53:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98EC5C35E02;
	Tue, 20 Aug 2019 14:53:46 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B972C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1566312824; bh=py02IQSJ2y0fP6mE701P/T7DLz5rHrBBsdi+SrYtmAQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ihT3jfMZjyNKOOmCAeVt8DagRKcxrgxjzBtMNrrsWuA2kW/0aWuyGUxkSeqV3zmDF
 DR8RbXPdWB0aunx4ASN4un+qj3dbjsy6VQ9bOV82+6a5KJ1i6hIjs1eEfFfqrBW1cW
 4zQmFKTHoUOoKsCOJgwVFpzgGDvjG2WzldaFI9rU=
From: megous@megous.com
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 20 Aug 2019 16:53:37 +0200
Message-Id: <20190820145343.29108-1-megous@megous.com>
MIME-Version: 1.0
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Add ethernet support for Orange Pi 3
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

From: Ondrej Jirman <megous@megous.com>

This series implements ethernet support for Xunlong Orange Pi 3 board, by:

- making small cleanups of existing dwmac-sun8i code
- adding DT bindings docummentation
- adding support for phy-io-supply to dwmac-sun8i code
- adding DT configuration for Orange Pi 3 board

For some people, ethernet doesn't work after reboot because u-boot doesn't
support AXP805 PMIC, and will not turn off the etherent PHY regulators.
So the regulator controlled by gpio will be shut down, but the other one
controlled by the AXP PMIC will not.

This is a problem only when running with a builtin driver. This needs
to be fixed in u-boot and should not prevent these patches from being
merged.

This evolved out of the Orange Pi 3 patches series, as I didn't want
to stretch that out any longer.

Please take a look.

thank you and regards,
  Ondrej Jirman

Ondrej Jirman (6):
  dt-bindings: net: sun8i-a83t-emac: Add phy-supply property
  dt-bindings: net: sun8i-a83t-emac: Add phy-io-supply property
  net: stmmac: sun8i: Use devm_regulator_get for PHY regulator
  net: stmmac: sun8i: Rename PHY regulator variable to regulator_phy
  net: stmmac: sun8i: Add support for enabling a regulator for PHY I/O
    pins
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../net/allwinner,sun8i-a83t-emac.yaml        |  8 ++
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 40 ++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 74 ++++++++++++-------
 3 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.22.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
