Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E7613532
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 13:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10E41C57183;
	Mon, 31 Oct 2022 12:00:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34B31C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667217628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
 b=QYoj37pjD4OKm5l/ZtMj/CC0h07tkgzFrb4uynnnsVwgLjaZIbCisyMVyutrW4bOQwNp3+
 y2f25Okt0hEEuBprfDzSBegF2yZQt/M/12xzkLwU7PTL206v3hgNTYCNtDPtkKP2j1rhNB
 NXZfXtIWSrmfeYUIOlBxb6KNXwRywaE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-WbBBZ_uUNrOTFhWQa7UWlQ-1; Mon, 31 Oct 2022 08:00:25 -0400
X-MC-Unique: WbBBZ_uUNrOTFhWQa7UWlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso5571073wmq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
 b=zR5+ephlr2GxqRWZpPXDnhnbkGdkbltzYzvUlbDw6Hr4fb5gkd774Bmv20kbz+DcZ1
 vPiLMSVHvNCJ0dHoO+TIm+zzvhZF8sjisNmfwi0ZSZiFowfcbOfUSptLGsDPMW3APmez
 TnEEJYHyqg9FCWWDWE61gfCEvfCM9ORRqnzdXiuq/8K+0nfX8KGF6isQZ1ZXfno2gN9K
 5FOWOv+usXCxY66kNySI9TtCfU1hKRgi+ojkuWBt00kTVAeWGhU+q0h2Rmao8XHXijyl
 SrrxoWBGATG3Gow49UxiswS2sRLfyEyUKvx1638N+WcJZ8POpH2gKghPFy0ICyqnw7u1
 hsVg==
X-Gm-Message-State: ACrzQf3SRZNEYGYMeiHixYkAzdNuv7jhXGxrlZQT9AEulSH8jdNI+btg
 nqgnCfj5FIrdDQ99yhbWeY6Q4vNSf4C4pHKknS4qw5TKQwrfonLDEnfPnEPY3utzZYCkkQcSiX5
 qaMic/cdetbT6xXO8WhgQpu8uR1syMrx0q9tDw4FM
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id
 l14-20020a5d560e000000b00236c3254858mr4606538wrv.259.1667217623892; 
 Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SGo+SId6me5X0r4rljOgpSC8TPNcKC+21wfNb2F4dclcZs6G1cIUREq2tk/ot5/dgyLJVEQ==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id
 l14-20020a5d560e000000b00236c3254858mr4606520wrv.259.1667217623655; 
 Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003c6c1686b10sm5388458wmb.7.2022.10.31.05.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Message-ID: <2e2e3915-a7b2-d030-2ffd-117b12deedb2@redhat.com>
Date: Mon, 31 Oct 2022 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-4-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 03/21] drm/vboxvideo: Don't set struct
 drm_driver.lastclose
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
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as vboxvideo uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

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
