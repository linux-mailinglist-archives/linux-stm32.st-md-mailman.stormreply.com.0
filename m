Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D632582FCF8
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 23:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EF24C6B457;
	Tue, 16 Jan 2024 22:35:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D65C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=RdhTevdQVBdb8wlxJd7xNXUyeRnkCEOfn9WkZe/WJWg=; b=W4QtaqR7NHIOIWimMjGhfOWFsm
 PKzYCRa3+vm+SUCtszEcpa18+cQMWn8Ejkyd5cqqhgi1CABB5bYt/tfUAaef97tbwOiDzLu/Snc/8
 0lCmYOUU+tGPH4RRI+IvLjzC/LbYe7R7yW5ch1462y3MpeZSzi3H/L2Bf/SozwnqO3UA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rPs1e-005MRS-8j; Tue, 16 Jan 2024 23:35:18 +0100
Date: Tue, 16 Jan 2024 23:35:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Wait a bit for the reset
	to take effect
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

On Mon, Jan 15, 2024 at 08:21:42PM +0100, Bernd Edlinger wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.
> 
> Add a wait for 10 us before continuing to be on the safe side.
> 
> > From what have you got that delay value?
> 
> Just try and error, with very old linux versions and old gcc versions
> the synopsys_id was read out correctly most of the time (but not always),
> with recent linux versions and recnet gcc versions it was read out
> wrongly most of the time, but again not always.
> I don't have access to the VHDL code in question, so I cannot
> tell why it takes so long to get the correct values, I also do not
> have more than a few hardware samples, so I cannot tell how long
> this timeout must be in worst case.
> Experimentally I can tell that the register is read several times
> as zero immediately after the reset is de-asserted

Is zero a valid synopsys_id? If its not, maybe do the wait conditional
on the first read returning 0?

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
