Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35B6CD5BF
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 11:01:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E660C69069;
	Wed, 29 Mar 2023 09:01:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFBAEC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tULeCImj22IMpn1LFutB65KLYjJBkR/cczPAM6gdrqA=; b=DzIT2I0wbJp6To2GXSnad+4CKg
 iQZvhFjjwCV7ipWxDY1pIlN/t3/SAjDAAqyxf9NtpBRvEAMh1CzqGUv3S6OBcFMiK8QpYGD3osbSa
 Zu1ajz47K9cKrqZJs6z/+EXPrJyXa+cw9gw0NuSvP3+oxiXOTwIKAnDYnbkX6bQKVeYlliH+FOd4k
 mMwGYcsuose9Mb4dePkOuelQOKwFRoJVM9YCJLgKRNHJJcpHQ3xNFNvDLyVEkG2geNcQShnd+hDja
 RuBTVjcTrKnsMpg/TBKTIib22jV0E6z0NzuY1PS2qw8aVm6ApGfyCW1hbOwgLaurw1Cu8MhOcasYq
 7E0uTDrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46564)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1phRgS-0008EI-Sk; Wed, 29 Mar 2023 10:01:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1phRgO-0007Nn-DX; Wed, 29 Mar 2023 10:01:28 +0100
Date: Wed, 29 Mar 2023 10:01:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZCP+aIoUTw2laZ3/@shell.armlinux.org.uk>
References: <20230324081656.2969663-1-michael.wei.hong.sit@intel.com>
 <20230324081656.2969663-2-michael.wei.hong.sit@intel.com>
 <20230328185720.6239e4a7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230328185720.6239e4a7@kernel.org>
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/3] net: phylink: add
	phylink_expects_phy() method
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

On Tue, Mar 28, 2023 at 06:57:20PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Mar 2023 16:16:54 +0800 Michael Sit Wei Hong wrote:
> > Provide phylink_expects_phy() to allow MAC drivers to check if it
> > is expecting a PHY to attach to. Since fixed-linked setups do not
> > need to attach to a PHY.
> > 
> > Provides a boolean value as to if the MAC should expect a PHY.
> > returns true if a PHY is expected.
> > 
> > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> 
> Russell, looks good?

Not really, given that phylink_attach_phy() will refuse to attach a PHY
when:

        if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
                    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
                     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
                return -EINVAL;

So, if we introduce a helper named "phylink_expects_phy" that returns
true when cfg_link_an_mode == MLO_AN_INBAND and the interface mode
is e.g. 1000base-X, but then someone tries to attach a PHY, the kernel
spits out a warning, backtrace, and a return value of -EINVAL, things
are going to look really rather stupid.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
