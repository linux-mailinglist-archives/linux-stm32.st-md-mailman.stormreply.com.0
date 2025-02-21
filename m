Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB24A3EA38
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Feb 2025 02:40:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50DAAC7A832;
	Fri, 21 Feb 2025 01:40:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A241C7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 01:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31A1A683B5;
 Fri, 21 Feb 2025 01:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72347C4CED1;
 Fri, 21 Feb 2025 01:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740102009;
 bh=btDMxeNfHBPNti2EoCCt/T314QWXygFwMOmYrLNf9ro=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MXepqXaRM4dVPsZFOEB7ouyCJSGm2Meq4q/xIOE+jd15D6NGJv5MlJ11lOtELov26
 vb6Qo/vCHwGaWuM6j+aECkThrTXqJuj9n4Co8AF/jGKjsrhioPuVmOveu2YTkIbu8Q
 wk8fBvXTzPE9xVv3mHz9ZKEHZsm4VYbRYMV3C/tftMDf4OyJPnoTk9+/nJmJOcmIN5
 qTPKkOO8pMG98R/rr+JkAKcE2wHkRz5SR+PgOMhg28NxWpGz07teN/RQ+DsvRHUrxj
 JHI03CieeTQBe9pXC9MrKEU1Ekw0EKKEd1dz/sbBXjosAXPCXyksjvP1fO+R97RMjj
 Gwyk8ilUJvQFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71AB6380CEE2; Fri, 21 Feb 2025 01:40:41 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174010204026.1539943.5735764109259382582.git-patchwork-notify@kernel.org>
Date: Fri, 21 Feb 2025 01:40:40 +0000
References: <20250216093430.957880-1-yoong.siang.song@intel.com>
In-Reply-To: <20250216093430.957880-1-yoong.siang.song@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: joabreu@synopsys.com, linux-kselftest@vger.kernel.org,
 florian.bezdeka@siemens.com, jdamato@fastly.com, ast@kernel.org,
 faizal.abdul.rahim@linux.intel.com, song@kernel.org, edumazet@google.com,
 anthony.l.nguyen@intel.com, danielj@nvidia.com, yonghong.song@linux.dev,
 shuah@kernel.org, jolsa@kernel.org, almasrymina@google.com,
 xuanzhuo@linux.alibaba.com, mykolal@fb.com, xdp-hints@xdp-project.net,
 donald.hunter@gmail.com, daniel@iogearbox.net, corbet@lwn.net,
 przemyslaw.kitszel@intel.com, linux-doc@vger.kernel.org,
 john.fastabend@gmail.com, andrii@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 eddyz87@gmail.com, maciej.fijalkowski@intel.com, hawk@kernel.org,
 kpsingh@kernel.org, yong.liang.choong@linux.intel.com,
 magnus.karlsson@intel.com, haoluo@google.com, willemb@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 zdenek.bouska@siemens.com, andrew+netdev@lunn.ch, bjorn@kernel.org,
 horms@kernel.org, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 martin.lau@linux.dev, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH bpf-next v12 0/5] xsk: TX metadata Launch
	Time support
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

This series was applied to bpf/bpf-next.git (net)
by Martin KaFai Lau <martin.lau@kernel.org>:

On Sun, 16 Feb 2025 17:34:25 +0800 you wrote:
> This series expands the XDP TX metadata framework to allow user
> applications to pass per packet 64-bit launch time directly to the kernel
> driver, requesting launch time hardware offload support. The XDP TX
> metadata framework will not perform any clock conversion or packet
> reordering.
> 
> Please note that the role of Tx metadata is just to pass the launch time,
> not to enable the offload feature. Users will need to enable the launch
> time hardware offload feature of the device by using the respective
> command, such as the tc-etf command.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v12,1/5] xsk: Add launch time hardware offload support to XDP Tx metadata
    https://git.kernel.org/bpf/bpf-next/c/ca4419f15abd
  - [bpf-next,v12,2/5] selftests/bpf: Add launch time request to xdp_hw_metadata
    https://git.kernel.org/bpf/bpf-next/c/6164847e5403
  - [bpf-next,v12,3/5] net: stmmac: Add launch time support to XDP ZC
    https://git.kernel.org/bpf/bpf-next/c/04f64dea1364
  - [bpf-next,v12,4/5] igc: Refactor empty frame insertion for launch time support
    https://git.kernel.org/bpf/bpf-next/c/f9b53bb13923
  - [bpf-next,v12,5/5] igc: Add launch time support to XDP ZC
    https://git.kernel.org/bpf/bpf-next/c/d7c3a7ff7502

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
