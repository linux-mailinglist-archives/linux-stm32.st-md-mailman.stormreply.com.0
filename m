Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BE6B22C3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:24:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10123C6A60C;
	Thu,  9 Mar 2023 11:24:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18D23C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=e5SU6G7bLT6rqVpuM0ywmlGUADmVQh/vuXKIHWHrbbOYs12QHjVDS7mynNo7JeSPVsTfYX
 DfRK2ZnpJ3xQyc2iTWHivjkFQhJQcbVLgTB13ShjLa8sLHK4h5z/o+Dw5Ol5wUTaObFhRd
 5ZcesgTMVhYIWCtl0NoDy+L/drOcFSY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-E97AnzYzN2Wz0J9-5MJegQ-1; Thu, 09 Mar 2023 06:24:26 -0500
X-MC-Unique: E97AnzYzN2Wz0J9-5MJegQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o27-20020a05600c511b00b003ebf87958f8so654670wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361065;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=KB74Ii/Ygrtv4TzyEJtVWUm0oueZnZkSBdmBqapKcfZjTsNDzwqObmEn4O1a/TxCFh
 sh4I95s5MDjOsQ7bl1w2J8Z6lJmUiXhkvAcImDSWYosXnmLPf99guLfbF+dcjVpHUeDx
 jxlnh6s2+s4zTDBBuoYz/sp4n3IXCq9YlluQM8qT1ngUMrKV0yFt3FkQ+9gk2f/LmkL8
 T5N1ADgcAx/IOFx04eitXiwHhhAUqsytqpDt3d91aj73yK84hkPXJts/6rjRQuNR2Rtx
 +2TTeSmOLghH0W+O9VG2/ueggpjtGz4BBQVDoc89PHnABU610d+e/f9wsq7QTSD22BtW
 AaRw==
X-Gm-Message-State: AO0yUKUCPqnqJ4VN0BYblp7kfM3qA0q53DD3h7QGN7dweR+wg+UwGix/
 xFKwjgQDmRNvo+Akjm4yK9gCvdt067q4zHb9YgoRnb/CndLeKYMI81whlDRHEMMj+pvV02aiANs
 f0yI36uo/n5qPX8KK2rsMlYIMjAGG8eQKVDMC/Akh
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id
 s19-20020a05600c45d300b003e7cee40f8amr19365862wmo.29.1678361065659; 
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9lVCuiT3oH2S4c0dL4PFGWn3m73Ldrm4xd1nwgxerYQstdGiySSUAK65ix4kHFEogJnnnnZQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id
 s19-20020a05600c45d300b003e7cee40f8amr19365828wmo.29.1678361065371; 
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003dfe5190376sm2436712wmq.35.2023.03.09.03.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:24:25 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-13-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-13-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:24:24 +0100
Message-ID: <87356ecglz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/22] drm/mxsfb/lcdif: Use GEM DMA fbdev
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
