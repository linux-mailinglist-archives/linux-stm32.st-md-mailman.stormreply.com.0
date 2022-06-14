Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF754B971
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 20:58:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45CF6C5A4FD;
	Tue, 14 Jun 2022 18:58:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 815F3C0D2BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=IX+klwzAQQ1z7rE9HiAxH5Ct3Iw/kApUkoCb4QjaGFM=; b=SYiH0cCXRGuuwK6ZPC52upau/s
 dvoOTx/1gHnsIFDJU1fwwGzQmwewiDO58Mco275hgLsQzPVMHZZucOXKxUChjQMS3ip4FiO9BuSH9
 mThWpbvD030Rya/sFROCX4GqTxtHWq+AnVZc136uSUDMXkn7WhBRA27KtHdqgg+by+AE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1o1Bjd-006vCV-6E; Tue, 14 Jun 2022 20:57:53 +0200
Date: Tue, 14 Jun 2022 20:57:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YqjaMbUERWuBL9FJ@lunn.ch>
References: <20220614030030.1249850-1-boon.leong.ong@intel.com>
 <20220614030030.1249850-5-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614030030.1249850-5-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Vladimir Oltean <olteanv@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Emilio Riva <emilio.riva@ericsson.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 4/5] stmmac: intel: add
 phy-mode and fixed-link ACPI _DSD setting support
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

> +	/* For fixed-link setup, we allow phy-mode setting */
> +	fwnode = dev_fwnode(&pdev->dev);
> +	if (fwnode) {
> +		const char *phy_mode;
> +
> +		if (!fwnode_property_read_string(fwnode, "phy-mode",
> +						 &phy_mode)) {
> +			if (!strcmp(phy_mode, "sgmii"))
> +				plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
> +			if (!strcmp(phy_mode, "1000base-x"))
> +				plat->phy_interface = PHY_INTERFACE_MODE_1000BASEX;
> +		}

fwnode_get_phy_mode() and then validate the value afterwards.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
