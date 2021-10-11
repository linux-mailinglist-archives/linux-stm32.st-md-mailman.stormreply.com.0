Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7584C4289D0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 11:40:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F542C5C82E;
	Mon, 11 Oct 2021 09:40:16 +0000 (UTC)
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8824C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 09:40:14 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id ZrmzmxWsHk3b0Zrn3mLuYm; Mon, 11 Oct 2021 11:40:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1633945214; bh=QMJAVf8Q7oJ7fV4THX5ne/5n45aV1FB1ikretTZlvTk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=fh+5Ii6t7j5Hj1MF7htRyUxZBLFY3A9VdDG+YYiUr2Mbc19QWo5svMucex0AaIdh/
 hxTgJuqa7IKvPoWBp088UpQ58w81W5TyegEZfcveuZpCk4QaD+vnmKuwFjtPSJNlf4
 wGFMT+zEMKq7wVkf3DWvP9dJRpnGJTsJaJ9LhslDstf9cfTadgSbCt26DC+40pglWl
 1p+1EHUgbizuSNJktleMw3Mw13F20HSknuV+Q5OFNIyqU3ER4x4ublWqAGOap5aJ5R
 CHhNeSGfMnIgvP1oXTH6HRtbDdv/16IchP3lzbIe5fsrqZPO7ScfZNlXXBtZx8SL1v
 muABHYtaY3r/w==
To: dillon.minfei@gmail.com, mchehab@kernel.org, mchehab+huawei@kernel.org,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
 <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
Date: Mon, 11 Oct 2021 11:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfA8mrB9Abh2IhqjcRtxRyKAse1GQxeM0M/SgzSbw8HkLHyu12yxnElzZhTCfKRhh/soLDsqaOBPhwN+cTmh6Ru2MpyRyzDRfmOQ2AuG9LP2BEMDAhJNW
 54p9fMY6GMgRiP5YMoOlwvpcCu6YmFjv4+0cge7V0VnzxyErDrzwWzjQNCBRl7zXGzj/DSagdo/L5BOfCPXT1u9cI5QgdtcepfvGNc76+s/wyjAumrDrQZkM
 nciZ7ksamb4wTgDSKUvWhDNpU0LS9fUWQAR4lb2a1WWD+Cl0r8qQQ8RDMXzBsGIxX1z9TYe8pC4tTtBTVfwAjlIxLlUpY88dH31NTPTwY2ZDO0uPdChcb+ul
 OSyglAZ1HlddrxnwOQl6JW9OW3hIerE4p7hhSjZWGQ+x/MjIG70+OkjhjSrn4yf/ec2FeJ5j7GgqMQGjM5TXAbAKdUTZU7WepIt332w43i08ktMdRAA0IWp3
 VhtrMemf1IstQGzTnDkFxm40x/pVvnFK9bP38li91ZlwTm9vSAZzOkaZqvmE21R4VTGoo58d+Fb5Q0Q6EJ8ctviyfumwOyba9Cq7C+9EA3lpzEw8zQgO9bmq
 ZdZFvFm0WbUaYpKhdNGRrr1VZG0VUXZ0y2K9JGhdZ9J8AUvzGZ9X8F3VBRCx/NeNYW5mik0FVciorMb0t3oGoC4eJ7ayW3CuBb3g5qTkOGuXnkaxgVu+yJF4
 hwqwMBFuFjDdsQ4VTqhxglcp/S5FCFUGa+HTWv7oPlR7SFJZeyxNT/uwyUS+I9LCghxVSNGGx8A9PJaKs07+lsHsT5/p6qs12eSRzwsr8aGaZzVYb6buqgWD
 ivDJR2IegcEnADEn3mDDhflHO+WOxg9gfkLcr+PBksWma6GHJGb3QwNlXPR8ElS1idrfkR2mqqpGA2Hjdv1UmCW++F2Gug8C3JOghirHWzK1UuHaqPyygR+B
 7P6EjEVSTobOXB8oEs7j4TIeeDU=
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color
	effects control
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

On 08/10/2021 12:30, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> - add V4L2_COLORFX_SET_ARGB color effects control.
> - add V4L2_CID_COLORFX_ARGB for ARGB color setting.
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v3: according to Hans's suggestion, thanks.
> - remove old stm32 private R2M ioctl
> - add V4L2_CID_COLORFX_ARGB
> - add V4L2_COLORFX_SET_ARGB
> 
>  Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
>  include/uapi/linux/v4l2-controls.h                | 4 +++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> index f8d0b923da20..319606a6288f 100644
> --- a/Documentation/userspace-api/media/v4l/control.rst
> +++ b/Documentation/userspace-api/media/v4l/control.rst
> @@ -242,8 +242,16 @@ Control IDs
>      * - ``V4L2_COLORFX_SET_CBCR``
>        - The Cb and Cr chroma components are replaced by fixed coefficients
>  	determined by ``V4L2_CID_COLORFX_CBCR`` control.
> +    * - ``V4L2_COLORFX_SET_ARGB``
> +      - ARGB colors.

How about:

        - The ARGB components are replaced by the fixed ARGB components
  	determined by ``V4L2_CID_COLORFX_ARGB`` control.

I also wonder if it makes sense to include the alpha channel here.

Looking at the driver code it appears to me (I might be wrong) that the alpha
channel is never touched (DMA2D_ALPHA_MODE_NO_MODIF), and setting the alpha
channel as part of a color effects control is rather odd as well.

Alpha channel manipulation really is separate from the color and - if needed - should
be done with a separate control.

Regards,

	Hans

>  
>  
> +``V4L2_CID_COLORFX_ARGB`` ``(integer)``
> +    Determines the Alpha, Red, Green, and Blue coefficients for
> +    ``V4L2_COLORFX_SET_ARGB`` color effect.
> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> +    bits [15:8] as Green component, bits [23:16] as Red component, and
> +    bits [31:24] as Alpha component.
>  
>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 421300e13a41..53be6aadb289 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
>  	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>  	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
> +	case V4L2_CID_COLORFX_ARGB:		return "Color Effects, ARGB";
>  
>  	/*
>  	 * Codec controls
> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		*min = *max = *step = *def = 0;
>  		break;
>  	case V4L2_CID_BG_COLOR:
> +	case V4L2_CID_COLORFX_ARGB:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*step = 1;
>  		*min = 0;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 5532b5f68493..2876c2282a68 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
>  	V4L2_COLORFX_SOLARIZATION		= 13,
>  	V4L2_COLORFX_ANTIQUE			= 14,
>  	V4L2_COLORFX_SET_CBCR			= 15,
> +	V4L2_COLORFX_SET_ARGB			= 16,
>  };
>  #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
>  #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
>  
>  #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
>  #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
> +#define V4L2_CID_COLORFX_ARGB			(V4L2_CID_BASE+43)
>  
>  /* last CID + 1 */
> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>  
>  /* USER-class private control IDs */
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
