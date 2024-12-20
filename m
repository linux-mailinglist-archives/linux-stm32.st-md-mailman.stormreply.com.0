Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7849F9609
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 17:10:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EB0C7801F;
	Fri, 20 Dec 2024 16:10:02 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7941CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734710994;
 bh=fSXg3M/0mE8dVreQMS+uKgIjGxP4AW3NuyFyKIkJBq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dqgar4bGC/BLTv2QAKUIkd2BygKD5e+I0N6V1xCCiHT4NcuJf81I2UBZKgl/I2g0I
 xe9LrGIyhi7C1/heLBUBDO9Skf77DK2pj7i7SxlKOg/5f9AzGqx52JiQelpf/+sZZ0
 u+Ty20bmSfwigAHVjK7LVjv7NACp3IIM0822nozSR64AdZiFSUZm1aDySRvxihfbnZ
 5HvHwXOW8O7OYTTygAdQi5vEaXe6sZwaQKCGAkgRPGo8DxDVWt+YsSiZRyabLxHEml
 5CCY8Q9OkSZe6yVrutIwuFPJwcNeQez0WcFSAZePgyev6fQJttjdxW1p/RjjvfFnW/
 C85XNIPcbjE1g==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1000])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CE71617E37AB;
 Fri, 20 Dec 2024 17:09:48 +0100 (CET)
Date: Fri, 20 Dec 2024 13:09:45 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: patchwork-bot+netdevbpf@kernel.org, Jakub Kicinski <kuba@kernel.org>
Message-ID: <876cf020-e2ba-46a7-b9b2-82dcd47f7a04@notapiano>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
Cc: edumazet@google.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 bartosz.golaszewski@linaro.org, joabreu@synopsys.com, pabeni@redhat.com,
 ahalaney@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, biao.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net,
 =?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Nov 14, 2024 at 04:00:27AM +0000, patchwork-bot+netdevbpf@kernel.or=
g wrote:
> Hello:
> =

> This series was applied to netdev/net.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> =

> On Sat, 09 Nov 2024 10:16:31 -0500 you wrote:
> > This series fixes the inverted handling of the mediatek,mac-wol DT
> > property. This was done with backwards compatibility in v1, but based on
> > the feedback received, all boards should be using MAC WOL, so many of
> > them were incorrectly described and didn't have working WOL tested
> > anyway. So for v2, the approach is simpler: just fix the driver handling
> > and update the DTs to enable MAC WOL everywhere.
> > =

> > [...]
> =

> Here is the summary with links:
>   - [v2,1/2] net: stmmac: dwmac-mediatek: Fix inverted handling of mediat=
ek,mac-wol
>     https://git.kernel.org/netdev/net/c/a03b18a71c12
>   - [v2,2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for=
 all boards
>     (no matching commit)

Hi Jakub,

This message implies patch 2 was also applied, but I only see patch 1, not =
patch
2 there:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/log/?qt=3Dgr=
ep&q=3Dmac-wol

So I just wanted to confirm whether it was applied or not. It would be fine=
 for
patch 2 to be merged through the mediatek tree as is usual if you haven't
already taken it.

(Also, FYI, I was not CC'ed in this message from the patchwork bot)

Thanks,
N=EDcolas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
