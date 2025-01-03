Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C755A0104E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 23:44:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7214C78F6B;
	Fri,  3 Jan 2025 22:44:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50FBBC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=TYb4EVw66eFgqXF6Tn680xcobIKnl8hXMw/P0sf476w=; b=HgTT/mlkcWu/bQBF4yf7rsUfoK
 IX+2MRAxuIKjglLa4YemYOixyNP0wDA+AuG5/tM1LkOOWNFJYB4AZYWDcG45px3K2SQe/8Ozo1/I7
 CXw1JXfrK/sbJZxVjXRYAmaGia4iuUXKzqWy2IhOsqEaLUIC2E50Q6q4aQAUMnQ8r/2o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tTqOn-001AB3-BZ; Fri, 03 Jan 2025 23:44:09 +0100
Date: Fri, 3 Jan 2025 23:44:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <86d264c5-73fb-45ee-ad11-4a2517a12cfa@lunn.ch>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
 <E1tTffV-007RoP-8D@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tTffV-007RoP-8D@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexander Couzens <lynxis@fe80.eu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: pcs: mtk-lynxi: fill in
 PCS supported_interfaces
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

On Fri, Jan 03, 2025 at 11:16:41AM +0000, Russell King (Oracle) wrote:
> Fill in the new PCS supported_interfaces member with the interfaces
> that the Mediatek LynxI supports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
