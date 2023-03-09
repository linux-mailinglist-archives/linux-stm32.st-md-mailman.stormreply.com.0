Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AF6B22CC
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:25:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33738C6A60C;
	Thu,  9 Mar 2023 11:25:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58EE4C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
 1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
 o9UYHuz23jYsj4eC4+yq//yWych3usE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183--LeIwq5PMHmmW1dEv0vGFg-1; Thu, 09 Mar 2023 06:25:52 -0500
X-MC-Unique: -LeIwq5PMHmmW1dEv0vGFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o27-20020a05600c511b00b003ebf87958f8so656442wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361151;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=It4bNVzX7EOWphRCNX98gL0447C7kzSsg/x4YZEjiAK0j1NuGDsIN6Lux2W3bgeV9U
 ts7oJ/ZDZWyK/6Pu//xydCClZ2Ymz8U5hlM4qwkh9oKx6MxNFGh71R9NMm4RHdY2GDD3
 RBIjvH94qQP1yOky1xqPrulRE2q2RWqzSZceO1TF7U/rkpmTEVfpcTIn5Uiq9KSD+AQ3
 DUgYjxF8YSX4P7/NKm/jD5ACN3aMM1BhoUwXM/gCKadv2cXfPVlBxwOgAazqsqx13gsm
 dT+a2U+PN2hW8CSLoV4NdKyU7dgH+J+kheFDYGUN6wwYhjaORwgwlZiqjIFTMwqhcsVa
 rwWw==
X-Gm-Message-State: AO0yUKXu6d4WzzdBIP+6MNzq1T7ao7o9kLzYNS3ejSm56YZ/sgcZmGPX
 VQQWUteRpoW1VjqqK8TSF8eC8wpj9y44/ppom1UXaWmTiTbCH/F8mVE3bwMgh1t4drfCT6oSVvH
 tYkGWZ+0vu4iey6w2HJouwVmFmozNmRme9LD6mq/V
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id
 t20-20020a0560001a5400b002ca6cb1c9c5mr14672877wry.30.1678361151279; 
 Thu, 09 Mar 2023 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+fKWERQDzcgswyQf9IdMUANe41W2TE3VA84WcXGdem8/aR/1UT8t++iE4upU8MSOqw2VB+mg==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id
 t20-20020a0560001a5400b002ca6cb1c9c5mr14672854wry.30.1678361151005; 
 Thu, 09 Mar 2023 03:25:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d40c3000000b002ce37d2464csm13808052wrq.83.2023.03.09.03.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:25:50 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-14-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-14-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:25:50 +0100
Message-ID: <87v8ja6u9t.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/22] drm/mxsfb: Use GEM DMA fbdev
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
