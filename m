Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAB2861BD
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 17:01:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F631C32EA8;
	Wed,  7 Oct 2020 15:01:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 970D0C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 15:01:10 +0000 (UTC)
IronPort-SDR: HZFprJlJzcO/MHYqJUcqcgn4c4X3zP4o+jWmvsOrZEXti5C6GnlRIqM93NFoenII/qYeT0BgfH
 nbAnj42TIC3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="144356592"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="144356592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 08:01:07 -0700
IronPort-SDR: 5lzoFqA8tDRjbwfnjut63o9THxltmzbYOCM65Gza+NqOdXcjobyAPqWE5CP4LnD5JSTcbol8HV
 JHTtDS3eBMjQ==
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; d="scan'208";a="297518512"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 08:01:05 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id A59D1207B6; Wed,  7 Oct 2020 18:01:03 +0300 (EEST)
Date: Wed, 7 Oct 2020 18:01:03 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201007150103.GN26842@paasikivi.fi.intel.com>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
 <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: ov5640: fix MIPI power sequence
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

On Wed, Oct 07, 2020 at 04:43:18PM +0200, Hugues Fruchet wrote:
> fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")

Fixes: ...

And preferrably before Sob line.

> 
> Fix ov5640_write_reg()return value unchecked at power off.
> Reformat code to keep register access below the register description.

If there's an error, I wouldn't stop turning things off, but just proceed.
The caller will ignore the error in that case anyway. This changes with the
patch.

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> Change-Id: I12db67c416c3d63eadee400a3c89aaf48c5b1469

This was probably not intended to be here.

> ---
>  drivers/media/i2c/ov5640.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..f34e62e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  {
>  	int ret;
>  
> -	if (!on) {
> -		/* Reset MIPI bus settings to their default values. */
> -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
> -		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
> -		return 0;
> -	}
> -
>  	/*
>  	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>  	 *
> @@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [3] = 0	: Power up MIPI LS Rx
>  	 * [2] = 0	: MIPI interface disabled
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
> +			       on ? 0x40 : 0x58);
>  	if (ret)
>  		return ret;
>  
> @@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [5] = 1	: Gate clock when 'no packets'
>  	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
> +			       on ? 0x24 : 0x04);
>  	if (ret)
>  		return ret;
>  
> @@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
>  	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
>  	 */
> -	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
> +	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
> +			       on ? 0x70 : 0x00);
>  	if (ret)
>  		return ret;
>  

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
