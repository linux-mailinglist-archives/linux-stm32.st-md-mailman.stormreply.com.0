Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F6B01033
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 02:30:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08818C32E8E;
	Fri, 11 Jul 2025 00:30:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8D75C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 00:30:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 323B2A54AFA;
 Fri, 11 Jul 2025 00:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA6FC4CEE3;
 Fri, 11 Jul 2025 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752193841;
 bh=EUY3LTEqVfnyft6jycovUuD3pKLNok7s/ZTVTtqQMRI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qDXgPd5682nZ7FxAb4YqDdWOGHXZssyZ1ldAX7Z5B3DUTn9/3iaDtxIGl+IU25+/6
 lCszKV01HyORq6wQmXt1o3uXd1KhkRXh5SXKFDB0hrzfQQBQ8ZapuKqBDA93f85QFc
 26fFctGAWw/B1xy0XKWQ9VkKYx78xtROUAJZkcmN3OzZOyZJZVMe2vVjYwaOqoSblB
 v2XnV+3u2o//Jcy4jn/7uzkGWOWL3IRyDiTnp183+Q3udj7HgOZYITzn1+F0vX0JT9
 C4DtjnvVrsqV6x3f7tIZFUbLHaRVg333LZU2L+hV6FrTFfigtTI771vxvSIJZIQfIN
 B+p/Kkkq6AYSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CE0383B266; Fri, 11 Jul 2025 00:31:05 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175219386374.1715084.5771017921965824302.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 00:31:03 +0000
References: <20250708064052.507094-1-inochiama@gmail.com>
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: quentin.schulz@cherry.de, looong.bin@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, alex@ghiti.fr, unicorn_wang@outlook.com, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 l.rubusch@gmail.com, sophgo@lists.linux.dev, paul.walmsley@sifive.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, dlan@gentoo.org,
 netdev@vger.kernel.org, joe@pf.is.s.u-tokyo.ac.jp, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] riscv: sophgo: Add
 ethernet support for SG2042
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Jul 2025 14:40:48 +0800 you wrote:
> The ethernet controller of SG2042 is Synopsys DesignWare IP with
> tx clock. Add device id for it.
> 
> This patch can only be tested on a SG2042 evb board, as pioneer
> does not expose this device.
> 
> The user dts patch link:
> https://lore.kernel.org/linux-riscv/cover.1751700954.git.rabenda.cn@gmail.com
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac
    https://git.kernel.org/netdev/net-next/c/e281c48a7336
  - [net-next,v2,2/3] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
    https://git.kernel.org/netdev/net-next/c/543009e2d4cd
  - [net-next,v2,3/3] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
    https://git.kernel.org/netdev/net-next/c/d40c1ddd9b4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
