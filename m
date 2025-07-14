Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19520B03BF5
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 12:33:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A7EC3F92E;
	Mon, 14 Jul 2025 10:33:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BA6C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 10:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 663EE4403D;
 Mon, 14 Jul 2025 10:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B13C4CEED;
 Mon, 14 Jul 2025 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752489225;
 bh=SWVRq9s8qi4vJBJhqL/e4RYaOr864sv/OrB9hMLrPRU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fsheUnp8PcWtoHD4n4iByTCF0+zkJyNJoOSR9CqUIgZwegpP1OvJD5XY5YhXFL0rF
 C/v3rr28VzO4eWGcz5DwxfY090knqgTsRWL1b6wsVYjeHR44QWVUsm9kNQ9AfhMnUz
 vhu3bGMrqqQjCcWKZ5/I3DkqJCFgrFNM/x6W/aX+bOO6kBzB5IKDyMXF88or3UzvV1
 1ajGThnWfNVIimAHj+pfBASJrDXjWwoBXHwNImGC1tbkz64Ooh0hOgj3rEC6wBrWU6
 PVSKAEpxT5oUa2ntL1oAKRb0UqkhbtwEXNDCid/L/tyewT/9NvON99OGN5iBJzNfn2
 69HyLmi/jyc7A==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250703183537.2075746-1-robh@kernel.org>
References: <20250703183537.2075746-1-robh@kernel.org>
Message-Id: <175248922378.18393.12584887132414171200.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 11:33:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Use
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

On Thu, 03 Jul 2025 13:35:37 -0500, Rob Herring (Arm) wrote:
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
