Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6928BBF0
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Oct 2020 17:32:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26DEBC3FAD5;
	Mon, 12 Oct 2020 15:32:15 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A01BC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Oct 2020 15:32:10 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5C4A5240002;
 Mon, 12 Oct 2020 15:32:08 +0000 (UTC)
Date: Mon, 12 Oct 2020 17:36:08 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
References: <1602145756-4354-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602145756-4354-1-git-send-email-hugues.fruchet@st.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] media: ov5640: add support of 160x120
	resolution
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

On Thu, Oct 08, 2020 at 10:29:16AM +0200, Hugues Fruchet wrote:
> Add support of 160x120 resolution.
>
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>

Looks good, the new mode works for me on a CSI-2 2 lanes setup

Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> ---
> version 3:
>   - fix wrong array affectation
>
> version 2:
>   - fix missing max framerate
>
>  drivers/media/i2c/ov5640.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..40d6983 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -98,7 +98,8 @@
>  #define OV5640_REG_AVG_READOUT		0x56a1
>
>  enum ov5640_mode_id {
> -	OV5640_MODE_QCIF_176_144 = 0,
> +	OV5640_MODE_QQVGA_160_120 = 0,
> +	OV5640_MODE_QCIF_176_144,
>  	OV5640_MODE_QVGA_320_240,
>  	OV5640_MODE_VGA_640_480,
>  	OV5640_MODE_NTSC_720_480,
> @@ -416,6 +417,24 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>
> +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> +	{0x3c07, 0x08, 0, 0},
> +	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> +	{0x3814, 0x31, 0, 0},
> +	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> +	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> +	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> +	{0x3810, 0x00, 0, 0},
> +	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
> +	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
> +	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> +	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
> +	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
> +	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> +};
> +
>  static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> @@ -552,6 +571,11 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>
>  static const struct ov5640_mode_info
>  ov5640_mode_data[OV5640_NUM_MODES] = {
> +	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> +	 160, 1896, 120, 984,

These values do not match what's actually applied on the sensor, but
this is not only related to this patch.

See ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com
I should try to re-submit Tomi's patch and the on-top clock rework.

You have a CSI-2 setup too, right ?

Thanks
  j

> +	 ov5640_setting_QQVGA_160_120,
> +	 ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> +	 OV5640_30_FPS},
>  	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
>  	 176, 1896, 144, 984,
>  	 ov5640_setting_QCIF_176_144,
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
