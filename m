Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D346A55FC3A
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 11:41:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 869DAC5F1EE;
	Wed, 29 Jun 2022 09:41:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C556DC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 09:41:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5436CB8219E;
 Wed, 29 Jun 2022 09:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC37C3411E;
 Wed, 29 Jun 2022 09:41:20 +0000 (UTC)
Message-ID: <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
Date: Wed, 29 Jun 2022 11:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
References: <20220627174156.66919-1-marex@denx.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220627174156.66919-1-marex@denx.de>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
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

Hi Marek, Tomi, Laurent,

On 27/06/2022 19:41, Marek Vasut wrote:
> Any local subdev state should be allocated and free'd using
> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
> takes care of calling .init_cfg() subdev op. Without this,
> subdev internal state might be uninitialized by the time
> any other subdev op is called.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add FIXME comment above __v4l2_subdev_state_alloc() calls
> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
>  1 file changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index c604d672c2156..c68d32931b277 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  			struct dcmi_framesize *sd_framesize)
>  {
>  	const struct dcmi_format *sd_fmt;
> +	static struct lock_class_key key;
>  	struct dcmi_framesize sd_fsize;
>  	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
> +	struct v4l2_subdev_state *sd_state;
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
>  	bool do_crop;
>  	int ret;
>  
> +	/*
> +	 * FIXME: Drop this call, drivers are not supposed to use
> +	 * __v4l2_subdev_state_alloc().
> +	 */
> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
> +

I've been reading the discussion for the v1 patch, and I seriously do not like this.

My comments are not specifically for this patch, but for all cases where
__v4l2_subdev_state_alloc is called.

It is now used in 4 drivers, so that's no longer a rare case, and the code isn't
exactly trivial either.

I think a helper function might be beneficial, but the real problem is with the
comment: it does not explain why you shouldn't use it and what needs to be done
to fix it.

My suggestion would be to document that in the kerneldoc for this function in
media/v4l2-subdev.h, and then refer to that from this comment (and similar comments
in the other drivers that use this).

And another question: are more drivers affected by this? Is it possible to
find those and fix them all?

Regards,

	Hans

>  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
>  	if (!sd_fmt) {
> -		if (!dcmi->num_of_sd_formats)
> -			return -ENODATA;
> +		if (!dcmi->num_of_sd_formats) {
> +			ret = -ENODATA;
> +			goto done;
> +		}
>  
>  		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
>  		pix->pixelformat = sd_fmt->fourcc;
> @@ -1036,10 +1044,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> +	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
>  	if (ret < 0)
> -		return ret;
> +		goto done;
>  
>  	/* Update pix regarding to what sensor can do */
>  	v4l2_fill_pix_format(pix, &format.format);
> @@ -1079,7 +1086,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	if (sd_framesize)
>  		*sd_framesize = sd_fsize;
>  
> -	return 0;
> +done:
> +	__v4l2_subdev_state_free(sd_state);
> +	return ret;
>  }
>  
>  static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
> @@ -1183,31 +1192,37 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
>  				  struct v4l2_pix_format *pix)
>  {
>  	const struct dcmi_format *sd_fmt;
> +	static struct lock_class_key key;
> +	struct v4l2_subdev_state *sd_state;
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
>  	int ret;
>  
> +	/*
> +	 * FIXME: Drop this call, drivers are not supposed to use
> +	 * __v4l2_subdev_state_alloc().
> +	 */
> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
> +
>  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
>  	if (!sd_fmt) {
> -		if (!dcmi->num_of_sd_formats)
> -			return -ENODATA;
> +		if (!dcmi->num_of_sd_formats) {
> +			ret = -ENODATA;
> +			goto done;
> +		}
>  
>  		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
>  		pix->pixelformat = sd_fmt->fourcc;
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
> +done:
> +	__v4l2_subdev_state_free(sd_state);
> +	return ret;
>  }
>  
>  static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
