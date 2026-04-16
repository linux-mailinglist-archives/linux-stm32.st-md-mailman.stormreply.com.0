Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIzVElrS4GkkmQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 14:13:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C980740DF13
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 14:13:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07678C8F264;
	Thu, 16 Apr 2026 12:13:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30432C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AIZQJPYeD4Klv4nLBvyqUTztK6P7r8ggtIOdUjT5wQA=; b=h4m/JvhyZfSGI5OiZCL3DDxSfr
 KzDrb1zIsDmWivUkIcaB/o06a0iSDM456JwtObAttrJ9Kch0WEo4lE9fhZSQwfc7nhQ46PWfSgiya
 4VwSXQVl2ZRSFgnD+BfqfqDmgP7hGeso+VI7ifD5LoRYIyyQNHtqL3T1CI1YUO25fOIn02KBlmagI
 roY6lN70L99orwRNf2k2tgRmE/2mtoV0F0w6nZwmfvyPxOUWxyfGWkIvEe2aWqcOLf20LCS6O81yA
 fZ9+/Vv2XZkP0LJkjJzISYuXk77beeNx+LNNpTcIxKbpr6XfbFC9niKJ8C4OVBtBTBGyKk5l2Aokn
 /gVKcPvg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35374)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wDLah-000000003Bs-1WLm;
 Thu, 16 Apr 2026 13:13:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wDLae-000000003C1-2Ds6; Thu, 16 Apr 2026 13:13:00 +0100
Date: Thu, 16 Apr 2026 13:13:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID: <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w>
 <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2410317.ElGaqSPkdT@steina-w>
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
	NEURAL_SPAM(0.00)[0.861];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: C980740DF13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 02:02:53PM +0200, Alexander Stein wrote:
> Hi Russel,
> 
> Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Oracle):
> > On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
> > > Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
> > > > On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> > > > > Hi,
> > > > > 
> > > > > Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
> > > > > > Move the PHY attachment/detachment from the network driver out of
> > > > > > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > > > > > stmmac_release() where these actions will only happen when the
> > > > > > interface is administratively brought up or down. It does not make
> > > > > > sense to detach and re-attach the PHY during a change of MTU.
> > > > > 
> > > > > Sorry for coming up now. But I recently noticed this commit breaks changing
> > > > > the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
> > > > > $ ip link set dev end1 mtu 1400
> > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> > > > > imx-dwmac 30bf0000.ethernet end1: Link is Down
> > > > > imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> > > > > imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed
> > > > 
> > > > This basically means that a clock is missing. Please provide more
> > > > information:
> > > > 
> > > > - what kernel version are you using?
> > > 
> > > Currently I am using v6.18.22.
> > > $ ethtool -i end1
> > > driver: st_gmac
> > > version: 6.18.22
> > > firmware-version: 
> > > expansion-rom-version: 
> > > bus-info: 30bf0000.ethernet
> > > supports-statistics: yes
> > > supports-test: no
> > > supports-eeprom-access: no
> > > supports-register-dump: yes
> > > supports-priv-flags: no
> > > 
> > > > - has EEE been negotiated?
> > > 
> > > No. It is marked as not supported
> > > 
> > > $ ethtool --show-eee end1
> > > EEE settings for end1:
> > >         EEE status: not supported
> > > 
> > > > - does the problem persist when EEE is disabled?
> > > 
> > > As EEE is not supported the problem occurs even with EEE disabled.
> > > 
> > > > - which PHY is attached to stmmac?
> > > 
> > > It is a TI DP83867.
> > > 
> > > imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (irq=136)
> > > 
> > > > - which PHY interface mode is being used to connect the PHY to stmmac?
> > > 
> > > For this interface
> > > > phy-mode = "rgmii-id";
> > > is set.
> > > 
> > > In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > Thanks for assisting. If there a further questions, don't hesitate to ask.
> > 
> > Thanks.
> > 
> > So, as best I can determine at the moment, we end up with the following
> > sequence:
> > 
> > stmmac_change_mtu()
> >  __stmmac_release()
> >   phylink_stop()
> >    phy_stop()
> >     phy->state = PHY_HALTED
> >     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
> >     _phy_state_machine_post_work()
> >      phy_suspend()
> >       genphy_suspend()
> >        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
> > 
> > With the DP83867, this causes most of the PHY to be powered down, thus
> > stopping the clocks, and this causes the stmmac reset to time out.
> > 
> > Prior to this commit, we would have called phylink_disconnect_phy()
> > immediately after phylink_stop(), but I can see nothing that would
> > be affected by this change there (since that also calls
> > phy_suspend(), but as the PHY is already suspended, this becomes a
> > no-op.)
> > 
> > However, __stmmac_open() would have called stmmac_init_phy(), which
> > would reattach the PHY. This would have called phy_init_hw(), 
> > resetting the PHY, and phy_resume() which would ensure that the
> > PDOWN bit is clear - thus clocks would be running.
> > 
> > As a hack, please can you try calling phylink_prepare_resume()
> > between the __stmmac_release() and __stmmac_open() in
> > stmmac_change_mtu(). This should resume the PHY, thus restoring the
> > clocks necessary for stmmac to reset.
> 
> I tried the following patch. This works as you suspected.

Brilliant, thanks for proving the theory why it broke.

I'll have a think about the best way to solve this, because
phylink_prepare_resume() is supposed to be paired with phylink_resume()
and that isn't the case here.

Please bear with me as my availability for looking at the kernel is
very unpredictable at present (family health issues.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
