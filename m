Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B918470FA
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Feb 2024 14:18:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FEF9C6DD9D;
	Fri,  2 Feb 2024 13:18:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1BAAC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Feb 2024 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GgHJ6mpt+sOxZhrwPb+ILFfuKufz3zU3QkcfFgIv9gg=; b=xDklo3pApLb8ZOGMPyWL65DQJw
 0x180dHVvfkqlgvdJby6hvV7d1kC10Mj+zr11NIAJR/2e4qFfisHmg1IDy2RETNnVIHBgRraW1PHK
 R7qu8Wb9T81DPmzDL3WN0mSRZd+w8C8cHhYg3isbItb65jAX3gw2kVmraq0WNfhstwRw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rVtQx-006mi6-6c; Fri, 02 Feb 2024 14:18:19 +0100
Date: Fri, 2 Feb 2024 14:18:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <04ed368c-9889-483c-b08f-9c061d433528@lunn.ch>
References: <Zby24IKSgzpvRDNF@shell.armlinux.org.uk>
 <E1rVpvh-002Pdv-Ol@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1rVpvh-002Pdv-Ol@rmk-PC.armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: sxgbe: remove
 eee_enabled/eee_active in sxgbe_get_eee()
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

On Fri, Feb 02, 2024 at 09:33:49AM +0000, Russell King (Oracle) wrote:
> sxgbe_get_eee() sets edata->eee_active and edata->eee_enabled from its
> own copy, and then calls phy_ethtool_get_eee() which in turn will call
> genphy_c45_ethtool_get_eee().
> 
> genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
> with its own interpretation from the PHYs settings and negotiation
> result.
> 
> Therefore, setting these members in sxgbe_get_eee() is redundant.
> Remove this, and remove the priv->eee_active member which then becomes
> a write-only variable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
