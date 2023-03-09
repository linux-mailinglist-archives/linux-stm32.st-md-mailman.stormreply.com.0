Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB96B22B6
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:22:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6522C6A60C;
	Thu,  9 Mar 2023 11:22:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F01FC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Dghzts1KQfEJn117b+D+nIsLd5JNUVZxacPTW+thvMS+bZCpeL/Kk2LnfiNO0OdOJkbCcH
 KCkYj3L2d/LUOtcMjAksgiA0glofBTMHqnuDJJl0yMuBSOMTLihGq600Hg5GH6mUHvqxk1
 T5lDDvYaievRtWIJpsuOV51mH2r7Gps=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-MrfH2auRMdu04hJTOUyvbw-1; Thu, 09 Mar 2023 06:22:44 -0500
X-MC-Unique: MrfH2auRMdu04hJTOUyvbw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bcd1a000000b003e71cde0e70so1563701wmj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360963;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=BNbel37dlGUXyoEyoIZkUhxRgrzd9JoND93Zkf9OTqleX6kpd2OvyIuBqosXxis3n2
 UmJkjMewIboGi5XRNvQpqQnjJgH/driRAmHeYqT9nlpWd6Lqcov1EQAcp7SycTMzhO8T
 AiipCkq/XokHoR0TOKDlbvf+aXLrY/f1pFmXVXJ3wPPuug/js6rnhKctENmADsNn3rZx
 w/yD3nCxaA2qK5l/sn6HSS5ssYfneQQb9DPc6fKbMujJIbg0Xjswo110XjNTwJVhfsCm
 ec09WOWLjg+LFrRBa4hbPyNrKaJkXdMUN1FOG/Vk7T3cngzp11cvDJ9KTWOjdqosd5qV
 AIdg==
X-Gm-Message-State: AO0yUKVpZV7pohK8WPSQJJBJnG+WUfhpuW2yOErXVwzlM3KpztQfKeWx
 cgpU/SvIuBKdqZO+SFweHE99b/rCFFpIwQkA3vJGDfuEIFd0KMeIuPc5+N7EHsDTNvA6Xhc7Og8
 09piuuN0J/DuuYT4ooY9vCcyTPYiI1cO+S2HOEgFs
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id
 j5-20020a05600c1c0500b003eb45016c60mr15506202wms.5.1678360963371; 
 Thu, 09 Mar 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+bXzeTIl7Irwfxa7/DXky+Tf4Fs2Oix8AFpHgk72LnoLDINFW1m3YZeFk72iyLEtfOHY0o9w==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id
 j5-20020a05600c1c0500b003eb45016c60mr15506159wms.5.1678360963195; 
 Thu, 09 Mar 2023 03:22:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003eb966d39desm2539921wmo.2.2023.03.09.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:22:42 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:42 +0100
Message-ID: <878rg6cgot.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/22] drm/meson: Use GEM DMA fbdev
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
