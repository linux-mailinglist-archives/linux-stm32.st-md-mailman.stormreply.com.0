Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFB9BA75D
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Nov 2024 19:20:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 948FCC6DD9E;
	Sun,  3 Nov 2024 18:20:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D60D2C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Nov 2024 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=KoeC812BJC1qP0utpHBC083qksYwLvvWXbWjSDq4s+A=; b=C/l/HTtVqwvFuLNKkM/AW0KD3u
 uVlWTzNtla+1d01nLpVzZP7bYItGm9/y9ZnSsmMHGpAccfccOcpzMzFT/sf21s4QmUeWUpvoNOPy1
 2L9+4DHB/lUyGyFR+S1OqrgwUyGLNBIoqcYvC0mqihwvqGadJLAjKf7mtLzKUedyOxcE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t7fCv-00C202-6c; Sun, 03 Nov 2024 19:20:13 +0100
Date: Sun, 3 Nov 2024 19:20:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lothar Rubusch <l.rubusch@gmail.com>
Message-ID: <0b64d49d-b0a0-45ba-aecc-febcdc557679@lunn.ch>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
 <20241102114122.4631-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241102114122.4631-2-l.rubusch@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/2] net: stmmac: add support for dwmac
	3.72a
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

On Sat, Nov 02, 2024 at 11:41:21AM +0000, Lothar Rubusch wrote:
> The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
> SoCs. Going by the hardware features "snps,multicast-filter-bins" and
> "snps,perfect-filter-entries" shall be supported. Thus add a
> compatibility flag, and extend coverage of the driver for the 3.72a.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Does what it says:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Dumb question. What does the 'a' mean in the version? Or is this
actually hex?

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
