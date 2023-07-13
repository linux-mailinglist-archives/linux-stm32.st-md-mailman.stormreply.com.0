Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38E768D97
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:16:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA0A1C6B46F;
	Mon, 31 Jul 2023 07:16:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 316BAC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 10:27:45 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qJtXu-0000xP-O8; Thu, 13 Jul 2023 12:27:38 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qJtXs-0003q8-0S; Thu, 13 Jul 2023 12:27:36 +0200
Date: Thu, 13 Jul 2023 12:27:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: linux-imx@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com
Message-ID: <20230713102735.qd3ispdabpdpxawt@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:17 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] i.MX8MP EQOS + 10/100MBit RMII Phy Issue
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

Hi all,

I currently debug an issue regarding the i.MX8MP EQOS in combination
with an 10/100Mbit RMII phy. The phy supplies the 50MHz rmii-refclk and
is working in 100Mbit but stops working in 10Mbit mode.

While my debugging session I found a great IP core signal overview from
STM [1]. The ETH signals matches the ones also listed in the i.MX8MP
refernce manual, therefore I think that the NXP used IP core version
does match the STM one very well.

As seen in the overview [1] the SoC has to provide the correct rx/tx
clocks to the EQOS core which depends on the speed (10/100/1000) and the
interface (mii, rmii, rgmii). The clock selection can be done by the
mac_speed_o[1:0] signals or have to be done separatly via software _but_
it have to be done outside the EQOS IP core.

The NXP i.MX8MP RM has some integration registers layed within the
IOMUXC_GPR1 register to select the interface (MII/RGMII/MII) but no bits
to select correct speed.

Since the RMII 100Mbit case is working I now assume:
 1) NXP has a /2 predivider but no /20 predivder nor a mux to select
    between both. Is this correct?
 2) NXP has all dividers and muxes but did not document these. If so can
    you provide us the registers and bits?

I look forward to here from NXP :)

Regards,
  Marco

PS: - I also checked the Rockchip refernce manual and they do have
      proper clock dividers and muxes like STM.
    - I did test the 10Mbit case on the i.MX8MP-EVK as well which does
      work because they use a RGMII interface which does have a
      different clock handling.

[1] https://community.st.com/t5/stm32-mpus/faq-stm32mp1-how-to-configure-ethernet-phy-clocks/ta-p/49266; figure 83
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
