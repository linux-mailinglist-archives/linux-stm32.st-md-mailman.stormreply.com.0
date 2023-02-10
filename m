Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1AE691D84
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 12:04:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2978C6A5EA;
	Fri, 10 Feb 2023 11:04:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53AA0C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OiSEzv9rtDSTvo2Zi5fGTIDoz35QzbSPZrOm1laNUMM=; b=q31jFGPkY6EPYOhhEOFeBuqgBW
 9DYtv8WXHGxMdfHJ/89KrDHm9dh9XGlQwu2RZR+kcob86Cka/SdhvlV23IZiQJwxArdcvGBNIn9bA
 6YQ0s3K1bsHI04vVpdhl0vpALG0d4hNE5lhaNc+U6ZRbwUC3PEhLGhqyWY+XFq3SA8T7C++E8jiK4
 vzufbQ1BC3MoOt4TSNpJ+IeGTpno75pw8TBo5MF0EBC6lzKQILQCGUBT6dnNA3RRk0bIlrajPTdKG
 3VxSbk4OXtnWvxaFZvyhf5wayWduKUrImf8HixkA/QfMx6UX3UH08sIMjHSy2OECuJqcz0ZL9xt8X
 BH16j7Xw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36512)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pQRBu-0001MT-Sf; Fri, 10 Feb 2023 11:03:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pQRBm-0005WD-Us; Fri, 10 Feb 2023 11:03:34 +0000
Date: Fri, 10 Feb 2023 11:03:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y+YkhjyaL+hNGW+7@shell.armlinux.org.uk>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-4-clement.leger@bootlin.com>
 <Y8UsvREsKOR2ejzT@shell.armlinux.org.uk>
 <20230207154135.6f0e59f8@fixe.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207154135.6f0e59f8@fixe.home>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: start phylink
 before setting up hardware
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

On Tue, Feb 07, 2023 at 03:41:35PM +0100, Cl=E9ment L=E9ger wrote:
> Le Mon, 16 Jan 2023 10:53:49 +0000,
> "Russell King (Oracle)" <linux@armlinux.org.uk> a =E9crit :
> =

> > On Mon, Jan 16, 2023 at 11:39:23AM +0100, Cl=E9ment L=E9ger wrote:
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index f2247b8cf0a3..88c941003855 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -3818,6 +3818,12 @@ static int __stmmac_open(struct net_device *de=
v,
> > >  		}
> > >  	}
> > >  =

> > > +	/* We need to setup the phy & PCS before accessing the stmmac regis=
ters
> > > +	 * because in some cases (RZ/N1), if the stmmac IP is not clocked b=
y the
> > > +	 * PCS, hardware init will fail because it lacks a RGMII RX clock.
> > > +	 */
> > > +	phylink_start(priv->phylink);  =

> > =

> > So what happens if you end up with the mac_link_up method being called
> > at this point in the driver, before the hardware has been setup ?
> > =

> > If you use a fixed-link, that's a real possibility.
> =

> I actually have this setup. On the board, one GMAC is connected to a
> DSA switch using a fixed-link and the other using the PCS such as added
> by this series.
> =

> From what I see, indeed, the mac_link_up() function is called before
> stmmac_hw_setup(). This does not seems to have any effect on my setup
> (except making it working of course) but I agree this is clearly not
> ideal.
> =

> What I could do is adding a function in the miic pcs driver that could
> be called from my rzn1 stmmac probe function to actually configure the
> PCS at probe time based on the detected "phy-mode". Does that seems
> better to you ?

I think Clark Wang is also working on addressing a very similar problem
with stmmac. Please can you check out his work first, he's adding a new
function to phylink to bring the PHY up early in the resume path.

I would like you both to work together to address what seems to be the
same issue.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
