Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CB6B22BE
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:23:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE8FCC6A60C;
	Thu,  9 Mar 2023 11:23:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 299CBC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=RchviBk9BaJnOhNnVKFVpd9CCx1Z6McWsVQIkpIYmuFjfpkK5H00q/ga26aFn9WpZQYxid
 zU8U+U6Im0rFb2LUOL1fzaeuORo21Hr8v5JpWrb6i7E8VcLIRUHgmSIZveT3+XATXxSNRi
 KN/2RTAIrzWjat81XrcVJAWOk0UK6sQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-y6PO8pW8MVOmqgAEMB61Cw-1; Thu, 09 Mar 2023 06:23:47 -0500
X-MC-Unique: y6PO8pW8MVOmqgAEMB61Cw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso541412wmi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678361026;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
 b=4qSqVVWkn144J1mlOs1oLex2cbKPLUM2p6Cg6LAqnCryQVg7hNy8LkpYCyazwSYn9r
 S5KB0N91ZAiKyoX2hnmm3mCtwPjHvowCO01ad6LY3HluTIFU0bqvPhbvEUXXKJwejykc
 3hT8Re3hd78XpAJhtI5wfE99whXUJ00tWOFr0M76OrM9JarOHwfLcpPqv3sLf0dCRffA
 yE5ibrSKn0LAR0FFBAX7yyJMEF6+4hrkmnbXS3IvFbTbNiXueHpUtsCvCYmdEziWvYh6
 8LMJO2tNuXKXVUS/wAvqP3fq4AWDAy06gFU+AuDoGLHIziUYdDhN4/wkjascOWhTd8F4
 V52g==
X-Gm-Message-State: AO0yUKXZm4C8DyO/N2krL3CfZuvuNI/59z1398hv0jXgUo+qxZNF5dUV
 OelrIzuIUKCBUzEpuqOs1JWRCDfUVRM5gsLWXJ6EuU9s1oriFKVSrqVDB5ImPTdQ7Ublbi0LYlb
 91pSr0T7AKk8mtZp2oeHd9IbQKA57CPdzhhUGtNua
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id
 v9-20020a5d6789000000b002c8dc70ab13mr14211746wru.18.1678361026296; 
 Thu, 09 Mar 2023 03:23:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/SH5LP3JdoN3TXJ/TYCOAs9QXCd0H2gq8nSZeQO9vW4n5twpVp9hXlg9qp/3ZX39KGtC3WSg==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id
 v9-20020a5d6789000000b002c8dc70ab13mr14211721wru.18.1678361026031; 
 Thu, 09 Mar 2023 03:23:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c71dd1109fsm17321700wrw.47.2023.03.09.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:23:45 -0800 (PST)
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
In-Reply-To: <20230301153101.4282-11-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-11-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:23:45 +0100
Message-ID: <875ybacgn2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/22] drm/logicvc: Use GEM DMA fbdev
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
