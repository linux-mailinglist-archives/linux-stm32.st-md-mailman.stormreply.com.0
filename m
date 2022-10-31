Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75B61362E
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 13:25:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D40EC64101;
	Mon, 31 Oct 2022 12:25:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAE5DC640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
 b=QJL2CvRZ35ILqntwglcfJB/a896412d1Gs/ryK19FqBu9PQAYKfszqdou+GX4fMWhbV1NR
 SyfIFVNRT2c2Zq7m+r3byOuOXeBEHZBzE4bqj+10158zk+qbaHlw32mcet4MZtyOv2hZMb
 hhKmV3lMNC/5KxPYLhztuxtSA4CoW/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-lzDdEcVFOSOmUozLYGF0mA-1; Mon, 31 Oct 2022 08:25:28 -0400
X-MC-Unique: lzDdEcVFOSOmUozLYGF0mA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso1029970wma.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 05:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
 b=6R2zvekXi3ihfxWGmz2nwIvijuzdfEERtYybjVxig+YY53M5fpelZjC55V4h1t4E6R
 38+E5vKL5hGy1osgzx5xQjMxSrk0oAtLvcuWbhDM7zgCVQPP3DWJKkTfqqumOVzbRY7V
 bi+CkrDwLEeoPx6bTE8BbfzwpBZMJlTbmziXhi61tcubEGAOz4Pg0h/YAYoc9TM1osiN
 HvY4W19TW+R7IAkh5fqWPkp8EB4lrdTSijIy2Lz5QnrEajUGLOB1Inzg86blHhoDAsBj
 a0D+cqG1BScdIHvLN5kJVtiOoDhPsXluGvXcWZsw4+vc0FvTkfEM0ROcfWrT0aYcVqnJ
 vmNw==
X-Gm-Message-State: ACrzQf2b0luKr2wEyJU8vWG5x00uW0pCJNs2xRgWJ9poGeJEXP8Laz5n
 sr0EC9t3Tn3tymNWInS+FAAnygxMN5vFoTepNM5lDytWwL6GvsUGCkzqTC4WrB+3zGAyI3JDaBK
 uO6Jaj3GRh41qWcKYLG2I1vyceyQJHncHeXqYQcQO
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id
 r10-20020a5d498a000000b0023658ef6796mr8133544wrq.399.1667219127469; 
 Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OaQ4lCdeJx0P85vXeCC9ohI1f8Am/sl3oDUbbTCyW5S09EQhBnmsKMGoGzObNL20EAzLquw==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id
 r10-20020a5d498a000000b0023658ef6796mr8133518wrq.399.1667219127226; 
 Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003bfaba19a8fsm7382582wms.35.2022.10.31.05.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:25:26 -0700 (PDT)
Message-ID: <53f341ad-4b72-5546-f752-ca705d62d63c@redhat.com>
Date: Mon, 31 Oct 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-13-tzimmermann@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 12/21] drm/fb_helper: Rename field
 fbdev to info in struct drm_fb_helper
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
> Rename struct drm_fb_helper.fbdev to info. The current name is
> misleading as it overlaps with generic fbdev naming conventions.
> Adapt to the usual naming in fbdev drivers by calling the field
> 'info'. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed. I got confused by this naming in the past.

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
