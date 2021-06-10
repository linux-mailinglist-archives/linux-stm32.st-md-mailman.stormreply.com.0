Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F43A3549
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 23:00:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0394AC58D5B;
	Thu, 10 Jun 2021 21:00:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08BFBC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 21:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47D04613E7;
 Thu, 10 Jun 2021 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623358807;
 bh=gQn1OCpH9FiMtSDU3KPmVf0lQwc+n6bhW0cgFyyO+fM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bkZDVSaD40TwwsjETeUAkVIV7nHIhtKyxp0XbWd9UhxvjsvFUhocyanfrWcCGDyt2
 xwzgWLp4I87cwd9F4mjnLbrLX93UIBjN9Gb6UP8R3ulqrulRBM8Oc2BTPE5x2wGkbV
 ENLlTOu9pz2KNgCq7f6tXfIgTIaO+RISTaUbsuttngRlWsbq5vO5OreEP1wpWDoWH3
 HfdwKyO08YLxHex0Blo8qGv5seaP1fZGVQ6GOPGHL33fKlDhvqk0AZkmPrl0iL4Uoq
 64/ECulNAfruEEGoE0Me0waKSZdXOf6w6wYk7dxdE7h7Bhrh2w3x8MKmFppLnCCVjR
 3moSZx2ScHkMA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3D31660BE2;
 Thu, 10 Jun 2021 21:00:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162335880724.5408.11064067362825446290.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jun 2021 21:00:07 +0000
References: <20210610085354.656580-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210610085354.656580-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 qiangqing.zhang@nxp.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: Fix mixed
	enum type warning
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

On Thu, 10 Jun 2021 16:53:54 +0800 you wrote:
> The commit 5a5586112b92 ("net: stmmac: support FPE link partner
> hand-shaking procedure") introduced the following coverity warning:
> 
>   "Parse warning (PW.MIXED_ENUM_TYPE)"
>   "1. mixed_enum_type: enumerated type mixed with another type"
> 
> This is due to both "lo_state" and "lp_sate" which their datatype are
> enum stmmac_fpe_state type, and being assigned with "FPE_EVENT_UNKNOWN"
> which is a macro-defined of 0. Fixed this by assigned both these
> variables with the correct enum value.
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] net: stmmac: Fix mixed enum type warning
    https://git.kernel.org/netdev/net-next/c/1f7096f0fdb2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
