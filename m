Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD573A452
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 17:07:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0222C65E4F;
	Thu, 22 Jun 2023 15:07:40 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC8C8C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8TPy4M/IgqT8baUzBBF1Ot9HCGGq63OZ2dRMS9U2qEs=; b=hr+LCn33yjNicFl80hCKAgwrYa
 93pDGSYl0/5FwW8xGbJb8Bzwztin6lA17hYELqtlfCGcjrfacnkQeDW1Lnhs4p6Yp9NR9LNSd0rby
 dueuqWRwCA/tDevppb+kFIH3iP5TedRM6dFD9YtjJX/8Ws4z3nGPQtt/kPtZ3e1NnRrVf76+qMMas
 62BEzt/rZsSylnXlBn0qSGDCDDv9NEhrrUizNFGFJRep32eCpFzYECJyP8A5b3s7RW+cRqYqeWdnp
 VDJTdWx8a7knGFAp2YasyuIJXY4IANgHDg2DsKL018BtVc64glMoFn4kujqH487kklA3eYmyQy7u1
 E9hIGVdw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43762)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1qCLtO-0004OW-29; Thu, 22 Jun 2023 16:06:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qCLtH-0000Wx-N7; Thu, 22 Jun 2023 16:06:31 +0100
Date: Thu, 22 Jun 2023 16:06:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <ZJRjd0oqj95U0nHc@shell.armlinux.org.uk>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-4-yong.liang.choong@linux.intel.com>
 <ZJReJ2yxqKGQx1BU@corigine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJReJ2yxqKGQx1BU@corigine.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, "Tan,
 Tee Min" <tee.min.tan@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phy: update in-band AN
 mode when changing interface by PHY driver
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

On Thu, Jun 22, 2023 at 04:43:51PM +0200, Simon Horman wrote:
> On Thu, Jun 22, 2023 at 12:19:02PM +0800, Choong Yong Liang wrote:
> > From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
> > 
> > Add cur_link_an_mode into phy_device struct for PHY drivers to
> > communicate the in-band AN mode setting with phylink framework.
> > 
> > As there is a mechanism in PHY drivers to switch the PHY interface
> > between SGMII and 2500BaseX according to link speed. In this case,
> > the in-band AN mode should be switching based on the PHY interface
> > as well, if the PHY interface has been changed/updated by PHY driver.
> > 
> > For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
> > back for SGMII mode (10/100/1000Mbps).
> > 
> > Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
> > Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> ...
> 
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index 11c1e91563d4..c685b526e307 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -756,6 +756,8 @@ struct phy_device {
> >  	/* MACsec management functions */
> >  	const struct macsec_ops *macsec_ops;
> >  #endif
> > +	/* For communicate the AN mode setting with phylink framework. */
> > +	u8 cur_link_an_mode;
> >  };
> 
> Hi Choong Yong Liang,
> 
> Please consider adding cur_link_an_mode to the kernel doc
> for struct phy_device - which is above the definition of struct phy_device.

This looks like it's grabbing something from phylink and stuffing it
into phylib.  However, I have no idea, because I don't seem to have
received the original patches. I'm guessing the reason is:

2023-06-22 05:21:24 1qCBoy-0003ji-G9 H=mga03.intel.com
[134.134.136.65]:57703 I=[78.32.30.218]:25
X=TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256
F=<yong.liang.choong@linux.intel.com> rejected after DATA: unqualified
address not permitted: failing address in "Cc:" header is: Tan

Which I suspect came from:

	Tan, Tee Min <tee.min.tan@linux.intel.com>

and someone doesn't realise that a "," in the display-name part of
an address *must* be quoted, otherwise "," is taken to be a separator
in the address list.

Consequently, it has now become:

	Tan@web.codeaurora.org, Tee Min <tee.min.tan@linux.intel.com>,

It should have been:

	"Tan, Tee Min" <tee.min.tan@linux.intel.com>

with the double-quotes.

Please do not review this series further, but instead, please can the
author repost it forthwith with correct conformant headers so that a
proper review can be undertaken by all?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
