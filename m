Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775259C3A9
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 18:05:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40344C6411B;
	Mon, 22 Aug 2022 16:05:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5A43C640F3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Aug 2022 16:05:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5205611D2;
 Mon, 22 Aug 2022 16:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40845C433D6;
 Mon, 22 Aug 2022 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661184340;
 bh=gqT9434pJDJBgp83uIgtBxn6Y1xaO9KrAPT5xfVuuqw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QEEgOLXBJThejd3iRvAl30EPrElptaov3qykr/J29ggHNVM4tozz5mQZgp2Ht4Kyj
 w7c1UNp085nzZrp1fi3a4YAwV++K3sIPl3eWWdfyqtMVFzt+F07HBj/GTAZC9QpR3w
 hl9yuO7//8j6kghtvbROtnk0hUuQvPxGZKxBeObyqiRZ9FNSWW4QzIdxchCJWxDPve
 z7es/0qJJA1FjnL/0jcxYZQj0S5ojLfqYm6EF75z0x3moatpP1qdTF2V4Y85CMnLt2
 BBkebH6IE963Be7d1/RcIJopJaKxGgZOled837d0afohXUM9Cx687hxkQa3GbAL1AE
 5wt1wiB12UL2Q==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
References: <20220816161344.2599908-1-patrice.chotard@foss.st.com>
Message-Id: <166118433897.209120.16190099503428270567.b4-ty@kernel.org>
Date: Mon, 22 Aug 2022 17:05:38 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v3 0/2] spi: stm32_qspi: use QSPI
	bus as 8 lines communication channel
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

On Tue, 16 Aug 2022 18:13:42 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> The goal of this series is to allow to use QSPI bus as a 8 lines communication
> channel for specific purpose.
> 
> The QSPI block offers the possibility to communicate with 2 flashes in
> parrallel using the dual flash mode, 8 data lines are then used.
> Usage of cs-gpios populated and spi-tx-bus-width / spi-rx-bus-width both set to 8,
> is needed to enable dual flash mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: stm32_qspi: Add transfer_one_message() spi callback
      commit: b051161f44d414e736fa2b011245441bae9babd7

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
