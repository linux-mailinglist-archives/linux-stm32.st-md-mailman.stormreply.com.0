Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 311518A5C98
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 23:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4C89C6B444;
	Mon, 15 Apr 2024 21:06:55 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6267BC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 21:06:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F57F497;
 Mon, 15 Apr 2024 23:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713215167;
 bh=QK/YnNEsRDQzA+VI9ZfCIug3P5VhevsltSl+SmjeDe0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rdukYCQh9mMFKAPdTqd4jo4lB4a4B7xptpHd357YCY6nsrtHDE8p4O2e61Yb+mMxi
 yKJPDLBT5H6E9wcVtgSM3TW7Vas5B4YrUJkgnLXrP6kJ0tc0rBjudUOeDKylS3L9Le
 RHF8woqIolcFMRosZ1uhKhaSSd4+78XmA8SkQZdg=
MIME-Version: 1.0
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Abylay Ospan <aospan@netup.ru>, Alain Volmat <alain.volmat@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>, Matthi
 as Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pavel Machek <pavel@ucw.cz>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Sergey Kozlov <serjk@netup.ru>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Mon, 15 Apr 2024 22:06:49 +0100
Message-ID: <171321520986.2333277.5902882675169324919@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 04/35] media: uvcvideo: Use max() macro
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

Quoting Ricardo Ribalda (2024-04-15 20:34:21)
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index a4a987913430..4b685f883e4d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -836,7 +836,7 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>         while (1) {
>                 u8 byte = *data & mask;
>                 value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
> -               bits -= 8 - (offset > 0 ? offset : 0);
> +               bits -= 8 - max(offset, 0);

This looks semantically the same to me so:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>                 if (bits <= 0)
>                         break;
>  
> 
> -- 
> 2.44.0.683.g7961c838ac-goog
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
