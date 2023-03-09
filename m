Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C0C6B227D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:17:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6F8BC6A60C;
	Thu,  9 Mar 2023 11:17:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E63D5C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=KFI5NolLW00M30XYJxkQ4MIHgLq0upzBFWGrVN73sW1eARaypBeC/FuDewBCvaVTJctFoq
 iIEqDyM+fu03ea/H2UFE5LU+JNir/dQlYcXI9pEKpD+V8yEto9nPEZstTrMkLCPOFg16Bf
 eJHZuZApcuEiBi9juOPLHameLIR0iU8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-Ykk_MYLMMqSgiYpbGv8Nuw-1; Thu, 09 Mar 2023 06:17:49 -0500
X-MC-Unique: Ykk_MYLMMqSgiYpbGv8Nuw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so346386wrx.21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360668;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=kKKE//8EWXfba4g7LLvv5cE5CmnqsZ30jLCGhdS0IqYT4YezZfw7rFKC32VFxZre5E
 EmViiwAk4JF/jbdvDqL5jsbhwQ7RcymJRpYFJPTPe42WjYU53JviXJQ+3F/MpNpVlu+V
 jmQeZaKr4rS3lVNeRdf2YJLnNlxWyDdTCU8i4cYdVTesJMv6itliEhWGCorga9ClKvOc
 6h6KHpMhxAm+PyBKW0UzaDrwvgy+3OwrUcRZKv1N+cklqbPR+OJeIvFnzm3wHcUEoNqH
 yiAZSjQFXuEF78J+sqmCkr8PUXL+F005hHZZwOTLZi1Xpyzx07bnl49gFyfPzCGLisrG
 CyzA==
X-Gm-Message-State: AO0yUKWtOnNQyEU1dflijl3IGE05sAs5rd71pUMUEh2TE1hE10Y/ygiY
 SK9Yz9EYi7p07NEENa5flvQoD//8HOD/QYNUUDsrx0db/+SrmxVXJOgFSrWLqM0G7iDN73gCVeb
 pxrUnJGM3GJnDFkVbLQCqSx0BKB8bviBgKbHkFTuF
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id
 o13-20020a5d670d000000b002c713197b1dmr13606681wru.39.1678360668798; 
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8t7W3VVjilkedn2prHPhya2P0ttMZiu2dHkADuEES7J7gfekac/bMcyXv4f/qMKVji9jryrA==
X-Received: by 2002:a5d:670d:0:b0:2c7:1319:7b1d with SMTP id
 o13-20020a5d670d000000b002c713197b1dmr13606665wru.39.1678360668526; 
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d63cc000000b002c5801aa9b0sm17711159wrw.40.2023.03.09.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:17:48 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-3-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-3-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:17:47 +0100
Message-ID: <87y1o6cgx0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/22] arm/hdlcd: Use GEM DMA fbdev
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
