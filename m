Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFE3E4248
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 11:16:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C91C5719E;
	Mon,  9 Aug 2021 09:16:05 +0000 (UTC)
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE533C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 09:16:03 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id D1O3mzM1v4SnAD1O6mlikF; Mon, 09 Aug 2021 11:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1628500563; bh=zeXxdLM8LzjWjZQIvOD7a0FLojdqnvKW9IdZzgJWrAE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=FapdsSWgrEHvWVXcUaMD3fLqqLg/hvsZq5zGHbQ6h9GYNLDWLnL7UQg6autDQ3EDa
 c9KOVGv7Jj3I9lqNCNjvkoMASuNgqtx5BTCRzLdS3zd8ZZfBOWkI5wIstJByDEiyeK
 W4WHF41/bE4AfYMVB08J14Fokwn5rK7tXTGM5r1UefyCjW35YFCSLZZF0MqKyf++9f
 +Gk0xxdVG12yjwX6Dlu40Hdu44C6fJKHXuhU+BZyjJMnWN44sjG4adPrVzUmuVB1rV
 2iLqCnrFXrNYeH+dP7W1D41PVx3LMgpm9RsDGH0ecMQxJADmba723sJhqPbAuaue2q
 ggyxDaFLgZWZA==
To: dillon.minfei@gmail.com, mchehab@kernel.org, mchehab+huawei@kernel.org,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
 <1626341068-20253-18-git-send-email-dillon.minfei@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7131ee03-fc81-cb9b-665f-80e4ce8435ab@xs4all.nl>
Date: Mon, 9 Aug 2021 11:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626341068-20253-18-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfJjZzB2AcxlqBOUwWHqo+yH9Eb+LcfXJCeRn5OWwp8nCYrdlYMKifMmC4EkG+ffRU7MQVVBJkTHcRYBIefuRsbR/v06kAj+qoKsR1Yk9azbC0u4s0VO3
 szFefb8rEZl3GtO+BsoiKigu/A/vsezQYHEbGTEWeN+JFSeB55VFdakD0lbXbqqX7xZ2woNpfY/SnlREfmD1AihMgrcw05feLS7rZEH8GweBLJFZyRh7627x
 zRCJOAdPjrt3nYBAo/PZcXiLT73kIfxa/2ad9gB/697IxNKtA2YTmlWTa5AFqxxNHudUm83nE+7oPB3mIpSD6AdZHmBrI3DxR8zBRhFAyaJ1pqyvuSIpzPdE
 L8purSweoZn32sKjaflhXWbBS15YXyO2eHFJEQ8ZPXfKES1Wv5yWZpQduu7tij8+Ri8NWWnVmS+vZe6lEtAd2zNSBu5f+ijoqPE1z8NSAFC6qVyOrOtkhUwn
 AzaP5ArBmDVtZh++6aXXemDmzGGDZydf+398v7JGwEd4sgbMoqnDfYktQHpgo5pN97sc5NNOlyKtZKyLM8wItAPpRo6l/ktkLAv9n/mXIfcBnE43cIscD04C
 oGn93fHZZpE1DgcxPlwRUh5ADx+i3RZvXVahJMDrSbyACph/229gIaOAgfPXs3qmAU/dha1z6AQ5IUh8gI3jQZiv+ySBfjZEmHouf1lCL2WqrnXteWB2qt5W
 XilwGk1qmW1kJWvFBx8OmCM+wWuoIVB+Y4rOzSEsIXZHkUNCe2c3zRzu0UJnvilAExL+SSwIb+i9TGTAKeQN+WLiUMawpbWpm1VQS13D/PQ1rtZtBQ4L9fPD
 +oFoVBlxolO75yY0i9oUtdBxFoyFmnlWqYziIfLWYQAljxj54aeKjgDqlNSHlQ==
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 7/9] media: docs: add doc for the stm32
	dma2d driver
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

On 15/07/2021 11:24, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> add stm32-uapi.rst for stm32's dma2d driver, explain the details of ioctl
> V4L2_CID_DMA2D_R2M_MODE, V4L2_CID_DMA2D_R2M_COLOR.
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v2: introduce the stm32-uapi.rst to explain the detail of dma2d's ioctl.
> 
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../userspace-api/media/drivers/stm32-uapi.rst     | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 12e3c512d718..ce42915d48f4 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
>  	max2175
>  	meye-uapi
>  	omap3isp-uapi
> +	stm32-uapi
>  	uvcvideo
> diff --git a/Documentation/userspace-api/media/drivers/stm32-uapi.rst b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> new file mode 100644
> index 000000000000..d7a4f717387d
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
> +================================================
> +
> +The DMA2D driver implements the following driver-specific controls:
> +
> +``V4L2_CID_DMA2D_R2M_MODE``

Please mention the control type as well.

> +-------------------------
> +    Enable/Disable the Register-To-Memory mode, filling a part or the
> +    whole of a destination image with a specific color.
> +
> +    1 for enable, 0 for disable.
> +
> +``V4L2_CID_DMA2D_R2M_COLOR``

Ditto.

> +-------------------------------
> +    Set the color to fill a part or the whole of a destination image.
> +    only used under Register-To-Memory mode, to set the DMA2D_OCOLR register
> +    (RED, GREEN, BLUE) which is:

Here you mention RGB only,

> +
> +    31 .. 24    23 .. 16  15 .. 8     7 .. 0
> +    ALPHA[7:0]  RED[7:0]  GREEN[7:0]  BLUE[7:0]

but here you also mention Alpha. So which is it?

See also my review of patch 9/9.

> 

I'm getting some warnings building this doc:

Documentation/media/userspace-api/drivers/stm32-uapi.rst:4: WARNING: Title underline too short.

STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
================================================
Documentation/media/userspace-api/drivers/stm32-uapi.rst:9: WARNING: Title underline too short.

``V4L2_CID_DMA2D_R2M_MODE``
-------------------------

Regards,

	Hans
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
