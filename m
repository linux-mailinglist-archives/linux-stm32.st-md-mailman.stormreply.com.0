Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451DFB533
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 17:35:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05CE3C36B0B;
	Wed, 13 Nov 2019 16:35:14 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F8D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 16:35:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 388EA28E964
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
In-Reply-To: <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-2-adrian.ratiu@collabora.com>
 <CACvgo51sNzSHCcix89giYEq=iGJa_-nYbgpOKY-MxPRGCM_cRQ@mail.gmail.com>
Date: Wed, 13 Nov 2019 18:35:30 +0200
Message-ID: <87r22bhgz1.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Cc: Neil Armstrong <narmstrong@baylibre.com>, "Linux-Kernel@Vger. Kernel.
 Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/4] drm: bridge: dw_mipi_dsi: access
 registers via a regmap
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 13 Nov 2019, Emil Velikov <emil.l.velikov@gmail.com> 
wrote:
> On Wed, 6 Nov 2019 at 16:30, Adrian Ratiu 
> <adrian.ratiu@collabora.com> wrote: 
>> 
>> Convert the common bridge code and the two rockchip & stm 
>> drivers which currently use it to the regmap API in 
>> anticipation for further changes to make it more generic and 
>> add older DSI host controller support as found on i.mx6 based 
>> devices. 
>> 
>> The regmap becomes an internal state of the bridge. No 
>> functional changes other than requiring the platform drivers to 
>> use the pre-configured regmap supplied by the bridge after its 
>> probe() call instead of ioremp'ing the registers themselves. 
>> 
>> In subsequent commits the bridge will become able to detect the 
>> DSI host core version and init the regmap with different 
>> register layouts. The platform drivers will continue to use the 
>> regmap without modifications or worrying about the specific 
>> layout in use (in other words the layout is abstracted away via 
>> the regmap). 
>> 
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com> 
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> 
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com> 
> 
> I should have been clearer earlier - I didn't quite review the 
> patch.  Is is now though.  Reviewed-by: Emil Velikov 
> <emil.velikov@collabora.com>

Sorry about that, I got confused and thought you reviewed it all.
 
> 
> Admittedly a couple of nitpicks (DRIVER_NAME, zero initialize of 
> val) could have been left out.  It's not a big deal, there's no 
> need to polish those.

I'll address them in v3 as well as updating your mail address.

Thanks for reviewing!

>
> -Emil
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
