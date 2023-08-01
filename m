Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD176B544
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 14:57:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C38E2C6A5E6;
	Tue,  1 Aug 2023 12:57:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CDC0C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A1UXyGi4tVO1CNUnpyY8C1O55E/6x79wyybqrcHbfvA=; b=0IC1RGg2Hm6kgEu7PxHbmxTU0D
 h4LJEtklGDODfDxqL2zvXibphfmcLkhnLMgU90+1UpkswU7hCpTMnwdIqFZ66X7KG2ZWjWUk1udRh
 AIjs13najytZS+5vLWfUkcs59o4/5QI4VE0ucL1cnJKiYdxOORrbtKxvtnryYUNaRwkcZ25TUwSDi
 e6+btWY5g4lPajiNzOpQoRTulBSlMq1EaEqiY7RXswMvxBMbMHcHt9m3UwmtICalV3EREDwXtJLXV
 dXHZurCfRd1AjEA7F8zW64y/dM6jBybCT5fSPMmAq3AKLU1fKA2xjL7nrEQJRhYcOLqvg5fO/RAMA
 hhpXN4LA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55550)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qQovd-00045o-14;
 Tue, 01 Aug 2023 13:56:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qQovY-0000i5-6Y; Tue, 01 Aug 2023 13:56:40 +0100
Date: Tue, 1 Aug 2023 13:56:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMkBCGJrX/COB5+f@shell.armlinux.org.uk>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Frank Li <frank.li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, Shenwei Wang <shenwei.wang@nxp.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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

On Tue, Aug 01, 2023 at 02:47:46PM +0200, Johannes Zink wrote:
> Hi Shenwei,
> 
> thanks for your patch.
> 
> On 7/31/23 18:19, Shenwei Wang wrote:
> > When using a fixed-link setup, certain devices like the SJA1105 require a
> > small pause in the TXC clock line to enable their internal tunable
> > delay line (TDL).
> 
> If this is only required for some devices, is it safe to enforce this
> behaviour unconditionally for any kind of fixed link devices connected to
> the MX93 EQOS or could this possibly break for other devices?

This same point has been raised by Andrew Halaney in message-id
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
and Fabio Estevam in message-id
 <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
but we don't seem to have any answer for it.

Also, the patch still uses wmb() between the write and the delay, and as
Will Deacon pointed out in his message, message-id
 <20230728153611.GH21718@willie-the-truck>
this is not safe, yet still a new version was sent.

It seems the author of these patches is pretty resistant to comments,
and has shown that when I was requesting changes - it was an awful
struggle to get changes made. I'm now of the opinion that I really
can't be bothered to review these patches, precisely because feedback
is clearly not welcome or if welcome, apparently acted upon.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
