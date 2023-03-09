Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E003C6B22ED
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:27:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7834C6A60C;
	Thu,  9 Mar 2023 11:27:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BECD5C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=USFi0+/CP0UFWLMVvpRZtPx6b9n4glCs5VK+0wAyksKJIIPhfVepJ+Q5mu4MF9FDV8Grbe
 Kf2+IpcamzMFXNBTA6b7lYp592hWlNGQ6qkRqu73fvEFyRipPsHPg80ylCFYXwRrXXhxrT
 lZBwVNpaDGxOfo1ICaanHv8PREfUHJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-0XaFd6cRNPSU_d8dGjQqUA-1; Thu, 09 Mar 2023 06:27:34 -0500
X-MC-Unique: 0XaFd6cRNPSU_d8dGjQqUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so653275wmb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361253;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=z2eVpEn9FKd1ZX5Jpr4+0vjNwefMpn6Lux99XqBPpO6rAef5hyoZ20R0uNdel9WwGg
 8CXlAjuh5DV18ArD2TYXEYW5MocaXhhZqNrnDeJjF9k0HQgqvbU4HBP90BTq9ZI69+b/
 akF3zGSq9c5gMc4dStnyZ5UDAcrr+rtl+f02odCFKcfoFZxQqejxO6UqHTaGOtQr85jP
 oOSi7pbLlTrHzPy/vG/6jPnZhjXQYpUVU07u2gMG2qaB148g7t/I/Uz8YJrqSuEy/iiY
 ufRzVYaHJ7BVV/4oQfnDHZZH8Ur3c7TkHr4tW85XE30v3mFvY53zeyg+tZJFRPyj51Rh
 7d4g==
X-Gm-Message-State: AO0yUKUHgWhzBsbu7NIOuigGtXVeJ+og7xKhl0OzrE4ok8Mckby9ztPg
 O/boYYIpp096HZlq4lfWfnwseejbpKzc1/2/g6+YBNeiNdo/w5ouA0NmTE5hM4wh0D0YLNkHuLv
 XnJTFioJvY9jxtsdwbXgVxylHx115iW1+N9+sdNN0
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr18329000wms.5.1678361253085; 
 Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9NkiNNv96tpY+ICOstwyMw+enkMfLxXSTreTdhPg1jdkeOeFAU5LDWK20u9ucio+cg3Xhjrg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr18328975wms.5.1678361252754; 
 Thu, 09 Mar 2023 03:27:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a1c7906000000b003e2052bad94sm2217733wme.33.2023.03.09.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:27:32 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-19-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-19-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:31 +0100
Message-ID: <87h6uu6u70.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev
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
