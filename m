Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC652844D85
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Feb 2024 01:00:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B7AFC6DD6D;
	Thu,  1 Feb 2024 00:00:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77164C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Feb 2024 00:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 342B461A24;
 Thu,  1 Feb 2024 00:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A141C43394;
 Thu,  1 Feb 2024 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706745629;
 bh=VQ1dvamFDSryW11vpmGv5L78MWAe9bKmnX4ruK5uSbs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N8/pQahrcMr8fQlcWeBYDBb/MeX8DcaueRP9x84V8xYsa4Kg1hRbTkfwdrT9Ohw8f
 YFlREoniVhxmlc7JjhGtiKMa9R/I8VTOyn4uHzx3MfR4avlQjXH0P5E7HYzeQoSlG1
 n1W9ay7LPAIch4Ia3ZjcBHapWrB41hLPF87pWWMx79/gnUSHeCG1KYTM9HnDMcr+7U
 g5vYZXb2hSCTULnqdtNAZdlJmTh/cm78zqRr8s/HFx5rQQRyYB+pGyneevU4LSnF6X
 3pHfPTFCSXiwWJDKdW+ecg6CDN9gIo4AcMWV0msXAAnV4Va5wp7tndoOcjCFUUJYXf
 QtC2xi+vokbmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5D1D2DC99E8; Thu,  1 Feb 2024 00:00:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170674562937.31899.1767619419103104462.git-patchwork-notify@kernel.org>
Date: Thu, 01 Feb 2024 00:00:29 +0000
References: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
In-Reply-To: <20240129-remove-dwmac-qcom-ethqos-reviewer-v1-1-2645eab61451@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 linux-arm-msm@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Drop unreachable reviewer
 for Qualcomm ETHQOS ethernet driver
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Jan 2024 11:12:11 -0600 you wrote:
> Bhupesh's email responds indicating they've changed employers and with
> no new contact information. Let's drop the line from MAINTAINERS to
> avoid getting the same response over and over.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> If anyone knows how to contact Bhupesh / if they're willing to continue
> being a reviewer feel free to suggest an alternative, but for the moment
> this is better than nothing.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Drop unreachable reviewer for Qualcomm ETHQOS ethernet driver
    https://git.kernel.org/netdev/net/c/e028243003ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
