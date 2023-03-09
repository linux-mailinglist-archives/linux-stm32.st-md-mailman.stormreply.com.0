Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 955216B22D7
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:26:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E3A2C6A60C;
	Thu,  9 Mar 2023 11:26:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B33F7C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=dyNhlerx4KGeQzPVLdJY9VxEpDzCTyrV4VJYcaj79/bXeb17BW28rHrFQeZrrULp0wu0Nk
 Yqg+k0I23aVXEDWC6CXPOgHW4gtwm+aen/P3xovNsKwOt/Xrt2bl3CEELAYS29f9k66XjV
 UsP8oh8wPGAH/qrupd7RhTP5rXhqPbU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-3sZPvgzIMDWDo2D7BmxJTg-1; Thu, 09 Mar 2023 06:26:38 -0500
X-MC-Unique: 3sZPvgzIMDWDo2D7BmxJTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020a05600000c700b002cd9188abe5so352471wrx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361197;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=mZzIm6QI5Ca3HBJ2aKzjbS7l+QrFvYs6cgahvSYbsbEc0U6gsuZ9a7Dr+GBKmM2/UE
 STCrBMtOlnOhHXApts5zCJoZe3XOQaqNh5UKu4laXTRA1zLhmxsa0tiH9Ut3jWR8pa6I
 B/E7B+epTbh1XuaI8Whx5SlcxYwZFyJy4+0cFQMzI6d5LzfJRDCVbqXTD33y06uYtg/o
 V82i5tupJ72Pc7Cw7QJGwdmNb4padLIc20f2lCIcHHcqZlmRIIYfIHR0iJCJGlgviAfB
 bHH+7AdmjObAQ/XAE2q4KZiqNH1JHNVYLmExycvNr64rBc8CQb2o4TU2GSkYr4avgmaT
 2MvQ==
X-Gm-Message-State: AO0yUKWQvnJoV4Nm07ksNjLJthmiRsBXD26v9ywPA4Bd+A9vPjQpk1fq
 ptW2q8MOSgWusvNl/KTDByfjn0mq2tNnMy6XPuFTbA0Fo8ixtyHda5TEUto8scsc16CBJH6+COv
 SXyHg4eWuNdNc6xAjp2SCjWpiKiOZPVm455roZkoX
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr19369381wmq.20.1678361197621; 
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+RyBjxyYc/phvqksZd0yr2bTO+U8qhrE/l56ozt/Hpw5EwIkObMj058GJMfnxZhhD8JebzIw==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id
 u15-20020a05600c19cf00b003db05f153a5mr19369354wmq.20.1678361197403; 
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003e21f01c426sm2647711wms.9.2023.03.09.03.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:26:37 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-16-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-16-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:36 +0100
Message-ID: <87pm9i6u8j.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 15/22] drm/stm: Use GEM DMA fbdev emulation
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
