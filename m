Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C39A7C120
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 18:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A9AFC78F85;
	Fri,  4 Apr 2025 16:00:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CB07C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 15:59:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 125784504A;
 Fri,  4 Apr 2025 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8E5C4CEDD;
 Fri,  4 Apr 2025 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743782398;
 bh=WrZEF9Yxb5ULBShRbFH48qvpHj9RvDQIE9VPe6LC7pI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LAEp/ntu2bwl+Irpk6BuOuLI2cgXnKNQat2ed18ZIW5NctNUL1ZzhUd0SiXglWQhU
 wIgNo+pKH0sDGZc3CfjfhKe1E6uLnrSyFFyYIl3nEmcFKvLiqsr900F+GMsCUafUM2
 DSN9Sby7QD1DZoyazHYKnflfzSSO66Ayv/hTocDCBinOtlm/T1P9gOKgzbM39naJXN
 L1UOjaY0n+Afa09d9XFzORjYckdqmIc35buJxrJshty8ZLuuq6Vq+JbSVc52McYwxi
 37zgbu6RCMIJzQo2jfoX/8U0wTXaJ1N8Vtp20CSSmQEpFEPYwjCQEiSc5BKkPgBSae
 0UqgzEXJK8QwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE4F33822D28; Fri,  4 Apr 2025 16:00:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174378243553.3310001.5428425724896312604.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 16:00:35 +0000
References: <20250401061546.1990156-1-nichen@iscas.ac.cn>
In-Reply-To: <20250401061546.1990156-1-nichen@iscas.ac.cn>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: yonghong.song@linux.dev, peterz@infradead.org, linux-kernel@vger.kernel.org,
 song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, juntong.deng@outlook.com,
 mykolal@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, sdf@fomichev.me, mcoquelin.stm32@gmail.com, ast@kernel.org,
 ameryhung@gmail.com, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, oleg@redhat.com, eddyz87@gmail.com, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH] selftests/bpf: Convert comma to semicolon
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

This patch was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Tue,  1 Apr 2025 14:15:46 +0800 you wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - selftests/bpf: Convert comma to semicolon
    https://git.kernel.org/bpf/bpf-next/c/c9661394850d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
