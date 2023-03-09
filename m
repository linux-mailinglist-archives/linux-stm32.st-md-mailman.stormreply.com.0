Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3B36B22AB
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:21:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F370C6A60C;
	Thu,  9 Mar 2023 11:21:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54F11C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=gbFCG8VukA/CuGrEwyaHyxIl4FWT1wnqKIjH7MuHIvRjkSuC5RAaL6Jy7RJjQ/XLI8tNnC
 ZzF4iAtwLiwrV5X2dkJB+iEHgdu/8P6hw43sHDxrWuNHkVK23X+gdUCnxcqTuHIhdqcnTb
 KYHXpiZYbmTP7iU7hy+Qhr5akNW8wFs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-iauj1o9WO9OUN4J3HSX9ZA-1; Thu, 09 Mar 2023 06:21:46 -0500
X-MC-Unique: iauj1o9WO9OUN4J3HSX9ZA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r14-20020a0560001b8e00b002cdb76f7e80so347496wru.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360905;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=yqQYFRHjkKJmiEuOc9xgCDmjEdPn7Ukj3Cbcrt8Mn/ZyPpvqpcIHcZ1UnukGuLUrmy
 G7gIcv58GFbncFRpbiDkJ2nRt1T6fIw0zh5G9JKMt6K2DJyKJzO7Yjen7lUJ1Enyiiw+
 kBA24BBirHQbp2ZmYlYoLCNtDpCLFyqdeC1SnjGk/KiM5duIa/YbiBRDYVNPq7mK0nTF
 g5xEWMR2hO+QaIi40XmGkg3+hyITUqB0vxM8Aw/RKeCfVLEFAVJpr5w8t/0oJCzGoPHK
 r0FtQNn4DB2h4IUij7xh9HxMVa1Rzhhcz9HHajxzGyD2jrFUxiloxjJ56T+gfJ4sZa/H
 PwPw==
X-Gm-Message-State: AO0yUKUH0gKGgmjbR6y27IoJUD/XLe4tOTzm+SasWIj0GhgMcZCNl2V3
 ymKVmeAnY1YuD34yTZKJOUnkM67TzG/6n/QhbT4hwXxMhpgKjGJDC3Dgrbm7J+yyse5sjljKw7P
 BruEBCvoZIoMCuDIA6yIaxjzVWnecbgwFmsBdlfHt
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id
 r7-20020adfda47000000b002c9f4885f54mr12321071wrl.57.1678360905537; 
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4C0dgvSGGMpJs8/32CGlr56CYDRn+YAtD8UDvYRDVE6ywdBnZAiSainv+9e2TUJLz767pg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id
 r7-20020adfda47000000b002c9f4885f54mr12321033wrl.57.1678360905258; 
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c54e26bca5sm17503473wru.49.2023.03.09.03.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:45 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:44 +0100
Message-ID: <87edpycgqf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
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
