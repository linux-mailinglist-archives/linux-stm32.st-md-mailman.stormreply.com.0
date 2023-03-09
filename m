Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2236B22A0
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:21:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 791ACC6A60C;
	Thu,  9 Mar 2023 11:21:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F176C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=J8AMSPbfaaWKAdueqBDchdfwCvvjPH6b5rfoKS9mYt5FZwMsDRY7NN8KQQ1LtTPgg8AZXC
 GQRxVvE9O7zrNk7DbpwaTEhE3pdK47y3HIuBADhdV0EUqatg4WJzh30ZTUeKgLBv2Mn3sP
 Ohmepe7GD96m683HdvXgEjcd097g5tI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-kl4N3J5QO3GSGVc95q2Sng-1; Thu, 09 Mar 2023 06:21:01 -0500
X-MC-Unique: kl4N3J5QO3GSGVc95q2Sng-1
Received: by mail-wm1-f72.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so659097wmr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360860;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=i0BikVyZ7TpgK/hqQaKJWB/Q4OnVFiFAEHbt/Nt+ao1HrFPCk+Mpk9sZqgt49T10Q0
 R48sRjszHmFKgEwujjfsbwniLG0zdqziRMZsCGtNrKky5QQ7yPN4SUonp2Xgr51rHZNg
 petRL0HeLjyTGavbCFAAW8a4zypdgNVJlMp1J93NUE7M4Upp8/34qfTGLi3J0vh5Uz+j
 xNiEs6x5gyPcWBJln+1XL01dwUc6kFgc8AH8yy+rK8x2SV8dLsFRcSFagMA4goQ5eliF
 wbkxFvuUSmfgz/sJnQhT7GNZfDtcoxSgJOxNmQV5E7KvzTfQhrCGNxpx+sGjhIfl6QAn
 3etw==
X-Gm-Message-State: AO0yUKVwFHu+gwgqfT8ZVOcX6KFn0ps3Ill8u05wfbdgx16Hdm5Q/hih
 OTAKO1SGUb/d8mqncW5uynN7EmbiaA3yzrJFFGfDMnvChpVE/uQ1nHpyb33vpoye0jHS7uD2IFd
 Mk88cFdbZNjGWJ6BDmIeGHaQ2SZQbye/QLfoUQB/5
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id
 h6-20020a05600c350600b003eaf6c45f26mr18535002wmq.17.1678360860426; 
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8sLO5bKSPBoOiZMye1ieYHzGLgjQdrxGWGVp5ppUvSkKaG+jgho1T4oKqlnOH+WRjzqLQwTQ==
X-Received: by 2002:a05:600c:3506:b0:3ea:f6c4:5f26 with SMTP id
 h6-20020a05600c350600b003eaf6c45f26mr18534954wmq.17.1678360860177; 
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b003eae73ee4a1sm2681759wms.17.2023.03.09.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:00 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-8-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-8-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:59 +0100
Message-ID: <87jzzqcgro.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 07/22] drm/imx/dcss: Use GEM DMA fbdev
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
