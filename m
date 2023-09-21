Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942287A950F
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 16:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 589FFC6A60C;
	Thu, 21 Sep 2023 14:09:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57BB9C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QISaqh9G4DzFpv5qasHYVcLuNJPZgvVZsAh/znxO66M=; b=VTNXQ5zmMk1xgow0SjFQvHt7VN
 0OlTTyoPg7ZIpxBxeIU5typ9qHlfn0/xSso3I2iftYkpqJ634DTbhiaQtB5l3Wd87OYBZJNU2Bb6d
 eML8VrqhPP2DcRnLyCt8/fybhGJnmThXov9Re3ZPC+3fbPOkMd7IlkHUHiwD67n4Wd5Bgc6TD0sKM
 0kAhDgWRq0aHFtC2k/M7p2kExzhACC/czUICFb7UJiHO+JpDzMVRg6nM/tqBqvNi2q0RTpXoNfn4n
 Hfy3Vn4bcwu0knjJwimf2lmh9X5OEEvxP2vZbojvJhogNjHL5KmgfH28RdQWEFu9Rhk/sdAtzXaRK
 Nl880l+g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54114)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qjKMe-0004lU-0u;
 Thu, 21 Sep 2023 15:09:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qjKMb-0003aw-Q8; Thu, 21 Sep 2023 15:09:05 +0100
Date: Thu, 21 Sep 2023 15:09:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZQxOgfw3LD5Bu2iD@shell.armlinux.org.uk>
References: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
 <4caade36-d4be-4670-ac79-d9d00488293d@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4caade36-d4be-4670-ac79-d9d00488293d@lunn.ch>
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, platform-driver-x86@vger.kernel.org,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Jean Delvare <jdelvare@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
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
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/5] TSN auto negotiation
	between 1G and 2.5G
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

On Thu, Sep 21, 2023 at 03:14:59PM +0200, Andrew Lunn wrote:
> > Auto-negotiation between 10, 100, 1000Mbps will use
> > in-band auto negotiation. Auto-negotiation between 10/100/1000Mbps and
> > 2.5Gbps will work as the following proposed flow, the stmmac driver reads
> > the PHY link status registers then identifies the negotiated speed.
> 
> I don't think you replied to my comment.
> 
> in-band is just an optimisation. It in theory allows you to avoid a
> software path, the PHY driver talking to the MAC driver about the PHY
> status. As an optimisation, it is optional. Linux has the software
> path and the MAC driver you are using basically has it implemented.

Sorry Andrew, I have to disagree. It isn't always optional - there are
PHYs out there where they won't pass data until the in-band exchange
has completed. If you try to operate out-of-band without the PHY being
told that is the case, and program the MAC/PCS end not to respond to
the in-band frames from the PHY, the PHY will report link up as normal
(since it reports the media side), but no data will flow because the
MAC facing side of the PHY hasn't completed.

The only exception are PHYs that default to in-band but have an inband
bypass mode also enabled to cover the case where the MAC/PCS doesn't
respond to the inband messages.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
