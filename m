Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602E356CC9
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Apr 2021 15:00:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B621AC5719D;
	Wed,  7 Apr 2021 13:00:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D93C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Apr 2021 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MwmTlFwIZ0WzFA7gpz/Eu4MuKSxZumxg+JxlyNKfb2E=; b=a34kgWuUKrL77AW2ECUJOqgeL
 fgvzS2gIsLSSqcjUVD8/SOhvbjo4b+c9gEhfFsMIPBQ6AnBD6j56PiTRa3+30bFhPYZVN84GFVmYP
 TMy3uXGFp5PWXKA8fAFNBo81Eb5kFZbxvwY57wokoZqaPc3YuCCdTQyuUjA/UOdmI9E+hd0ScyaaE
 TPs1cS9Bztbb5Ia+1a/geN3obzQGxdHepvtOUvJfHlzLO2V9KtERh9fki2g+KTtA0XMVooqz/qjLZ
 rOoM6r3YmQv1QD2d0giCqngoIN0oRoyZo15oBKvo1zaTsAGF2Gfb4/pLp6PdllUejbs+FQoEV43K6
 AykgOgGXg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52186)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lU7n1-0008Ht-84; Wed, 07 Apr 2021 14:00:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lU7mx-0001zo-Dm; Wed, 07 Apr 2021 14:00:07 +0100
Date: Wed, 7 Apr 2021 14:00:07 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210407130006.GH1463@shell.armlinux.org.uk>
References: <20210405112953.26008-1-michael.wei.hong.sit@intel.com>
 <YGsMbBW9h4H1y/T8@lunn.ch>
 <CO1PR11MB5044B1F80C412E6F0CAFD5509D779@CO1PR11MB5044.namprd11.prod.outlook.com>
 <YGsgHWItHcLFV9Kg@lunn.ch>
 <SN6PR11MB313690E7953BF715A8F488D688769@SN6PR11MB3136.namprd11.prod.outlook.com>
 <YGy/N+cRLGTifJSN@lunn.ch>
 <SN6PR11MB3136E862F38D7C573759989188759@SN6PR11MB3136.namprd11.prod.outlook.com>
 <YG2pN8uupbXP7xqU@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG2pN8uupbXP7xqU@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>,
 "fugang.duan@nxp.com" <fugang.duan@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "qiangqing.zhang@nxp.com" <qiangqing.zhang@nxp.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] Enable 2.5Gbps speed for
	stmmac
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

On Wed, Apr 07, 2021 at 02:44:39PM +0200, Andrew Lunn wrote:
> > Intel mgbe is flexible to pair with any PHY. Only Aquantia/Marvell
> > multi-gige PHY can do rate adaption right?
> 
> The Marvell/Marvell multi-gige PHY can also do rate
> adaptation. Marvell buying Aquantia made naming messy :-(
> I should probably use part numbers.
> 
> > Hence, we still need to take care of others PHYs.
> 
> Yes, it just makes working around the broken design harder if you want
> to get the most out of the hardware.

FYI, we really need to come up with a good solution to the rate
adaption issue. What we have today really is not good.

For example, take a MAC that supports only 2500base-X connected to a
PHY that does rate adaption from 2500base-X to media speed.

So, the PHY could be capable of 10, 100, 1G and 2.5G media speeds,
and would advertise those in its supported mask. The MAC however
would only report (via the validate callback) support for 2.5G speed
because that's all that 2500base-X supports.

What we really want when a rate adapting capable PHY is connected is
to ignore what ethtool link modes the MAC supports beyond "does it
support this interface type" and just use the PHY supported mask.
However, that's another property of the PHY that we need to know from
phylib, and it's not clear when that property should be made available.
As we know from Marvell PHYs, it depends on the configurable MAC_TYPE
setting, so could only be available once we've selected an interface
mode for the PHY. On the other hand, we might need to know what
interface mode(s) are available from the PHY and MAC to select an
appropriate mode.

This is not easy problems to overcome; I have had some patches for some
time which allow some combination of MAC and PHY to advertise which
interface mode(s) they support but I haven't been entirely happy with
them to push them upstream - and it would be another phylink API change
which means having to maintain the new and old code until everything
has been updated (thereby making stuff a lot more complex.) After the
last round of phylink API updates and the hostility from people over
that, this is a big demotivating factor.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
