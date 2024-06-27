Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70D91A4E3
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 13:18:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01344C71282;
	Thu, 27 Jun 2024 11:18:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7833EC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 11:18:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4921361E1C;
 Thu, 27 Jun 2024 11:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D731CC32786;
 Thu, 27 Jun 2024 11:17:56 +0000 (UTC)
Message-ID: <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>
Date: Thu, 27 Jun 2024 13:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240624084123.3009122-1-alain.volmat@foss.st.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240624084123.3009122-1-alain.volmat@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmipp: correct error
 handling in dcmipp_create_subdevs
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

On 24/06/2024 10:41, Alain Volmat wrote:
> Correct error handling within the dcmipp_create_subdevs by properly
> decrementing the i counter when releasing the subdeves.
> 
> Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 4acc3b90d03a..4924ee36cfda 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  	return 0;
>  
>  err_init_entity:
> -	while (i > 0)
> +	while (i-- > 0)
>  		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
>  	return ret;
>  }

I accidentally merged this one, but this patch isn't right.

After this change the [i - 1] indices should be changed to [i].
If i == 1, then the while condition is true, but now i == 0 in the
actual statement, so you access out-of-bounds values.

I decided to revert it, since it is better to just get stuck in the
while loop, then to crash.

But a new patch is needed for this.

Regards,

	Hans
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
