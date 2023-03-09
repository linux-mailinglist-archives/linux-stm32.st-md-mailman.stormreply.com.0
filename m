Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1066B2299
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:20:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F6FEC6A60C;
	Thu,  9 Mar 2023 11:20:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67DEAC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=d1j71K7wfOiFcBlHogpxmlMQtkDBn+laXr/H/G+Ik19Du//9HJVuQLYxE4T0XyLQsdunRK
 p4XNZea43wFcmre2CnFmBK+PD9tJ4RAhAPv1vrYHRxd5Gtut38IuNETv6I3qmXUKwpgB+s
 zKB1OrHYCWHnW7my++RYp3Y6W6OTaw0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-ZBjcr2WxPGiCiJ76EwafBg-1; Thu, 09 Mar 2023 06:20:26 -0500
X-MC-Unique: ZBjcr2WxPGiCiJ76EwafBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so658321wmr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360825;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=P06gCSxraJrLqPUr5x06U+/UySoDxHjdoTnVvNIlxv5fV4QQbUtd3xg11nh93knwoP
 UxhHiUdox4EdEcyk724ElCoH0+OMnwlnuhTjtv5pRdfHu4aFcoD1ofvz4Z1q+YgfnMZw
 pMruEkVTfu8pnOkT0aZgLqMVeWFQWJayN5D+lhYyac6yqLp8uwT3ZtZ0wi4/ybuIQh+O
 9tO2W3phaztIYcqh0OFxxdS1S94X2LAHdhQZerdbETnqMu+Czj1yseu/Ssy+FWynk/e7
 mboTVV5T0KykZzrnzIKOFn574MZzimyvvRdRmGgv3RdB3+UV2SZd34IGf1SflSENB30u
 8LGw==
X-Gm-Message-State: AO0yUKUyhJ8Flv3aEDTga7NierSDTyOey7B6OpkOd6gpYwhEGKueFFv2
 rhuAuVn4DHTV7Gh4fm4RZCw1vkPC8EUoDYjTAgJN8iNBYxLv6FxpAXJsN9wZ5MiAao2kRmh1Zfb
 kPCE4QrsqOq6dla4vuZ3sXY/8p7yjm0B4awq3v6o+
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id
 c17-20020adfe711000000b002c740f6d7femr14224801wrm.64.1678360825568; 
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9k96PNTBUz0TEByIG7gapEmsch0cL8AOD17b63GFBK4F6QUKC1zqFtEdtv5cA4DKM8r6l/1w==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id
 c17-20020adfe711000000b002c740f6d7femr14224778wrm.64.1678360825289; 
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d608c000000b002c552c6c8c2sm17742706wrt.87.2023.03.09.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:20:25 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:24 +0100
Message-ID: <87pm9icgsn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev
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
