Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB068C4D9B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 10:20:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0CB2C5E2D1;
	Tue, 14 May 2024 08:20:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E71FFC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ea1x5TthVhL/eZxigK69/rLLPNFPYqSPY6iTUTHpgq0=; b=ScVB/UTZKYfbLIhP88h9zRctxV
 QhxOy/qSNv1dFvvhYjvTjEP3YGli81IMYiketsStZ35DwUthRMiQ32DfQR4gkD2x/otafT7by4P6o
 7GW/s/wrPtRqXkRi5vUazwBx/K3c3lzoJdVpYm0a1XSDXpeCTEh+DGaPYISnuahl8ZySHq495Ysit
 FAlY7GuDF9elqWyfjQJY4txqyF2D4FLPBiALxM3Pg+NaA7Ji5pPbSXrSiOADkRWd0eDX+FiLyOK74
 +BzSodPafKVsUERvgUevmNWxaMmVGbbYQU3eov/lx3WECstH+vs7Djr3479CTv1B87L1zWrOw0/4T
 py35oo2g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58764)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s6nNy-0002jd-0i;
 Tue, 14 May 2024 09:19:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s6nNw-0006vW-Hl; Tue, 14 May 2024 09:19:44 +0100
Date: Tue, 14 May 2024 09:19:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <ZkMeoB05cV/pK89B@shell.armlinux.org.uk>
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
 <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
 <08b9be81-52c9-449d-898f-61aa24a7b276@lunn.ch>
 <CAMdnO-+V2npKBoXW5o-5avS9HP84LV+nQkvW6AxbLwFOrZuAGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-+V2npKBoXW5o-5avS9HP84LV+nQkvW6AxbLwFOrZuAGg@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
 2/2] net: stmmac: PCI driver for BCM8958X SoC
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

On Mon, May 13, 2024 at 10:32:19AM -0700, Jitendra Vegiraju wrote:
> +==================================================+
> Since the legacy fixed link cannot support 10G, we are initializing to
> fixed speed 1G.

Or to put it a different way... "I can't represent my hardware so I'm
going to hack around with the kernel in a way that lies to the kernel
about what the hardware is doing but it'll work for me!"

Sorry, but no, this isn't some hacky github project, this is the kernel
where we engineer proper solutions.

I think I've just lost all interest in this... 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
