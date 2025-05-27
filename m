Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A2AC59A1
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 20:00:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D25C36B1E;
	Tue, 27 May 2025 18:00:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90E15C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 18:00:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0A535C5794;
 Tue, 27 May 2025 17:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828BBC4CEE9;
 Tue, 27 May 2025 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748368798;
 bh=tGyF8P4S3EbpCGhv5Z7+NumLX4kyyVCYj56OYjztRUc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ggt6+u75DuvvhATXL/Ewb/Tq5FV0I1Sxv6il87g5pmcWFTwGMNBYEIz0F+RpIpq2L
 y5xDFiwe5FhVeBpkceQMQDA11szxUtqBezuC4ejM7PnpXXCsvb/leNkeqUCU2jyP+L
 iCzGf9c30L1bTSveU3ZRMPLosVFHfbFNftZUkyWSFKCOrqpO+AsoItqhbJYktg9BPe
 XRpxjQziE+o8xnvHVP8IjsEfpwzKrvJi+Q0lDl1yoCFm69wfQApAUbYYYr2KkM4ovI
 f1XcwM6CypG/fOxjpYJsYlGkXCYiKKwY5NoWZgzMzSjIosmKx9ZvbILKzeTX9Ha16t
 X7BNVlEMOv7pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB29F380AAE2; Tue, 27 May 2025 18:00:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174836883250.1728518.5524041990135634472.git-patchwork-notify@kernel.org>
Date: Tue, 27 May 2025 18:00:32 +0000
References: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
In-Reply-To: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29_=3Calexis=2Elothore=40bo?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 =?utf-8?q?otlin=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: thomas.petazzoni@bootlin.com, catalin.marinas@arm.com, song@kernel.org,
 yonghong.song@linux.dev, xukuohai@huawei.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com, daniel@iogearbox.net,
 will@kernel.org, john.fastabend@gmail.com, andrii@kernel.org, sdf@fomichev.me,
 bastien.curutchet@bootlin.com, revest@chromium.org, puranjay@kernel.org,
 mcoquelin.stm32@gmail.com, ebpf@linuxfoundation.org, xukuohai@huaweicloud.com,
 ast@kernel.org, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, eddyz87@gmail.com, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 0/2] bpf,
	arm64: support up to 12 arguments
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
by Alexei Starovoitov <ast@kernel.org>:

On Tue, 27 May 2025 12:06:02 +0200 you wrote:
> Hello,
> 
> this is the v2 of the many args series for arm64, being itself a revival
> of Xu Kuhoai's work to enable larger arguments count for BPF programs on
> ARM64 ([1]).
> 
> The discussions in v1 shed some light on some issues around specific
> cases, for example with functions passing struct on stack with custom
> packing/alignment attributes: those cases can not be properly detected
> with the current BTF info. So this new revision aims to separate
> concerns with a simpler implementation, just accepting additional args
> on stack if we can make sure about the alignment constraints (and so,
> refusing attachment to functions passing structs on stacks). I then
> checked if the specific alignment constraints could be checked with
> larger scalar types rather than structs, but it appears that this use
> case is in fact rejected at the verifier level (see a9b59159d338 ("bpf:
> Do not allow btf_ctx_access with __int128 types")). So in the end the
> specific alignment corner cases raised in [1] can not really happen in
> the kernel in its current state. This new revision still brings support
> for the standard cases as a first step, it will then be possible to
> iterate on top of it to add the more specific cases like struct passed
> on stack and larger types.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/2] bpf, arm64: Support up to 12 function arguments
    https://git.kernel.org/bpf/bpf-next/c/9014cf56f13d
  - [bpf-next,v3,2/2] selftests/bpf: enable many-args tests for arm64
    https://git.kernel.org/bpf/bpf-next/c/149ead9d7e3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
