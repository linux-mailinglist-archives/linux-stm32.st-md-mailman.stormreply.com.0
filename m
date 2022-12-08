Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4798647156
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 15:09:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50611C6507A;
	Thu,  8 Dec 2022 14:09:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC2A5C6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 14:09:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F192B823D4;
 Thu,  8 Dec 2022 14:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8CAC433C1;
 Thu,  8 Dec 2022 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670508550;
 bh=TjT5PUNaNbGlUXOnw89bI4x13NlHeMqj/JZXmYi1AAk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oJlNQ4XNnq456CSrH1v2scCD1AZykmpEWYi9ZpCSEBMCDccShg8hkBW1oplSPKF4m
 2EFXgqonaDWDJSv9HKGQ92njZyKK2284lOPCYn1oXPWWRtwQGtrWyw9ugyczYW5dlq
 5+DkWKiAmUL14HIDtTYj+wmGd8txWjwGspyHO+eX5vJBKG1BC1eIvwHauFfn1hQc/A
 vHdyuEC9N4jglHWI8/SmZLaAtyLQ2AoLUx9w97AFXCP7Y+zIKT853dmiHxHJx/XYmV
 ZFSz4PAs5cem8w0BkR7wWJUnEIqEmsSOLnUxNXRFOulRH/41TxMQli5XGNUplNyQ1B
 BqxPTpelfGsww==
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
In-Reply-To: <1670311341-32664-1-git-send-email-u0084500@gmail.com>
References: <1670311341-32664-1-git-send-email-u0084500@gmail.com>
Message-Id: <167050854689.183709.17486516496456151482.b4-ty@kernel.org>
Date: Thu, 08 Dec 2022 14:09:06 +0000
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-76d0b
Cc: gene_chen@richtek.com, markgross@kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, djrscally@gmail.com, hdegoede@redhat.com,
 chiaen_wu@richtek.com, mcoquelin.stm32@gmail.com, yangyingliang@huawei.com,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] regulator: core: Use different devices
 for resource allocation and DT lookup
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

On Tue, 06 Dec 2022 15:22:21 +0800, cy_huang wrote:
> Following by the below discussion, there's the potential UAF issue
> between regulator and mfd.
> https://lore.kernel.org/all/20221128143601.1698148-1-yangyingliang@huawei.com/
> 
> From the analysis of Yingliang
> 
> CPU A				|CPU B
> mt6370_probe()			|
>   devm_mfd_add_devices()	|
> 				|mt6370_regulator_probe()
> 				|  regulator_register()
> 				|    //allocate init_data and add it to devres
> 				|    regulator_of_get_init_data()
> i2c_unregister_device()		|
>   device_del()			|
>     devres_release_all()	|
>       // init_data is freed	|
>       release_nodes()		|
> 				|  // using init_data causes UAF
> 				|  regulator_register()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Use different devices for resource allocation and DT lookup
      commit: 8f3cbcd6b440032ebc7f7d48a1689dcc70a4eb98

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
