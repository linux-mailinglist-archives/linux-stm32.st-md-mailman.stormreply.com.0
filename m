Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F39E86C7
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Dec 2024 17:59:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDC49C78013;
	Sun,  8 Dec 2024 16:59:09 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2043EC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Dec 2024 16:59:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 962E7A40C61;
 Sun,  8 Dec 2024 16:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487EEC4CED2;
 Sun,  8 Dec 2024 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733677142;
 bh=toOsgRuEWOhHn9FOC604OTu6l2exJPo4BC7XHhbdWEo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DcwdN23m6ERs8sHSF54Cs3zdlAnAHoIvQLu9QM8FseNB7dXYYwrbcaT9dZ7gYMclV
 Fx0gIMS3GCzAa+JVPD5g8xblWLuo32yKC8mxwKdWe8a3626FpSut7T62RpkWK/shYu
 y7fnZluusiAQGkplCvDLy1dScye9kG3dTMP3lCMiZ3BKxOKbRARHGXl0XlQIO93Iag
 IM4lJkOqJNh/6sUfWld5GWk/Vh+DHqdAnCqGhCobNVMGAVpraMNeLvh51OJrR4giTC
 DyMUxLT3yPwnrWVSKd5MNfDGaDyEiLRUZqAMM7VFJyamA6No0oAzFl2dQJpa36n8hH
 ezHls67pDIMKA==
From: Vinod Koul <vkoul@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20241111103712.3520611-1-arnd@kernel.org>
References: <20241111103712.3520611-1-arnd@kernel.org>
Message-Id: <173367713788.1031947.8609520201420590738.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:28:57 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: work around constant-value
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


On Mon, 11 Nov 2024 11:37:02 +0100, Arnd Bergmann wrote:
> FIELD_PREP() checks that a constant fits into the available bitfield,
> but if one of the two lookup tables in stm32_impedance_tune() does
> not find a matching entry, the index is out of range, which gcc
> correctly complains about:
> 
> In file included from <command-line>:
> In function 'stm32_impedance_tune',
>     inlined from 'stm32_combophy_pll_init' at drivers/phy/st/phy-stm32-combophy.c:247:9:
> include/linux/compiler_types.h:517:38: error: call to '__compiletime_assert_447' declared with attribute error: FIELD_PREP: value too large for the field
>   517 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                      ^
> include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    68 |   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>   115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>       |   ^~~~~~~~~~~~~~~~
> drivers/phy/st/phy-stm32-combophy.c:162:8: note: in expansion of macro 'FIELD_PREP'
>   162 |        FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of));
>       |        ^~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] phy: stm32: work around constant-value overflow assertion
      commit: 2de679ecd724b823c2cb58caab8508c7eec8aefc

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
