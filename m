Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 544C8BE5C76
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 01:20:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED8D9C57B67;
	Thu, 16 Oct 2025 23:20:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 907EAC57B64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 23:20:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47EB76048C;
 Thu, 16 Oct 2025 23:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2EC4CEF1;
 Thu, 16 Oct 2025 23:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760656829;
 bh=XmFZ1aCPOavivGFm2MY2rpuXNMGOSeXgUjkf7jQ4ZSY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NdX2/npyuApB04JWfGhacNAQxh7Odc9VcysylDLj6xMk8iShYkL+ZSQulPbmVQnBP
 K5pg+2x4rOXIYLy6/MyMYeS6YblWpBHbRxa85mGx9Tk6J6BtgBwZEvq73JTA0pytjx
 ArdCtEq5O8mdevH4P1QWpfnYtEyun22mdyT+Cb4iSUuo1rXgpb8dsxGPZS5jSmxjI3
 JisiJn9jyFWATdHaf1lUoFioBvz9dCMI6MtKCCLWPD+H59kELGRRS+ljXrFV/Gdpm2
 y3F5YA3qkcYciAK53CnN5e8x+tQREXUYNusfIxLgbYaK1Oiu7vSYJxbtxC+7PBPOPc
 dVhsyg7mVesfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D7739D0C31; Thu, 16 Oct 2025 23:20:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176065681299.1942659.16205838065637894819.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 23:20:12 +0000
References: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
In-Reply-To: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
To: =?utf-8?b?6Z+m5bCa5aifIDx3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ningyu@eswincomputing.com,
 0x1207@gmail.com, lizhi2@eswincomputing.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v8 0/2] Add driver support for Eswin
 eic7700 SoC ethernet controller
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

On Wed, 15 Oct 2025 19:37:51 +0800 you wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Updates:
> 
>   Changes in v8:
>   - Removed config option patch dependency from cover letter, because the patch
>     was applied.
>   - Modify the theme style of patch 2.
>   - Remove unnecessary dependencies, such as CRC32 and MII
>   - Add "Reviewed-by" tag of "Andrew Lunn" for Patch 2.
>   - Update eswin,eic7700-eth.yaml
>     - Add new line character at the end of file
>   - Update dwmac-eic7700.c
>     - Provide callbacks for plat_dat->init/exit and plat_dat->suspend/resume
>       to optimize clock processing
>     - Use devm_stmmac_pltfr_probe() instead of stmmac_dvr_probe() in probe
>     - Remove eic7700_dwmac_remove()
>   - Link to v7: https://lore.kernel.org/all/20250918085612.3176-1-weishangjuan@eswincomputing.com/
> 
> [...]

Here is the summary with links:
  - [v8,1/2] dt-bindings: ethernet: eswin: Document for EIC7700 SoC
    https://git.kernel.org/netdev/net-next/c/888bd0eca93c
  - [v8,2/2] net: stmmac: add Eswin EIC7700 glue driver
    https://git.kernel.org/netdev/net-next/c/ea77dbbdbc4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
