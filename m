Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DC871858
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Mar 2024 09:40:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA5AC6DD69;
	Tue,  5 Mar 2024 08:40:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AAC2C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BWwm6Uaae5hMfLSGg+U9y3Fkv0vle+n+mBpNEyJwlQ0=; b=IlePWdjCNRvMIQ6uRq1hCMLdWV
 2A9YQhrZnUMDtIV3accm3gxm5aFQfRI6ZmAzXz6p0tLSyVcIYsl1ctxhqflKDb7feRQnhYma8ejUB
 PJ0wmod4DFOuZHDsynJoijkdqQlY+bs6d5VnjmK4mbCEjQxFT8QvRMRU+5OWLCN8Vz4CeFnK8TyJi
 GqmruHFAY8/SUjiKFefv5Q91pcF2iP6fSckyKMIuMie7NE5Z+biVD1BvAMVQiJFcmz7hAZ4VxEflY
 oT8o0wBkZ8RM/flMFtrWqkw5xPcg0Lm/Y9+mXGVLVs5XscqCxzHJmSWJ7ZSA+mA63/ItQ1GxAudxu
 jlvIKzPQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53184)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rhQKk-0006rB-1j;
 Tue, 05 Mar 2024 08:39:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rhQKg-0005Ht-Cb; Tue, 05 Mar 2024 08:39:30 +0000
Date: Tue, 5 Mar 2024 08:39:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZebaQpwyHi0ZoPws@shell.armlinux.org.uk>
References: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
 <20240215030500.3067426-2-yong.liang.choong@linux.intel.com>
 <Zc47T/qv8Xg2SA21@shell.armlinux.org.uk>
 <PH7PR11MB65210C62342088CF5C484A2888552@PH7PR11MB6521.namprd11.prod.outlook.com>
 <6fbbd36a-20f5-43db-97fc-c8755a82a159@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fbbd36a-20f5-43db-97fc-c8755a82a159@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "Voon, Weifeng" <weifeng.voon@intel.com>,
 "Lai, Peter Jun Ann" <peter.jun.ann.lai@intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, "Abdul Rahim,
 Faizal" <faizal.abdul.rahim@intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/9] net: phylink: provide
 mac_get_pcs_neg_mode() function
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

On Tue, Mar 05, 2024 at 12:20:39PM +0800, Choong Yong Liang wrote:
> 
> 
> On 23/2/2024 2:58 pm, Voon, Weifeng wrote:
> > > > For instance, if the interface switches from 2500baseX to SGMII mode,
> > > > and the current link mode is MLO_AN_PHY, calling
> > > 'phylink_pcs_neg_mode'
> > > > would yield PHYLINK_PCS_NEG_OUTBAND. Since the MAC and PCS driver
> > > > require PHYLINK_PCS_NEG_INBAND_ENABLED, the
> > > 'mac_get_pcs_neg_mode'
> > > > function will calculate the mode based on the interface, current link
> > > > negotiation mode, and advertising link mode, returning
> > > > PHYLINK_PCS_NEG_OUTBAND to enable the PCS to configure the correct
> > > settings.
> > > 
> > > This paragraph doesn't make sense - at least to me. It first talks about
> > > requiring PHYLINK_PCS_NEG_INBAND_ENABLED when in SGMII mode. On
> > > this:
> > 
> > The example given here is a very specific condition and that probably why there are some confusions here. Basically, this patch provides an optional function for MAC driver to change the phy interface on-the-fly without the need of reinitialize the Ethernet driver. As we know that the 2500base-x is messy, in our case the 2500base-x does not support inband. To complete the picture, we are using SGMII c37 to handle speed 10/100/1000. Hence, to enable user to switch link speed from 2500 to 1000/100/10 and vice versa on-the-fly, the phy interface need to be configured to inband SGMII for speed 10/100/1000, and outband 2500base-x for speed 2500. Lastly, the newly introduced "mac_get_pcs_neg_mode"callback function enables MAC driver to reconfigure pcs negotiation mode to inband or outband based on the interface mode, current link negotiation mode, and advertising link mode.
> > 
> > > 
> > > 1) are you sure that the hardware can't be programmed for the SGMII
> > > symbol repititions?
> > > 
> > 
> > No, the HW can be program for SGMII symbol repetitions.
> > 
> > > 2) what happens if you're paired with a PHY (e.g. on a SFP module) which
> > > uses SGMII but has no capability of providing the inband data?
> > > (They do exist.) If your hardware truly does require inband data, it is going to
> > > be fundamentally inoperative with these modules.
> > > 
> > 
> > Above explanation should have already cleared your doubts. Inband or outband capability is configured based on the phy interface.
> > 
> > > Next, you then talk about returning PHYLINK_PCS_NEG_OUTBAND for the
> > > "correct settings". How does this relate to the first part where you basically
> > > describe the problem as SGMII requring inband? Basically the two don't
> > > follow.
> > 
> > It should be a typo mistake. SGMII should return PHYLINK_PCS_NEG_INBAND_ENABLED.
> > 
> > > 
> > > How, from a design point of view, because this fundamentally allows drivers
> > > to change how the system behaves, it will allow radically different behaviours
> > > for the same parameters between different drivers.
> > > I am opposed to that - I want to see a situation where we have uniform
> > > behaviour for the same configuration, and where hardware doesn't support
> > > something, we have some way to indicate that via some form of capabilities.
> > > 
> > 
> > Hi Russell,
> > If I understand you correctly, MAC driver should not interfere with pcs negotiation mode and it should be standardized in the generic function, e.g., phylink_pcs_neg_mode()?
> > 
> > > The issue of whether 2500base-X has inband or not is a long standing issue,
> > > and there are arguments (and hardware) that take totally opposing views on
> > > this. There is hardware where 2500base-X inband _must_ be used or the link
> > > doesn't come up. There is also hardware where 2500base-X inband is not
> > > "supported" in documentation but works in practice. There is also hardware
> > > where 2500base-X inband doesn't work. The whole thing is a total mess
> > > (thanks IEEE 802.3 for not getting on top of this early enough... and what's
> > > now stated in 802.3 for 2500base-X is now irrelevant because they were too
> > > late to the
> > > party.)
> > > 
> > 
> > Agreed. And I have also seen some of your comments regarding the 2500SGMII and 2500BASEX.
> > 
> Hi Russell,
> 
> Did the previous reply clear your doubt?

I am working on the problem as and when I can find the time (which is
not much spare time.) I have some prototype code at the moment.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
