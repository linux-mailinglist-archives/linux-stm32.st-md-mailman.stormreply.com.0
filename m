Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C7E613517
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 12:59:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF64DC0AA15;
	Mon, 31 Oct 2022 11:59:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77A81C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667217579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
 b=g4jMqAp8hrGRUSmI2Hc4CZvOW0ebl46D4m3RfmyoWgCmf2lrlh3KOdMx6WKwy6Wms7BBpu
 9oFmNSmJ1GNJ0f9OwMeNqOTKRyvkNNdkJOzaaR8FxeKcNNwJnA1wtKNxvfiBk4dKz+vhjf
 7Gxvj1aF3r85fgbNn4qnVwdUj3RxF6Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-_hzsGkwyOHeCYwnt181RKg-1; Mon, 31 Oct 2022 07:59:38 -0400
X-MC-Unique: _hzsGkwyOHeCYwnt181RKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so5227848wma.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
 b=mWbToT6cwKU6XgiDXVIIyJyaIvh1poSBI5V8Gwb4piWVcQeyyJat1LKFnM6KfYvsEc
 g3M2rmUFH2IH9FtfJCm42M/9gbW7g+3ePMS+dDlsUmWfgSMd7fgoXZTShnKGCeo55Nvq
 FEg1FMFSikKqQJvgpC1m+e/lfVvg3yLWyUZ/mJEIvsdBvU/MKnV5hyQ6kPZmAKZvWDKi
 joRefRrF/QG2X54b86cOeGVww9aM80gsJN0CPsEGAHMXxXCEt7LztSCCMkYOMcT1Wjkx
 4+rH3RQYd4ep965DuQ1v2XEaIWfd86QgLsj05n0+ELghGBbYxKUruU7+XX1kU7chqreF
 Q4yA==
X-Gm-Message-State: ACrzQf25qihnP48GGfCJaDx6SKmTHZsZ4QqOhKmxx0ftRn8lLRkjGyZS
 /FHpfpsXrDCRUUvNnwKb5FxSguxnhZDP2dOP16zKOpWOhkysD10ZqYIhaJyP+oNWwqmViUEhckX
 LaIJI84Mt5R2OEkQFH36zFFrTvL9Rnwx+EjRSkmdO
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr7602930wmo.179.1667217577115; 
 Mon, 31 Oct 2022 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EBETLSD4MBJxdnzTxR3FGu4hBbX2SQFUCrJloOPK1q2LF0w1HzUkYOXWVOI9w84+cugepvA==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr7602924wmo.179.1667217576945; 
 Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c182bef9sm7774720wmz.36.2022.10.31.04.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Message-ID: <ae69e0c5-05ee-f0ef-a333-53bbaff5c3e8@redhat.com>
Date: Mon, 31 Oct 2022 12:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-3-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/21] drm/mcde: Don't set struct
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
> fbdev console. But as mcde uses generic fbdev emulation, the
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
