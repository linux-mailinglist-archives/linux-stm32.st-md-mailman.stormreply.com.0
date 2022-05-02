Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0002517049
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 15:28:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F5CC60462;
	Mon,  2 May 2022 13:28:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FA08C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651498112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=M/bOdoL2S3N0JICWRmvfdoNBvP4iNrDAP1wSgx/MeZZQL2CSowHRGcH3mF5Gt1s8xHPhCN
 SX7OFMMemNWaKzv/qjEmY3I630B0PmkjWeVJZ+08PF/1KgZ0hh5grd8LMv9v5B3qjzJc7d
 UaFePn/FknHIegcRpdvjKAe8qaTrvR4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-kEhFuLqSP3So325mdWVjNw-1; Mon, 02 May 2022 09:28:31 -0400
X-MC-Unique: kEhFuLqSP3So325mdWVjNw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso946767wmm.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 06:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zV+k9kqlgz67AfOxcNykb0h39cTNVnn0WXnNEGgjk4=;
 b=dyTh0yvKhm9ssb7rrjfoTfBFwP2VtAhhKM+e1e+JJDFut6fzHf3n67ih5WQjhFCb+e
 EPEJ3nNBmgr0m+zKlG0cfO0QXsqNxUHkunmyYv5hhzL89Xu+YkVDJZ/+0kPr207Y63Lc
 2QndEV1M8zhvG2xPyloX2uzaCv9NfK9nkDqsUncSr1jCQ4dmkk+kOjEjHH9BeMxHPEmq
 EjR3y8cT8lgSa9E3pIKsXO8ATmAvhNpDYHh1qg11Srl5o6PftQ3onjW0k5eCDKZ6lH3z
 djJ8T3YKaGs5L8o2AGOH/M9xVCWOUQK6CieEb7KdjeDgTHENVWT5SV+EscW8UxZ2ynjX
 pNWg==
X-Gm-Message-State: AOAM530/IUhPXUFNSa7q0WtDVxNh0DfNsFAkreA7Ub95AJQVtr47EGBn
 YOHsoDvcEWOobS/3RZ9nsxc7/XPD0YmTu5+1yfePOOMN97WwBB02pWafz9O2h7SIhXHTCuUE+tp
 Rc6E7O4M1l1+DDazDXW4X8bicKnS3Vhmw87kVo3ek
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244388wms.52.1651498109813; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu2jM2LG+DX+dIVzq45o/V1TxQWIpFsCwnWfT+RmC19xyv+UYhuI/wi7PI/5TDnuN7eFlQ9w==
X-Received: by 2002:a05:600c:1c20:b0:394:25cb:1404 with SMTP id
 j32-20020a05600c1c2000b0039425cb1404mr12244330wms.52.1651498109516; 
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfa383000000b0020c5253d8bcsm6985850wrb.8.2022.05.02.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:28:29 -0700 (PDT)
Message-ID: <c0703a8c-3263-6dde-07e4-9f03680c6726@redhat.com>
Date: Mon, 2 May 2022 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502084830.285639-1-javierm@redhat.com>
 <20220502084830.285639-3-javierm@redhat.com>
 <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Ym/BtOM3OlPoE+nr@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 spice-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jyri Sarha <jyri.sarha@iki.fi>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Vasut <marex@denx.de>, Hao Fang <fanghao11@huawei.com>,
 Evan Quan <evan.quan@amd.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Alain Volmat <alain.volmat@foss.st.com>,
 Dave Airlie <airlied@redhat.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 virtualization@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, amd-gfx@lists.freedesktop.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, Tomi Valkeinen <tomba@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [Linux-stm32] [PATCH 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
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

Hello Laurent,

On 5/2/22 13:34, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 

Thanks a lot for your feedback.

[snip]

>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2501,8 +2501,16 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>  /**
>>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>>   * @dev: DRM device
>> - * @preferred_bpp: Preferred bits per pixel for the device.
>> - *                 @dev->mode_config.preferred_depth is used if this is zero.
>> + * @options: options for the registered framebuffer.
>> + *
>> + * The @options parameter is a multi-field parameter that can contain
>> + * different options for the emulated framebuffer device registered.
>> + *
>> + * The options must be set using DRM_FB_SET_OPTION() and obtained using
>> + * DRM_FB_GET_OPTION(). The options field are the following:
>> + *
>> + * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>> + *               @dev->mode_config.preferred_depth is used instead.
> 
> Do I assume correctly that a driver that would need to set multiple
> options would do something like
> 
> 	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_BPP, 32) |
> 				DRM_FB_SET_OPTION(DRM_FB_FW, 1));
>

That's correct, yes.
 
> ? If so, I would rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() as it's
> computing the value of the option bitfield, it doesn't actually set it.
> Apart from that,
>

Right. I'll rename it.
 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
