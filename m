Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB87F752E
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 14:32:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD69BC6B47A;
	Fri, 24 Nov 2023 13:32:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01990C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 13:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8B9EFB830A2;
 Fri, 24 Nov 2023 13:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41961C433CB;
 Fri, 24 Nov 2023 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700832772;
 bh=fhbMJZ27leVTHlU/rvmhc8ewmJZU6ueXtCcpXIxIDJY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YiA2pP3B5rujWI+yGBH96W8o/HpPx5+0teQ+jH6BZaYT7MtEqCfQfVV7HiZ2xdhC+
 ZksjogMFANkMhvmdDIxzRicACG85HmNqUSAgoINfB36f6ePjldvS3N/LDJR+cT48xQ
 LekK6XF1APfKrbLEaJBCNgeQgBXKcYDgk4Zl+TXUNUzqD0hgbEejXH3PW/LSGfDYij
 we+rpSkzSiNoU3wnl9alGNJHz1wsL2L7U3LeLCnf9LtH4orQjGTZdXWa0r3z9gRpPI
 tpV1UwU9vWW9shfpkPFKYbEyeaqEYYJvv9hecXh++3rU/OmFcJbgFtqS1ezGgMpB/P
 aez8elYq9JxiQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pierre Yves MORDRET <pierre-yves.mordret@st.com>, 
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20231106134832.1470305-1-amelie.delaunay@foss.st.com>
References: <20231106134832.1470305-1-amelie.delaunay@foss.st.com>
Message-Id: <170083276888.771401.2511759200122212610.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 19:02:48 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: stm32-dma: avoid bitfield
 overflow assertion
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


On Mon, 06 Nov 2023 14:48:32 +0100, Amelie Delaunay wrote:
> stm32_dma_get_burst() returns a negative error for invalid input, which
> gets turned into a large u32 value in stm32_dma_prep_dma_memcpy() that
> in turn triggers an assertion because it does not fit into a two-bit field:
> drivers/dma/stm32-dma.c: In function 'stm32_dma_prep_dma_memcpy':
> include/linux/compiler_types.h:354:38: error: call to '__compiletime_assert_282' declared with attribute error: FIELD_PREP: value too large for the field
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                          ^
>    include/linux/compiler_types.h:335:4: note: in definition of macro '__compiletime_assert'
>        prefix ## suffix();    \
>        ^~~~~~
>    include/linux/compiler_types.h:354:2: note: in expansion of macro '_compiletime_assert'
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                         ^~~~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>       ^~~~~~~~~~~~~~~~
>    include/linux/bitfield.h:114:3: note: in expansion of macro '__BF_FIELD_CHECK'
>       __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>       ^~~~~~~~~~~~~~~~
>    drivers/dma/stm32-dma.c:1237:4: note: in expansion of macro 'FIELD_PREP'
>        FIELD_PREP(STM32_DMA_SCR_PBURST_MASK, dma_burst) |
>        ^~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] dmaengine: stm32-dma: avoid bitfield overflow assertion
      commit: 54bed6bafa0f38daf9697af50e3aff5ff1354fe1

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
