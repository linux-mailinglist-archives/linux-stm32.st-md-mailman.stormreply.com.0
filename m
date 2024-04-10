Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C181D8A0081
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 21:20:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75FD9C6C820;
	Wed, 10 Apr 2024 19:20:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76DF9C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dd1aVZalUKuA+B9so3sWEVj2LqaGyKO5Aioahoz1vu8=; b=jnBOFofuCRHm+O8XMCs99fUn+L
 UXp75jYAtDxJlu/wtMb4foX7uSRRD+Q+TwX+nFozurCdwnW8f4TJw0fhYisFCNbgE8TlvJrWRJRl8
 +qHegzmIZKXaqDrVHvrE4X/DZnbbdHlNKL879QPzG33DfG8e/YHsp8uqcl9kUOrIf0DeyZMlAVa5O
 pb0kM09fXSNtS7935t6ShX040phZEI0K+QxhJLXNfRgpiVuKwueeSBF+TNkbXcN4m35qjxnMErYyN
 rpP/4SIGhD8z5sdcmBfKPf3om8cujhnuVjHkociKGNJS6mN2Sld8TTFard2pldEdDHcQBpiyrDZrn
 h7PnNJkg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33334)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rudU9-0008QF-1o;
 Wed, 10 Apr 2024 20:19:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rudU6-0006Cb-09; Wed, 10 Apr 2024 20:19:50 +0100
Date: Wed, 10 Apr 2024 20:19:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZhbmVVXgu27ZZaNf@shell.armlinux.org.uk>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-3-79ca45f2fc79@bootlin.com>
 <20240409183404.7d3eb04f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409183404.7d3eb04f@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/5] net: stmmac:
 dwmac-socfpga: use pcs_init/pcs_exit
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

On Tue, Apr 09, 2024 at 06:34:04PM -0700, Jakub Kicinski wrote:
> On Tue, 09 Apr 2024 11:21:46 +0200 Romain Gantois wrote:
> > +	struct regmap_config pcs_regmap_cfg = {
> > +		.reg_bits = 16,
> > +		.val_bits = 16,
> > +		.reg_shift = regmap_upshift(1),
> 
> This appears to displease the compiler:
> 
> drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:389:16: error: call to undeclared function 'regmap_upshift'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   389 |                 .reg_shift = regmap_upshift(1),
>       |                              ^

Yes, annoyingly I accidentally it 'u' instead of 'y' in vi which
lower-cased the entire function, and didn't realise before sending the
patch as a theoretical solution to Romain. After build-testing it locally
I did notice it. I would've thought that Romain would've build-tested
before sending out his patch set and would've fixed it up... I didn't
have time to properly fix up my patch (essentially would've ment
redoing the edits from scratch to ensure that it was correct.) Still
don't have time to do that. Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
