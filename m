Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511BB340E4
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 15:38:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48899C3FAD7;
	Mon, 25 Aug 2025 13:38:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923E6C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PVgYUvPT1vPM01I1nr9R+3H7BRFArSAfjzLQN6iJKvQ=; b=SCimNEDupFMkyQhB1L09lOvN6L
 2R2NcLUFXj3aX6q1C9zMzhUzbva/YBhfegk7MxjDN9oyQchc03Y+e3j+lu0irp5X2jaAcQNfcLzkw
 57qcs0A5jOaIq5wT7QANf9CQw6k4yxggPLKlR2yYU9Hywo3l9qD2g0f/WNHW+WeGYkILoDqzSx59i
 64jBpaJd1/A5X2fUoTAm8taxCXd+syedJ0xfiDBwokuWNqMVpiwgI0EQCCMmjCy8MeQ3DEWfab/9z
 P/l3yoCWe6alpUfHXrf9VaRE17B1xFYZ0brzJFjmu3wKvk3yrOAqMNfujbdN1WPD7tVxWtSF8RFUT
 iH3woFiQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53562)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uqXOF-000000006XF-25Id;
 Mon, 25 Aug 2025 14:37:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uqXO9-0000000089m-0a0b; Mon, 25 Aug 2025 14:37:33 +0100
Date: Mon, 25 Aug 2025 14:37:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <aKxnHFSrVeM7Be5A@shell.armlinux.org.uk>
References: <20250815023515.114-1-kernel@airkyi.com>
 <CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
 <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
 <d0fe6d16-181f-4b38-9457-1099fb6419d0@rock-chips.com>
 <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <809848c9-2ffa-4743-adda-b8b714b404de@samsung.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: ethernet: stmmac:
 dwmac-rk: Make the clk_phy could be used for external phy
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Aug 25, 2025 at 12:53:37PM +0200, Marek Szyprowski wrote:
> On 25.08.2025 11:57, Chaoyi Chen wrote:
> > On 8/25/2025 3:23 PM, Marek Szyprowski wrote:
> >> On 15.08.2025 04:35, Chaoyi Chen wrote:
> >>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>>
> >>> For external phy, clk_phy should be optional, and some external phy
> >>> need the clock input from clk_phy. This patch adds support for setting
> >>> clk_phy for external phy.
> >>>
> >>> Signed-off-by: David Wu <david.wu@rock-chips.com>
> >>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>> ---
> >>>
> >>> Changes in v3:
> >>> - Link to V2: =

> >>> https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
> >>> - Rebase to net-next/main
> >>>
> >>> Changes in v2:
> >>> - Link to V1: =

> >>> https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
> >>> - Remove get clock frequency from DT prop
> >>>
> >>> =A0=A0 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
> >>> =A0=A0 1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c =

> >>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> index ac8288301994..5d921e62c2f5 100644
> >>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> >>> @@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct =

> >>> plat_stmmacenet_data *plat)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clk_set_rate(plat->stmmac_clk, 5000000=
0);
> >>> =A0=A0=A0=A0=A0=A0 }
> >>> =A0=A0 -=A0=A0=A0 if (plat->phy_node && bsp_priv->integrated_phy) {
> >>> +=A0=A0=A0 if (plat->phy_node) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bsp_priv->clk_phy =3D of_clk_get(plat-=
>phy_node, 0);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR_OR_ZERO(bsp_priv->clk_=
phy);
> >>> -=A0=A0=A0=A0=A0=A0=A0 if (ret)
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, ret, "Ca=
nnot get PHY clock\n");
> >>> -=A0=A0=A0=A0=A0=A0=A0 clk_set_rate(bsp_priv->clk_phy, 50000000);
> >>> +=A0=A0=A0=A0=A0=A0=A0 /* If it is not integrated_phy, clk_phy is opt=
ional */
> >>> +=A0=A0=A0=A0=A0=A0=A0 if (bsp_priv->integrated_phy) {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(d=
ev, ret, "Cannot get PHY =

> >>> clock\n");
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clk_set_rate(bsp_priv->clk_phy, 50=
000000);
> >>> +=A0=A0=A0=A0=A0=A0=A0 }
> >
> > I think=A0 we should set bsp_priv->clk_phy to NULL here if we failed to =

> > get the clock.
> >
> > Could you try this on your board? Thank you.
> =

> Right, the following change also fixes this issue:
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c =

> b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 9fc41207cc45..2d19d48be01f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1415,6 +1415,8 @@ static int rk_gmac_clk_init(struct =

> plat_stmmacenet_data *plat)
>  =A0=A0=A0=A0=A0=A0=A0 if (plat->phy_node) {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bsp_priv->clk_phy =3D of_c=
lk_get(plat->phy_node, 0);
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR_OR_ZERO(bs=
p_priv->clk_phy);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bsp_p=
riv->clk_phy =3D NULL;

Or just:

		clk =3D of_clk_get(plat->phy_node, 0);
		if (clk =3D=3D ERR_PTR(-EPROBE_DEFER))
			...
		else if (!IS_ERR)
			bsp_priv->clk_phy =3D clk;

I don't have a free terminal to work out what "..." should be.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
