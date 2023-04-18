Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4E6E574C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 04:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C0F4C65E70;
	Tue, 18 Apr 2023 02:10:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F246C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 02:10:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF51562C3A;
 Tue, 18 Apr 2023 02:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1335C433A0;
 Tue, 18 Apr 2023 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681783819;
 bh=MvfqSWbs8IULCqRVEwCUVudPRPAhWInXRLQP6KdLf4g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N8dDczYqartLaUqoIyTNnBT8ml/i6GU3vvQJNL5tL0bcr7JsVZSDKTp30lcVwo6GV
 xdS7LOzJs9sHbMRrAbSswEyY4ldrTzo8T08AnKJQC65WN9LOg0h5Uaj0ouhpNnzzqP
 ubW3A/MVAXg4hxM3y/5y3mhos/Bh+v+XHRqYkB+IAmLOOmteXoiEVpRLxuj2vzhSKy
 6PT2Qd/xDA6jCsHU7UKbRYi6+YBL7+pc4BJysYeGpUI0u9270ymphtBqPryzPUWfP7
 mDLX3mQXeWGGOvGXJwpXHoD+n3Zz6vYEZRx9u6WzWqSXpr6P+WD9mI7GdTUuD+g/G4
 n6zLzufhQHkVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A8DA6C40C5E; Tue, 18 Apr 2023 02:10:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168178381968.5081.7896199883043114155.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 02:10:19 +0000
References: <20230415064503.3225835-1-yoong.siang.song@intel.com>
In-Reply-To: <20230415064503.3225835-1-yoong.siang.song@intel.com>
To: Song@ci.codeaurora.org, Yoong Siang <yoong.siang.song@intel.com>
Cc: alexanderduyck@fb.com, edumazet@google.com, sdf@google.com,
 boon.leong.ong@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 xdp-hints@xdp-project.net, daniel@iogearbox.net, john.fastabend@gmail.com,
 joabreu@synopsys.com, brouer@redhat.com, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, ast@kernel.org,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/3] XDP Rx HWTS metadata for
	stmmac driver
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

On Sat, 15 Apr 2023 14:45:00 +0800 you wrote:
> Implemented XDP receive hardware timestamp metadata for stmmac driver.
> 
> This patchset is tested with tools/testing/selftests/bpf/xdp_hw_metadata.
> Below are the test steps and results.
> 
> Command on DUT:
> 	sudo ./xdp_hw_metadata <interface name>
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] net: stmmac: introduce wrapper for struct xdp_buff
    https://git.kernel.org/netdev/net-next/c/5b24324a907c
  - [net-next,v6,2/3] net: stmmac: add Rx HWTS metadata to XDP receive pkt
    https://git.kernel.org/netdev/net-next/c/e3f9c3e34840
  - [net-next,v6,3/3] net: stmmac: add Rx HWTS metadata to XDP ZC receive pkt
    https://git.kernel.org/netdev/net-next/c/9570df353309

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
