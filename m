Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13F4266BC
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 11:26:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC861C597B3;
	Fri,  8 Oct 2021 09:26:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1F1EC5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 09:26:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9DB0D6E;
 Fri,  8 Oct 2021 02:26:04 -0700 (PDT)
Received: from monolith.localdoman (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEA153F70D;
 Fri,  8 Oct 2021 02:26:01 -0700 (PDT)
Date: Fri, 8 Oct 2021 10:27:41 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Punit Agrawal <punitagrawal@gmail.com>
Message-ID: <YWAO/gibeTDelPVq@monolith.localdoman>
References: <8e33c244-b786-18e8-79bc-407e27e4756b@arm.com>
 <87zgrk19yb.fsf@stealth>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zgrk19yb.fsf@stealth>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 p.zabel@pengutronix.de, netdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, lgirdwood@gmail.com, joabreu@synopsys.com,
 michael.riesch@wolfvision.net, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [BUG] Ethernet broken on rockpro64 by commit
 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable
 warnings")
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

Hi Punit,

On Fri, Oct 08, 2021 at 12:17:48PM +0900, Punit Agrawal wrote:
> Alexandru Elisei <alexandru.elisei@arm.com> writes:
> 
> > (Sorry I'm sending this to the wrong person, this is what I got
> > scripts/get_maintainer.pl for the file touched by the commit)
> >
> > After commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
> > pm_runtime_enable warnings"), the network card on my rockpro64-v2 was left unable
> > to get a DHCP lease from the network. The offending commit was found by bisecting
> > the kernel; I tried reverting the commit from current master (commit 0513e464f900
> > ("Merge tag 'perf-tools-fixes-for-v5.15-2021-09-27' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux")) and the network card
> > was working as expected.
> >
> > It goes without saying that I can help with testing the fix and
> > further diagnosing.
> 
> A fix was recently merged for this (see aec3f415f724 ("net: stmmac:
> dwmac-rk: Fix ethernet on rk3399 based devices") and should show up in
> the next rc. Please shout out if that doesn't fix the broken ethernet
> for you.

I can confirm that it's now working, many thanks.

Alex

> 
> Thanks,
> Punit
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
