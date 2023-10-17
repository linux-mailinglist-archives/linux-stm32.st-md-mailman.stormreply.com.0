Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F3B7CD0F1
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 01:41:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128E5C6C837;
	Tue, 17 Oct 2023 23:41:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12AF1C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 23:41:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 731F5615FD;
 Tue, 17 Oct 2023 23:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD1EC433C8;
 Tue, 17 Oct 2023 23:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697586094;
 bh=ud63s7V4RrXt+rW3zpF4iPUqjo7I9N4Q+XHSbTsG6tM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DVfW3DeRZWsaQ7wfguaPYMMtlTZX0TmcHy6XUS6c0fvpvhRvI4F1UAROKr+EVxPfH
 IxMOo/0MMMipu9JkLPDO24slywOLANWynkRGuPC2nKb/bHkPxwOb6UKDRPALZjStU+
 9jYlmPcgslTQKTeGSVvS9CZh2mlW/HFGsJm9C5jB0qSWea6L3g+GXEEr/XN/Vbu3+4
 rfig3YVkm87i+PZScYdg7seCZAQD9bMIFtj09rLIiBdaff6QSGfqKlk7Rq7T9xLU2d
 TdySJ+I1PW14hcJvUQZjq/WCMx6fGClCORQUoiEf64ToUy8vZtrM78x/+g1ug/XZ3C
 jeEq4zRpBpCXA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20231017203442.2699322-1-robh@kernel.org>
References: <20231017203442.2699322-1-robh@kernel.org>
Message-Id: <169758609148.3230422.9069339982126384846.b4-ty@kernel.org>
Date: Wed, 18 Oct 2023 00:41:31 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH] regulator: Use
	device_get_match_data()
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

On Tue, 17 Oct 2023 15:34:41 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Use device_get_match_data()
      commit: 8f7e17d847edf6bc02d0813b123b9d78ba504098

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
