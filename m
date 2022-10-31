Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C06135ED
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Oct 2022 13:21:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD687C64101;
	Mon, 31 Oct 2022 12:21:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A224FC640F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
 b=dtQVGo+IZpIyUJY4zXXEG/jalqF9M1pfn2IdTmrz7mYYRpF87IBrQkBlR5B3RpuR3G+aTI
 k40MuyKuCdqnmW1jG7fFCXifOR3s3Ok4Quh2y1JHM0a5/wUppWpI1Ut0YG88m5KLySqOoG
 LhUFfBKyizj5dA8s/Vl8MiAhsJnE5hc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-1wB_15cfMBy31LykNuCCPg-1; Mon, 31 Oct 2022 08:21:51 -0400
X-MC-Unique: 1wB_15cfMBy31LykNuCCPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso1026517wma.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Oct 2022 05:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
 b=KfYacDBhNMLvzp1u06VqaN8hT4p0X9dXiVR7Q+2BG8WDqvu5nhSbTOTDHHS8rJfeIC
 SurJnC6h8iDXwvfwWPM21vix7P7gstOM2MU6NCjiqhzPv4nJ9oEEyUsnTnrwJytk48KA
 bWYvgi1hWE2jdHx1udeXIDZdnMoKCR01KNTdMqv9cFleDNy5KNbVmr2RUqbNWpB72rB7
 T9pWveI9ixzHqIsEy5e+Np0TvVnqrx/iSQAqIz4eVOq1opzVdEs+LmzPv6K7F9BMFCry
 sXWB5ViP57kxtMs1fJVbDQrf8udB9XQKkp5KN0DGBL2/o8K2h0R8yiohD7s3FsmOOUWT
 CHig==
X-Gm-Message-State: ACrzQf3VJ/copbYC81zJJN74+iWCw7Bn/LnB/OcDkzOAY5+4tl3A6PfP
 QgOcOji+Kw2UR5bzMQYXu06wN4zTYTZXT/UMe5KYAzQTk4n5L41iBRjifBTJ/uQIeAI9oeFKG7F
 nMJXJol8ByjHe2RBLX4s7dr6RZYlCD0NI53J0V3bD
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr7935998wmb.187.1667218910345; 
 Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kQh5/EvsJvI9K3W2EFLXezwgTMZr8BgFr4Dt+IxgUiTtboeKKAu1FK4Es/7ETyez8XSTV6g==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id
 bg14-20020a05600c3c8e00b003b4d224ae27mr7935971wmb.187.1667218910155; 
 Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003cf4c1e211fsm7421692wmq.38.2022.10.31.05.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:21:49 -0700 (PDT)
Message-ID: <e9192382-f04c-4ebd-ca1c-b2fceaa29f86@redhat.com>
Date: Mon, 31 Oct 2022 13:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH v2 09/21] drm/panel-ili9341: Include
	<linux/backlight.h>
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Include <linux/backlight.h> for devm_of_find_backlight().
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
