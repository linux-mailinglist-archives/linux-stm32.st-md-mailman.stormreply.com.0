Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB286B2293
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:20:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14CBDC6A60C;
	Thu,  9 Mar 2023 11:20:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF7F4C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=SFZp/Og4GvnTEu2G65f1o9EoAFNv75FpzmUCue1CfPD1ONDU2GoXDqwFjHXEH49NuoWmO7
 167/uyGqnDuBrx9ar7A9B4zKPu12ZXEXDCUXXfcZn4hobPJwqZv8Bs9pQCyyZteKDwUMlg
 uu2Hi6mwYIKMJxFrs4GebxZrRcC1wHs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-MMXnhaT0NV2s-xeMzoEAtA-1; Thu, 09 Mar 2023 06:20:04 -0500
X-MC-Unique: MMXnhaT0NV2s-xeMzoEAtA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so642473wms.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360803;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=p873RvG5ADqDccxiKiGpOAFFUZmHgMxC0ouo+9DWVVh/Bg/0Spj5AZkXBzF4lFknFT
 7QWT0QtigZAsUNKbB0iKZ3BKeJXMS0GL3DXSLeQh3pTdLVOwCSWs99AEMY+GXt6Yiywg
 Ue2pCnlbWWcwoP3IRqqBsk0ShWK9areu+wq9kGN1wDvcbPT2itn47ggIcCTbbIhz8bZz
 bPdrr1NMl5QqeVx1Lhklfu22KjCbE0j7X8Cgw76q1nGnfX6a59s+gpQ1P/iJPX8LnJZj
 EqMMBXXoL368r2gvJEiRtX4z+OkKp+/0OHT8StiY+CmJZLqQ4GcQIm3bo6P5wB3ugA8X
 UHxg==
X-Gm-Message-State: AO0yUKXHu44wBgEd+UAEpdp1A1ifxpRfHnLuTKr7isPhpGkZFlK44y6s
 SA6OQTT1NTuFqXB9Z9GcI6RvZu6nt8NCpyBZqj04D+3J4kXmdk7B9XuM2HxlisAkMttQhr/+KVJ
 nNwKsKSMJLSa3Feg0ICtgVCf+bEj0Ox2zQsJQlbQd
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id
 u8-20020a05600c19c800b003e10bfcd16emr19563124wmq.39.1678360803688; 
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/qnVD0YYOZOg0gATaJ95G2PynE58HCE1Dk3DOhH1ATAU++l0OCrumBkXbrdoQMrJSTJfkHMQ==
X-Received: by 2002:a05:600c:19c8:b0:3e1:bfc:d16e with SMTP id
 u8-20020a05600c19c800b003e10bfcd16emr19563083wmq.39.1678360803370; 
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b002c54f4d0f71sm18023382wry.38.2023.03.09.03.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:03 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-5-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-5-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:01 +0100
Message-ID: <87sfeecgta.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/22] drm/aspeed: Use GEM DMA fbdev
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
