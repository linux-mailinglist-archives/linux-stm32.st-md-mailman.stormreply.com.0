Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 033DA7670AC
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 17:36:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87945C6B468;
	Fri, 28 Jul 2023 15:36:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB12BC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 15:36:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 910F062184;
 Fri, 28 Jul 2023 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD475C433C8;
 Fri, 28 Jul 2023 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690558582;
 bh=g4K5vq4lPyGBYhqgJJE0//L14vL/7BRJwDrh2+NOlqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0/2qOh9DNQM/zNi5r9udD62Tuu5Uosyrt7S4golN5beku3HBItbqx/hsmFGSsjso
 /K78hYySn6CsOKCp40tUlRsYRNgEQR/ZSeR3x2gxM6/SvBC/W1YQyj7muSEibPxpt4
 9fx5kaG5gptMsk367e7ditSVFDcX2XzKOQai8PgIupG70U0dRp3wNZW74zkoQPzZ/g
 DdsyYULweQssqFoRfX7p2gW8o4eVxrtPtFqJjxOjm0Ib1hFQBJULx5RV4D8BgBxHCD
 dMb7FJIYJfoGEcIG/KcIdeYFlcF4Pb77Kzu9Gez3zZTCGgrk3wvZLSiigrkx4o4R2s
 S/qZhlXIcMYCQ==
Date: Fri, 28 Jul 2023 16:36:12 +0100
From: Will Deacon <will@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230728153611.GH21718@willie-the-truck>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
 <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Frank Li <frank.li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, Shenwei Wang <shenwei.wang@nxp.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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

On Fri, Jul 28, 2023 at 04:22:19PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 27, 2023 at 01:36:45PM -0500, Andrew Halaney wrote:
> > I don't have any documentation for the registers here, and as you can
> > see I'm an amateur with respect to memory ordering based on my prior
> > comment.
> > 
> > But you:
> > 
> >     1. Read intf_reg_off into variable iface
> >     2. Write the RESET_SPEED for the appropriate mode to MAC_CTRL_REG
> >     3. wmb() to ensure that write goes through
> 
> I wonder about whether that wmb() is required. If the mapping is
> device-like rather than memory-like, the write should be committed
> before the read that regmap_update_bits() does according to the ARM
> memory model. Maybe a bit of information about where this barrier
> has come from would be good, and maybe getting it reviewed by the
> arm64 barrier specialist, Will Deacon. :)
> 
> wmb() is normally required to be paired with a rmb(), but we're not
> talking about system memory here, so I also wonder whether wmb() is
> the correct barrier to use.

Yes, I don't think wmb() is the right thing here. If you need to ensure
that the write to MAC_CTRL_REG has taken effect, then you'll need to go
through some device-specific sequence which probably involves reading
something back. If you just need things to arrive in order eventually,
the memory type already gives you that.

It's also worth pointing out that udelay() isn't necessarily ordered wrt
MMIO writes, so that usleep_range() might need some help as well.
Non-relaxed MMIO reads, however, _are_ ordered against a subsequent
udelay(), so if you add the readback then this might all work out.

I gave a (slightly dated) talk about some of this at ELC a while back:

https://www.youtube.com/watch?v=i6DayghhA8Q

which might help.

Will
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
