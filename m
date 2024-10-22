Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAB9AA0B9
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 13:00:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8FEDC78027;
	Tue, 22 Oct 2024 11:00:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DD9C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 11:00:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EFB5DA41BFB;
 Tue, 22 Oct 2024 11:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDA5C4CEC3;
 Tue, 22 Oct 2024 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729594826;
 bh=jyomz7Sjmu20861u8ZNZQbaw2uqKwsh1VDQ9EksgZUk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qiIKhXSjt0oNvYm2GxGQ8CXl1LnctZ6UBfQ1OGz/3TnlCRCkTtZMxanzOQNtyiyAt
 c0EwknnjPtiuqfSIVlLld6LoAzKqXhbzI3+/xpkD/YyKLrbr3BvRXPOLWRqoizyRf0
 L0+KY0/454APnjjH6cUPZiRwRpU5R2FX3idHBA0WKPwFj4k/GpUMIA/kn35qwxBpea
 Nsc5KPWl9spESks4fhFf3vF5xGeDsXN1NcNDMkUEAVhKbrweO7FnL2FF1G362Va+eC
 /LIvJgoWeZwk5DJpiX+2/v9eA30gj4SnZQObweXdhsLQaVpxh4DtXR3jkaexlP1+Bh
 sN01E01mmPhzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D933809A8A; Tue, 22 Oct 2024 11:00:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172959483281.930149.12211861779177755420.git-patchwork-notify@kernel.org>
Date: Tue, 22 Oct 2024 11:00:32 +0000
References: <20241016234313.3992214-1-quic_abchauha@quicinc.com>
In-Reply-To: <20241016234313.3992214-1-quic_abchauha@quicinc.com>
To: Abhishek Chauhan (ABC) <quic_abchauha@quicinc.com>
Cc: mohammad.athari.ismail@intel.com, vee.khee.wong@linux.intel.com,
 kernel@quicinc.com, horms@kernel.org, netdev@vger.kernel.org,
 jonathanh@nvidia.com, linux-stm32@st-md-mailman.stormreply.com,
 tee.min.tan@linux.intel.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, boon.leong.ong@intel.com, kuba@kernel.org,
 Ong@qualcomm.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Programming
 sequence for VLAN packets with split header
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 16 Oct 2024 16:43:13 -0700 you wrote:
> Currently reset state configuration of split header works fine for
> non-tagged packets and we see no corruption in payload of any size
> 
> We need additional programming sequence with reset configuration to
> handle VLAN tagged packets to avoid corruption in payload for packets
> of size greater than 256 bytes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Programming sequence for VLAN packets with split header
    https://git.kernel.org/netdev/net-next/c/d10f1a4e44c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
