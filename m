Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D261605F
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 11:02:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3FBEC6411C;
	Wed,  2 Nov 2022 10:02:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9198C6410F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667383352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
 b=Q7leAYZqc3S236QbrWd5JH7lcPBXB8R+bp7eqqQlt+z6eCMQ8px+gxzxnMworn2TL77lNM
 FVdbbhiCE0IYf1RdcQkjXSdr6asP0r/zf+/CmUI6+px2J5NuNgKaDePz9WpBYZwpK3UrJG
 5pkA39pvy2xfMh8gPmXyv9Xp1UlJIms=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-Pa64xuIfOAaUfB2G7hKJ-A-1; Wed, 02 Nov 2022 06:02:31 -0400
X-MC-Unique: Pa64xuIfOAaUfB2G7hKJ-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d10-20020adfa34a000000b00236616a168bso4658209wrb.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 03:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
 b=P5UGffD8igpCvI8C1Qr4hJgE/R2F6Q3bYzdxRizo0C1cQJJmD1QBwElMv61cka8v2b
 r1qtoCKyvXgiv7/i/tqFn5f2q66fTtlzx5JN8ebuzvfnBvUXkqtCHtvXLncOhbhOLqbz
 XYk6MtdzQvFJB1pkomin24eB9VPRuZWdH1ZVE+yFQq4/j5G7O7ZldlBiua0656DW3OIo
 YUcyNhgOY8djELGJLEQq3uVP7rRvq9Em12/wPcBkT4LsYxTRonNG+2CqFvZuBaZbERcr
 DXu0h+FF7tUb4yUtqH0O+Uj39Hv2ZMiIEA7jVUDyqbgjJbipH8lVX8HNu1gvy2nqb8LY
 LF6Q==
X-Gm-Message-State: ACrzQf2L9c34OmG1396ZZbcaO2d18+aiRPDRR/02n1MX1uOTOT+bETV6
 KoGi+N+EW9ImcOJN36NarqLjCgbtj6ijmmhRSaw9/tDoDABHlCAk5fEumYFHu3aV9vDuUzTJVUb
 K4P1jiqFXsfKlUErJGOd37Or53PkpcqXJ7/7LjBG8
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id
 w15-20020adff9cf000000b002366a26c055mr14584873wrr.195.1667383350613; 
 Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OHHkFmpcUlQhLx4VZSF/FNGP0hsrmpEExWtKIxFg2Jf6dmbAckk/gQVQTytU8dXpfU2B04w==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id
 w15-20020adff9cf000000b002366a26c055mr14584846wrr.195.1667383350420; 
 Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fn13-20020a05600c688d00b003a3170a7af9sm1564836wmb.4.2022.11.02.03.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Message-ID: <68309442-ad39-36da-b1ec-680dd4129a7f@redhat.com>
Date: Wed, 2 Nov 2022 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-22-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-22-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 21/21] drm/fb-helper: Remove
 unnecessary include statements
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
> Remove include statements for <drm/drm_fb_helper.h> where it is not
> required (i.e., most of them). In a few places include other header
> files that are required by the source code.
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
