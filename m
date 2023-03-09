Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244D6B22D1
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:26:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47550C6A60C;
	Thu,  9 Mar 2023 11:26:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F7DC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=a+Zt9OltAkkNGKt9MD83wZG9X8YtxH2RptqjLLcw5oZU/W8sm+5MBUtiI8M+iY1pY0Fl2I
 Sn0BnnOS2FC6euh29XHZ/0CIzRAn1eVKgpbLd4a+jBPFvJOMbOebhmGJKxP83IRnyTSEuz
 5C3FfGsWhNylJDNNbzB8yc1p1cNF29o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-WOvoIuTePSyYjlN-IfM_Ng-1; Thu, 09 Mar 2023 06:26:12 -0500
X-MC-Unique: WOvoIuTePSyYjlN-IfM_Ng-1
Received: by mail-wm1-f70.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so2245535wme.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361171;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=EJU8xPZptH0ylkliAKjvuVLcO8ALZODdVkaS0kwOT9V2C/n70PalAHGQQIwhlI3HL1
 r/17CJbj/goTjg+zuDLik/9e+QDNsCwKD/KJH3csaQaoBoA5djf87TpXaAtaqXcjWgrC
 fzMMgpIHT2o7ZjlFvxcbM9C/VmpObjmeSeWIvzZTCz2oRyVk+3/yJDj6XloKYeV+9Su3
 1zIo5UFwN6UhpoWwJsG9GWC7Pw3ltlFGv+/lUhCuKjXl3kRdNWLDwezFb2k7iXx8cD9G
 uLaJWkEVR5DGwP8+IuhMwZe91IpjpKTu+cwWCiTGnVdHktxwtxj0NENqyE0CUxToksR6
 EBig==
X-Gm-Message-State: AO0yUKU35t3pk8JKPfikk3KPCkixT2EIw71csUYkMxN13D5BLvxq2L/w
 ZBHx4HphKMaifyVbJPeCVycgICOFyzkfzBj5NfGIKsIADQ4wnDWrmM0aDmMVbkQU2C/9E5tEXMW
 AoWt0EY6/vxzfiVa5z2+TX1L/TC/ZEL2fv0WmvYxZ
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id
 g15-20020a05600c310f00b003eaedd71f24mr19249581wmo.39.1678361171526; 
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8P+TR8QVeZTPkvZUtmOPITmpd/ysZXzZ/aUrzjfnJhfAoMKaclBZMuBRrY3afv4leM7oxMzQ==
X-Received: by 2002:a05:600c:310f:b0:3ea:edd7:1f24 with SMTP id
 g15-20020a05600c310f00b003eaedd71f24mr19249536wmo.39.1678361171233; 
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b003eae73f0fc1sm2297965wmb.18.2023.03.09.03.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:11 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-15-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-15-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:10 +0100
Message-ID: <87sfee6u99.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 14/22] drm/sti: Use GEM DMA fbdev emulation
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
