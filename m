Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C006B2287
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:18:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE122C6A60C;
	Thu,  9 Mar 2023 11:18:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF40C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=cDnHDXe96B7YvwQCb8Oqv7aGXwN/Zg1cQbXsjlc2/Vk/REwGmHpqa0nA6euRIDct19qfDH
 MOi2y72G0mKQTFs/LHD0wV6TqkXe6H3Ec/fnftGzIsWuFN+8Jq0/s0u+hc2wI7/c0vl0aK
 Ui3WQ/ydpmjqjxU5o/R6pijQS2NMnXo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-LqEznFHPMXW7uvVVdosSpw-1; Thu, 09 Mar 2023 06:18:11 -0500
X-MC-Unique: LqEznFHPMXW7uvVVdosSpw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020a05600000c700b002cd9188abe5so347669wrx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360690;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=BYm64DTbQL2Wt3YZjjmGZ7DRDvHeGJUDWRmCny+I3AFx6HxP4qh9JyPQw1WXK8YHrW
 sMpwsruk6siDbWOcbxRm+Tf61DyypgrO/UmbPuz7jOg8E70lBmwXUohXxkqA3MvYMWBd
 S/EEWJdnPyk9qTdxotUG7QWEhROygp7uKH3yOgnKUI64yRNAADZqb2MHhtF0KUgWHiwI
 1QXp/ePx2dteGj0YGNWJssp42ALuO1aTpQkWs5M3z0Ph8gehovNHJy/e13cYAj6oe+r3
 Hd+IuaVe41Xf4QMWTxm0mUImmatZ9LTac4zRL6m+q7jCY5I3UMNnIHQgBBt6Ne8KRX6/
 2FXQ==
X-Gm-Message-State: AO0yUKU1hTSxWxXcJ+EGKFnJO8GtoBe1dceorLiy/Kc+IcUygxP0MyJF
 Gj5sxrgf34fDS4SNgxseNJCQ5jFDbDmqZmyM0ETlC7YKaY5Ykk1pEWBc8J4hSuKCYCF8nirUNaJ
 2GJGZeIMxdYAeSNNoIVTrfGPaSGwVztWaNOx4Ta2v
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id
 r11-20020a05600c458b00b003ead620570amr19256909wmo.38.1678360690488; 
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8nz/b/mv461MJo6uCh18V+HWYnANd/m5ucTuXO+pUDMtWMOWVVOePuNeDpPXiYp2Mt7j7R+w==
X-Received: by 2002:a05:600c:458b:b0:3ea:d620:570a with SMTP id
 r11-20020a05600c458b00b003ead620570amr19256887wmo.38.1678360690262; 
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c229000b003eb2e33f327sm4775721wmf.2.2023.03.09.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:18:10 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-4-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-4-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:18:09 +0100
Message-ID: <87v8jacgwe.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/22] arm/malidp: Use GEM DMA fbdev
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
