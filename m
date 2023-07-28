Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C876706B
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 17:23:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB93FC6B468;
	Fri, 28 Jul 2023 15:23:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF9EEC6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFaTvjva0ryo1dGvlmwD9YwRXLb5KCK4M2vuVLGCmtY=; b=R648ApYvuLp9TRmpig3RK00k45
 iwo/6SoqI2MGew0WOsD/C0Pmrd8pPKAp71PCdAHyf3DtaYQsTPecUkOn3Ka5apKAjNYX6GLNVerk9
 FFE1jTiLl2rSU5G3jkLo1oh6P7XcoETkQj9jfhD9f6wgdOzCB8UBP3/wJV0846kRjE/XAE2JhyHZH
 17FIB6eRR571XIYccm02B92tb7uFK5y7rI/XX8k2I4Kqoh8AAR60xEZyV2pvw8TPmoHWD372yIBE8
 vccayBxsZXU4StXzIKMWl3/WmbHP3Z2Iz5Jy/oCU3DexPI5jEKpOQOtuhgX3I+d6ZmBAypVpilYa/
 +TG9D+Kw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34660)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qPPIQ-0007Qe-2c;
 Fri, 28 Jul 2023 16:22:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qPPIJ-00051L-6E; Fri, 28 Jul 2023 16:22:19 +0100
Date: Fri, 28 Jul 2023 16:22:19 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Halaney <ahalaney@redhat.com>, Will Deacon <will@kernel.org>
Message-ID: <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
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

On Thu, Jul 27, 2023 at 01:36:45PM -0500, Andrew Halaney wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> > index 53ee5a42c071..e7819960128e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> > @@ -40,6 +40,9 @@
> >  #define DMA_BUS_MODE			0x00001000
> >  #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
> >  #define RMII_RESET_SPEED		(0x3 << 14)
> > +#define MII_RESET_SPEED			(0x2 << 14)
> > +#define RGMII_RESET_SPEED		(0x0 << 14)
> > +#define CTRL_SPEED_MASK			(0x3 << 14)
> 
> GENMASK() would be cleaner, as well as BIT() usage, but I do see
> the driver currently does shifts.. so /me shrugs

BIT() is only useful for single-bit items, not for use with bitfields,
and their use with bitfields just makes the whole thing perverse.

#define CTRL_SPEED_MASK		GENMASK(15, 14)
#define CTRL_SPEED_RGMII_RESET	0
#define CTRL_SPEED_MII_RESET	2
#define CTRL_SPEED_RMII_RESET	3

and then its use:

	FIELD_PREP(CTRL_SPEED_MASK, CTRL_SPEED_RGMII_RESET)
or
	FIELD_PREP(CTRL_SPEED_MASK, CTRL_SPEED_MII_RESET)
or
	FIELD_PREP(CTRL_SPEED_MASK, CTRL_SPEED_RMII_RESET)

alternatively:

        if (iface == MX93_GPR_ENET_QOS_INTF_SEL_RMII)
                speed = CTRL_SPEED_RMII_RESET;
        else (iface == MX93_GPR_ENET_QOS_INTF_SEL_MII)
                speed = CTRL_SPEED_MII_RESET;
	else
		speed = CTRL_SPEED_RGMII_RESET;

	old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
	ctrl = old_ctrl & ~CTRL_SPEED_MASK;
	ctrl |= FIELD_PREP(CTRL_SPEED_MASK, speed);
	writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);

> I don't have any documentation for the registers here, and as you can
> see I'm an amateur with respect to memory ordering based on my prior
> comment.
> 
> But you:
> 
>     1. Read intf_reg_off into variable iface
>     2. Write the RESET_SPEED for the appropriate mode to MAC_CTRL_REG
>     3. wmb() to ensure that write goes through

I wonder about whether that wmb() is required. If the mapping is
device-like rather than memory-like, the write should be committed
before the read that regmap_update_bits() does according to the ARM
memory model. Maybe a bit of information about where this barrier
has come from would be good, and maybe getting it reviewed by the
arm64 barrier specialist, Will Deacon. :)

wmb() is normally required to be paired with a rmb(), but we're not
talking about system memory here, so I also wonder whether wmb() is
the correct barrier to use.

Adding Will.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
