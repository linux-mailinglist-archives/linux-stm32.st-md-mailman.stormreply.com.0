Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3F3412B2
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 03:20:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8704C57B7C;
	Fri, 19 Mar 2021 02:20:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43233C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 02:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7FB0864F69;
 Fri, 19 Mar 2021 02:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616120412;
 bh=jNyUZfXlsLhgllYvYDrVviadzfncXMj2v5qCCP9M23Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bvXg9joYsFTdiRkt5TwD7WiYeSaOmxSt7bgWjsM0Q6bAd9qf02SDUvuSQhyHGV2ak
 56uIg2izUMlB85cG3Ho0Z8Pb40GQSQWqC2oFQK/G6Fo4EXftIq0xiqWbf/sQ2R+GSa
 A2ukSb0JDMmcWvLEcwjd7G4DBPn9eO82b4EwvreIkY3bu7jDvrUtp8QrBIboBc+mR8
 +Z6vqbRwGjD4c9MRz+svbtUdxKbB1CHm+7x/2H+aOoW/GyanwBIjkpP/fdo3fvn/e+
 qCiKqTfszX2fok0LpUuViE0Iw6B4eIraFfgemci0pltFLKrElPYc7fvzyESWKfouyT
 42qp9EnoVsmGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 72C2160997;
 Fri, 19 Mar 2021 02:20:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161612041246.22955.7315779436357052148.git-patchwork-notify@kernel.org>
Date: Fri, 19 Mar 2021 02:20:12 +0000
References: <20210317013247.25131-1-boon.leong.ong@intel.com>
In-Reply-To: <20210317013247.25131-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/1] stmmac: add PCH and PSE PTP
	clock setting
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 17 Mar 2021 09:32:46 +0800 you wrote:
> Hi,
> 
> Intel mGBE controllers that are integrated into EHL, TGL SoC have
> different clock source selection. This patch adds the required setting for
> running linuxptp time-sync.
> 
> The patch has been tested on both PSE (/dev/ptp0) and PCH TSN(/dev/ptp2)
> and the results for the time sync looks correct.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: Add PSE and PCH PTP clock source selection
    https://git.kernel.org/netdev/net-next/c/76da35dc99af

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
