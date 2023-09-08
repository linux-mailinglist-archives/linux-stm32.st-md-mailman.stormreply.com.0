Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D17992E1
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Sep 2023 01:40:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EE02C6B458;
	Fri,  8 Sep 2023 23:40:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3663BC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 23:40:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5AA11CE1D2C;
 Fri,  8 Sep 2023 23:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C8C7C433CA;
 Fri,  8 Sep 2023 23:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694216423;
 bh=EYy6dm59NBJFJSkKgAVVKliFV8RPPvIRF78A5HR9JTk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dx3rPf0MzkZsWXLUkXWew2LJ5W//xr3SYY86QyC8Rgn0pdWc/lcZgXiIXqdsmqF+V
 +57Bz+3Un50MNepPyimHkPA0JvqP7f8jXAEvEqetFgvYvBdSx5JmMV5ydu0RsXG6T8
 pVk2AbMW/0XCPRhqSPr1SRsqYflSbM/clfQOewEMTs3O0X9XWNVpn9djmG0y83osd1
 yL3+9xWwoR4SBzCb8Mr7eBjctL96kKBgi3To4SlUvEBr4Pflsk1zTxS5c/nwFkSqus
 WNtBDOYKj5MLEl46UPF+QHba6kYPteVoM0uaFVoXYtO22WXhM0l3z3rzKFzUCJSP1q
 kNkKzqdvlElmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5CAFFF1D6A9; Fri,  8 Sep 2023 23:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169421642337.339.11184428489042288950.git-patchwork-notify@kernel.org>
Date: Fri, 08 Sep 2023 23:40:23 +0000
References: <tencent_FA47B711AB0DEC843EB3362E6355505ED509@qq.com>
In-Reply-To: <tencent_FA47B711AB0DEC843EB3362E6355505ED509@qq.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: yonghong.song@linux.dev, song@kernel.org, laoar.shao@gmail.com,
 rongtao@cestc.cn, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org, mcoquelin.stm32@gmail.com,
 ast@kernel.org, kpsingh@kernel.org, olsajiri@gmail.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, jolsa@kernel.org, bpf@vger.kernel.org,
 martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v12 0/2] selftests/bpf: Optimize
	kallsyms cache
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

This series was applied to bpf/bpf-next.git (master)
by Andrii Nakryiko <andrii@kernel.org>:

On Thu,  7 Sep 2023 09:59:12 +0800 you wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> We need to optimize the kallsyms cache, including optimizations for the
> number of symbols limit, and, some test cases add new kernel symbols
> (such as testmods) and we need to refresh kallsyms (reload or refresh).
> 
> Rong Tao (2):
>   selftests/bpf: trace_helpers.c: optimize kallsyms cache
>   selftests/bpf: trace_helpers.c: Add a global ksyms initialization
>     mutex
> 
> [...]

Here is the summary with links:
  - [bpf-next,v12,1/2] selftests/bpf: trace_helpers.c: optimize kallsyms cache
    https://git.kernel.org/bpf/bpf-next/c/c698eaebdf47
  - [bpf-next,v12,2/2] selftests/bpf: trace_helpers.c: Add a global ksyms initialization mutex
    https://git.kernel.org/bpf/bpf-next/c/a28b1ba25934

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
