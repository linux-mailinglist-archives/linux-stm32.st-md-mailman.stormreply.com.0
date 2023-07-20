Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFB768DBD
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B398C6C84D;
	Mon, 31 Jul 2023 07:17:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FE9FC6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 06:46:59 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qMNQt-0002wa-Kg; Thu, 20 Jul 2023 08:46:39 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1qMNQq-000153-7Z; Thu, 20 Jul 2023 08:46:36 +0200
Date: Thu, 20 Jul 2023 08:46:36 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230720064636.5l45ad64kwwgd2iw@pengutronix.de>
References: <20230718132049.3028341-1-m.felsch@pengutronix.de>
 <20230718132049.3028341-2-m.felsch@pengutronix.de>
 <20230719211235.1758bbc0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719211235.1758bbc0@kernel.org>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: kernel@pengutronix.de, joabreu@synopsys.com, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: add support
	for phy-supply
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

Hi,

On 23-07-19, Jakub Kicinski wrote:
> On Tue, 18 Jul 2023 15:20:49 +0200 Marco Felsch wrote:
> > Add generic phy-supply handling support to control the phy regulator to
> > avoid handling it within the glue code. Use the generic stmmac_platform
> > code to register a possible phy-supply and the stmmac_main code to
> > handle the power on/off.
> > 
> > Changelog
> > ---
> > 
> > v2:
> > - adapt stmmac_phy_power
> > - move power-on/off into stmmac_main to handle WOL
> > - adapt commit message
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> 
> Format should be:
> 
> Bla bla bla
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog
> 
> v2:
>  bla bla bla
> 
> 
> Please fix and rebase because the current version does not apply to
> net-next/main.

Sure, I thought the changelog should be part of the commit message in
net-dev therefore I included it. Unfortunately I used --- as underline
:/

I will fix this and rebase it on-top of net-next/main.

Regards,
  Marco


> -- 
> pw-bot: cr
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
