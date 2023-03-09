Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAE6B22E5
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:27:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 920F6C6A60C;
	Thu,  9 Mar 2023 11:27:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEEA3C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=HhBx59K5GRUTCv/uIxtSHIcPIHuPCFoJ/9xwZQxosXBM2eBadYSGK7ubJ2JFpFsxZnHpq3
 JXjd4HemQspSgFZvSbgQQR71XXXwt3U4VEKX40S/nABPhbnE7zc0zTJIn6liK4/UrtY5U6
 KgX/Hg+CZlIln7pPJQfZTUH2AGuwwQg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-SwINP1-uOmyhc1UUB9510A-1; Thu, 09 Mar 2023 06:27:15 -0500
X-MC-Unique: SwINP1-uOmyhc1UUB9510A-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so543013wmb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361234;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Za/SPZNUz2U1SErMRqQ9Q1i2yIhWBHVGSkIVxEHkhRIVZA3r8XvrIF8zFynHkILQli
 el+eJjsUNji3zwtXBL/LfRRlQvfAHoujjfO9ZiUNZZDOG8XA4wVN7QWvSn8OuK2E4rwk
 mmqujadX7x21M5enJG03T1ZtRi2OMsPaD1AW8UqUNyFkRb0mi44+7rfVDEyCZ8uFRWKH
 ulg8mS5D73LKS6UtaGG3838rBWvjDa9ysDfDwjewizY8IXsAUB4DRlH7qretK7OVYQB5
 Tdi1dpgwFA0CVk9FEqnRE7N6odLN9l+09b9d/J1owlvg2iPA5FcFEvWRlWzI0rhK/avl
 qJRg==
X-Gm-Message-State: AO0yUKU0ATkildILaUu5sHlMKR3Wnnu4eal8YA7ilGIEinW8mzU8orXB
 PPRfRJJMHGU2CI7UA9MIeVyjTFxX1cPRNHwV9/YZr8F/Xo9tpwgbM3gXbf3729sBxc++PGwsY3g
 EfhlTZGFOHqC11Qv+iatrA+mYqqHDnee64qNfrAVm
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id
 a2-20020adfeec2000000b002c58d0675c2mr16143002wrp.35.1678361233892; 
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ARdxfkcrK23hiLLxHMM+1xly+a483wuNbL82OhsV1hVbBQRT5MxfXfizo4EESj/6UVgIYTA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id
 a2-20020adfeec2000000b002c58d0675c2mr16142965wrp.35.1678361233574; 
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfdf90000000b002c707785da4sm17592422wrl.107.2023.03.09.03.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:27:13 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
In-Reply-To: <20230301153101.4282-18-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-18-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:12 +0100
Message-ID: <87jzzq6u7j.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 17/22] drm/tidss: Use GEM DMA fbdev
	emulation
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
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
