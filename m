Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5006B22FC
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:28:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F193DC6A60C;
	Thu,  9 Mar 2023 11:28:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 856F5C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Y0w9WY0anRnaOp5s5PVvSnqnK0gUmSfQDPj5w7KRjHBA9isrVwZCevt0G13wpgMz5zKWs5
 u+hrjU8ksyk/DJxBACl24ZHXKRoZltK9pOdOjn3sn/zpPvvhNsdYIwAXpYnd41d/Vy6yBa
 xTqWMM3TgbGklMK0X2X4eODs1ytlQJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-rn64yLq4O4yHUgmOZ1sIyg-1; Thu, 09 Mar 2023 06:28:43 -0500
X-MC-Unique: rn64yLq4O4yHUgmOZ1sIyg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so545655wms.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361322;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=Q2/HujOtkra2LZQDWb3ztJoEg1mjpuLs77PhGoyrm4lbi6JD6KKM/EYg2aqU5OE1y/
 YII+3v0Y393sCvaEvvaIO/iLbGsNfs1eIgB9DAcZEJo8vySFBU+IijPms/usTWuC0h9r
 uUsnzF6ZyHsNpz9JXNKbuxTXN7om/15RNSvd+8r4OSaBABD3jYVcu4Tm8vi9Tpt8uz2/
 o66P/mdz1AAGmQ6g5YCFHxNcehThIxQ52qJM2t7yhLi5hHMtUZwUQPgnHxfDsEEXkqeZ
 WKnBx7AzXicJAEV+3uELpAal9GZ2HAq0L7JzBDzVoh7fNSQ7ekoT7XCmF2HEtgyuc12P
 XvgQ==
X-Gm-Message-State: AO0yUKU7YYWzhUQ+c00UVTmrgF+ELeEU6X+ECOZ/dtpkS6vR62k/UnkN
 Y7GtTbufbYQRDUulwdsYaK7G6u0F6nHmLnlbBLrQ0A+qPVitPIYAUpS3+mAw05opCu2+gNW6uC+
 SJKGreV2nPNJ+2MCvcx3RQdjHNSOfIyNjPzDFoLHq
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id
 c17-20020adffb51000000b002ce721942b8mr7244747wrs.32.1678361322365; 
 Thu, 09 Mar 2023 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mn2JIY54bbfAArMm1jwHLD5d38GNHioh3xaVKkpiDjrBseSSAAHghi7SxByPhaXqMV5nmpg==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id
 c17-20020adffb51000000b002ce721942b8mr7244719wrs.32.1678361322054; 
 Thu, 09 Mar 2023 03:28:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc4a47605fsm2372395wml.8.2023.03.09.03.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:28:41 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-22-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-22-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:41 +0100
Message-ID: <878rg66u52.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 21/22] drm/vc4: Use GEM DMA fbdev emulation
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
