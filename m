Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE0856984
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 17:27:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CE55C6410C;
	Thu, 15 Feb 2024 16:27:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36A03C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWZIyim+Tuvyt3wOnNkE0nCb5ATARobWhzBcyG/FuL0=; b=O3eXekOJVXDVMI39FdMDQkdpcQ
 PyjL5Dp5oG/MIRx71Pmy9Oi9Hqr6Y5DXH1kPsFJECm5WupOzQxQbOVHAWtYrJvcQR6gWYx+INfcsj
 RgJ5BhvXhBy8LpAGO6Bn9EVL+nCHFpRakzgLNGrKYS6chsqYXFfNQMp5Nd1DEibb8RGpESJD22vtb
 mxLpMMerGDK7pWuuZvnrxKzUtE77cgbAHo+Sa3QVBQX9uYcpWwISHvv0IwKzm14Mn+ILqGbTXFctw
 zuJqNDDoa8H2VHQp77/Mb+L9J5ruUXBZddwARnpiVsfxS6tP/jxZCuvDl3nVDDB7Iy5CRJ2DGWnBp
 sIXX7vsQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50496)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1raeZg-0004Qb-2H;
 Thu, 15 Feb 2024 16:27:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1raeZb-0004pl-Eb; Thu, 15 Feb 2024 16:26:55 +0000
Date: Thu, 15 Feb 2024 16:26:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Zc47T/qv8Xg2SA21@shell.armlinux.org.uk>
References: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
 <20240215030500.3067426-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240215030500.3067426-2-yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
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

On Thu, Feb 15, 2024 at 11:04:51AM +0800, Choong Yong Liang wrote:
> Phylink invokes the 'mac_get_pcs_neg_mode' function during interface mode
> switching and initial startup.
> 
> This function is optional; if 'phylink_pcs_neg_mode' fails to accurately
> reflect the current PCS negotiation mode, the MAC driver can determine the
> mode based on the interface mode, current link negotiation mode, and
> advertising link mode.
> 
> For instance, if the interface switches from 2500baseX to SGMII mode,
> and the current link mode is MLO_AN_PHY, calling 'phylink_pcs_neg_mode'
> would yield PHYLINK_PCS_NEG_OUTBAND. Since the MAC and PCS driver require
> PHYLINK_PCS_NEG_INBAND_ENABLED, the 'mac_get_pcs_neg_mode' function
> will calculate the mode based on the interface, current link negotiation
> mode, and advertising link mode, returning PHYLINK_PCS_NEG_OUTBAND to
> enable the PCS to configure the correct settings.

This paragraph doesn't make sense - at least to me. It first talks about
requiring PHYLINK_PCS_NEG_INBAND_ENABLED when in SGMII mode. On this:

1) are you sure that the hardware can't be programmed for the SGMII
symbol repititions? 

2) what happens if you're paired with a PHY (e.g. on a SFP module)
which uses SGMII but has no capability of providing the inband data?
(They do exist.) If your hardware truly does require inband data, it
is going to be fundamentally inoperative with these modules.

Next, you then talk about returning PHYLINK_PCS_NEG_OUTBAND for the
"correct settings". How does this relate to the first part where you
basically describe the problem as SGMII requring inband? Basically
the two don't follow.

How, from a design point of view, because this fundamentally allows
drivers to change how the system behaves, it will allow radically
different behaviours for the same parameters between different drivers.
I am opposed to that - I want to see a situation where we have uniform
behaviour for the same configuration, and where hardware doesn't
support something, we have some way to indicate that via some form
of capabilities.

The issue of whether 2500base-X has inband or not is a long standing
issue, and there are arguments (and hardware) that take totally
opposing views on this. There is hardware where 2500base-X inband
_must_ be used or the link doesn't come up. There is also hardware
where 2500base-X inband is not "supported" in documentation but works
in practice. There is also hardware where 2500base-X inband doesn't
work. The whole thing is a total mess (thanks IEEE 802.3 for not
getting on top of this early enough... and what's now stated in 802.3
for 2500base-X is now irrelevant because they were too late to the
party.)

I haven't been able to look at this issue over the last few weeks
because of being at a summit, and then suffering with flu and its
recovery. However, I have been working on how we can identify the
capabilities of the PCS and PHY w.r.t. inband support in various
interface modes, and how we can handle the result. That work is
ongoing (as and when I have a clear head from after-flu effects.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
