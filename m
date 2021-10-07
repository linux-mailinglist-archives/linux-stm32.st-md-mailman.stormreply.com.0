Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C81425012
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Oct 2021 11:28:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BC11C597B3;
	Thu,  7 Oct 2021 09:28:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BCD4C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 09:28:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DCBB1FB;
 Thu,  7 Oct 2021 02:28:53 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B77F3F766;
 Thu,  7 Oct 2021 02:28:51 -0700 (PDT)
Date: Thu, 7 Oct 2021 10:30:25 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Jakub Kicinski <kuba@kernel.org>, broonie@kernel.org
Message-ID: <YV6+G0glwnwf+N8G@monolith.localdoman>
References: <YV3Hk2R4uDKbTy43@monolith.localdoman>
 <20211006173332.7dc69822@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006173332.7dc69822@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, lgirdwood@gmail.com, joabreu@synopsys.com,
 michael.riesch@wolfvision.net, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [BUG RESEND] net: stmmac: dwmac-rk: Ethernet
 broken on rockpro64 by commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix
 unbalanced pm_runtime_enable warnings")
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

On Wed, Oct 06, 2021 at 05:33:32PM -0700, Jakub Kicinski wrote:
> On Wed, 6 Oct 2021 16:58:11 +0100 Alexandru Elisei wrote:
> > Resending this because my previous email client inserted HTML into the email,
> > which was then rejected by the linux-kernel@vger.kernel.org spam filter.
> > 
> > After commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
> > pm_runtime_enable warnings"), the network card on my rockpro64-v2 was left
> > unable to get a DHCP lease from the network. The offending commit was found by
> > bisecting the kernel; I tried reverting the commit from v5.15-rc4 and the
> > network card started working as expected.
> 
> We have this queued up in netdev/net:
> 
> aec3f415f724 ("net: stmmac: dwmac-rk: Fix ethernet on rk3399 based devices")
> 
> It should hit stable soon.

Hi Mark, Jakub,

Thank you both for your replies, will keep an eye out for when that patch hits
mainline.

Thanks,
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
