Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3CD0DA70
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jan 2026 19:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E86D8C8F283;
	Sat, 10 Jan 2026 18:26:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD77C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=afgUmo7FVA0UMa1pCZgDdfCcrRnZeK5e78tq9RhRkhg=; b=TBBkE6S2viMmModJ7gC/H2/pmC
 VyCBuAULdIlBeFeTHMiw1k0FI9FcdG6ZYI1BUln5cJKJ7zM3IO/0Yu/jwaGbWHXh3HRxNGi2rvjC0
 Hz0BCuDbZYud3yTnPz8zwu+7fJzcw/sRSA+e3NdIRcGs1gh00G9p+549BbloBiq8ABhDnCErrYaTQ
 XU9rKs5jr5RWGdDFmocUJ9eDG56euyzXR2k6wQsPSkbZPJO3RsBcoAUlpiNd4mxtrNGTiokRmhwCg
 WmrJJK+oGJstSjolh+TcadHGN2n34Haq7qdOFJIgfYLrosyn5nVPStr8/UkuueO07+wegHmnt049j
 ElqpB2aA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44118)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vedf7-000000004ui-3O08;
 Sat, 10 Jan 2026 18:26:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vedf3-000000004St-0Hpf; Sat, 10 Jan 2026 18:26:05 +0000
Date: Sat, 10 Jan 2026 18:26:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linmin@eswincomputing.com, robh@kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 lizhi2@eswincomputing.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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

On Fri, Jan 09, 2026 at 07:27:54PM +0100, Andrew Lunn wrote:
> >    rx-internal-delay-ps:
> > -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> > +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
> >  
> >    tx-internal-delay-ps:
> > -    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> > +    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
> 
> You need to add some text to the Changelog to indicate why this is
> safe to do, and will not cause any regressions for DT blobs already in
> use. Backwards compatibility is very important and needs to be
> addressed.
> 
> > +  eswin,rx-clk-invert:
> > +    description:
> > +      Invert the receive clock sampling polarity at the MAC input.
> > +      This property may be used to compensate for SoC-specific
> > +      receive clock to data skew and help ensure correct RX data
> > +      sampling at high speed.
> > +    type: boolean
> 
> This does not make too much sense to me. The RGMII standard indicates
> sampling happens on both edges of the clock. The rising edge is for
> the lower 4 bits, the falling edge for the upper 4 bits. Flipping the
> polarity would only swap the nibbles around.

I'm going to ask a rather pertinent question. Why do we have this
eswin stuff in the kernel tree?

I've just been looking to see whether I can understand more about this,
and although I've discovered the TRM is available for the EIC7700:

https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases

that isn't particularly helpful on its own.

There doesn't appear to be any device tree source files that describe
the hardware. The DT bindings that I can find seem to describe only
ethernet and USB. describe the ethernet and USB, and maybe sdhci.

I was looking for something that would lead me to what this
eswin,hsp-sp-csr thing is, but that doesn't seem to exist in our
DT binding documentation, nor does greping for "hsp.sp.csr" in
arch/*/boot/dts find anything.

So, we can't know what this "hsp" thing is to even know where to look
in the 80MiB of PDF documentation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
