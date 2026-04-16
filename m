Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO3oN8O+4GnQlQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 12:49:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0B40D09D
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 12:49:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB32DC87ED3;
	Thu, 16 Apr 2026 10:49:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD63C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iTecCTUOjCT2Rh+35c/jBL17rubrlvWXt7j7t5fyE4A=; b=hS+zERdx785E7w8JuVhIqIUjqo
 rfTzzmGwWX/PzAGKN9P/mq5ofpIaokW6Naxsd3Ouod8CcSBoL8YWAadvltn2AtDOzWPioFgM3W23v
 Q5V2vsauwwB7RZ2YexHer3u5vyh7euHUKU2rzvgV9PdVtbEJLLuJicgrkCOfdvGGVSY9FQEmuT38O
 81dAcc0BC83k8bFEmZOvAW7fKXhSVgEb7U0L1T5zR/uJpFRUP321srKZKF/YHgCOLflE8d09edYbj
 fBA/wHJ3iQWgZOYuYhy15KCeJUdJ6s+4ZH/aBdCVzE0WtuP0TEUB7ihUZzfk17611Ex3gsTduFa57
 pydTVpKg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60888)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wDKHp-0000000035z-1EzG;
 Thu, 16 Apr 2026 11:49:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wDKHl-0000000038b-3rco; Thu, 16 Apr 2026 11:49:25 +0100
Date: Thu, 16 Apr 2026 11:49:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID: <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <8409022.LvFx2qVVIh@steina-w>
 <ad-LtOBrKREM1tCk@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5987484.DvuYhMxLoT@steina-w>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: move PHY
 handling out of __stmmac_open()/release()
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.881];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,shell.armlinux.org.uk:mid,armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 75B0B40D09D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
> Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
> > On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> > > Hi,
> > > 
> > > Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
> > > > Move the PHY attachment/detachment from the network driver out of
> > > > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > > > stmmac_release() where these actions will only happen when the
> > > > interface is administratively brought up or down. It does not make
> > > > sense to detach and re-attach the PHY during a change of MTU.
> > > 
> > > Sorry for coming up now. But I recently noticed this commit breaks changing
> > > the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
> > > $ ip link set dev end1 mtu 1400
> > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> > > imx-dwmac 30bf0000.ethernet end1: Link is Down
> > > imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> > > imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed
> > 
> > This basically means that a clock is missing. Please provide more
> > information:
> > 
> > - what kernel version are you using?
> 
> Currently I am using v6.18.22.
> $ ethtool -i end1
> driver: st_gmac
> version: 6.18.22
> firmware-version: 
> expansion-rom-version: 
> bus-info: 30bf0000.ethernet
> supports-statistics: yes
> supports-test: no
> supports-eeprom-access: no
> supports-register-dump: yes
> supports-priv-flags: no
> 
> > - has EEE been negotiated?
> 
> No. It is marked as not supported
> 
> $ ethtool --show-eee end1
> EEE settings for end1:
>         EEE status: not supported
> 
> > - does the problem persist when EEE is disabled?
> 
> As EEE is not supported the problem occurs even with EEE disabled.
> 
> > - which PHY is attached to stmmac?
> 
> It is a TI DP83867.
> 
> imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (irq=136)
> 
> > - which PHY interface mode is being used to connect the PHY to stmmac?
> 
> For this interface
> > phy-mode = "rgmii-id";
> is set.
> 
> In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> Thanks for assisting. If there a further questions, don't hesitate to ask.

Thanks.

So, as best I can determine at the moment, we end up with the following
sequence:

stmmac_change_mtu()
 __stmmac_release()
  phylink_stop()
   phy_stop()
    phy->state = PHY_HALTED
    _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
    _phy_state_machine_post_work()
     phy_suspend()
      genphy_suspend()
       phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)

With the DP83867, this causes most of the PHY to be powered down, thus
stopping the clocks, and this causes the stmmac reset to time out.

Prior to this commit, we would have called phylink_disconnect_phy()
immediately after phylink_stop(), but I can see nothing that would
be affected by this change there (since that also calls
phy_suspend(), but as the PHY is already suspended, this becomes a
no-op.)

However, __stmmac_open() would have called stmmac_init_phy(), which
would reattach the PHY. This would have called phy_init_hw(), 
resetting the PHY, and phy_resume() which would ensure that the
PDOWN bit is clear - thus clocks would be running.

As a hack, please can you try calling phylink_prepare_resume()
between the __stmmac_release() and __stmmac_open() in
stmmac_change_mtu(). This should resume the PHY, thus restoring the
clocks necessary for stmmac to reset.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
