Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E66B229D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:20:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EF8FC6A60C;
	Thu,  9 Mar 2023 11:20:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37E6C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=ixnRlXWRpnb51wOydiNxN8RPFeZSrkKnjqNIlnKCm2O+Fe2cyCIxr69RaQjQq3zFHfySAP
 XWeszpQvKbYongU46jxlGqxHLUjDnIA9frXEabH/c8BLYH7zPio23gSfLhUAJSlNLcDWpc
 QdQBZlv3+lH+SyA5x9ymBqfXrY8XGs8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-FdiSusqhMCyqMYVJKF_zFQ-1; Thu, 09 Mar 2023 06:20:41 -0500
X-MC-Unique: FdiSusqhMCyqMYVJKF_zFQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso538495wmi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360840;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=vElrjn5MZFFqpl3aafy8Rf+8nLVI9wpXPpsmHnDTRKjkIA5winOGZZEnJzWLd9VKe7
 7Z3nNW3hBcCDJuBMxuYwWMsrNkiPwIkmaktIPBA7R+CnDDhunyuCwQavovW0t2E2iFD6
 ZUS6HXCm1A/ed4R2y8Kp/T65RG1uWdIf7wIorgcKZD4fFO4tzlG54kORs6oLWk5lFL+Q
 +W2JIHjSN1psGSnWaMG+R94cu2GIbQhyFuJyXePyONdsOGCaGBwDqQCbAhu0/JdK6HPZ
 cCAQFvEQGDf3uVzP3d6iomBK8/HN/aRU4T2MZxIojU2wslpfWe4TIUBOyYXY+LP0cGlu
 yvpQ==
X-Gm-Message-State: AO0yUKWtgPyZ0lZ+H5+ztgEn20SgJSg9Rbd0sbL9Ml5VjsETZP4FS8+1
 2WEHCNsFkubEJlx3oD+273GuQlmu2DywDLHXC1E64sojZ0C76M2pOBpTPoPZjE1Rdgn3Xd8z6Xe
 XQsh0XU5gFw6CTCavm9RuTuxsH7eHOaVy/LUBJIVv
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id
 v9-20020a05600c444900b003dfe659f9d9mr17924789wmn.34.1678360840091; 
 Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set90uCM0Kw514Efx0RC1JOWrOFPoY3H9ZtCG8DZJ7CZ4XdZwaIBFGLtcMSgQBx3eBGbTb1Y4bA==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id
 v9-20020a05600c444900b003dfe659f9d9mr17924778wmn.34.1678360839923; 
 Thu, 09 Mar 2023 03:20:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az5-20020a05600c600500b003eaf666cbe0sm2386747wmb.27.2023.03.09.03.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:39 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-7-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-7-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:39 +0100
Message-ID: <87mt4mcgs8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/22] drm/fsl-dcu: Use GEM DMA fbdev
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
