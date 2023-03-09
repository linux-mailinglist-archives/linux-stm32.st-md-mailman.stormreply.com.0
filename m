Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD716B22B1
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:22:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFFE7C6A60C;
	Thu,  9 Mar 2023 11:22:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53E72C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
 cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
 lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-yaanvmJnOBeew8UOJom62A-1; Thu, 09 Mar 2023 06:22:08 -0500
X-MC-Unique: yaanvmJnOBeew8UOJom62A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso539892wmi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360927;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=jmBS2FGbkqJKn0O3Kw4/bn49aFWtpkizwWY62cBXXD/NMTpCuQ7Zs1XMSY4fyxV6la
 a2Z5cvmO6ZxIzPnOrvF3lWMg3YkrYKV6s2p/upb7hT0H+aRkXVNDoj1PdwE+IqXoyxFi
 d9handYKh3WljJxbjBPSTC5x0rSUYvhtXM1YtNuB3iL2FxYwNoR8Bj9fO06QQnhZcjDf
 +ulSAFF0Sq3R2dyHYf5+cdegfWAALCMRWX9D4gMMH70GqY9QzJiaiNYuuAub7LCnRJ5G
 myg1baCobNm2vWkee6zkoby8TquZ7wRA4gOhfAn6siz0Le/Jxo709iO/kthRsQPohZ+N
 Fj6g==
X-Gm-Message-State: AO0yUKWdyRr3rg3EULWl+HUX2/zIfOluRqt6ZKBtOWB7B+sOnEnz4vUG
 PfKXxBQQlFm97PdFmIGXYB+FAvNiL5R9rUrORf+/EJfEzeTco/DWVnx4rG8V5tqvmTr6DC9lbWJ
 gojD+RyKMDYy8B1bwBTxsTF48bi3ZNbWtap1T19XO
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id
 j9-20020a05600c190900b003eb248fa140mr20913775wmq.6.1678360927406; 
 Thu, 09 Mar 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sm+8KaUtaTToC6ewzxor62agxQaZWhIHs+6czjysLnXbg5f9mG7vIV2yLxia1B+mTwIz1AA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id
 j9-20020a05600c190900b003eb248fa140mr20913724wmq.6.1678360927112; 
 Thu, 09 Mar 2023 03:22:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c354300b003ebff290a52sm2051380wmq.28.2023.03.09.03.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:22:06 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:06 +0100
Message-ID: <87bkl2cgpt.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
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
