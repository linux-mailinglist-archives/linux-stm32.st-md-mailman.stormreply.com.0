Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDA6137F0
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 14:27:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 657A6C57183;
	Mon, 31 Oct 2022 13:27:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FECC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
 b=W0vqrJETrrXTqQoG3vpBmoqKSRrJS1/Jq7LTpPu+mO9deitZfgbdUDFUfCZ5bixBYlMIUZ
 GrDC02uosAahqXIn6bqCVSZB6T87vh0yNDdytr1uBX2vmgQpsTb5GxCpQz186gv0yM5s91
 Ju+RHUdGinbYv4UwP1yzMQLflk8HTSQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-Hv_oWSarOWOdqM6nWlKMPw-1; Mon, 31 Oct 2022 09:27:16 -0400
X-MC-Unique: Hv_oWSarOWOdqM6nWlKMPw-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so3047608wrg.16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
 b=p/WDEZA+e9h4mxxGFi7b2V5p8vtaTw8jDl8c3v5PLnjqmsqg6oV8Y9jabzN6ML4QI/
 2S1BuhYNAk4tLMCjZ01epyx5haWm8mKy7gFwdsDnh7e2Hfux91EcCXuWJLLHFik8T6ss
 VYFs4kSE0O050k4O2E2cKiSxOJ+roZFOQLR0Zmr/bHNsWRQcTWXkRithBTY/hTveu4dG
 HQNMtTvS7ThoXO84flqBq41Hj0FVlhv78erNrS8/FHkQAANuVuAwKEtWPjnTGSDlULZE
 WmALaAjYCfrCemyD6juCk2P68TSVEVOb4sqq3SuR3kASFO8kl6S9sESUyRqIoSlJ+/KD
 sNPg==
X-Gm-Message-State: ACrzQf0qnwfnAMmtUVDqlPHKnI5GwcLz264Pb3n+KVUVD56nButxld/C
 WCyMJB8DU/MSIY7TNwgiTnyirfdF4twBjliU2HYiZ0YTqtouJ1tuhzdTzExFmUZWTFQ2NozdUD6
 2F2/dj2y+p66WCfkw1nLgHECNiC8fpSUpWGpJx4kD
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr7858608wrn.509.1667222835963; 
 Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XoYVkE5jE7vlhuKQ/BuqMv6qQj/pE66jVA36/qVXv1WZdIDiMFN0/ixJs2zjwBzGxtBPgyA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id
 z10-20020adfec8a000000b002365b80da83mr7858599wrn.509.1667222835772; 
 Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bg37-20020a05600c3ca500b003b477532e66sm25116881wmb.2.2022.10.31.06.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Message-ID: <0fe3974c-de66-9eaa-b56a-ed1d07644e4c@redhat.com>
Date: Mon, 31 Oct 2022 14:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-15-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-15-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 14/21] drm/fb-helper: Rename
 drm_fb_helper_unregister_fbi() to use _info postfix
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
> Rename drm_fb_helper_unregister_fbi() to drm_fb_helper_unregister_info()
> as part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
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
