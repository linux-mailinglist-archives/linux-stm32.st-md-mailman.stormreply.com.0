Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026BB6B26B2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 15:22:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C470C6A610;
	Thu,  9 Mar 2023 14:22:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C6A0C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678360484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
 b=am8CFVop0IGik2W1AzHoZL7ZpCqiPSaMdL9ZbWB6aUvKnQr5ENr28wmyn1D5cY5GyiYvMe
 IfH738Os1iv1FewKURJLsA6xiniVfoBjQoxvO9EL2TpwP366pHn7WDIfc54YMSHmf5a+kt
 XB2kyQzyhRvVlmYRHrscaly2E77Dgio=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-o80EcVzEMSqwFqpLejyF-w-1; Thu, 09 Mar 2023 06:14:42 -0500
X-MC-Unique: o80EcVzEMSqwFqpLejyF-w-1
Received: by mail-wr1-f69.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso343078wru.15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678360481;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
 b=8McMKyxsoVfWCc6L7X5/9vlDDYQL0pSgr7yVL5SGXooO0axrOki9R6q5qVD1/bfME7
 HDwTldnl2lGtLpnJQsZNOAF0cDrUBlqQsus054ENOLCnYkDf67aW2xXIpMgm8YPr39Km
 3YliN4i4ekDFyWiuK7ojSedpqRdPpuxCbnI4v3I/r/fnyqLaL/PcXcbQN6AOt0haJ/hB
 w8/VMdMKxSaC34/8MGyhdfHdY/YA9moO4hqmdKnMprzqKxRWr/yHICutte0tD822qeEi
 KLqAq68YeVpmz81XvNaok0+iQPj7ms/TqWoI3RThbqS17G9u/tFiaSvkRgpP7h5JdYmO
 fkBw==
X-Gm-Message-State: AO0yUKWgwgBbBxxpsmegpXofyLOiAvsUwMKpi5x+j7splLbhJNufyJuA
 mojMFcw3HFY6Jl9lypX3gFwAUs3PB4IdAh7Z1MOowaIE9UT2GWfDDp5twnnOjDxWVzl20Y/18T7
 p/WpMOw7qDgcCWTkEgxTFqydYLF67JCTjCUSoIqku
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id
 r4-20020a5d52c4000000b002c7390e163cmr15389444wrv.47.1678360480890; 
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set915u9SxlnTzfz8tGdDVQASzd1E75MhTfa6AFkSAnvLaeMrUwPtQlpNR4g2GraOjyd7bJsXiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id
 r4-20020a5d52c4000000b002c7390e163cmr15389414wrv.47.1678360480580; 
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003eb5a531232sm2198602wmc.38.2023.03.09.03.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 03:14:40 -0800 (PST)
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
In-Reply-To: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
References: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 09 Mar 2023 12:14:39 +0100
Message-ID: <871qlydvmo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 09 Mar 2023 14:22:45 +0000
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/22] drm/fbdev-dma: Implement fbdev
 emulation for GEM DMA helpers
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

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
>> +
>> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register client: %d\n", ret);
>> +		goto err_drm_client_init;
>> +	}
>> +
>> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
>> +	if (ret)
>> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>> +
>> +	drm_client_register(&fb_helper->client);
>> +
>> +	return;
>> +
>> +err_drm_client_init:
>> +	drm_fb_helper_unprepare(fb_helper);
>> +	kfree(fb_helper);
>> +}
>> +EXPORT_SYMBOL(drm_fbdev_dma_setup);
>
> And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
> is used instead.
>

Scratch this one, you need the custom setup function to pass the 
drm_fbdev_dma_helper_funcs to drm_client_init(). But I think the
other comments this apply.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
