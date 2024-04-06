Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2689A8FC
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Apr 2024 07:20:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D832FC71288;
	Sat,  6 Apr 2024 05:20:32 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC9FC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Apr 2024 05:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D4D5CE2777;
 Sat,  6 Apr 2024 05:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5A9C433C7;
 Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712380828;
 bh=TBj/hcnPrvS19ZOluMZ12evt8AeDaDrUTBeM5kaTuKY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HYazYNypOS+iPe/PmwIZVgrP0OAjOmuWcCZaXmQBd5/DF3DU2Cm7HK1KTLKVM8W2j
 EfdrhznuDsHvbEh7NeV1r2EDMVkxTqo+hmKt5MdFIcqj68UTB4u7gvHG6geAe3ArfV
 cYxb7yc2nqhO3pPj8ToTFIgL78NntzPlzi3tNk1u8F7N5z7SqSGJ1Z/QhHbUaQaR1j
 GTv/7bDPNNXqFXoXNMGCl3bjIAtmML/lX++bgYkRjXumLNf6dEzpQPrpxdPeyVgSKh
 czfxRuHIWxcuBJ6wGSXEzVfHmRCYmRJdToESEDFulu3u4HF5IZUSSU3tkxxLhyQRAI
 TbkNIwkM8MMRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 19C9BD84BAC; Sat,  6 Apr 2024 05:20:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171238082809.31617.17365732495689756509.git-patchwork-notify@kernel.org>
Date: Sat, 06 Apr 2024 05:20:28 +0000
References: <20240403080702.3509288-1-arnd@kernel.org>
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Shyam-sundar.S-k@amd.com, heiko@sntech.de, rafael@kernel.org,
 dri-devel@lists.freedesktop.org, benjamin.tissoires@redhat.com,
 srinivas.pandruvada@linux.intel.com, hch@lst.de,
 linux-samsung-soc@vger.kernel.org, mpe@ellerman.id.au,
 christophe.leroy@csgroup.eu, linux-pm@vger.kernel.org,
 linux-sound@vger.kernel.org, abbotti@mev.co.uk, linux-omap@vger.kernel.org,
 trond.myklebust@hammerspace.com, elder@kernel.org, kristo@kernel.org,
 chenxiang66@hisilicon.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 hsweeten@visionengravers.com, iyappan@os.amperecomputing.com,
 linux-crypto@vger.kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 alexandre.belloni@bootlin.com, markuss.broks@gmail.com,
 hvaibhav.linux@gmail.com, linux-i2c@vger.kernel.org, lars@metafoo.de,
 minyard@acm.org, deller@gmx.de, lee@kernel.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 yisen.zhuang@huawei.com, lenb@kernel.org, andi.shyti@kernel.org,
 michael.hennerich@analog.com, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, jarkko@kernel.org,
 anna@kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
 jic23@kernel.org, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kasan-dev@googlegroups.com, jirislaby@kernel.org, linux-rtc@vger.kernel.org,
 stf_xl@wp.pl, masahiroy@kernel.org, linux-staging@lists.linux.dev,
 linux-input@vger.kernel.org, ychuang3@nuvoton.com, keescook@chromium.org,
 arnd@arndb.de, jikos@kernel.org, robin.murphy@arm.com, rostedt@goodmis.org,
 nathan@kernel.org, broonie@kernel.org, mdf@kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 martin.petersen@oracle.com, dmitry.torokhov@gmail.com, sre@kernel.org,
 peda@axentia.se, linux-stm32@st-md-mailman.stormreply.com, tony@atomide.com,
 liviu.dudau@arm.com, linux-ide@vger.kernel.org, peterhuewe@gmx.de,
 ardb@kernel.org, linux-leds@vger.kernel.org, herbert@gondor.apana.org.au,
 linux-scsi@vger.kernel.org, vkoul@kernel.org, linux-serial@vger.kernel.org,
 kuba@kernel.org, mhiramat@kernel.org, kvalo@kernel.org, john.allen@amd.com,
 netdev@vger.kernel.org, andersson@kernel.org, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, dlemoal@kernel.org, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 00/34] address all -Wunused-const warnings
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  3 Apr 2024 10:06:18 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Here is the summary with links:
  - [05/34] 3c515: remove unused 'mtu' variable
    https://git.kernel.org/netdev/net-next/c/17b35355c2c6
  - [19/34] sunrpc: suppress warnings for unused procfs functions
    (no matching commit)
  - [26/34] isdn: kcapi: don't build unused procfs code
    https://git.kernel.org/netdev/net-next/c/91188544af06
  - [28/34] net: xgbe: remove extraneous #ifdef checks
    https://git.kernel.org/netdev/net-next/c/0ef416e045ad
  - [33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
