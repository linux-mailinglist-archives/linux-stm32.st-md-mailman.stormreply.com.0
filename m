Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6145CEC9
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Nov 2021 22:12:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF2C6C597BE;
	Wed, 24 Nov 2021 21:12:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79CE5C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637788361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RorRY0n5C9glkMtFV4SYCaRBzAHcsHcap7m+J3g1iLk=;
 b=ftAhsbL1XcDlJeWtBOJuSJXEsT2hBwEWMdvxhvw2TLZBsvFxvZgnsGQrzJH4SnbOu9eXQ0
 IxZvh2pUINBtLgUFHc4Ye/Ht/aXlTDo/hXK9QHDjrBsBPD9gm4J3lUaH+jkp8ry42JVil4
 ny7ehf8ppSNO49ux6f1QQXvz8XX84CQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-UKLrTHH4OcaiaYtmE-pKww-1; Wed, 24 Nov 2021 16:12:33 -0500
X-MC-Unique: UKLrTHH4OcaiaYtmE-pKww-1
Received: by mail-ed1-f69.google.com with SMTP id
 m12-20020a056402430c00b003e9f10bbb7dso3481855edc.18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 13:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RorRY0n5C9glkMtFV4SYCaRBzAHcsHcap7m+J3g1iLk=;
 b=XFN4+Wp6EJlRWKfZKCBYdXHbSLRzuZhYHFtjVIU+3kOMGtuVE8Un0dYBriIUyUt8D7
 LyAShg9+nl0h1iFT3TFbTLHBKYaNGGfp4uytZN938KqfzLQn/W9Y72pLOzjSclLpuz1D
 A/FvWkh+AsJDAnmHDULcJloVIYllnggWJxtsUW5NT/nTeW7sHk+VVZrt5Z4cMGXl8cim
 e+zCVXptktvqecV+/Rpog/KRGVpmuvVfnBf+213aYjrMC8mUuaY8AN/XYgpEV95DzSe/
 kVBbyyQ9XV6HTNMR4gUxSxyiIDI8mkFtUzFlnc8zkrwpJLMZLG8Xi4pEyOqNGL3WNcFd
 DLKg==
X-Gm-Message-State: AOAM530Ttlu2CC9+IvZugRN94UBO4H2jLxEd36W2/+fIJaI6Fee9+MjM
 61pTQ0T5tvewM68nQiJ7TEGQHaGcFqa7YSW73zhMdvPRMv2LuIA2roharPNrN7PJJqHC3/Nku+A
 KcllF6XUhEIiINTvnGo2TkbvTgWPwfsOnJ5Qn0aEW
X-Received: by 2002:a05:6402:169a:: with SMTP id
 a26mr31105969edv.292.1637788352276; 
 Wed, 24 Nov 2021 13:12:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqLmOWsCPmneNLjCwAsRX93gntMVvVuAlK+kAEx/6faUF7BKjEYByFENyGpUnzu7kS+ByTsg==
X-Received: by 2002:a05:6402:169a:: with SMTP id
 a26mr31105915edv.292.1637788352006; 
 Wed, 24 Nov 2021 13:12:32 -0800 (PST)
Received: from redhat.com ([2.55.144.93])
 by smtp.gmail.com with ESMTPSA id em21sm456589ejc.103.2021.11.24.13.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:12:30 -0800 (PST)
Date: Wed, 24 Nov 2021 16:12:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211124161055-mutt-send-email-mst@kernel.org>
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] rpmsg: virtio: don't let virtio core
 to validate used length
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

On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> Using OpenAMP library on remote side, when the rpmsg framework tries to
> reuse the buffer the following error message is displayed in
> the virtqueue_get_buf_ctx_split function:
> "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> 
> As described in virtio specification:
> "many drivers ignored the len value, as a result, many devices set len
> incorrectly. Thus, when using the legacy interface, it is generally
> a good idea to ignore the len value in used ring entries if possible."
> 
> To stay in compliance with the legacy libraries, this patch prevents the
> virtio core from validating used length.
> 
> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---

Arnaud, thanks a lot for the analysis.

Jason, I think this is another good point. We really should not
validate input for legacy devices at all.


> Update vs v1[1]: update commit message to clarify the context.
> 
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> 
> [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..5f73f19c2c38 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>  	.feature_table_size = ARRAY_SIZE(features),
>  	.driver.name	= KBUILD_MODNAME,
>  	.driver.owner	= THIS_MODULE,
> +	.suppress_used_validation = true,
>  	.id_table	= id_table,
>  	.probe		= rpmsg_probe,
>  	.remove		= rpmsg_remove,
> -- 
> 2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
