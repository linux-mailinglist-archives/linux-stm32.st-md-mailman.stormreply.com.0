Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0905287DB
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 17:02:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F454C03FE2;
	Mon, 16 May 2022 15:02:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129B9C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 May 2022 15:02:44 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
 by mail.gandi.net (Postfix) with ESMTPSA id BBC79FF807;
 Mon, 16 May 2022 15:02:39 +0000 (UTC)
Date: Mon, 16 May 2022 17:02:37 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20220516150237.v3xt7onp2lpmellw@uno.localdomain>
References: <20220516092048.264036-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516092048.264036-1-hugues.fruchet@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: add support of 1X16
 serial pixel formats variant
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

Hi Hugues,

On Mon, May 16, 2022 at 11:20:48AM +0200, Hugues Fruchet wrote:
> From: Hugues Fruchet <hugues.fruchet@st.com>
>
> Add support of 1X16 serial pixel formats in order to support
> CSI-2 camera sensor exposing 1x16 pixel formats only.
>
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Sakari, if you're sending a new pull request for the ov5640 series,
could you include this one as otherwise dcmi would be broken when used
with that sensor.

Thanks
   j

> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 09a743cd7004..b2ba4d95bfa3 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1592,25 +1592,31 @@ static int dcmi_set_default_fmt(struct stm32_dcmi *dcmi)
>  	return 0;
>  }
>
> -/*
> - * FIXME: For the time being we only support subdevices
> - * which expose RGB & YUV "parallel form" mbus code (_2X8).
> - * Nevertheless, this allows to support serial source subdevices
> - * and serial to parallel bridges which conform to this.
> - */
>  static const struct dcmi_format dcmi_formats[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB565,
>  		.mbus_code = MEDIA_BUS_FMT_RGB565_2X8_LE,
>  		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +		.mbus_code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.bpp = 2,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUYV,
>  		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
>  		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_YUYV,
> +		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.bpp = 2,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_UYVY,
>  		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
>  		.bpp = 2,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_UYVY,
> +		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.bpp = 2,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_JPEG,
>  		.mbus_code = MEDIA_BUS_FMT_JPEG_1X8,
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
