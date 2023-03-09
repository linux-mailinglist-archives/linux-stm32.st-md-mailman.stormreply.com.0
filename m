Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 252916B22F8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:28:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1D6C6A60C;
	Thu,  9 Mar 2023 11:28:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A006AC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=byuRJFsgwIbmwDoClgXjpGIRY7fzH9iO0cMStxilik1zPmdx7J0FLlIb5ch1zowP9Qs8Md
 1hQ+angNnLqqW5CPIQgTMWFQusJw3av0PZp3pMUI6QgOcylvGMWAprKL7ybDnp6aBLIdhS
 n7iYiQPDhJHLsFHs9yn2X4AobuDRLBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-dqqPBVa-PDuvz_fNa95Glg-1; Thu, 09 Mar 2023 06:28:28 -0500
X-MC-Unique: dqqPBVa-PDuvz_fNa95Glg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so2247564wms.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361308;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=bHp4C5OIu4VpGDk7sh4Z6/Erpc728ja25hRDa3Jch6EsC7/IA+NhZNmxYE79KRg4qW
 6SGJ0Lfr3PvzS8uBUyNxy0O1f5mScNRyUTyfFH5VOIjkuCqpbIpIDHJCofcwXMJuf4/6
 AHd85Y6hKQO6RDjJ5MzMJnhrVzj7Kwr7puISSe5zjW1xyraXptRrdTFGKFZiJH4mCrCB
 deCfyv0ddb6N8+Ud7fvE+HnqWT3CwIDWdoy4oCMdGHUZT0NVqNqfaJrjoPkots5KsLMG
 Wn5al0H3T0RBg7cXiN7uxGLF4Cmwis3tQW6sI+216Sdnji4BIR0QV5FGpM7/VxLIlV9Z
 1Vvg==
X-Gm-Message-State: AO0yUKXFDU8LgyTD0Aq5mqdy4O3ldWewW/s8LZ9fMs3oDNQtgnJoqgIa
 Mc1olZNs0uApAi9iqLM9yu59gAQgQuGrSm3jRJVhdGSh0TRkq5ET0FSplbEw0IdHpKCU+mA80i7
 x+5BOTm2eWrq6ZYoWXpoyvAtsi56P7iU6p1Cmu7o9
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id
 z11-20020adfe54b000000b002ce7b1462famr5641250wrm.18.1678361307865; 
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9maKowzBLXhrmVUURVySuRkGf+S+tkdt6mfteqqV00Jt+aM76M3w51SKUbdQy9Rrz6LZ2GlQ==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id
 z11-20020adfe54b000000b002ce7b1462famr5641233wrm.18.1678361307645; 
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003eb68bb61c8sm2498550wmo.3.2023.03.09.03.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:27 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:26 +0100
Message-ID: <87bkl26u5h.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 20/22] drm/tve200: Use GEM DMA fbdev
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
