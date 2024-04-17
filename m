Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD68A8545
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 15:50:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5393DC6B444;
	Wed, 17 Apr 2024 13:50:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EAC4C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTuNyDC74aMGnpALnaMRzG0hlRkuyuTWVng3Ktfqx4k=; b=fphK7jFfOdWOFdlS8QMEUYrK21
 zM/EuLgy7KpOwoiTXGNn3ntuLskQwCxS8ak+QSpfEngqmG5XEQcwW6xETWOMgBakoECI2fzWCEz+A
 gDwl3kKuS189hFLPCxjyMmCQnqioD02G0m/iBEvZgpBqpIcWJVezU4u6l8/lyPa7lbtUpEMC32VpZ
 +TbKirOE9Igb6/7A5kzeCgIZNzoXk6xtV4WhNTYyRE/NNtKMsFD4ptwd7BgL1w3UTxD0LOpj7CX9L
 ENhVrEKvh00XSc03nP061krgyYLpdih4+rK392zB/cTj7b1hLYoameFGbVBdxZWDRmxPgIk+K0tw7
 1UKHfcQA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52554)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rx5g7-0003JF-35;
 Wed, 17 Apr 2024 14:50:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rx5g1-00060W-Pa; Wed, 17 Apr 2024 14:50:17 +0100
Date: Wed, 17 Apr 2024 14:50:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <Zh/Tmarryr4TzHIA@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
 <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
 <8a8a8e8b-8256-4d33-a39b-9e3cbc4ccff2@arm.com>
 <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e762eb1-864e-4bb5-ab5d-debeac19c8fa@linaro.org>
Cc: kvm@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-input@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Olivia Mackall <olivia@selenic.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 James Clark <james.clark@arm.com>
Subject: Re: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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

On Wed, Apr 17, 2024 at 03:29:26PM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2024 12:41, Suzuki K Poulose wrote:
> > + Greg
> > 
> > 
> > Hi Krzysztof,
> > 
> > On 30/03/2024 18:00, Krzysztof Kozlowski wrote:
> >> On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
> >>>
> >>> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
> >>>> Merging
> >>>> =======
> >>>> All further patches depend on the first amba patch, therefore please ack
> >>>> and this should go via one tree.
> >>>>
> >>>> Description
> >>>> ===========
> >>>> Modules registering driver with amba_driver_register() often forget to
> >>>> set .owner field.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [01/19] amba: store owner from modules with amba_driver_register()
> >>>          (no commit info)
> >>
> >> Patchset applied here:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba
> > 
> > How do you plan to push this ? Given this affects most of the drivers/, 
> > do you plan to send this to Greg ? We have changes in the coresight
> > tree that would conflict with this "tag" ( I haven't merged them yet, 
> > but is in my local queue). I want to make sure we can avoid the
> > conflicts. I am happy to merge this to my local tree and base the
> > changes on this, if this is going in for v6.10 and all are in agreement.
> 
> I pushed it to arm-linux patches but it hasn't been picked up.
> 
> I propose you take entire set then.

You are again being, IMHO, abrasive with your attitude. So far, every
interaction with you has been abrasive and bordering on abusive.

You haven't asked me whether I will take them. I will - just not at the
moment because 

I HAVE MEDICAL APPOINTMENTS LAST WEEK AND THIS WEEK WHICH MEAN I AM
NOT SPENDING ALL MY TIME ON THE KERNEL.

Have some bloody patience rather than behaving in your standard
objectionable manner.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
