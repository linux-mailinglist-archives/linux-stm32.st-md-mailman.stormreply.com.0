Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FED493F82
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jan 2022 19:02:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15A27C5F1EB;
	Wed, 19 Jan 2022 18:02:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE097C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 18:02:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 531C8B81995;
 Wed, 19 Jan 2022 18:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A488C004E1;
 Wed, 19 Jan 2022 18:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642615368;
 bh=2qp8+c0do7iGqMKUDe+RLIbzFyrSKpLK6ZCDMCrZcLA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NNkVzgkPeP3vUXAOk2sOK58xpkoXcyIxpyqtLDEywyofTz6mU25vrAKR3PB8MrmwK
 Itpshs9pW6Mz8DbYYKf2+GcDxGw4Zeo2kjwwtuBqunoxnwQS/atgzo61nXPqCL/nMd
 5OW8xsbf3vHeK6QBY3fYb5F0z6MRDzPHfC4l1VlgczN1LPNgrCcF0w+o5f9jOdZMBy
 4ygnqOoP93fP4oR0B0kJ0zoKBHkq+kAHuGr9CQr06B8kK1zgY/XIVyxEaUWiX3juUV
 2pF1NZRQ40GcLktmNE1kGmXyy1wTKc/pHhT5DZESCHyM+gBrPTHAZW5hFWY1GV4dk9
 mt7DHJjipW76w==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20220117121744.29729-1-patrice.chotard@foss.st.com>
References: <20220117121744.29729-1-patrice.chotard@foss.st.com>
Message-Id: <164261536622.2816943.17525364866114130985.b4-ty@kernel.org>
Date: Wed, 19 Jan 2022 18:02:46 +0000
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] spi: stm32-qspi: Update spi registering
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

On Mon, 17 Jan 2022 13:17:44 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Some device driver need to communicate to qspi device during the remove
> process, qspi controller must be functional when spi_unregister_master()
> is called.
> 
> To ensure this, replace devm_spi_register_master() by spi_register_master()
> and spi_unregister_master() is called directly in .remove callback before
> stopping the qspi controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-linus

Thanks!

[1/1] spi: stm32-qspi: Update spi registering
      commit: e4d63473d3110afd170e6e0e48494d3789d26136

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
