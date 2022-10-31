Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39736135B7
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 13:18:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62A6AC57183;
	Mon, 31 Oct 2022 12:18:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE3CBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
 b=gDJmJCaUqJ7Fm6o9o5aunIA5xfKid9ZLcI2R1r8DajuGUsufutJXLsks1ABDt97IrmjQXr
 rFHPAXjVvH2zt4OLa6y1XAHhEZomEUALKaONYArkpyjqGt47uZ3902Kpa/xZESRuV7066X
 8VkTIYOU1i6VKauEjV1TQZqcTnqptow=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-RmawKXrXN4uC-H6mx3US9g-1; Mon, 31 Oct 2022 08:18:44 -0400
X-MC-Unique: RmawKXrXN4uC-H6mx3US9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 h204-20020a1c21d5000000b003cf4e055442so5233972wmh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
 b=7TMHIYBxhYXU1V4UGkg3zgXhygiiouVndvPELX1YMYAPO3vVhczVBThgcvbPflak0R
 rB31+mdlWfCEwE9ExW32LOLuzkstVUpYVtNanSu68bPQFYPfyALV37lZ+AyF0ERAN4Jd
 qXNxr9xNkM5my2wkTl0SIp6gtyB7U29DH84wLB+IZRCFhBdeUQKKAb6FbFniFcLelqxc
 t3vjwPlXpm67vpPY5BjQRrPItJzTEa7rT2+Z7Gfnt/0lLMpxOrXugdtmbyT6d0w4PpwI
 YuxGmHKaDjY9BsrIeXyP2IlD9P6dnVZOZDLGsZmw4KkGh+6wLCqyiu9HQqRVAyQHVYfQ
 rOmg==
X-Gm-Message-State: ACrzQf0I+jWQd8qRlimC6kddQ37jah3M7EXiC+Qv00EscB6orgW7X8dM
 f9UyE8J71A5qMTays2SHUysRFnHB9NYbsn4RhbIz8ZkUf/KQMYjlNy752ysgt3scPBvK3+uLUQm
 fd+rhwmng4HivgPz+p/Gtbu6PxGxin7ADgRH6en6N
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id
 j19-20020a05600c191300b003c732c820f1mr18174569wmq.81.1667218723533; 
 Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7l/GcAhTFdfukiyp7nV9yfjX7i/zfBGid5JfBMyP3xXFRWK8fegD9382/Cb8rQ8SeG7Fkrtw==
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id
 j19-20020a05600c191300b003c732c820f1mr18174541wmq.81.1667218723353; 
 Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003b505d26776sm1928473wms.5.2022.10.31.05.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:18:42 -0700 (PDT)
Message-ID: <05a2ad4a-b053-ba98-2547-520ab51d3e77@redhat.com>
Date: Mon, 31 Oct 2022 13:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-8-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 07/21] drm/logicvc: Don't set struct
 drm_driver.output_poll_changed
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
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as logicvc uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
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
