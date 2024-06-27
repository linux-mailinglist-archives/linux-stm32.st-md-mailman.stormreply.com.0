Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2691AFBD
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 21:37:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A094C71280;
	Thu, 27 Jun 2024 19:37:35 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4045FC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=oYCCFUsdbLvFXZA3WkDkIuUbJppe2HN72PE2NIGZw5M=; b=M9/lb0bHeHkOSDmbEMEU84cAOp
 lHtPAlQ6bgsfBtAWBS7ZNPF6jgnQfjCpWJbzeZC+2deBvYGVdlfqvb78D6IpQr5bMYw0MPjQzgI0m
 8lHQl0NkzmykT2HHYFc623bPGYQnjXvjnJwyDtvHj9NL+7UvfJ3jfiMCSNp+Sr3IKDDY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMuvl-001Cgs-9J; Thu, 27 Jun 2024 21:37:17 +0200
Date: Thu, 27 Jun 2024 21:37:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride
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

On Thu, Jun 27, 2024 at 12:07:22PM -0500, Andrew Halaney wrote:
> On Thu, Jun 27, 2024 at 01:39:47PM GMT, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> > the time of the DMA reset so we need to loop TX clocks to RX and then
> > disable loopback after link-up. Use the existing callbacks to do it just
> > for this board.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Sorry, not being very helpful but trying to understand these changes
> and the general cleanup of stmmac... so I'll point out that I'm still
> confused by this based on Russell's last response:
> https://lore.kernel.org/netdev/ZnQLED%2FC3Opeim5q@shell.armlinux.org.uk/
> 
> Quote:
> 
>     If you're using true Cisco SGMII, there are _no_ clocks transferred
>     between the PHY and PCS/MAC. There are two balanced pairs of data
>     lines and that is all - one for transmit and one for receive. So this
>     explanation doesn't make sense to me.
> 

Agreed. We need a deeper understanding of the clocking to find an
acceptable solution to this problem.

Is the MAC extracting a clock from the SERDES lines?

Is the PHY not driving the SERDES lines when there is no link?

For RGMII PHYs, they often do have a clock output at 25 or 50MHz which
the MAC uses. And some PHY drivers need asking to not turn this clock
off.  Maybe we need the same here, by asking the PHY to keep the
SERDES lines running when there is no link?

https://elixir.bootlin.com/linux/v6.10-rc5/source/include/linux/phy.h#L781

I also wounder why this is not an issue with plain SGMII, rather than
overclocked SGMII? Maybe there is already a workaround for SGMII and
it just needs extended to this not quiet 2500BaseX mode.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
