Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B7894E4B
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 11:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B291C6B45B;
	Tue,  2 Apr 2024 09:06:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BB6DC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WgxlhgEkcesCrm0cyV5cBT67pvB35pzQ8uy7zKzfp+U=; b=HMZ4D16rZ4NjHb0nRxusf1y0kp
 Cx5U4CsEc8hjD87M5joxCqf43Nf8iHiSgSJ53nUQ3ONne0X66Ilnfra1FqSSLvfpPDNPy+Y9LiDRi
 mwYySxCAqSTrdPN7G3EoRaDGHB0ff8dEbdZg4awRtHwukV5uUv10YwDiyqyP1QCszCr3lXzB6/RlI
 Y/L06XUwq8xclYYFmGHii89HDcgjeJHrj4la1fIWmiMccdHABe1Qu142qY+Zk0nTjb+2dmNw4xz/3
 6bpNOGMzk85ZH71n21PSr7CPz+CwmhehjqWCLFkAhkPJsq24F5YKDx9ImMYYYsiarY0PGRs4vZ1FI
 b/pWTLcQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57496)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rra60-00063X-1q;
 Tue, 02 Apr 2024 10:06:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rra5v-0006pn-Cg; Tue, 02 Apr 2024 10:06:15 +0100
Date: Tue, 2 Apr 2024 10:06:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZgvKh/Cwudh3gCDr@shell.armlinux.org.uk>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
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

On Tue, Apr 02, 2024 at 09:56:17AM +0100, Russell King (Oracle) wrote:
> On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
> > On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
> > > Merging
> > > =======
> > > All further patches depend on the first amba patch, therefore please ack
> > > and this should go via one tree.
> > > 
> > > Description
> > > ===========
> > > Modules registering driver with amba_driver_register() often forget to
> > > set .owner field.
> > > 
> > > Solve the problem by moving this task away from the drivers to the core
> > > amba bus code, just like we did for platform_driver in commit
> > > 9447057eaff8 ("platform_device: use a macro instead of
> > > platform_driver_register").
> > > 
> > > Best regards,
> > 
> > I tried to submit this series to Russell patch tracker and failed. This
> > is ridiculous. It's 2024 and instead of normal process, like every other
> > maintainer, so b4 or Patchwork, we have some unusable system rejecting
> > standard patches.
> 
> Sorry but no. Stop being offensive.
> 
> > First, it depends some weird, duplicated signed-off-by's.
> 
> Eh? There is no such logic in there.
> 
> > Second it > submitting patch-by-patch, all with clicking on some web
> > (!!!) interface.
> 
> Again, no it doesn't, and you're just throwing crap out because you
> failed. Unlike most of the "normal" processes, the patch system allows
> you to submit both by *email* and also by *web* for those cases where
> the emails get screwed up by ones company mail server. That's why the
> web interface exists - to give people *flexibility*.
> 
> The fact is, the web interface is merely a front end interface that
> generates an email and submits it in the usual way by email - an
> email that you can perfectly well generate that is *very* close to
> the standard email that git format-patch generates.
> 
> The *only* difference is that the patch system wants a KernelVersion:
> tag in the email _somewhere_ and it doesn't matter where it appears.
> Git even has support to do this.
> 
>   git format-patch --add-header="KernelVersion: $foo"
> 
> Why does it want the kernel version? Because when we were running 2.4
> and 2.5 kernel versions in parallel, it was important to know which
> tree the patch was being submitted for. It has continued to be required
> because it means when there's problems applying a patch, it gives me
> the additional information about the base used for the patch (and it
> keeps on being useful to have.)
> 
> > That's the response:
> > -------------
> > Your patch has not been logged because:
> > 
> > Error:   Please supply a summary subject line briefly describing
> >          your patch.
> > 
> > 
> > Error:   Please supply a "KernelVersion: " tag after "PATCH FOLLOWS" or
> > "---".
> > 
> > Error:   the patch you are submitting has one or more missing or incorrect
> >          Signed-off-by lines:
> > 
> >          - author signoff <krzkreg@gmail.com> is missing.
> > 
> >          Please see the file Documentation/SubmittingPatches, section 11
> >          for details on signing off patches.
> 
> Lots of people use it without a problem. I've just run the parser
> through its offline tests, and it parses email content correctly.
> I've no idea what you're doing wrong, but it looks like something
> pretty serious if it didn't parse the subject line.
> 
> Rather than getting stressed about it, why don't you send me an email
> the first time something goes wrong so I can investigate, turn on
> debugging to capture the problem email?

... and I'll also point out one of the biggest problems is people.
People who think it's more complex than it is, or who can't read
instructions.

For example, trying to tell people to use the standard format subject
line:

	[PATCH ...] blah

has proven to be hopeless - unless one states to them the exact
sequence of keys on their keyboard to press - yes, it *really* takes
that patronising level to get everyone to understand. If one tries to
do it any other way, then you get stuff like:

	"[PATCH ...] ..."

with the quotes. Or some other stupid variation.

The patch system is as forgiving as possible. It takes standard git
formatted patches (with the exception of wanting an additional tag).

It is possible that bugs creep in - particularly when Debian updates
get applied and change the way Perl works, but I don't think that's
what has happened with your situation.

I _guess_ you're putting the entire email-like output from git
format-patch as the patch file. That won't work - that isn't a "patch
file", that is an email/email template, and the patch system will
attempt to parse that as the patch itself.

I suppose you term "patch" to be the email as well, rather than what
I interpret it to be, which is only the output of "diff" - call me
old fashioned but that's what a patch file used to be before the
waters got muddied by git "patch files".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
