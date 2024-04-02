Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF543894F4D
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 11:57:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8645C6B45B;
	Tue,  2 Apr 2024 09:57:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08E3FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fVDBciGSJCM1lbFvz9XZk/dHqAfnqhC4b511eXifG+U=; b=PQ7ZitOVReHmXLRhmyYqDikBKr
 d78kgUjDj6zH+/5NuUS16O5s+2GmJiYRd5dtkS2/QsHucNII9FSlsge6iLc+aEJB643S6pCSGk3FU
 L8kmFJoYi/vAJhWz9IO//GGAmzhbc3OZHPBrwqoYCfD6gEF6gsPpAKuEaCNTlnGs81Rq6UJh26RZZ
 NTz4B7T4W9qe1h966HMzRcIMbPHv0K8vCDa/Yu2+5LgAD+NQRU5SRgSPYSe7A7ZKWyDji24EuxwNg
 1W9fLhTSHylJcEjQ6EorH5Jmwurf64FC0OzZbcOfzk4VaMB/DxJEXnakiEPg1CRtHOijipBKCADX8
 vMuzFEqQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41498)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rratQ-0006EU-3D;
 Tue, 02 Apr 2024 10:57:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rratL-0006ry-4S; Tue, 02 Apr 2024 10:57:19 +0100
Date: Tue, 2 Apr 2024 10:57:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgvWfhSEYIUaIn6h@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <324e9c02-c005-4e18-9872-8408695fb1fe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <324e9c02-c005-4e18-9872-8408695fb1fe@linaro.org>
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

On Tue, Apr 02, 2024 at 11:48:08AM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2024 10:56, Russell King (Oracle) wrote:
> > On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
> >> On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
> >>> Merging
> >>> =======
> >>> All further patches depend on the first amba patch, therefore please ack
> >>> and this should go via one tree.
> >>>
> >>> Description
> >>> ===========
> >>> Modules registering driver with amba_driver_register() often forget to
> >>> set .owner field.
> >>>
> >>> Solve the problem by moving this task away from the drivers to the core
> >>> amba bus code, just like we did for platform_driver in commit
> >>> 9447057eaff8 ("platform_device: use a macro instead of
> >>> platform_driver_register").
> >>>
> >>> Best regards,
> >>
> >> I tried to submit this series to Russell patch tracker and failed. This
> >> is ridiculous. It's 2024 and instead of normal process, like every other
> >> maintainer, so b4 or Patchwork, we have some unusable system rejecting
> >> standard patches.
> > 
> > Sorry but no. Stop being offensive.
> > 
> >> First, it depends some weird, duplicated signed-off-by's.
> > 
> > Eh? There is no such logic in there.
> 
> In the web system there is - read the error message I pasted. It wants
> another SoB from the unrelated email account, the one used purely for
> registering in some web system, not the one used for code handling.

So you're disagreeing with the author of this system. Of course you
know best, you know the code behind it. I have only one word for
that kind of attitude: idiotic.

> >> Second it > submitting patch-by-patch, all with clicking on some web
> >> (!!!) interface.
> > 
> > Again, no it doesn't, and you're just throwing crap out because you
> > failed. Unlike most of the "normal" processes, the patch system allows
> > you to submit both by *email* and also by *web* for those cases where
> 
> The email one requires additional steps, so this is unnecessary work
> confusing submitters. I submit dozens or hundreds of patches every
> release cycle. That's the only subsystem which is odd to use.

Lots of people use it without issue. People even send patches to the
mailing list copied to the patch system.

> > the emails get screwed up by ones company mail server. That's why the
> > web interface exists - to give people *flexibility*.
> 
> No, they are not. None of my emails are screwed by my company system.

So why are you using the web interface?

> > Why does it want the kernel version? Because when we were running 2.4
> > and 2.5 kernel versions in parallel, it was important to know which
> > tree the patch was being submitted for. It has continued to be required
> 
> Which is absolutely ridiculous now. Expecting submitters to adhere to
> some rule for 20 year old kernel is not reasonable.

You aren't listening to me, so it's pointless discussing this further.
You have a bee in your bonet and you want to make it a huge issue
rather than work constructively. Sorry but no, I'm not going to continue
this confrontational exchange.

You clearly don't want to understand anything.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
