Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C872F6B22A7
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:21:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E8EEC6A60C;
	Thu,  9 Mar 2023 11:21:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26864C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=CU40T/dhvBztNwrsVnlRl1wprx1SK03OK+kO20wyYBCfHjLSrOzvCMrcJr8eMnaabGSwIh
 rqf/haMMXQc/ahc1CEeEffYvx33ny7wNJXLmUDu8XDDt1OlIiAdOI799V1fy5g+wAOqDNL
 XtBiep6tjUK7UqV/VT5k/GhgUf8UOGU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-KmgCvONZPt-fHADAI_9EVg-1; Thu, 09 Mar 2023 06:21:24 -0500
X-MC-Unique: KmgCvONZPt-fHADAI_9EVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba28-20020a0560001c1c00b002cc6d1f0c06so348589wrb.17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360883;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=0KQ02sg8kDDuwDm+WJMSjTckZN4s9k8bi6CKmZl+3EZZsmV8RLZDKlPBtmETE+Ysl4
 sun/+awM3a8Zk9PLqH3xUDfWr8IYROAIetV7aQCZ7aWMPYvU18lODJQVp++iW+LiMF/1
 K7TKxeUZT/Y5RjnDX8iNH3lsQ+MSTHy83p0vp6tYI121x/C6z6iNOJpqN8Lx0RX8Wm+H
 RAbXeICOFo+cVoUFg+smm6R5jhO/5W/LLtnK+SOvUyIZwPASb20am4i9pVYZGZVH7Qd+
 D755KwFYZig6EOafPEk4zq38cJLaC2+68bWbNKlt/HfHmUHjZGasQpHCWHlgMZsxx3+a
 RLMQ==
X-Gm-Message-State: AO0yUKVBiCaCvXW34Ua56RCrvCqzC55a/dWPqAjumx7GSOgYXsLQLJt7
 XF9qwGn6U09gXfTZFBa9+TEzsuZpn7gUk/2VZGgnVBEDj1z75LAkkCx1SF3j1t9UXDo26rN3145
 OZ5dUQDWMSdYRMbbKJjY35nChq4QQYCMKUkAf79q1
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id
 u15-20020a05600c19cf00b003e7772d22demr18809450wmq.30.1678360883235; 
 Thu, 09 Mar 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9QvIelUa3ZPRMnnDZU4wSkpr+jKhTz8vzz9MlATkeg82OLoMst/ctfKDlY/kc1tAF7ljMTyg==
X-Received: by 2002:a05:600c:19cf:b0:3e7:772d:22de with SMTP id
 u15-20020a05600c19cf00b003e7772d22demr18809404wmq.30.1678360882944; 
 Thu, 09 Mar 2023 03:21:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b003eb5a0873e0sm2237300wml.39.2023.03.09.03.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:21:22 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:22 +0100
Message-ID: <87h6uucgr1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
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
