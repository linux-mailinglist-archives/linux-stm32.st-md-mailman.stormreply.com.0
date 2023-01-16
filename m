Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A566BC42
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 11:54:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20775C6507E;
	Mon, 16 Jan 2023 10:54:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB3FAC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k75wwwhG7lUtWo3nfpU73+/Nhl6iDUNa31lHcKIVs6I=; b=0b8wCmI1xBBrYgi464CipbnstD
 EbeaLU5wB9IDjqo4BMx4XIgPgnal3biWluBhl6ZNC8GgHbFI/F37jmCnX7+Shfd5olsSjLKXupfOA
 UAOv5qzzJd80SiC6acu4Zx+3cbrgGxfRqd36EKamZKikptdrAO5qDyMlwhepKObTsI70TTYQWJoIp
 5gkREfy6L7OGeC6wGzNsUkXPpDLCd8Qw0TdIHG0/ZF6Nuclgxry59TZUmhcMm9ICSFLu22KxhzNBg
 jqS3AR/pL1Vjcrm+MrrTePUQBF/OhjvzqWPl+0raKXVRqL018WTY6b23F/3aORLuiYw1EX6Rp8wwh
 pLoksX5Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36122)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pHN7j-0004es-V8; Mon, 16 Jan 2023 10:53:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pHN7e-0005ww-0n; Mon, 16 Jan 2023 10:53:50 +0000
Date: Mon, 16 Jan 2023 10:53:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Message-ID: <Y8UsvREsKOR2ejzT@shell.armlinux.org.uk>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-4-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116103926.276869-4-clement.leger@bootlin.com>
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

On Mon, Jan 16, 2023 at 11:39:23AM +0100, Cl=E9ment L=E9ger wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index f2247b8cf0a3..88c941003855 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3818,6 +3818,12 @@ static int __stmmac_open(struct net_device *dev,
>  		}
>  	}
>  =

> +	/* We need to setup the phy & PCS before accessing the stmmac registers
> +	 * because in some cases (RZ/N1), if the stmmac IP is not clocked by the
> +	 * PCS, hardware init will fail because it lacks a RGMII RX clock.
> +	 */
> +	phylink_start(priv->phylink);

So what happens if you end up with the mac_link_up method being called
at this point in the driver, before the hardware has been setup ?

If you use a fixed-link, that's a real possibility.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
