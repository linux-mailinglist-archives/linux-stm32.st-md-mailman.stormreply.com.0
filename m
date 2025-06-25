Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97CAE90EA
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jun 2025 00:17:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E0B8C30883;
	Wed, 25 Jun 2025 22:17:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DA0BC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 22:17:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3F4E40C2F;
 Wed, 25 Jun 2025 22:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C12C4CEEA;
 Wed, 25 Jun 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750889870;
 bh=SOlW945FsEuU+z2VqRVH+3m+gzeJachd1rv/kOLBoD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOuy1yeF9Ackritm8p/aX1omm/wZpCvVFwrZ3wESNTTLB9VHdquUbC99Mdt2qBsdZ
 N8/t9i6dnBeOa+dPtJFo6OOH31RuyxUJBKxpWR+xPF9hZnykWDiO+nUWow2SRBa5RN
 E7ctyqtCrksbpBdo3tCyfbMmLP12EdJY/OHMXSzpQghhpUQpIOlD5SXN5PQd2kh8OS
 bszr0EgASrf3/dqjEk4MSjbEjcvE/YRh9IIcB5J7N8QrejF5uIVXurarv63NJA3+/R
 gt3UcLcTEferpmtCxfAu7CjHV4xgXoZCoIn55s0VOhfb9RpXfwsykwUjC/NpK1XCYW
 MkLbLM82qkpiw==
Date: Thu, 26 Jun 2025 00:17:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <cmxzc2slync7toacgqpng6u5nbxhp73foaacwqdkm3z7k7hesu@zc3mpbdrpiaz>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Fix STM32 I2C dma operations
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

Pierre-Yves, Alain,

On Mon, Jun 16, 2025 at 10:53:53AM +0200, Cl=E9ment Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
> Cl=E9ment Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

any chance you can take a look at this series?

Thanks,
Andi

> =

>  drivers/i2c/busses/i2c-stm32.c   |  2 +-
>  drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----=
------
>  2 files changed, 30 insertions(+), 12 deletions(-)
> ---
> base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
> change-id: 20250527-i2c-upstream-e5b69501359a
> =

> Best regards,
> -- =

> Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
