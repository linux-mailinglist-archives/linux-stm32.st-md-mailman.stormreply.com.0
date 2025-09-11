Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E7B5267B
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 04:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9473DC32EBF;
	Thu, 11 Sep 2025 02:32:57 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CACB9C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 02:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=tbGufTgC4Ea0k5Wg/viciM/Ro45OFwFdqd/nvP2O0m4=;
 b=Rk/1L1kidUFupjgqkvtTPvK8Rsu7o7N0+j9R+zXwCY13H464HodSXrC3UHQ1sF
 goS/+VeSZuV1rDljT6JPeAvK0/ZbaHf1OqMXFbOBN0YDGuCJlp/2l0sDRgsyVkbh
 4CwXlT6yacVHPgDSg4hQlQnARDecPnvTq8W7HYkLOlJm4=
Received: from dragon (unknown [])
 by gzsmtp3 (Coremail) with SMTP id M88vCgD3_548NMJosrZGBA--.64549S3;
 Thu, 11 Sep 2025 10:30:23 +0800 (CST)
Date: Thu, 11 Sep 2025 10:30:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aMI0PJtHJyPom68X@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
X-CM-TRANSID: M88vCgD3_548NMJosrZGBA--.64549S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DJF1DWFWDWr1rtF47Jwb_yoW8GFyfpa
 yUCrZ8CrykXr1kXwsFgry2ga4YgwsrJF4YgFyUXrZ7urW5uF18WF1S9ayF9ry7Xr1fZw1Y
 y3W7t340va4ruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jenQUUUUUU=
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgfFZWjB-SqFCQAAsH
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com, Frank.Li@nxp.com,
 edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, Joy Zou <joy.zou@nxp.com>,
 devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, othacehe@gnu.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v10 0/6] Add i.MX91 platform support
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

On Wed, Sep 03, 2025 at 11:40:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:

Jakub,

Can you stop applying DTS changes via net tree?

Shawn

> On Mon,  1 Sep 2025 18:36:26 +0800 you wrote:
> > The design of i.MX91 platform is very similar to i.MX93.
> > Extracts the common parts in order to reuse code.
> > 
> > The mainly difference between i.MX91 and i.MX93 is as follows:
> > - i.MX91 removed some clocks and modified the names of some clocks.
> > - i.MX91 only has one A core.
> > - i.MX91 has different pinmux.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v10,1/6] arm64: dts: freescale: move aliases from imx93.dtsi to board dts
>     (no matching commit)
>   - [v10,2/6] arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
>     (no matching commit)
>   - [v10,3/6] arm64: dts: imx91: add i.MX91 dtsi support
>     (no matching commit)
>   - [v10,4/6] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>     (no matching commit)
>   - [v10,5/6] arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
>     (no matching commit)
>   - [v10,6/6] net: stmmac: imx: add i.MX91 support
>     https://git.kernel.org/netdev/net-next/c/59aec9138f30
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
