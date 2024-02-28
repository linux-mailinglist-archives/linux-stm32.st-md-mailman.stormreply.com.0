Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 668FE86AD26
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Feb 2024 12:30:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096FDC6C841;
	Wed, 28 Feb 2024 11:30:37 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D247C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Feb 2024 11:30:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4C999CE2112;
 Wed, 28 Feb 2024 11:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8F8C43141;
 Wed, 28 Feb 2024 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709119832;
 bh=lFcJGAGA5lcdDj56mNYSZV+dF9xdORWlqOqFhmkTMpY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CKYsrabLBrEuo0epyrgwkcdozKSzdA3nAWk/hRMw/4XGMv6R3FxqaFS1S2pCp/ylG
 ZzCbjUrMiDzAOvpDffiU09oYBVuSGRSpWWuJL6dnFs/9JM9/jvqjHz0ipEgn7mPy5j
 qkLNn3DkXKQhjRolmY3X3mdPI+JTfEAowua/gnWRiDDRcV0KSBhyqbIRu7uF9MFSTO
 YwcKOmBLxN05f34Ap46Z2m6zNQo42x4AJU8YuhGL1GQ8IFh2Rr1lAD8mNAjN3zDtLk
 TMTt/vdwcqWCl352R+w7Pnx04fcPueo3Ya5x+yA2f3dqppt7YNMYfDFOZ/4AjLwz4Y
 UjvwBowqe4RYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 34ECFC595D2; Wed, 28 Feb 2024 11:30:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170911983221.5841.1928393024313525974.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 11:30:32 +0000
References: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
In-Reply-To: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
To: Sarosh Hasan <quic_sarohasa@quicinc.com>
Cc: quic_jsuraj@quicinc.com, quic_snehshah@quicinc.com,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, kernel@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 psodagud@quicinc.com, ahalaney@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
 netdev@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 konrad.dybcio@linaro.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac:
 dwmac-qcom-ethqos: Update link clock rate only for RGMII
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

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 26 Feb 2024 15:12:26 +0530 you wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: dwmac-qcom-ethqos: Update link clock rate only for RGMII
    https://git.kernel.org/netdev/net-next/c/26311cd112d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
