Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AC61611C
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 11:46:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65160C6411C;
	Wed,  2 Nov 2022 10:46:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 254ACC03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667386007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUJvEUx8gtjx3iaw6xY22YZZMkx+Fxj3A7QQSAUB80Y=;
 b=IdsGxcpc/b9eri3/F2vdOUh/cr0GJaUlcfrvfXm5M1ivFv5rIhWx6/D/pKE538YSPP5rTI
 dnD7I+fjmyuhuvWBoCiKKCvwlRz6YgWk+A/vS3qXmahAei/2tst2AFgeuCYRtXXo0TJL7L
 IuJ/qqE+hcToYJ3azmb4wt9N7PXsAw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-ocyt7O78McS1CImrIfbw0w-1; Wed, 02 Nov 2022 06:46:46 -0400
X-MC-Unique: ocyt7O78McS1CImrIfbw0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so336748wmb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 03:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUJvEUx8gtjx3iaw6xY22YZZMkx+Fxj3A7QQSAUB80Y=;
 b=mBM7PuhdHzqbJVznCOCfGUDpkthfMQXzqe/RkhTEeZpk9cMJO5MGn/UsAlq+QdZItJ
 irrugvwxk0EYU1T10jaQpNpTvbgCDucDuvkPzLJG7+hCM5qt4H1CtUfh+1T42zoY/l/E
 yJhImNlnFgTOAvr1gJX1zTDvEcEQYsSzUySPdQSOCs7+75Za0Jsu82gpMO9+Myx9k/yf
 vFfM7cYdt7qBNL5vOL2ywHUgbdhGVv6q84A+qfECxtg+BpVGweidg+6h+pC2CElswo2t
 /THLDgSry1JVB/EUA5ru3eNc7fzFg7d30eERriEc3pMs9JNOPZa24Nj1TFXPjksvgO5U
 dp+A==
X-Gm-Message-State: ACrzQf1Yx+H0LdeUfYdyncXrg0ftobR0ZzBQo6Px/spoAR5D0aMjFTBR
 td1j5Zlp1HKpoG1oPES9qeNVRehDH1/ae1kI28jwQ64q/WV5q3PKuRyDTDbJtX/SURQD8ml2SMm
 +NRy5R8V5rNl5FS06SLR7YgFj34jgV4Rg9LtLSeUO
X-Received: by 2002:a05:600c:3556:b0:3ca:771d:701a with SMTP id
 i22-20020a05600c355600b003ca771d701amr14652028wmq.61.1667386004912; 
 Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5jzv0egtLEIAVaxEN/tayyZgqvKvq+1qzahuWoTfzpPIfJE04AyAO6MvJnCllXJsp0I0J18w==
X-Received: by 2002:a05:600c:3556:b0:3ca:771d:701a with SMTP id
 i22-20020a05600c355600b003ca771d701amr14651998wmq.61.1667386004691; 
 Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0a5200b003b3365b38f9sm1701531wmq.10.2022.11.02.03.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 03:46:44 -0700 (PDT)
Message-ID: <5abf94d6-9a48-525e-c562-605529c5793a@redhat.com>
Date: Wed, 2 Nov 2022 11:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
 <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
 <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0ca70b76-c24a-4fdb-cf0d-2647d37379df@suse.de>
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
Subject: Re: [Linux-stm32] [PATCH v2 17/21] drm/fb-helper: Perform all fbdev
 I/O with the same implementation
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

On 11/2/22 11:33, Thomas Zimmermann wrote:

[...]

>>
>>> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
>>> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
>>> +{
>>
>> [...]
>>
>>> +	/*
>>> +	 * Copy to framebuffer even if we already logged an error. Emulates
>>> +	 * the behavior of the original fbdev implementation.
>>> +	 */
>>> +	ret = write_screen(info, buf, count, pos);
>>> +	if (ret < 0)
>>> +		return ret; /* return last error, if any */
>>> +	else if (!ret)
>>> +		return err; /* return previous error, if any */
>>> +
>>> +	*ppos += ret;
>>> +
>>
>> Should *ppos be incremented even if the previous error is returned?
> 
> Yes. It emulates the original fbdev code at [1]. Further down in that 
> function, the position is being updated even if an error occured. We 
> only return the initial error if no bytes got written.
> 
> It could happen that some userspace program hits to error, but still 
> relies on the output and position being updated. IIRC I even added 
> validation of this behavior to the IGT fbdev tests.  I agree that this 
> is somewhat bogus behavior, but changing it would change long-standing 
> userspace semantics.
>

Thanks for the explanation, feel free then to also add to this patch:

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
