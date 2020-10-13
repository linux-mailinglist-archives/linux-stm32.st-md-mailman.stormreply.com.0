Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4E28CAC7
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 11:08:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283E6C3FADE;
	Tue, 13 Oct 2020 09:08:15 +0000 (UTC)
Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4BAEC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 09:08:13 +0000 (UTC)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk
 [IPv6:2a01:4f9:c010:4572::80:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8F33C634C87;
 Tue, 13 Oct 2020 12:07:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
 (envelope-from <sakari.ailus@retiisi.org.uk>)
 id 1kSGGv-0002fj-Dc; Tue, 13 Oct 2020 12:07:05 +0300
Date: Tue, 13 Oct 2020 12:07:05 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
References: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yannick Fertre <yannick.fertre@st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: add support of BT656
	bus
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

On Wed, Oct 07, 2020 at 06:14:50PM +0200, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus.
> This mode allows to save hardware synchro lines hsync & vsync
> by replacing them with synchro codes embedded in data stream.
> This bus type is only compatible with 8 bits width data bus.
> Due to reserved values 0x00 & 0xff used for synchro codes,
> valid data only vary from 0x1 to 0xfe, this is up to sensor
> to clip accordingly pixel data. As a consequence of this
> clipping, JPEG is not supported when using this bus type.
> DCMI crop feature is also not available with this bus type.

You can have more than 62 characters per line. In fact, 75 is the
recommended maximum.

You should also amend the bindings to cover BT.656 mode. Also bus-type
should probably be made mandatory, too.

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 37 +++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index fd1c41c..d7d7cdb 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -157,6 +157,7 @@ struct stm32_dcmi {
>  	struct vb2_queue		queue;
>  
>  	struct v4l2_fwnode_bus_parallel	bus;
> +	enum v4l2_mbus_type		bus_type;
>  	struct completion		complete;
>  	struct clk			*mclk;
>  	enum state			state;
> @@ -777,6 +778,23 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (dcmi->bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  		val |= CR_PCKPOL;
>  
> +	/*
> +	 * BT656 embedded synchronisation bus mode.
> +	 *
> +	 * Default SAV/EAV mode is supported here with default codes
> +	 * SAV=0xff000080 & EAV=0xff00009d.
> +	 * With DCMI this means LSC=SAV=0x80 & LEC=EAV=0x9d.
> +	 */
> +	if (dcmi->bus_type == V4L2_MBUS_BT656) {
> +		val |= CR_ESS;
> +
> +		/* Unmask all codes */
> +		reg_write(dcmi->regs, DCMI_ESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
> +
> +		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
> +		reg_write(dcmi->regs, DCMI_ESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
> +	}
> +
>  	reg_write(dcmi->regs, DCMI_CR, val);
>  
>  	/* Set crop */
> @@ -1067,8 +1085,9 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>  	if (ret)
>  		return ret;
>  
> -	/* Disable crop if JPEG is requested */
> -	if (pix->pixelformat == V4L2_PIX_FMT_JPEG)
> +	/* Disable crop if JPEG is requested or BT656 bus is selected */
> +	if (pix->pixelformat == V4L2_PIX_FMT_JPEG &&
> +	    dcmi->bus_type != V4L2_MBUS_BT656)
>  		dcmi->do_crop = false;
>  
>  	/* pix to mbus format */
> @@ -1592,6 +1611,11 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>  			if (dcmi_formats[i].mbus_code != mbus_code.code)
>  				continue;
>  
> +			/* Exclude JPEG if BT656 bus is selected */
> +			if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
> +			    dcmi->bus_type == V4L2_MBUS_BT656)
> +				continue;
> +
>  			/* Code supported, have we got this fourcc yet? */
>  			for (j = 0; j < num_fmts; j++)
>  				if (sd_fmts[j]->fourcc ==
> @@ -1873,9 +1897,18 @@ static int dcmi_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "CSI bus not supported\n");
>  		return -ENODEV;
>  	}
> +
> +	if (ep.bus_type == V4L2_MBUS_BT656 &&
> +	    ep.bus.parallel.bus_width != 8) {
> +		dev_err(&pdev->dev, "BT656 bus conflicts with %d bits bus width (8 bits required)\n",
> +			ep.bus.parallel.bus_width);

bus_width is unsigned here.

> +		return -ENODEV;
> +	}
> +
>  	dcmi->bus.flags = ep.bus.parallel.flags;
>  	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
>  	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
> +	dcmi->bus_type = ep.bus_type;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0)

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
