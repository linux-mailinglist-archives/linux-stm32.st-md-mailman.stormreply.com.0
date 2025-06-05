Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF346ACF4D6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 18:57:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52540C30883;
	Thu,  5 Jun 2025 16:57:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7856C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 16:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0A0FB440F3;
 Thu,  5 Jun 2025 16:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99E9C4CEE7;
 Thu,  5 Jun 2025 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749142674;
 bh=pjV3bNzBf1YJf1rM+e/SvZsaxG6fHSEEd/WI3ExKBGY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rrONN9qW1aHmF5/UQgqLlnYMX7Q4VsokJ4R22HjDxXA934YUU0zNzq6yjAiwujQMa
 KT2BDFGdKRzP/RiPPMOj3guszhi3/xzuwAkbC8zf2uYgpL1CGRX07vzgnZ+LbK+xoO
 S2POrMn3TLOiLPh2aqFY3eGuyCbLN4ntVHjMM3uDVAdrSljSC7F2eLY7W2WdHOS1SE
 cy2QFsEcSrC8D7r4pgLvv2jWy1wy9HjfqVoMuyJZ3jhsnzspvg/5ibV+eTyT0dIGxA
 rMpal3yosEluCov6TPplKm4A0gxOA4DKDDgyiLlBBzwaH/JJD+eU+Jm3ASXDOvhYFq
 Mtl+lu6HSwUZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB1FD39D60B4; Thu,  5 Jun 2025 16:58:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174914270651.3142609.5571647506914286281.git-patchwork-notify@kernel.org>
Date: Thu, 05 Jun 2025 16:58:26 +0000
References: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
In-Reply-To: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
To: Rong Tao <rtoax@foxmail.com>
Cc: linux-kselftest@vger.kernel.org, peterz@infradead.org,
 linux-kernel@vger.kernel.org, song@kernel.org, rongtao@cestc.cn,
 yonghong.song@linux.dev, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, juntong.deng@outlook.com,
 mykolal@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, sdf@fomichev.me, mcoquelin.stm32@gmail.com, ast@kernel.org,
 ameryhung@gmail.com, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, oleg@redhat.com, eddyz87@gmail.com, jolsa@kernel.org,
 bpf@vger.kernel.org, martin.lau@linux.dev
Subject: Re: [Linux-stm32] [PATCH bpf-next] selftests/bpf: Fix compile error
 of bin_attribute::read/write()
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
by Alexei Starovoitov <ast@kernel.org>:

On Wed,  4 Jun 2025 13:53:22 +0800 you wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
> bin_attribute::read/write()"), make bin_attribute parameter of
> bin_attribute::read/write() const.
> 
> Signed-off-by: Rong Tao <rongtao@cestc.cn>
> 
> [...]

Here is the summary with links:
  - [bpf-next] selftests/bpf: Fix compile error of bin_attribute::read/write()
    https://git.kernel.org/bpf/bpf-next/c/4b65d5ae9714

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
