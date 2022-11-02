Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3C615FF6
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 10:39:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8898EC6411C;
	Wed,  2 Nov 2022 09:39:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 497DBC6410F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667381967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgeOXsRJ+XKaYoOYvxoyhBylXQrWD/HUrGfmQUHOZZs=;
 b=NUjdYV3rW79cPv/AK0PWPgFBCxIqQyzjJC7+TBixeJ+GrpLhAetFvre/jNHsDh3WHN9fkN
 qIhEY98vXVKVZTpwUluv7G52Vnd8YgeNxFTFPzB3yb/3+/YOCi5unhZSaBadHvPIVkGGCS
 Fqf/xQJxT9DKpbUnMs09sSYNx4qfjBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-FiDE4wgyMnuTgdty9WQZGg-1; Wed, 02 Nov 2022 05:39:25 -0400
X-MC-Unique: FiDE4wgyMnuTgdty9WQZGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i128-20020a1c3b86000000b003cf4ff1b917so7733666wma.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 02:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RgeOXsRJ+XKaYoOYvxoyhBylXQrWD/HUrGfmQUHOZZs=;
 b=h668zDbfnpWvcWzypYMBi+Jil3oK6FS7TZ0wzgjtygx8CNvEV/5BnCSNiu1yCglFIo
 uaHbebHWdvpUOSAukhgW7xj8kJD08bdG4FZCIA4/PKAHzfWMqcHnGcB1UQIUYZytZPJ/
 l4acELTVItZ8zRKXFqsMhHCW6dpUl5pDJz8aqy9fG6fkbKKEW+jGGVtGgI3BWT/02wP3
 9MeBRap1sbYstx0yzBZToSrIiihe6ABCgQObPKkF5DF6M0nt8jEmMv/6dUtgEEi+Dtkm
 dmYusWlRydhyWrCODpDu8oQRmKunWsEknvmX+qXDzDeknpcwDK9iL/Lx+my28LZyfMA4
 4n0w==
X-Gm-Message-State: ACrzQf0V6vUhBI6ulzl9EnIjwAJMvue/2dEIAa8H57PmWoS1kVjvpGxe
 DJ9Jd4RPT34U1j6lvAl/p8rVmavjp5bSltNlyGoiegeEQZF76aoJ5/cid159rffQ5CHaWOW/PIQ
 QLKKbBg6kro2EmCtdLom4Mm9qCYe5FWfo0CHuJjx7
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id
 b17-20020a5d40d1000000b00236786d611emr14871566wrq.355.1667381964728; 
 Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/k2KHrjikPXyIbTE3cWGjPi0EsRobUeOg55XAJjnO250x+w4Sp4JFFeS1nRK3GUJGY3QPnQ==
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id
 b17-20020a5d40d1000000b00236786d611emr14871522wrq.355.1667381964509; 
 Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 dn12-20020a05600c654c00b003cf537ec2efsm1653185wmb.36.2022.11.02.02.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:39:24 -0700 (PDT)
Message-ID: <23b6c3ca-828a-5376-ae80-0b04202e190b@redhat.com>
Date: Wed, 2 Nov 2022 10:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-19-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-19-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 18/21] drm/fb_helper: Minimize
	damage-helper overhead
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
> Pull the test for fb_dirty into the caller to avoid extra work
> if no callback has been set. In this case no damage handling is
> required and no damage area needs to be computed. Print a warning
> if the damage worker runs without getting an fb_dirty callback.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

But I've a trivial comment below:

>  drivers/gpu/drm/drm_fb_helper.c | 90 ++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 836523aef6a27..fbc5c5445fdb0 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -449,12 +449,13 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
>  	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
> +	struct drm_device *dev = helper->dev;

You removed this in patch #15, maybe just leaving it in that patch if you
plan to use it again here?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
