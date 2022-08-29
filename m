Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9725A5221
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 18:50:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DBE2C04004;
	Mon, 29 Aug 2022 16:50:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77F49C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 16:50:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F71B6126B;
 Mon, 29 Aug 2022 16:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232C1C43140;
 Mon, 29 Aug 2022 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661791819;
 bh=t4wMul9vxfMvuUg8UI41DbmTAkYSK1yPK94NKJG8a+4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AOkVqZMNHdQziyPJMVzg7Yp67/LOAN0l6Z4abhJmwpvjIcKMX8ClVYkDUW5c4KLbR
 t3Kkv4AfYhJ7jOea8Ho8NL6Wgcveo5xmBjHYV2wgH58ZkTw+rCb1lol2rOxxv74kZr
 dMf/bZi9PlEdFnCTU+K2ktiIzrghD+YJoYLptFB2g1YeGrnpJc7iZwfDcgllEByka4
 YhlV4TkuZVxkEm+t678KidmkOoB4SpDXbS9rTAI7R+cCRt4JY9KMSLnTATharY486r
 iRzY1qDSy8C6vVP67eY6KKYSwpyaEE06VpuKGq68dt7i3xMwFCxgKKlEWt9vbD+ro4
 iHKU0zF8+FDIA==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
In-Reply-To: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
References: <20220829123250.2170562-1-patrice.chotard@foss.st.com>
Message-Id: <166179181682.898839.326483296605925659.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 17:50:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-65ba7
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix pm_runtime
	management in stm32_qspi_transfer_one_message()
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

On Mon, 29 Aug 2022 14:32:50 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ctrl->auto_runtime_pm was wrongly set to true when adding
> transfer_one_message() callback.
> As explained in commit 6e6ccb3d4cdc ("spi: stm32-qspi: Add pm_runtime support")
> the expected behavior is to prevent runtime suspends between each transfer.
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Fix pm_runtime management in stm32_qspi_transfer_one_message()
      commit: 47c32b2b7fcfa97f7224df222f439fc0ccf94ffe

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
