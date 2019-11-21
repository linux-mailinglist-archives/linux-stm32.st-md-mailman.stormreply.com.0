Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AB10486C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 03:18:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDAC8C36B0B;
	Thu, 21 Nov 2019 02:18:05 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB13C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 02:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qAkKunk23IfftGddy2mr2fXtQy4avDcjS8V5azXyJbE=; b=Bmf7v9bag6lEBI4LryUMTXnfQG
 u4GCxMREmKr3MSE23XME+XmJvGhzJsmc20sNat7tD5Rpwznz1fJ+ufqHYunvbY2FxsBxFpFKQ5iK2
 bcIneYtAgt74WdlqmNIHGuvQvWli2iEk4V+KRFbsRFR3bk/l+XBGT81f/FedUI+W4+6M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1iXc2O-00071y-VP; Thu, 21 Nov 2019 03:17:40 +0100
Date: Thu, 21 Nov 2019 03:17:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Russell King <rmk+kernel@armlinux.org.uk>
Message-ID: <20191121021740.GE18325@lunn.ch>
References: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RFC PATCH net-next] net: phylink: rename
 mac_link_state() op to mac_pcs_get_state()
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

> This is something I'd like to do to make it clearer what phylink expects
> of this function, and that it shouldn't just read-back how the MAC was
> configured.  However, it will require some testing and review as it
> changes quite a lot, and there's some things, particularly in DSA, that
> don't seem quite right from a phylink point of view, such as messing
> with state->interface in this function.

Hi Russell

Could you have more detail about DSA issues? Do you means the 6250
setting interface to PHY_INTERFACE_MODE_NA?

I think you and i have pretty similar marvell hardware. So i don't
think i can do much additional testing. Ideally we want Florian to do
some testing on b53.

Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
