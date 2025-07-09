Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF6AFEDDB
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B55C36B2A;
	Wed,  9 Jul 2025 15:36:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6DFCC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B872661148;
 Wed,  9 Jul 2025 15:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F52C4CEEF;
 Wed,  9 Jul 2025 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752075368;
 bh=z5R0g5bRaFcE+byBEvAYFxwzxwtN+sL10BzKO0308UM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kJaOkhdxWi9qV5vWcFnJ+JHTiQSlubZYl18mUsLG/pSBYdw+T1NKtWF5028TxIiFZ
 wZfpISsYz6qDXmz2TI9Vt2XUjIKX936nTToXVpxLwiDoaCgB6R4T9SzqBhHgJFfpBd
 DUjk1wdx3vSPwyZIM2EFvrhSQPqiWhpnXIU+dEh09EHx2ZObNI3mOIZsCcG9pdYe8q
 BC4Z5NY1XOLoQTFEXD6LRKGjWkLN/mitCQSJ4wZRDpY40o5N+wT3fnKdwgpqCDUsHx
 JG9DsmlWMhj+0erNX6r8khQZ4MuvF5NJtd+TeRO4St5FF7gaDqAbNdZh8u/V4dEqHi
 8bPTgLe8qW+Og==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250709021638.2047365-1-robh@kernel.org>
References: <20250709021638.2047365-1-robh@kernel.org>
Message-Id: <175207536585.695960.5730567147905543825.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 16:36:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-07fe9
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
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

On Tue, 08 Jul 2025 21:16:37 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: defe01abfb7f5c5bd53c723b8577d4fcd64faa5a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
