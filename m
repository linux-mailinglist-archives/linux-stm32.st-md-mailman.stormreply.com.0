Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F32932D991
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 19:45:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17424C57B75;
	Thu,  4 Mar 2021 18:45:36 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1734C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 18:45:33 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id bj7so356408pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 10:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AfzYA4MYm4o0NBs3+MWAkCalbICVDep2WzlX9v2I+F8=;
 b=cvbIZzFy4tKSoioTDRDvsehbKvgBr8wpI09lcjS9KYeFH47NqnzM5VHMUMDWwo8kK7
 Gsuuj01NzyWNLBzuRsHc9wjcr6EsLet7kLPllDQ5MIjKS0nMuafzRfFlv7w5LXctv9Us
 Qc6j8tsi0K70HjsTxooAwecliEJYSExLL5kxoesnuRqXBspMfcAEpd9l7VH6oaQqRAxE
 qheBgIn1LYST2OZkjpeMkCgPGmVcWlOcWlLsmiVRZPUeCZUXDkgwObM9hI7w3ti/A0jc
 DymPvg2DkNqp1CDNFP0jEnfN3QKOE+E+R6fXLSZvCTZHTAwRCJqD8uHBHFBeSTxm5vII
 vkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AfzYA4MYm4o0NBs3+MWAkCalbICVDep2WzlX9v2I+F8=;
 b=KzWNc5gCL8oiXQITucWLVCrJ3d0kOEKWPp4OKWhBp+zHfIchGeUWc+5CcjO7QTgmv2
 5VCSYy/otRgmHO5MJM/jdMhBIvH+tPjglsbxAMV9hlMx6lCd5wMYQCx4Q91zsN+laNrW
 UPjm8VuOiXcwyk6a/LwNxoMVG8bB3xakQfO6aDwb9WW/lDKcmWZL6M3cBUdMQ1fZpLsG
 EQ2ZmM6jKVxQ9+RsVju0LjRfn+ibMb6W/ldS+30g2HWkflvfHvz4eVV5oUi8/IMaelip
 3GJYruMSew8UlwWZeR4j9cksEXBbS8ZPqMcJHH98FhUpYg2Zb/E0wLFvsGV+e/60rrX9
 2DnA==
X-Gm-Message-State: AOAM531jrPNrZDzyh+Ws9wGtH1lXi3eKPcNFngnp6914Gz4/3Ba2MnGF
 jZVk0UhvLz5Guw1JmuS0Rhjaqg==
X-Google-Smtp-Source: ABdhPJwL3EYl86r8faI7gQK72idH6mIl1cI7i334/cvnu7Kb7ruGlHdt3+2DWYhNx+nSRWRUiL6y1Q==
X-Received: by 2002:a17:902:b941:b029:e3:1628:97b7 with SMTP id
 h1-20020a170902b941b02900e3162897b7mr5296349pls.60.1614883531870; 
 Thu, 04 Mar 2021 10:45:31 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 68sm131267pfd.75.2021.03.04.10.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 10:45:31 -0800 (PST)
Date: Thu, 4 Mar 2021 11:45:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210304184529.GB3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-17-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-17-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 16/16] rpmsg: char: return an error if
 device already open
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

On Fri, Feb 19, 2021 at 12:15:01PM +0100, Arnaud Pouliquen wrote:
> The rpmsg_create_ept function is invoked when the device is opened.
> As only one endpoint must be created per device. It is not possible to
> open the same device twice. But there is nothing to prevent multi open.

s/multi/multiple

> Return -EBUSY when device is already opened to have a generic error
> instead of relying on the back-end to potentially detect the error.
> 
> Without this patch for instance the GLINK driver return -EBUSY while
> the virtio bus return -ENOSPC.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 8d3f9d6c20ad..4cd5b79559f0 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -116,6 +116,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct device *dev = &eptdev->dev;
>  	u32 addr = eptdev->chinfo.src;
>  
> +	if (eptdev->ept)
> +		return -EBUSY;
> +

It would be nice to return the same error code regardless of the backend but at
the same time I feel like it isn't the right place to do this.  I need to think
about this one but for now we can keep it.

>  	get_device(dev);
>  
>  	/*
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
