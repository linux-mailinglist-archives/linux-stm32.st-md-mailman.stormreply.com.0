Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA439BD31
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jun 2021 18:32:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065F7C57B6B;
	Fri,  4 Jun 2021 16:32:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8578C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 16:32:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C62261153;
 Fri,  4 Jun 2021 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622824362;
 bh=0pyBbHebHavMSIgnjzBumaMQcmnqDSMG7t3lC1FX+3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SuJDK8f4MpYMvJ8/f1MWcDO3waTdi4ICNCMWwgdhhanxEQmWGZmndUyrv+z0hRUE4
 uMBurWfxvz6jyWGNFjAd1q6AIlCXdkZ+l6NWnwz7R7NfiAlHBdYNM8kxeQwtfcbP8a
 cEl6Tuqp63emC7SZpm2jJFyO5sQIYcMLiCtc9eYjlU3bezhtQ0WwDq8sEQVDD9n+MA
 eUH6a1bq28AgFAfEDt92ziO3ksrT/TuvccHedtLdBDiL1pZtFpIG4KQmhBb5uaEoFe
 0SPxJLCnxfB8iOt24iEqGrxTsWrzY4KAENj8wnNj9S3a+02PrRWabJNx4wTkCzvFCB
 CR/XxEQN64dTg==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 patrice.chotard@foss.st.com
Date: Fri,  4 Jun 2021 17:32:24 +0100
Message-Id: <162282433425.39122.14560975915714182351.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604075009.25914-1-patrice.chotard@foss.st.com>
References: <20210604075009.25914-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix W=1 build warning
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

On Fri, 4 Jun 2021 09:50:09 +0200, patrice.chotard@foss.st.com wrote:
> Fix the following compilation warning using W=1 build:
> arm-linux-gnueabi-ld: drivers/spi/spi-stm32-qspi.o: in function `stm32_qspi_poll_status':

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Fix W=1 build warning
      commit: 6829222b408f5aa5222c18ea3f492cac19fa9405

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
