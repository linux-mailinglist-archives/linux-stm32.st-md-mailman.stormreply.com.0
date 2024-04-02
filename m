Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B493894FB8
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 12:15:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8382C6B45B;
	Tue,  2 Apr 2024 10:15:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F1FC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XcKQ6bjR8juooJeYFkyQvyoAYNtxrPcLEvnKdMTyFu8=; b=0beqMXVtPisgfQmEG2UBAidiVW
 84+j9DAP25fOyTv08R6Sq+HES71u81tNt/O07QPZpGE3DDCsc5eMDgt27vYLJKa2vSrJUB6eGdSO5
 2xJ8YAqid3EnAbCdEchOKgHRM6mT8Bh3x+TWFOFRLkGQzi1oOeTn/i76rfyD4ZQeL3NsvKLN8q0IY
 fmtkpkXyq/aOlrrjHPexBzYFjdJw+8l6k3zqUvOk8FwKv5fXbzYrdOiDxKW9wPtZl12nlrQHZ1Neq
 o2r6Pw+BMVTmSwN/IzPOC6ts0Evl8M5cISIt3onDGFUXRkQ7YQLJ8mm2VQ6+4UBLk83BeUAyaQGe6
 90zRLFdQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35944)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rrbAc-0006J4-1Y;
 Tue, 02 Apr 2024 11:15:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rrbAb-0006t6-9b; Tue, 02 Apr 2024 11:15:09 +0100
Date: Tue, 2 Apr 2024 11:15:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgvarVCRBam9anOm@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <324e9c02-c005-4e18-9872-8408695fb1fe@linaro.org>
 <ZgvWfhSEYIUaIn6h@shell.armlinux.org.uk>
 <65f0ed39-4c2f-4cea-b488-2a8ba6fdbeff@linaro.org>
 <ZgvaFNLTqgQrPeiO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZgvaFNLTqgQrPeiO@shell.armlinux.org.uk>
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

On Tue, Apr 02, 2024 at 11:12:36AM +0100, Russell King (Oracle) wrote:
> On Tue, Apr 02, 2024 at 12:04:07PM +0200, Krzysztof Kozlowski wrote:
> > You brought no argument for keeping the kernel-version-header
> > requirement nowadays, yet you call me of not working constructively. I
> 
> So add inability to read to your failings, because I _did_ state that
> _I_ still _use_ it.
> 
> End of discussion, I'm not engaging with you in your current
> confrontational mood where you clearly don't want to understand
> anything (or intentionally misinterpreting) I'm writing - making it
> pointless to continue.
> 
> I even think you're intentionally misinterpreting the responses
> from the patch system.
> 
> Overall, I can only draw the conclusion that you are playing politics
> and want the patch system gone, and you want me to use "standard"
> tooling that will _increase_ the amount of effort I need to put in.
> No, that's not going to happen.

... and this is your final chance to change to a constructive discourse,
if not, you are going to end up in my kill file. Whether you do is
entirely up to the tone of your reply to this email.

I am always more than willing to work with a submitter to diagnose
what the problem is, but the tone of your emails make me want to
ignore you.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
