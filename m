Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EA6B22F2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:28:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C24CBC6A60C;
	Thu,  9 Mar 2023 11:28:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C78CBC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=U3QmQiwOG2L5ks0Rhj0fWFvBjisjYigNj9RK4QwE10iRclRIRWP1dxaMgh7QXaKqBx6tEl
 YqES2lwLKK+h7t1RYAnnHs3qUJ2IMBj5TMpxlRaHaHXQG2BmjYJNRohplCQ73yrwEtlNOO
 iWI8jeSflcJ8hgywBGCrdayfPplN4Po=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-FbkI6KxCNc2GbE66oPWQHQ-1; Thu, 09 Mar 2023 06:28:08 -0500
X-MC-Unique: FbkI6KxCNc2GbE66oPWQHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so2274723wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361287;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Dy+E7/faTvBtn0OIwenXb3mBMmihABwW6ojyf8pEjukQ8KTTb24yJqIYLNlBr9rTJi
 yh0XYbSxCyBSM7JjaQ3YNgNV4Z8vQORO9pR0dixSEftmnQPUIbJH6ND+tvorrguXHx43
 zTFC8Uj4IJRa8mct5taw3celibQYPBgQATSrwpY93fxGW+XTHNFSU9ulvo6H05SgHEOj
 8EkGOB0X1oJm9mXtSbfHB+WtEFcSqH42bLD2QJTSW2nC1ncURYht0gzQBjPurke5I+G6
 OUcUynGYuDEwBB9iUl7qoNZ3k0eqk0lCwgFB2H4Q0JM8A7lbXkec4EF6hMh50DOm7SVS
 nd+g==
X-Gm-Message-State: AO0yUKVAAf90kog3OVu91JKU7C45nBjm4ukPbZrbo/Uj35eIACeCqmA7
 hPqScJsP7NH+DmHVIl6EjTNy0qJYfknu7EOSSzZQuH9sSF3U2aEriA2ykEz7Wyygnz959Hp0UE8
 iELh2vOJuqza1APbq4ABPDd/Wgm8bDjD2mpH/wMb8
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id
 s6-20020a05600c45c600b003eb2e1ebeaemr18094381wmo.25.1678361286866; 
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/WVkqnZjpkmSmEiWhaQK18CsrOsasLB6GMCz1AC0uyDvVk4dRPtB1UV7OYFbDbrMsIDiabKA==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id
 s6-20020a05600c45c600b003eb2e1ebeaemr18094343wmo.25.1678361286535; 
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f10-20020a5d4dca000000b002c70bfe505esm17395825wru.82.2023.03.09.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:06 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-20-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-20-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:05 +0100
Message-ID: <87edpy6u62.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 19/22] drm/arcpgu: Use GEM DMA fbdev
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
