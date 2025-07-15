Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43424B069EE
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 01:39:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6077C349C3;
	Tue, 15 Jul 2025 23:39:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B712C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 23:39:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DED5646909;
 Tue, 15 Jul 2025 23:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9497C4CEE3;
 Tue, 15 Jul 2025 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752622785;
 bh=q3QIBc/TsdXBWirwIMIHxwp+8kRlnWdwqh1CRlQ82NU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EotaRwYUI7AAtHpn69V6T63FUu/TQgcsEuWQOrGJo5F/IWGf/z8IHUenYw8Wive+q
 SW+2AYdXXZnmnd1P07d86pJso5KevSYAytDeXBV8yKUD8jzz8mYgCQGDyf91U4sHFq
 P6IMnFoISHnRqz3EQjKoshItmjaTR2ckZ6hVNdApnhi06fRk7/SC1Ug8Fzsqatr2IY
 Dx9rJYvDkp/2iyFt4NSFObtVDPvbC0Wy40Fs2/gScMSVKTw2qrM83nX406DfumOpWO
 fDyy21UbuPE1UQBOdAlXT8ewL0TuaC6fcxGrIBpcfh3CdnUH2vzUnPkpaADF5HJmS1
 w9ZyS9PBNsmhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7167E383BA30; Tue, 15 Jul 2025 23:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175262280626.617203.5242260114409933910.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jul 2025 23:40:06 +0000
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
To: =?utf-8?b?TWFya3VzIEJsw7ZjaGwgPG1hcmt1c0BibG9jaGwuZGU+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-kernel@vger.kernel.org, lakshmi.sowjanya.d@intel.com,
 markus.bloechl@ipetronik.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, jstultz@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, tglx@linutronix.de, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 13 Jul 2025 22:21:41 +0200 you wrote:
> get_time_fn() callback implementations are expected to fill out the
> entire system_counterval_t struct as it may be initially uninitialized.
> 
> This broke with the removal of convert_art_to_tsc() helper functions
> which left use_nsecs uninitialized.
> 
> Initially assign the entire struct with default values.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: intel: populate entire system_counterval_t in get_time_fn() callback
    https://git.kernel.org/netdev/net/c/e6176ab107ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
