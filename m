Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76E6B22E1
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:26:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73119C6A60D;
	Thu,  9 Mar 2023 11:26:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB129C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=XX357ieAPtGv0Rh0t31gJ639rZi1FlWdwLgBSID3nj+NJD10X1l2n4na2LAU7v1Xpm/1G2
 uhk+kaSZcmThSWcQckbL38M0SHmEhM09fZSkEuULoNpkGPVnt/GJwbk1kEfj7P0L4xuz2j
 HUmPi/XDKoWwkGwYdzOkgunE+9cpwgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-9xFua2apOKWeCvHp9E-kFQ-1; Thu, 09 Mar 2023 06:26:55 -0500
X-MC-Unique: 9xFua2apOKWeCvHp9E-kFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so544852wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361215;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=uJ5Ka/BPbTpnd9yBYWpiXN4XLayyJ8JR1qKzcIaHQDOW7wFrw6lNP8GR/10I0d6pvH
 EKyeMlyq1owJvqFCrTtQKy2txgn1Y4SS2dr39v5NqewXF8dP0zFBW5rGHEDRBlmEUutK
 8sbtVSiErh4NHqtLGbotqRplF8nE+71vqu40eOpvIHm5m7ACyzBt4E/DkOJLGIwOvaCE
 ZcTB2T7IyFSjxdRf6mLEMwOzyAQXKMQRyQBCWMCforh/rmzAzGM7hZvDnMM/1pExgiYW
 XI352HYIEAYyR5ONjpPQdsq/bgup5SjDPOKFMpVYwwhEtNibB2QryVetrzc48TF/yHA8
 XeuA==
X-Gm-Message-State: AO0yUKXU99Zv/3hbvYu91y6cobErKu90xsst1BkclU93E4bxnIROkt4A
 Dsi6yiJoeQf/XGQedpa10xYPYjV5gPcq79rcB9XLjzOgvsIQ8fnRbAXgIsgVUeEMXQKsIPU0+OS
 niNgAWTZqDRwU/zUS/L7wMJP1XuT0Dgs8Qh0xUpox
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id
 u18-20020a05600c19d200b003e795bae1c7mr19013917wmq.32.1678361214956; 
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ootXMCqEk3gOIZKrqE6NGC6vCRZefQop/jJ1mx2KmfjNSeFee8+geTPWhVxDzmhIrEN6nCQ==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id
 u18-20020a05600c19d200b003e795bae1c7mr19013869wmq.32.1678361214645; 
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5-20020a05600c230500b003db01178b62sm2249369wmo.40.2023.03.09.03.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:54 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-17-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-17-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:53 +0100
Message-ID: <87mt4m6u82.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/22] drm/sun4i: Use GEM DMA fbdev
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
