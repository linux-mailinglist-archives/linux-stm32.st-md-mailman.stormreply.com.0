Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFAF8448AC
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 21:20:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C05C6DD6D;
	Wed, 31 Jan 2024 20:20:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88EE1C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 20:20:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CE156CE22DA;
 Wed, 31 Jan 2024 20:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1644BC43399;
 Wed, 31 Jan 2024 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706732429;
 bh=5n2GPaqqGywO7Qry4eYZWTM4oFGQUDmGZmFT4fN7rrA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j2uVbYHmJ0BNlBHTdgUBgToOHPf+Qp4+Unj1DhM4x0CdZn1Tp36nyKi13zJ4NsBIr
 //0kQJg6fwsnmWQYfnR2CZSUXvSIpo3/iGgYh/XaFnVL1jU0DTgM8QBNto5qWBWVDS
 vcqbDp7/vd0zLOGyh5KfD4vVhxPymWXNSaVHEQnaHcADHr+VtdaF38ZzDPzu6o8zPU
 fWEGnzHYcE7+2/JhZaS3ZIov8rGKSfUD63SwZdSAHH3lFpglQsA/0G3nIPMWrFeXm3
 9frtgxX17A8LyAlpcuY9DlRurZmEwHMKebMLzPTzZHfIKjiacmWjriWBzUTbkx54sG
 53m66RsqvuGaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F2F56DC99E4; Wed, 31 Jan 2024 20:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170673242899.4502.6917209613478941432.git-patchwork-notify@kernel.org>
Date: Wed, 31 Jan 2024 20:20:28 +0000
References: <cover.1706491398.git.dxu@dxuuu.xyz>
In-Reply-To: <cover.1706491398.git.dxu@dxuuu.xyz>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: fsverity@lists.linux.dev, alan.maguire@oracle.com,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, memxor@gmail.com,
 coreteam@netfilter.org, netfilter-devel@vger.kernel.org, quentin@isovalent.com,
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org,
 cgroups@vger.kernel.org, bpf@vger.kernel.org, olsajiri@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 0/3] Annotate kfuncs in
	.BTF_ids section
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

On Sun, 28 Jan 2024 18:24:05 -0700 you wrote:
> === Description ===
> 
> This is a bpf-treewide change that annotates all kfuncs as such inside
> .BTF_ids. This annotation eventually allows us to automatically generate
> kfunc prototypes from bpftool.
> 
> We store this metadata inside a yet-unused flags field inside struct
> btf_id_set8 (thanks Kumar!). pahole will be taught where to look.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/3] bpf: btf: Support flags for BTF_SET8 sets
    https://git.kernel.org/bpf/bpf-next/c/79b47344bbc5
  - [bpf-next,v4,2/3] bpf: btf: Add BTF_KFUNCS_START/END macro pair
    https://git.kernel.org/bpf/bpf-next/c/2747e0ee57c2
  - [bpf-next,v4,3/3] bpf: treewide: Annotate BPF kfuncs in BTF
    https://git.kernel.org/bpf/bpf-next/c/6e7769e6419f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
