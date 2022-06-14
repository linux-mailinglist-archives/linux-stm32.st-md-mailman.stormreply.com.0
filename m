Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB254AC4E
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 10:48:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B3FCC6046A;
	Tue, 14 Jun 2022 08:48:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AA77C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQ2FpvP0XV43LJGQiHOvInjKVg2YYiLABEA2FkVs+fk=; b=H41eTaT/754zEkzjyGDSVV1jae
 NNcAaAFkn2nj5kVBye7Xrc5jCnBKmuWzqfoSEajL5c2nmamLHVN+jFZgVvHs5bNoaiZMif52X2otu
 Jw5IYlO39N7sntceRpmlnQ5XVxvpOsMDXV0aHnqAA+PdnUa6gDhJov1Ir4LopBP2soO/rO8IzsIJ5
 Q5+z7pgeBYKBs1GU8ENeU6PWCN9gdTjueFQd2sXZm0lVP2sBYOnxsWIXCZYd+FJkekq250wOqPjNd
 pRrAQCz9tngYKedFAeNrgCWSMv0dtbODygMkcegk922LMqxHGOvcnJa78NjPvmIQ1huISRUX90vpR
 FW40c+iw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32858)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1o12DA-0002xL-M9; Tue, 14 Jun 2022 09:47:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1o12Cx-0007Ly-ES; Tue, 14 Jun 2022 09:47:31 +0100
Date: Tue, 14 Jun 2022 09:47:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YqhLI0vWuDWNTQ8h@shell.armlinux.org.uk>
References: <20220614030030.1249850-1-boon.leong.ong@intel.com>
 <20220614030030.1249850-4-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614030030.1249850-4-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/5] net: pcs: xpcs: add CL37
 1000BASE-X AN support
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

On Tue, Jun 14, 2022 at 11:00:28AM +0800, Ong Boon Leong wrote:
> +int xpcs_modify_changed(struct dw_xpcs *xpcs, int dev, u32 reg,
> +			u16 mask, u16 set)

Why is this globally visible? I can find no reason for it in this patch
set.

> +{
> +	u32 reg_addr = mdiobus_c45_addr(dev, reg);
> +	struct mii_bus *bus = xpcs->mdiodev->bus;
> +	int addr = xpcs->mdiodev->addr;
> +
> +	return mdiobus_modify_changed(bus, addr, reg_addr, mask, set);

There is a mdiodev_modify_changed() which would be slightly cleaner
here.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
