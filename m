Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDGEDLHz4Wmv0AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 10:47:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E748C418E5D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 10:47:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91423C87ECF;
	Fri, 17 Apr 2026 08:47:40 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 690BDC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=l58XSNH8R/mwB60BqCvoOIYMvGSIH31wM+Rks1CFbpc=; b=Yxg6prFE+rhlPUeg5StCJV+gQM
 mTb7z1pMiSEwSlRHUUkv/yzPxIDjbUf65/dR9QpFvSa/3p5U991X4shATrwkuGb5gTxL0x7nCHuqZ
 qNFn7LW5usVSeTlSW26q7KOc4yjxfg/O6UXCUNiK9xJY8s8PifSM06UMHECY3TEbS6SXHy/NqoXQW
 rOZ6YLh58nMyw743cdgcQayPEv0sei9cdhl07OXbqYB7VOXYhd3BxE9d7CidC/ZE+EE5sLUDZu652
 +5lDKnKX6TDqnLOhDa3mNnMFTSsphmlhOTZf1gkqyYo5X4JSdHUS5YCxpTiVEVFn+fXluhz2ZtaX1
 9ZIx+6Dg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <alexander.stein@ew.tq-group.com>)
 id 1wDerM-000PCr-0s; Fri, 17 Apr 2026 10:47:32 +0200
Received: from localhost ([127.0.0.1])
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <alexander.stein@ew.tq-group.com>)
 id 1wDerL-0006uB-1S; Fri, 17 Apr 2026 10:47:31 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Fri, 17 Apr 2026 10:47:30 +0200
Message-ID: <13939918.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <680c384c-135f-44cd-a2cd-7e4fd0ec4bf7@bootlin.com>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
 <680c384c-135f-44cd-a2cd-7e4fd0ec4bf7@bootlin.com>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27974/Fri Apr 17 08:24:08 2026)
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] Re: [PATCH net-next 5/6] net: stmmac: move PHY
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ew.tq-group.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ew.tq-group.com:s=default2602];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexander.stein@ew.tq-group.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.854];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: E748C418E5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Freitag, 17. April 2026, 09:11:59 CEST schrieb Maxime Chevallier:
> Hi,
> =

> On 16/04/2026 14:13, Russell King (Oracle) wrote:
> > On Thu, Apr 16, 2026 at 02:02:53PM +0200, Alexander Stein wrote:
> >> Hi Russel,
> >>
> >> Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Ora=
cle):
> >>> On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
> >>>> Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Ora=
cle):
> >>>>> On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell Kin=
g (Oracle):
> >>>>>>> Move the PHY attachment/detachment from the network driver out of
> >>>>>>> __stmmac_open() and __stmmac_release() into stmmac_open() and
> >>>>>>> stmmac_release() where these actions will only happen when the
> >>>>>>> interface is administratively brought up or down. It does not make
> >>>>>>> sense to detach and re-attach the PHY during a change of MTU.
> >>>>>>
> >>>>>> Sorry for coming up now. But I recently noticed this commit breaks=
 changing
> >>>>>> the MTU on i.MX8MP. Once I simply change the MTU I run into some D=
MA error:
> >>>>>> $ ip link set dev end1 mtu 1400
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Link is Down
> >>>>>> imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> >>>>>> imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine init=
ialization failed
> >>>>>
> >>>>> This basically means that a clock is missing. Please provide more
> >>>>> information:
> >>>>>
> >>>>> - what kernel version are you using?
> >>>>
> >>>> Currently I am using v6.18.22.
> >>>> $ ethtool -i end1
> >>>> driver: st_gmac
> >>>> version: 6.18.22
> >>>> firmware-version: =

> >>>> expansion-rom-version: =

> >>>> bus-info: 30bf0000.ethernet
> >>>> supports-statistics: yes
> >>>> supports-test: no
> >>>> supports-eeprom-access: no
> >>>> supports-register-dump: yes
> >>>> supports-priv-flags: no
> >>>>
> >>>>> - has EEE been negotiated?
> >>>>
> >>>> No. It is marked as not supported
> >>>>
> >>>> $ ethtool --show-eee end1
> >>>> EEE settings for end1:
> >>>>         EEE status: not supported
> >>>>
> >>>>> - does the problem persist when EEE is disabled?
> >>>>
> >>>> As EEE is not supported the problem occurs even with EEE disabled.
> >>>>
> >>>>> - which PHY is attached to stmmac?
> >>>>
> >>>> It is a TI DP83867.
> >>>>
> >>>> imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP838=
67] (irq=3D136)
> >>>>
> >>>>> - which PHY interface mode is being used to connect the PHY to stmm=
ac?
> >>>>
> >>>> For this interface
> >>>>> phy-mode =3D "rgmii-id";
> >>>> is set.
> >>>>
> >>>> In case it is helpful. My platform is arch/arm64/boot/dts/freescale/=
imx8mp-tqma8mpql-mba8mpxl.dts
> >>>> Thanks for assisting. If there a further questions, don't hesitate t=
o ask.
> >>>
> >>> Thanks.
> >>>
> >>> So, as best I can determine at the moment, we end up with the followi=
ng
> >>> sequence:
> >>>
> >>> stmmac_change_mtu()
> >>>  __stmmac_release()
> >>>   phylink_stop()
> >>>    phy_stop()
> >>>     phy->state =3D PHY_HALTED
> >>>     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
> >>>     _phy_state_machine_post_work()
> >>>      phy_suspend()
> >>>       genphy_suspend()
> >>>        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
> >>>
> >>> With the DP83867, this causes most of the PHY to be powered down, thus
> >>> stopping the clocks, and this causes the stmmac reset to time out.
> >>>
> >>> Prior to this commit, we would have called phylink_disconnect_phy()
> >>> immediately after phylink_stop(), but I can see nothing that would
> >>> be affected by this change there (since that also calls
> >>> phy_suspend(), but as the PHY is already suspended, this becomes a
> >>> no-op.)
> >>>
> >>> However, __stmmac_open() would have called stmmac_init_phy(), which
> >>> would reattach the PHY. This would have called phy_init_hw(), =

> >>> resetting the PHY, and phy_resume() which would ensure that the
> >>> PDOWN bit is clear - thus clocks would be running.
> >>>
> >>> As a hack, please can you try calling phylink_prepare_resume()
> >>> between the __stmmac_release() and __stmmac_open() in
> >>> stmmac_change_mtu(). This should resume the PHY, thus restoring the
> >>> clocks necessary for stmmac to reset.
> >>
> >> I tried the following patch. This works as you suspected.
> > =

> > Brilliant, thanks for proving the theory why it broke.
> > =

> > I'll have a think about the best way to solve this, because
> > phylink_prepare_resume() is supposed to be paired with phylink_resume()
> > and that isn't the case here.
> > =

> > Please bear with me as my availability for looking at the kernel is
> > very unpredictable at present (family health issues.)
> =

> FWIW I am able to reproduce this with imx8mp + ksz9131
> =

> I can give this a try as Russell isn't available.

Thanks for conforming this for another PHY. What I'm wondering right now:
Why is the PHY stopped in the first place? We are just changing the MTU, no?
This has no effect on the PHY itself. "all" we need to do is reconfiguring
the DMA. I have a proof of concept running, but it needs more cleanup due
to code duplication.

Best regards
Alexander
-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
