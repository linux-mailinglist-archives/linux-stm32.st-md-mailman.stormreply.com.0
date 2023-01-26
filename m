Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887E67C227
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jan 2023 02:02:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE856C69058;
	Thu, 26 Jan 2023 01:02:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA446C69056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 01:02:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC1661707;
 Thu, 26 Jan 2023 01:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CD0C433EF;
 Thu, 26 Jan 2023 01:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674694946;
 bh=oWj+PSWQniAByi2cEVk6gphILiQ71eH7FK0qeFS23+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQ1JAaWWu4tBloRt05IW2/Rd/CijyxK2gYDVZDi9101pLmoOr/xZ1PoOVPsQ5IP2p
 jdQXZn9KdXsd6P0EQY31hllBS9Tmyzecsf2lDQj+CPR7ofIbGWUKRNm8ZVCP6uwbDj
 xXQanYSWA5pU7NwUj69eByatbkkfGYMqwTfOOyMFW03+2H/JuQIyAUY0WT3Qlr4ttb
 w8ZMZLJoOPwoxocV6KBF3TY9/z+ZqMR3rxw6QE2n47Vu2Kp7/K3U/xAhwdQ32jFYDH
 76r4SpaPtbIBdfyWprpW7ou4mAjatM5X0dIaTI/j2er/Eu45EXlED4X83b12v2RYT/
 Hr+PUeNrmb/eg==
Date: Thu, 26 Jan 2023 09:02:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>
Message-ID: <20230126010214.GO20713@T480>
References: <20230113033347.264135-1-xiaoning.wang@nxp.com>
 <6ee1798af93cc5b8c46611ecca941ee57481358e.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ee1798af93cc5b8c46611ecca941ee57481358e.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kernel@pengutronix.de, peppe.cavallaro@st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 shenwei.wang@nxp.com, wei.fang@nxp.com, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 Clark Wang <xiaoning.wang@nxp.com>, festevam@gmail.com,
 richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 0/7] Add eqos and fec support for imx93
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

On Tue, Jan 17, 2023 at 09:27:56AM +0100, Paolo Abeni wrote:
> Hi,
> 
> On Fri, 2023-01-13 at 11:33 +0800, Clark Wang wrote:
> > This patchset add imx93 support for dwmac-imx glue driver.
> > There are some changes of GPR implement.
> > And add fec and eqos nodes for imx93 dts.
> > 
> > Clark Wang (7):
> >   net: stmmac: add imx93 platform support
> >   dt-bindings: add mx93 description
> >   dt-bindings: net: fec: add mx93 description
> >   arm64: dts: imx93: add eqos support
> >   arm64: dts: imx93: add FEC support
> >   arm64: dts: imx93-11x11-evk: enable eqos
> >   arm64: dts: imx93-11x11-evk: enable fec function
> > 
> >  .../devicetree/bindings/net/fsl,fec.yaml      |  1 +
> >  .../bindings/net/nxp,dwmac-imx.yaml           |  4 +-
> >  .../boot/dts/freescale/imx93-11x11-evk.dts    | 78 +++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx93.dtsi      | 48 ++++++++++++
> >  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 55 +++++++++++--
> >  5 files changed, 180 insertions(+), 6 deletions(-)
> 
> It's not clear to me if the whole series should go via netdev. I
> think/fear such option could cause later conflicts for Linus. Does it
> make sense to split this in 2 chunks, and have only the first 3 patches
> merged via netdev?

I share the same concern here.

David,

Could you *not* apply DTS patches in the future?  People often include
driver changes and corresponding DTS ones in a single series to ease
cross reviewing and testing.  If picking selected patches from a series
could a problem for your applying robot, we should probably start asking
people to split change-sets.

Shawn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
