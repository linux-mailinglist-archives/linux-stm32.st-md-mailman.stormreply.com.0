Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0F50E60C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:43:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9840DC628A5;
	Mon, 25 Apr 2022 16:43:59 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7526AC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Apr 2022 02:06:40 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k4so7811390plk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Apr 2022 19:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G5chtXdXHBAHq9U8cN942JiV6ivsvkzMtMA5fbafTig=;
 b=qBHPxvxPL6sor5qMtXE3DaLjQP9T/ilrSNm23CyTsMaZTcq1kHQr0cGCKQrgm/dVIT
 QgaF5j6ync5JRYZ2Cn7QsuQs4YoVCQjiLf4eDT/zkMnquI/OYksg0q+4twatpo3R9McQ
 EKKKowZ5KnFn0RmUUS0GvbXC3lrVd5mg4J+ZBC1yO6dAv5arSZxD7s9wd5+1Xl4/0SOg
 CM4GhCkzCCqgDz7rw8n5pJ/Z9oh4DXfRGkWe1gmfaSQUH4c9Crpu/7hIZldobc6UBR+/
 UnQBtXF1vJRs939yBl5MD72dxLB6O7h8fZja08SNADyYwlL9oOvCEJmcpKKjnH4665Ey
 a4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5chtXdXHBAHq9U8cN942JiV6ivsvkzMtMA5fbafTig=;
 b=E9V1byPzdMMOLLZgyEr35UuGxpaI87cJ1fzWN474qQtlbRAbwkbNDGn1IMEpoe7Zks
 5i3dHKW0WjnTeJ4WTnUPVDbsj7sXxOZHIrsrebNBFoPxfOEL4JABdKJVOvocQhMmdGFR
 DwGWkLnMZTiqkkAcWLKl68VZN9lZ/fzOqQvPXuFpZeelXze6Q1w5PWPu/jGsiBoYdbTg
 ivtX/Tt5wdQlykXRRYqtL9JJXKb4YJVHytQv5LFOy68St3emMhCMKvYRPo236XO9g3q2
 09ToxzHZULpKP1LhiPsNE7qcHvsgHjGdeGzfFIFH1U7Lm2QmnK/ivFALBvqonUiUmZz5
 8JeQ==
X-Gm-Message-State: AOAM532rjTGfAuCn+UnK4o5lK8/UUxf/UdgAy+71wVNs4sdbWhR8LZoP
 V72lLn1Yo6IkJwQXFa1u4+o=
X-Google-Smtp-Source: ABdhPJzLTnOSaQr+nWBe52Kah2RbUcCpcTm+2JUktZ74CsyXnl9YV8zvqt64lVJCETd/TcOiuFHoSA==
X-Received: by 2002:a17:902:a501:b0:153:f956:29f0 with SMTP id
 s1-20020a170902a50100b00153f95629f0mr11714114plq.120.1650765998998; 
 Sat, 23 Apr 2022 19:06:38 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 64-20020a17090a0fc600b001d5f22845bdsm9959867pjz.1.2022.04.23.19.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 19:06:38 -0700 (PDT)
Message-ID: <ab977d4e-dbe7-3198-9477-66d42d818d1a@gmail.com>
Date: Sun, 24 Apr 2022 10:06:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220422155402.721982-1-arnaud.pouliquen@foss.st.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <20220422155402.721982-1-arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:43:58 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: Fix the unregistration of
 the device rpmsg_ctrl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2022/4/22 23:54, Arnaud Pouliquen wrote:
> Unregister the rpmsg_ctrl device instead of just freeing the
> the virtio_rpmsg_channel structure.
> This will properly unregister the device and call
> virtio_rpmsg_release_device() that frees the structure.
> 
> Fixes: c486682ae1e2 ("rpmsg: virtio: Register the rpmsg_char device")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Hangyu Hua <hbh25y@gmail.com>
> ---
>   drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3b7b47f785cf..0db8043e6c49 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -861,7 +861,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
>   {
>   	if (!rpdev_ctrl)
>   		return;
> -	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> +	device_unregister(&rpdev_ctrl->dev);
>   }
>   
>   static int rpmsg_probe(struct virtio_device *vdev)


Thanks for further optimization.

Reviewed-by: Hangyu Hua <hbh25y@gmail.com>

Thanks,
Hangyu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
