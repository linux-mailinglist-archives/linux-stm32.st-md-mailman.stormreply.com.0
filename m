Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA79BEDBCF
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Oct 2025 22:50:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0521C5A4DB;
	Sat, 18 Oct 2025 20:50:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F4AFC5A4D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HZVFyQFH/N6BlbXZw7Nya2jm1NlFu/aT9k9hJeAWYd0=; b=S8RVQB9gc5V85YTnJ25mLHH2Vs
 jYcPLDoDMEB7wJ3GereehfiJA/tHV9Qc71uSKDF4TlPs8FyhXlcyaUoJeUPZvlz6Y5JdQoX+Zhr+r
 RVmVRq0wk05pUUXtc+J/P39mOXEN0XPmRT7ibqUkCTOk9rcM3BewqOYeBBrylj6u7A9uoowpHa5o3
 Azqt2pju1pTzqbWHNYythB3qFjEh+M+rzQSEuX++nmhDN1RnCdfXLybWNYJSJuJow+KFvo+9qSYcY
 kUew1Zpz4oNZttZXiC3p1WzmZjUcNMjGH72MEDReMLkZnFqKZTiKDlJUd8ZcMACGg5XA+as8/OW/K
 ukzTLkjw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50152)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vADsJ-000000000i9-1B5b;
 Sat, 18 Oct 2025 21:50:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vADsA-000000005aS-0gvN; Sat, 18 Oct 2025 21:49:54 +0100
Date: Sat, 18 Oct 2025 21:49:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Yixun Lan <dlan@gentoo.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, sophgo@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

On Sat, Oct 18, 2025 at 10:38:17PM +0200, Andrew Lunn wrote:
> On Sat, Oct 18, 2025 at 08:42:07AM +0800, Inochi Amaoto wrote:
> > On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> > > On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > > > As the SG2042 has an internal rx delay, the delay should be remove
> > > > when init the mac, otherwise the phy will be misconfigurated.
> > > 
> > > Are there any in tree DT blobs using invalid phy-modes? In theory,
> > > they should not work, but sometimes there is other magic going on. I
> > > just want to make sure this is not going to cause a regression.
> > > 
> > 
> > I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
> > which is vaild.
> 
> Great, thanks for checking.

Hang on. Is this right?

The commit says that SG2042 has an internal receive delay. This is
presumably the MAC side.

To work around that, you map rgmii-id to rgmii-txid for the PHY, to
prevent the PHY from enabling its receive-side clock delay.

It seems to me that you're saying that rgmii-rxid and rgmii-id
should not be used with these MACs, and you're fixing up to remove
the receive-side delay.

"rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
It's supposed to mean that the PHY should add delays on both tx and
rx paths.

Confused.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
