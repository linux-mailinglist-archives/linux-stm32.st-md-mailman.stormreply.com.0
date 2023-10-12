Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EF7C61E9
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 02:40:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3018AC6B45E;
	Thu, 12 Oct 2023 00:40:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC7AAC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 00:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EC18DCE26A1;
 Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83BDBC433CD;
 Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697071229;
 bh=wGHJyiALp3GFYTvWaoHxyso+f2Vuj4QGs+ejJHlDf/k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VE5CUTDPsvYyqkldEDqOEXMVmFtYsTPZSIVSOrPhdqUiu+qC0gTSFu6e4mo37ejhQ
 /nJHSRLR/5Uq37Vk7V8G+nOXlNvk8vH6E7h/jFJuVqHPRQONGS0TzuyWGyPhojUAH7
 Y4urAQ4NY7DQHqZIv7DL90hwQTF8/SrBLn8tcK2EKIaO4+tESHK8SoJsiMlOStfslk
 O/7RUIjozO0FXUzHR0diff2R+Z5LRSigjR9sS4lydG4rj6L1lOXawWzS/iyDrc3/8u
 ubZ2+bqVueHFdmEqJE9Vi1b+9kyKU6EIaNcULLSEz66GZICCGoNPjSU3dE+Xj/HwlZ
 8gXY0TDIzUzzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5A538E21ED9; Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169707122936.23011.6924255297609142862.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 00:40:29 +0000
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: andrew@lunn.ch, ryazanov.s.a@gmail.com, ziweixiao@google.com,
 chris.snook@gmail.com, ricklind@linux.ibm.com, linux-kernel@vger.kernel.org,
 khalasa@piap.pl, edumazet@google.com, ath10k@lists.infradead.org,
 danymadden@us.ibm.com, gregory.greenman@intel.com, set_pte_at@outlook.com,
 chiranjeevi.rapolu@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linuxwwan@intel.com, robh@kernel.org, jeroendb@google.com, leon@kernel.org,
 linux-rdma@vger.kernel.org, mpe@ellerman.id.au, haren@linux.ibm.com,
 christophe.leroy@csgroup.eu, rushilg@google.com, jgg@ziepe.ca,
 tlfalcon@linux.ibm.com, joabreu@synopsys.com, elder@linaro.org,
 linux-wireless@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 wg@grandegger.com, nnac123@linux.ibm.com, bhupesh.sharma@linaro.org,
 haijun.liu@mediatek.com, kvalo@kernel.org, u.kleine-koenig@pengutronix.de,
 bcf@google.com, npiggin@gmail.com, linux-can@vger.kernel.org,
 ruc_gongyuanjun@163.com, shailend@google.com, mkl@pengutronix.de,
 benjamin.berg@intel.com, m.chetan.kumar@linux.intel.com, tglx@linutronix.de,
 YKarpov@ispras.ru, linux-arm-kernel@lists.infradead.org,
 chandrashekar.devegowda@intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, zhengzengkai@huawei.com, netdev@vger.kernel.org,
 pagadala.yesu.anjaneyulu@intel.com, linuxppc-dev@lists.ozlabs.org,
 dougmill@linux.ibm.com, gustavoars@kernel.org, tariqt@nvidia.com,
 horms@kernel.org, krzysztof.kozlowski@linaro.org, junfeng.guo@intel.com,
 mcoquelin.stm32@gmail.com, rajur@chelsio.com, pkaligineedi@google.com,
 johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v3 1/5] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
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

On Mon,  9 Oct 2023 15:37:50 +0200 you wrote:
> Replace drivers that still use napi_schedule_prep/__napi_schedule
> with napi_schedule helper as it does the same exact check and call.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add missing semicolon
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
    https://git.kernel.org/netdev/net-next/c/ef724517b596
  - [net-next,v3,2/5] netdev: make napi_schedule return bool on NAPI successful schedule
    https://git.kernel.org/netdev/net-next/c/0a779003213b
  - [net-next,v3,3/5] netdev: replace napi_reschedule with napi_schedule
    https://git.kernel.org/netdev/net-next/c/73382e919f3d
  - [net-next,v3,4/5] net: tc35815: rework network interface interrupt logic
    https://git.kernel.org/netdev/net-next/c/be176234d0a8
  - [net-next,v3,5/5] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
    https://git.kernel.org/netdev/net-next/c/d1fea38f01ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
