Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A6767667
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 21:34:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C26DC6B468;
	Fri, 28 Jul 2023 19:34:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 227B2C6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 19:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPenveROvmLP9xK4bVQXMQSFpU0bLGq9l0utMcWGrfM=; b=S3P1XhiNI7tuydMrFHMGOtysw4
 y7VxJlfdAExXJizqj4Qwc25CAaVdYRwdYTPeALneag129u+mW6NnjT+T7k+1BVbMz+6GnQ6+zyvVC
 5D/9nWvpNBg6jeMWlTkQqS1v1Vjh6m0kkwvLLrcDyceBa4zN8zpSuc+kjysseEjfRfV+FRPavTh3I
 2bEi9qFHbGOxrV/B3SdL+Wi8gKML0mDxdC/hgbe7PHi4k2/FvVElp9vrZNON7d8E+42y6XEfwhOfh
 Z+s9pckqRxtpCUryeXfQx6shKLGrkvw7ZIZ02ie2f7et1TgNMLqrVWXt/zXpXur+ZGbxJDiZM4Cza
 KjzCUZCQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47138)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qPTDb-0007kx-2V;
 Fri, 28 Jul 2023 20:33:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qPTDW-0005B7-3J; Fri, 28 Jul 2023 20:33:38 +0100
Date: Fri, 28 Jul 2023 20:33:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <ZMQYEs9gULZmmijV@shell.armlinux.org.uk>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
 <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
 <20230728153611.GH21718@willie-the-truck>
 <ZMPs+sOIzWR0LmrP@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMPs+sOIzWR0LmrP@lizhi-Precision-Tower-5810>
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause
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

On Fri, Jul 28, 2023 at 12:29:46PM -0400, Frank Li wrote:
> On Fri, Jul 28, 2023 at 04:36:12PM +0100, Will Deacon wrote:
> > Yes, I don't think wmb() is the right thing here. If you need to ensure
> > that the write to MAC_CTRL_REG has taken effect, then you'll need to go
> > through some device-specific sequence which probably involves reading
> > something back. If you just need things to arrive in order eventually,
> > the memory type already gives you that.
> > 
> > It's also worth pointing out that udelay() isn't necessarily ordered wrt
> > MMIO writes, so that usleep_range() might need some help as well.
> 
> Hi Deacon:
> 
> Does it means below pattern will be problem?
> 
> 1.writel()
> 2.udelay()
> 3.writel()

Yes, it can be a problem - because the first write may take a while
to hit the hardware. It's been this way ever since PCI became a thing,
even on x86 hardware.

PCI posting rules are that writes can be posted into the various
bridges in the bus structure and forwarded on at some point later.
However, reads are not allowed to bypass writes - which means that if
one reads from a PCI device, the preceeding writes need to be flushed
out of the bridges _in the path to the device being read_.

So, if we take an example and apply it to PCI:

	writel()
	udelay(100)
	writel()
	readl()

The device could well see nothing for a while, and then two consecutive
writes and a read in quick succession.

> It may not wait enough time between 1 and 3. I think the above pattern
> is quite common in driver code.  I am not sure if usleep_range involve
> MMIO to get current counter, ARM may use cp15 to get local timer counter.

There are no guarantees, even on x86, that udelay() offers anything to
space device writes apart.

If this pattern is popular in drivers, and it's critical to the
drivers operation, then it's technically buggy - and it's been that way
for at least a couple of decades! One might get away with it (maybe the
hardware isn't delaying the writes?) but the kernel has never
guaranteed that writel(), udelay(), writel() will space the two writes
apart by the specified delay.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
