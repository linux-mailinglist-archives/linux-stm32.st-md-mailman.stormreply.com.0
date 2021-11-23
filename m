Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37F459F60
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 10:39:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A79D4C5C82A;
	Tue, 23 Nov 2021 09:39:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B393C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637633747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1DldLfSNZ3GZO5TU3A8eWGee6MOniRNFPe++o8u1a8=;
 b=VVDwo4iIx7ofCxU3RB9hfqRQv7Xf2qK10kg91B8vEx/57UN/HoZEf05f1VCpb8laryx0ff
 RRDrwmcunhqRCVzGgdlRVPGI/jH3C9aU4Le5xzmLiD06u3vfuOBjqRFGfk831ls8ObkH/z
 V3+SSPFFoxjKgt3wcoGShOpUhbx2uDA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-meT1xBh_MfSAy6SQ2x-baQ-1; Mon, 22 Nov 2021 21:15:45 -0500
X-MC-Unique: meT1xBh_MfSAy6SQ2x-baQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 y40-20020a0565123f2800b003fded085638so13364901lfa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 18:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1DldLfSNZ3GZO5TU3A8eWGee6MOniRNFPe++o8u1a8=;
 b=ftEZ7ES0TpPG1TZfMXEhtt1YyfvmW4YGSX/Ies4NNLZ3mA37lkdHaWc4AKr/kzuJWO
 V/OQae/jimC1HY5b9UY+iqu0zc29AXfj9POWRHNpMRXRrYuRHFxebnUM2CyIzZD6kPDw
 Df+GtnKMRS+WNFTmKjclibHu2ezdo2HDMP5ElkIVXHKp1B9Lz1qWcBdkzvusoaOI9X6U
 y3GO6+HfNBv4+50lZBqBVdyvBmzY4Yy5gJKNdSztAwch4CNkKNPP4trjDWW+oJPb3z3+
 mhCwJqSqAqYvWGtzRNWzQ3f9lwlCrQYOheH5CaMD18ybGJUQdPBeHslTeczMFkr0OewR
 QNdw==
X-Gm-Message-State: AOAM530ANQzYos066LjTbBlot1t4Q6/TMHjUXOTdFWwFxsV+nuhYqoNm
 mT5ymujFqs3LR2BH9rj+RfBT9mIvSGrxyT9VEp9jLYmDphKo1lbcYtv/Qx2I9Ezf+Cl+++tsdSj
 qa1FLNJuizP2Sx8kd9FDxSWEklEh6UKEOG/qHjW5WHsR03oaSMPJtdist
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1146929lfh.580.1637633743846; 
 Mon, 22 Nov 2021 18:15:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5F3fLTnFecDRwlbxWQoSLXoV9918xgCV7czUaBFIpkdKJC7LiNweYTTTLyK3IrQGG25LnISfSApYTs8M+AAs=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1146901lfh.580.1637633743597; 
 Mon, 22 Nov 2021 18:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 23 Nov 2021 10:15:32 +0800
Message-ID: <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:39:26 +0000
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: don't let virtio core to
	validate used length
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

On Tue, Nov 23, 2021 at 12:08 AM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> For RX virtqueue, the used length is validated in all the three paths
> (big, small and mergeable). For control vq, we never tries to use used
> length. So this patch forbids the core to validate the used length.

If I understand the code correctly, the function that calls
virtqueue_get_buf() ares:

rpmsg_recv_done()
get_a_tx_buf()

So it looks to me like the above change log needs some tweak? (It
looks like a copy from the virtio-net patch).

The codes are fine.

Thanks

>
> Without patch the rpmsg client sample does not work.
>
> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..5f73f19c2c38 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>         .feature_table_size = ARRAY_SIZE(features),
>         .driver.name    = KBUILD_MODNAME,
>         .driver.owner   = THIS_MODULE,
> +       .suppress_used_validation = true,
>         .id_table       = id_table,
>         .probe          = rpmsg_probe,
>         .remove         = rpmsg_remove,
> --
> 2.17.1
>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
