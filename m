Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52372A70876
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 18:50:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09181C78F68;
	Tue, 25 Mar 2025 17:50:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF29CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 17:50:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 937E65C55B6;
 Tue, 25 Mar 2025 17:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450E9C4CEE4;
 Tue, 25 Mar 2025 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742925000;
 bh=EL3VnTPJo+P5z/KHMukRAuwWkDM/Ve3eT4OQHlZyvHk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=V0VoNwWFYekJ6GE+Mh79Ye9r10xvX4kYy61L4qTDJYZ1lCE0NvGznWgAIfKpFL7xD
 93yeRa9iyQKS0iQXWhRf4rTKrc48UDEQbIBtWY6q3w4dUpWn6P9CQwZJera0SBAvE0
 +iSXQnrcIbftNlmdBBxtqi3q1IjsHheOyBj42UlEWxEinvkWqO9+h9IkNSJb2Fmocm
 WpnfHJ+VbBj/x8zgx4vl11u0dcmQnoWX/HH6lbmAPrG1fiVVQfnbwP7I+XNqgaU/mP
 OOtZzZhkx1ys+0Hd5tNPncbgutqCCn0S8r0zcXGa2Mrxlq+7SGv20faqTavfOwki07
 3P5WJTPbkKqKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B061F380CFE7; Tue, 25 Mar 2025 17:50:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174292503611.665771.17143313687582113005.git-patchwork-notify@kernel.org>
Date: Tue, 25 Mar 2025 17:50:36 +0000
References: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] stmmac: intel: interface
 switching support for RPL-P platform
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Mar 2025 14:27:42 +0800 you wrote:
> Based on the patch series [1], the enablement of interface switching for
> RPL-P will use the same handling as ADL-N.
> 
> Link: https://patchwork.kernel.org/project/netdevbpf/cover/20250227121522.1802832-1-yong.liang.choong@linux.intel.com/ [1]
> 
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1,1/1] stmmac: intel: interface switching support for RPL-P platform
    https://git.kernel.org/netdev/net-next/c/cc04ed502457

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
