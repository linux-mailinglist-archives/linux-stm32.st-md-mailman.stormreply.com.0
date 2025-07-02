Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E77CAF5F7B
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 19:08:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A700CC3F93A;
	Wed,  2 Jul 2025 17:08:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CB1AC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 17:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEEA64483C;
 Wed,  2 Jul 2025 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F52C4CEED;
 Wed,  2 Jul 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751476097;
 bh=sl+L6c54S4JFvlxl6rBTBhnWpBiz19X6BE8lx/bDcPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ne6mhWW5/ruaxicHzkogiUibQWjbCGTAI+my3l4pVqB15UOy1fW6nLHm9mZROYlDa
 PzWhevJsY4UJj9sCUNIj6dJJ7cZKFn6XiIecaEgHCVZZwbtgB0ixXgVhMM+ak/sDyy
 Jma4GMusJQ1DbYwp13XD+6jkWW88Cd3y5UhC/Lt/O/nq9DrCRkisDhza0XHFhsRmMB
 WISjBHieLagyhTV5XYWNtUMwUKHYmaTaC4C1Tq2h1MSDUfJAjFu4ZV+t640sDopXwC
 a2HSyzYZk0lBNN1sHlKHp9oM3CybVJvSzzjlpdk7eTclBXjeZ1+qtmcG0pI4kAXxxF
 uukyrWgcQ6IfA==
Date: Wed, 2 Jul 2025 19:08:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped
	buffer
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

On Mon, Jun 30, 2025 at 02:55:14PM +0200, Cl=E9ment Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.

"Fix an issue..." is too generic. Can you be more specific? Where
was it mapped? Where was it left unmapped?

Please, do consider that the user needs to understand what
happens in the patch without needing to look into the patch.

> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index e4aaeb2262d0..042386b4cabe 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(stru=
ct stm32f7_i2c_dev *i2c_dev,
>  	if (i2c_dev->use_dma) {
>  		stm32f7_i2c_disable_dma_req(i2c_dev);
>  		dmaengine_terminate_async(dma->chan_using);
> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
>  	}
>  =

>  	i2c_dev->master_mode =3D false;
> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result =3D -ENXIO;
>  	}
> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int=
 irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);

Can't we use the dma_callback here, or similar? I see some
similar patterns and I think the code can be improved.

Andi

>  				f7_msg->result =3D -ETIMEDOUT;
>  			}
>  		}
> =

> -- =

> 2.43.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
