Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1E598670A
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 21:38:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E56EAC6C841;
	Wed, 25 Sep 2024 19:38:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B14DFCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WjdEpakeAEueAFF38g825g9x6ZCC7yRWFkL/TDSCzf4=; b=dB4xz0D+ZLsZ8rRZRuHk2g7f0F
 om8LUD3GKpWwh2Fs3G+4EdP2q5XG9Yz8gjo2G7DEG1f4Bd1JMACALUonuEavPkLlVPPyA1xG2FS6I
 YcEPo0BdJgmWGPwQAGeRzveSDy9jrICmq+bDQ5kiaARL9eHZKgJwsXB2kqeA7motkxvr86YlPHUYE
 QdcJaeLGrMUYxDdgqpMGAjohUyzfCRInu5FqJo04rczLL1VDqd6fXb7t9VEUUJlPY6rEujKppCpu5
 9t7/oMgI0pqFFUtir6y1iPINXshZIY6vIePXkf3jyA+fmiGxzikOGI4H37jYDSI/nMe4GenncV4Zn
 fzc2N26g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35972)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1stXqJ-0007AJ-1I;
 Wed, 25 Sep 2024 20:38:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1stXqB-0007bY-1T;
 Wed, 25 Sep 2024 20:38:23 +0100
Date: Wed, 25 Sep 2024 20:38:23 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZvRmr3aU1Fz6z0Oc@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcz-005Ns9-D5@rmk-PC.armlinux.org.uk>
 <20240925131517.s562xmc5ekkslkhp@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925131517.s562xmc5ekkslkhp@skbuf>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 06/10] net: dsa: sja1105:
 simplify static configuration reload
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

On Wed, Sep 25, 2024 at 04:15:17PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 23, 2024 at 03:01:25PM +0100, Russell King (Oracle) wrote:
> > +static int sja1105_set_port_speed(struct sja1105_private *priv, int port,
> > +				  int speed_mbps)
> >  {
> >  	struct sja1105_mac_config_entry *mac;
> > -	struct device *dev = priv->ds->dev;
> 
> I think if you could keep this line in the new sja1105_set_port_speed()
> function..
> 
> >  	u64 speed;
> > -	int rc;
> >  
> >  	/* On P/Q/R/S, one can read from the device via the MAC reconfiguration
> >  	 * tables. On E/T, MAC reconfig tables are not readable, only writable.
> > @@ -1313,7 +1295,7 @@ static int sja1105_adjust_port_config(struct sja1105_private *priv, int port,
> >  		speed = priv->info->port_speed[SJA1105_SPEED_2500MBPS];
> >  		break;
> >  	default:
> > -		dev_err(dev, "Invalid speed %iMbps\n", speed_mbps);
> > +		dev_err(priv->ds->dev, "Invalid speed %iMbps\n", speed_mbps);
> 
> you could also get rid of this unnecessary line change.

Yes, maybe I'll move it to another patch, but the reason I made the
change is that I don't see much point to the local variable existing
for just one user (there were multiple users prior to this patch.)
However...

> >  		return -EINVAL;
> >  	}
> 
> There are 2 more changes which I believe should be made in sja1105_set_port_speed():
> - since it isn't called from mac_config() anymore but from mac_link_up()
>   (change which happened quite a while ago), it mustn't handle SPEED_UNKNOWN
> - we can trust that phylink will not call mac_link_up() with a speed
>   outside what we provided in mac_capabilities, so we can remove the
>   -EINVAL "default" speed_mbps case, and make this method return void,
>   as it can never truly cause an error
> 
> But I believe these are incremental changes which should be done after
> this patch. I've made a note of them and will create 2 patches on top
> when I have the spare time.

... if we were to make those changes prior to this patch, then the
dev_err() will no longer be there and thus this becomes a non-issue.
So I'd suggest a patch prior to this one to make the changes you state
here, thus eliminating the need for this hunk in this patch.

> > +/* Set link speed in the MAC configuration for a specific port. */
> 
> Could this comment state this instead? "Write the MAC Configuration
> Table entry and, if necessary, the CGU settings, after a link speed
> change for this port."

Done.

> > @@ -2293,7 +2294,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
> >  {
> >  	struct ptp_system_timestamp ptp_sts_before;
> >  	struct ptp_system_timestamp ptp_sts_after;
> > -	int speed_mbps[SJA1105_MAX_NUM_PORTS];
> > +	u64 mac_speed[SJA1105_MAX_NUM_PORTS];
> 
> Could you move this line lower to preserve the ordering by decreasing line length?
> 
> >  	u16 bmcr[SJA1105_MAX_NUM_PORTS] = {0};

Probably didn't notice that due to not having full clear sight for the
screen yet (a few more weeks to go before that happens!) Thanks for
spotting that.

> > -	/* Back up the dynamic link speed changed by sja1105_adjust_port_config
> > +	/* Back up the dynamic link speed changed by sja1105_set_port_speed
> 
> Could you please put () after the function name? I know the original
> code did not have it, but my coding style has changed in the past 5 years.

Done.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
