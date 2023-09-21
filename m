Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B736C7A949F
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 15:21:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A7B4C6B46C;
	Thu, 21 Sep 2023 13:21:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19FAEC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=UY8fQYMYp3LwZRz20tNRxkLAI7g3a7cNxYpuf3mT/Kg=; b=Jj9H1CAo5OpcfYVJwcTdJqLBZY
 jkt7qTwvzs9d4PrOzIIOpo5Ze4U2L193NSUaDE/KHgnbuZ8xNxfa34RIN+9sXGBG2BE5FkVc+Jxxx
 CIuH7mKcWvP7/ERSTfSUPFn2QFcoMbWoM78X59SOr3YOvN1VuVwOAkmixNJywIsqGbfs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qjJc4-0075XM-3D; Thu, 21 Sep 2023 15:21:00 +0200
Date: Thu, 21 Sep 2023 15:21:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <37fe9352-ec84-47b8-bb49-9441987ca1b9@lunn.ch>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <5bd05ba2-fd88-4e5c-baed-9971ff917484@lunn.ch>
 <f9b21a9d-4ae2-1f91-b621-2e27f746f661@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9b21a9d-4ae2-1f91-b621-2e27f746f661@linux.intel.com>
Cc: Voon Wei Feng <weifeng.voon@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] TSN auto negotiation
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

> Hi Andrew,
> 
> After conducting a comprehensive study, it seems that implementing
> out-of-band for all link modes might not be feasible. I may have missed some
> key aspects during my analysis.
> 
> Would you be open to sharing a high-level idea of how we could potentially
> make this feasible? Your insights would be greatly appreciated.

stmmac_mac_link_up() gets passed interface, speed and duplex. That
tells you what the PHY has negotiated. Is there anything else you need
to know?

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
