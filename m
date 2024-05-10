Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE38C2839
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 17:52:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF044C6907A;
	Fri, 10 May 2024 15:52:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5E1C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgU5xDXwFs4QEjcHU4kuuCpha5X8eRsJv6GJUqZKdTQ=; b=cPmonIHvlTOPUe5pIJgg2HJ/qz
 eAOZt0HRWk9ANyinjkSfgJ96aPpC8iEoLUnqkZLpC1H3whU5XEbtPFsBxCJpkJ1HbW21YeWHlUGFr
 eUgFQE2DmtPSFNv2giA0Cx9DVQ4U1RCKFQfOqGr7CNMMs5mxILIOW1NbwizV1Lx0nr7/JRNthmKHV
 TMTAKiNii1V+8WvX+LyK3lfodxtZC1OgeSh7QfMWGwqWzVzbi/k4sY402xw1XF5g+gNvej+0gcTpE
 SvcRfQMjHRgEZMb1/TfH7yMYXzM2ZdMVj0ARRaE+artlqr1bUkUq5g7BCmBuaK5wja37qrWhmKEUQ
 6c87ObCA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42940)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1s5SXW-0007aJ-2n;
 Fri, 10 May 2024 16:52:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1s5SXT-0003Qx-Bi; Fri, 10 May 2024 16:52:03 +0100
Date: Fri, 10 May 2024 16:52:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <Zj5Co6wk4RV67vt5@shell.armlinux.org.uk>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
 <20240510-rzn1-gmac1-v6-2-b63942be334c@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510-rzn1-gmac1-v6-2-b63942be334c@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 2/7] net: stmmac: Add
 dedicated XPCS cleanup method
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

On Fri, May 10, 2024 at 09:38:09AM +0200, Romain Gantois wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> Currently the XPCS handler destruction is performed in the
> stmmac_mdio_unregister() method. It doesn't look good because the handler
> isn't originally created in the corresponding protagonist
> stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
> order to have more coherent MDIO and XPCS setup/cleanup procedures,
> let's move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
> method.
> 
> This method will also be used to cleanup PCS hardware using the
> pcs_exit() callback that will be introduced to stmmac in a subsequent
> patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
