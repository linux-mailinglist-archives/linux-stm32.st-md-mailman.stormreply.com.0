Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB1AF5FAA
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 19:15:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CEA0C3F93A;
	Wed,  2 Jul 2025 17:15:54 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1BD1C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 17:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F1EB7A4C759;
 Wed,  2 Jul 2025 17:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130EFC4CEE7;
 Wed,  2 Jul 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751476551;
 bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZ9RcvdQOreMvSgDQRdVOEc/3VFScLsnmhwqM/sa66bIpvbg3w1OV8quHFH0LNOoB
 8FB/kdxkY6aDGF+O/uTnDyUWZVrlDyfq/qNztceUP0tY6uIYbOwi0fSIuszRSCrdzG
 QDzzB0LlXvYk1jazJvoITjrYUJfKwNCJSk97GM3O2TstHMJZio4EWnJO849WI7F9RO
 ULDfzU7qYCzxNDwwsd/zKqS0TNDWvyGZ+hemOL7S+sw2LuEnJRW00f4KV/rwvU9sJd
 aw51UzEocEFbb8N3yvhs28mzsG+HFmuKRJwCtE+QjYr62LYG138yA36eL+aA/KYhZW
 Z5PLvkvXx/Yag==
Date: Wed, 2 Jul 2025 19:15:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] i2c: stm32f7: support
	i2c_*_dma_safe_msg_buf APIs
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:15PM +0200, Cl=E9ment Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.

same here, I don't understand anything... you could have written
"do some coding" and it would have been the same :-)

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
