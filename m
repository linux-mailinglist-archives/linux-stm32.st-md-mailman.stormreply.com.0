Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2E8452DD
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 09:38:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F03DC6DD6B;
	Thu,  1 Feb 2024 08:38:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FB41C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rrEM/L5CNb2Siaw0EtzA1uq6MEwvjM+ooAg4sDv+6Ys=; b=vUOaJTXwWrDwPbjOYcQMYs5ISg
 vTGHLnDbiExdxCQU4+KTNPIU0vo8RUyQ92hzTz7icFpYBaS+dkVlGJPjkk0EWKQ3HSrTFCJB++nR2
 7Aqg2M5Ejz5EUOn9yVorOeWvzHkLg8tTSHtgvny4nV3L4Zu1aEsQsALg3kraGBvpB07iF0i2h9Ho2
 BjBcJ9Nr6VKJvSqEu4SvgsXcX67dpfHtE1vY56zz+LBPek48+qvQ38c/NqAo26nxZczitbF9m84Tv
 I9o63J9fpzCon81R3y7mgJvCKpSoiJ9Pqv+yR74mPmdZjG2ujzxls78qpTyAvI1sYV7rCA2INc7Tk
 9YtOja1g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35708)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rVSaG-0004IS-19;
 Thu, 01 Feb 2024 08:38:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rVSa9-0007FA-KA; Thu, 01 Feb 2024 08:38:01 +0000
Date: Thu, 1 Feb 2024 08:38:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZbtYaXkNf2ZF1prE@shell.armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
 <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
 <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v4 06/11] net: stmmac: resetup
 XPCS according to the new interface mode
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

On Thu, Feb 01, 2024 at 01:10:05PM +0800, Choong Yong Liang wrote:
> 
> 
> On 30/1/2024 6:21 pm, Russell King (Oracle) wrote:
> > NAK. Absolutely not. You haven't read the phylink documentation, nor
> > understood how phylink works.
> > 
> > Since you haven't read the phylink documentation, I'm not going to
> > waste any more time reviewing this series since you haven't done your
> > side of the bargin here.
> > 
> Hi Russell,
> 
> Sorry that previously I only studied the phylink based on the `phylink.h`
> itself.

From phylink.h:

/**
 * mac_select_pcs: Select a PCS for the interface mode.
 * @config: a pointer to a &struct phylink_config.
 * @interface: PHY interface mode for PCS
 *
 * Return the &struct phylink_pcs for the specified interface mode, or
 * NULL if none is required, or an error pointer on error.
 *
 * This must not modify any state. It is used to query which PCS should
 * be used. Phylink will use this during validation to ensure that the
 * configuration is valid, and when setting a configuration to internally
 * set the PCS that will be used.
 */

Note the "This must not modify any state." statement. By reinitialising
the PCS in this method, you are violating that statement.

This requirement is because this method will be called by
phylink_validate_mac_and_pcs() at various times, potentially for each
and every interface that stmmac supports, which will lead to you
reinitialising the PCS, killing the link, each time we ask the MAC for
a PCS, whether we are going to make use of it in that mode or not.

You can not do this. Sorry. Hard NAK for this approach.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
