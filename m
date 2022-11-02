Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA72615EC7
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 10:04:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A44FC6411C;
	Wed,  2 Nov 2022 09:04:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 245B7C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667379842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
 b=hsoMBjNEqX+xJf5EP0ftChjJWaNlm5Ab6srydPMaTf3gAnsGOUupErgZWwXFPPyrvveVya
 Dsate39yYAumLqCwsJiN/cl0/ETpy+44B2xQwspgUwnuM14uJXEdfiHa965ftF2wdo4a+b
 1Hm11DHZe7KLoMSLxhqE/TEzGUjaHlk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-kzAcFCoNM26646NL3NILzA-1; Wed, 02 Nov 2022 05:04:01 -0400
X-MC-Unique: kzAcFCoNM26646NL3NILzA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r4-20020adfbb04000000b00236639438e9so4654998wrg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 02:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
 b=eaFwnUDt6a6I8ZXARtGiS9/IQAgL+eoEj+AsJxYy2W/begJwD72aR2Z04S+O027wBU
 HPwUoF+0G5oOmZZ35rTJFnpluioI/j6HXoghEX/vZ4kBgeH/KGIknIR0vuNpUBzHfyzY
 MVSVttxx+vGNW9fXLYdl9GF+XSId7OMlDtHVHvXnsc+asr05YQdyst6j1hyl6RUqIa/N
 /wJTalX2WbI62laYBflCbwiFm52zCdviOz5S16ZtqWME+573kOEsYpQKlKiIX9cY2D7k
 JBhWCcl5p5I3GaJQvQ7n+38YjZzxWe9FcmV7Y/tLcPKJbS7hHvAY2LRQhFOOVgtBu/6P
 Crow==
X-Gm-Message-State: ACrzQf3OC0NkIsA1u3q9BTpPQ2yOYu0OH9FrUw85Bv02SU/FIJtkeAsd
 KE/ZiWYV3Jb9EkHD6y3AEEojqlo6581KGj7VJAXa4Rg/inqRnV0BRwffj/sExGskoxYJY0kGjt5
 8SHW0xckiH76ZpymhwCaHeduaepBkXeqFYYrRztLs
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id
 k9-20020a7bc409000000b003cf4c818936mr24380806wmi.38.1667379840252; 
 Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72ckpdUoZR+NwXtu1sv2+7NmgS+YMIWWHB7QdeKnWTKduGDRl7tg4bkpenTZv0mX1kFf34kw==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id
 k9-20020a7bc409000000b003cf4c818936mr24380784wmi.38.1667379840046; 
 Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b13-20020a5d550d000000b002366b17ca8bsm14083933wrv.108.2022.11.02.02.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:03:59 -0700 (PDT)
Message-ID: <87284e5e-859e-3b1c-7142-28d4fa7a7939@redhat.com>
Date: Wed, 2 Nov 2022 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH v2 15/21] drm/fb-helper: Disconnect damage
 worker from update logic
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> The fbdev helpers implement a damage worker that forwards fbdev
> updates to the DRM driver. The worker's update logic depends on
> the generic fbdev emulation. Separate the two via function pointer.
> 
> The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
> a new callback that hides the update logic from the damage worker.
> It's not possible to use the generic logic with other fbdev emulation,
> because it contains additional code for the shadow buffering that
> the generic emulation employs.
> 
> DRM drivers with internal fbdev emulation can set fb_dirty to their
> own implementation if they require damage handling; although no such
> drivers currently exist.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> -	struct drm_device *dev = helper->dev;
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);

This line is an unrelated code style change. But I guess it's OK.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
