Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB152F8FFA
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Jan 2021 01:59:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79883C57190;
	Sun, 17 Jan 2021 00:59:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56E6EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Jan 2021 00:59:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 297F722BEA;
 Sun, 17 Jan 2021 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610845155;
 bh=tSvaCGk0aGCNFtliffn2jp5B4ukLkm0tvq5XS8ex8ms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gobF7UkZ6zQb7p6QOThEsdi2tUKlW+6yOgTW721zh8mn/M0OmYbuIQcKbWHxpBmub
 31ZxlQgLccAavCrPdPeqvk2z4zMPR1tbi9xtiY3r3QzA7gXmUZyL3856d0odD6w2AU
 urKIdPrGaikuDtLUHipcnhiXbhkW8zSC49wgVgEePupvomUQ9jFr+SuocseRoh3Gbf
 MrnJclJJdgFdmhDnD6vO8VRD2i16xzKxsJyg6GXbuZ+JWhNVk3vLMqKnugAauaZ21j
 EGFXLf094z5XiyxHdafrOaGavgxbCodtvA1yIQdURqCmNxQcz2mjFvjEe43L/voBHR
 XbspO/7N4mmyg==
Date: Sat, 16 Jan 2021 16:59:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Message-ID: <20210116165914.31b6ca5f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <bf5170d1-62a9-b2dc-cb5a-d568830c947a@siemens.com>
References: <20201106094341.4241-1-vee.khee.wong@intel.com>
 <bf5170d1-62a9-b2dc-cb5a-d568830c947a@siemens.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: change all
 EHL/TGL to auto detect phy addr
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

On Sat, 16 Jan 2021 10:12:21 +0100 Jan Kiszka wrote:
> On 06.11.20 10:43, Wong Vee Khee wrote:
> > From: Voon Weifeng <weifeng.voon@intel.com>
> > 
> > Set all EHL/TGL phy_addr to -1 so that the driver will automatically
> > detect it at run-time by probing all the possible 32 addresses.
> > 
> > Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> > Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
> 
> This fixes PHY detection on one of our EHL-based boards. Can this also
> be applied to stable 5.10?

Sure.

Greg, we'd like to request a backport of the following commit to 5.10.

commit bff6f1db91e330d7fba56f815cdbc412c75fe163
Author: Voon Weifeng <weifeng.voon@intel.com>
Date:   Fri Nov 6 17:43:41 2020 +0800

    stmmac: intel: change all EHL/TGL to auto detect phy addr
    
    Set all EHL/TGL phy_addr to -1 so that the driver will automatically
    detect it at run-time by probing all the possible 32 addresses.
    
    Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
    Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
    Link: https://lore.kernel.org/r/20201106094341.4241-1-vee.khee.wong@intel.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>


It's relatively small, and Jan reports it makes his boards detect the
PHY. The change went in via -next and into Linus's tree during the 5.11
merge window.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
