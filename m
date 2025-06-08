Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3FAD15F3
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 01:45:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4CEDC349C1;
	Sun,  8 Jun 2025 23:45:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01E96C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jun 2025 23:45:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9AB15C5B6E;
 Sun,  8 Jun 2025 23:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF91C4CEEE;
 Sun,  8 Jun 2025 23:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749426320;
 bh=SHfCoZY5hYY5EDnVkDKQicNcun5i2yE7XuOeEa1hNrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6D3CEGGvc2nZYavYAxIrB/ZRVSwpIQSF70OXeyC1QkQIZpo93PhK/7z9uw9BKYFZ
 XZpAUnN/X2kjMXTUmuv3HlTimpGu+mRcy7JkjEfXJPuIei1128Bd84JKkhgNRbtCxG
 6D4xSjOuwyryM02DMsRWphcQ1rEWNr2tG0G7v+n8NPpeKpGz6oIeASQNT1JcWH3+N8
 TYKabPoPam5ybUHgOeo0/bIrEAb+9L0RAreMSzqw9OfAA2gvynNb6hzvyvpBampeJT
 i3rZqHPq1xXtV2SCXEIUdWCvTrpz0Vf30rk/MwqeYHarVjoAro1EsT1SOz7+CX7Z8e
 4JWGaQB2jp0bQ==
Date: Sun, 8 Jun 2025 16:44:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Message-ID: <20250608234458.GD1259@sol>
References: <20250601193441.6913-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250601193441.6913-1-ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-stm32@st-md-mailman.stormreply.com,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] crypto: stm32 - remove crc32 and
	crc32c support
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

On Sun, Jun 01, 2025 at 12:34:41PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Remove the crc32 and crc32c support from the stm32 driver.  Since it's
> not wired up to the CRC library, almost no CRC user in the kernel can
> actually be taking advantage of it, so it's effectively dead code.
> 
> Support for this hardware could be migrated to the CRC library, but
> there doesn't seem to be much point.  This CRC engine is present only on
> a couple older SoCs that lacked CRC instructions.
> 
> Even on those SoCs, it's probably not worthwhile.  This driver has to
> deal with things like locking and runtime power management that do not
> exist in software CRC code and are a source of bugs (as is clear from
> the commit log) and add significant overhead to the processing of short
> messages, which are common.  The patch that originally added this driver
> seemed to justify it based purely on a microbenchmark on Cortex-M7 on
> long messages, not a real use case.  These days, if this driver were to
> be used at all it would likely be on Cortex-A7 instead.  This CRC engine
> is also not supported by QEMU, making the driver not easily testable.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> v2: reworked commit message and added Acked-by
> 
>  arch/arm/configs/multi_v7_defconfig |   1 -
>  drivers/crypto/stm32/Kconfig        |   9 -
>  drivers/crypto/stm32/Makefile       |   1 -
>  drivers/crypto/stm32/stm32-crc32.c  | 480 ----------------------------
>  4 files changed, 491 deletions(-)
>  delete mode 100644 drivers/crypto/stm32/stm32-crc32.c

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

Adjusted wording in commit message slightly:

"Even on those SoCs, it's probably not worthwhile."

=>

"Even for those SoCs, it probably wouldn't be worthwhile."

... since it's talking about a hypothetical port to the CRC library, not the
status quo where the driver is almost never used anyway.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
