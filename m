Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320F539AA3A
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 20:42:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6C06C57B6F;
	Thu,  3 Jun 2021 18:42:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0066C57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 18:42:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B76BC613F8;
 Thu,  3 Jun 2021 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745739;
 bh=g1/r4tEGhtCj6lkdxd0L3N8YRbkPXi360LES2CfwFOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vBRCnf4GPNeS8yf7UcWVMo+BtBm0a5n/daCHJ+ca3f0PNjN/ltDOrBq4a748B3brS
 tHUK8rdhchXiHTpB/OU6+PTQuqMGX++SPwIGeWHKQL9T+v9Yz6gZJdwVMZUz6bN2+L
 9vfuQ+CJQyrYLvnprtUyTZjHNDMo8mQqNO8b4+N8lWlGsyWS3mYyxAWSzHkfSAlQfG
 czb3Gs8QwJ3lWHlE7L9zq/+mCUHLRVi0+48FxWwk+ExuMDR5c6hbzjn3J+i5GEAO+7
 PS/n4KjxouY8M5WaJ1DLqvqd+sAdTqJRRZyKjsP2EjnmtYVUjVzKydcqBIIBd+MdVs
 UC9oYSOZCeuPw==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 patrice.chotard@foss.st.com
Date: Thu,  3 Jun 2021 19:41:45 +0100
Message-Id: <162274571327.15050.1265263305930790161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603073421.8441-1-patrice.chotard@foss.st.com>
References: <20210603073421.8441-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Always wait BUSY bit to be
	cleared in stm32_qspi_wait_cmd()
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

On Thu, 3 Jun 2021 09:34:21 +0200, patrice.chotard@foss.st.com wrote:
> In U-boot side, an issue has been encountered when QSPI source clock is
> running at low frequency (24 MHz for example), waiting for TCF bit to be
> set didn't ensure that all data has been send out the FIFO, we should also
> wait that BUSY bit is cleared.
> 
> To prevent similar issue in kernel driver, we implement similar behavior
> by always waiting BUSY bit to be cleared.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Always wait BUSY bit to be cleared in stm32_qspi_wait_cmd()
      commit: d38fa9a155b2829b7e2cfcf8a4171b6dd3672808

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
