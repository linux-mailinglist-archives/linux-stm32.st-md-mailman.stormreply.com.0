Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333D3A87E1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 19:38:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A63B7C597AE;
	Tue, 15 Jun 2021 17:38:50 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A60FC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 17:38:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i34so12047015pgl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gJUa+0hx0rbXUFX7mmxsZwfywyMDtRYFDwhkW7Df8yU=;
 b=av/65a3p3BRVNG9XKFdJYeO2wWiTcfNj42ljpHRPMF3DlyK+jxaAhqBukh2qrhdn6m
 QGmP698y/f4Yl//cY6O8iLmNL6VkQqw+FVzzydBgFDdlhSNQ9EpiFSj7/HLh4mE+9CaI
 TMk6M8DwJAwcme41wPmz/dkbmT7KMgPCbPOjc1tzRm8cdq+oaChK/q7UeiUgQJWsVPJ1
 JrzAgmitVjWOHYJoovf6Tdukxo0H3KvRKw1hKZM55d3ZiMr/axZW3yeAds7xR0gJLLIZ
 TzDdxoxwDJgp0axoJLndMMeeFEIgKtNorS7NLMYx2Lnxccy9Qqw1FUU/MvnoiiZGXyMN
 aoSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gJUa+0hx0rbXUFX7mmxsZwfywyMDtRYFDwhkW7Df8yU=;
 b=I5jMv5mx0p5FBl/Pz+slurzFXcpKkMPtUExJQoW/0h6cLWd/OJYog0yOscndodCCLS
 NhpJ/LW4DtYZmevPmIVpjwa9vE5NfN+VpQHTYaZXokG/0XKbdkPYD+qUvx+lcqLRfqU4
 f8QOco1vdcA4OynK9pFkXAgltidIMq812zWOoSA1q/lwM6mCEcaGaMWXlNTR9CFMzT81
 WvwZ5kqX0sUz51iswUhvhu9crTqYRXTtwHyido4FbiSi6VK3e5g7+HDWFamDb/RCh73P
 AYP7iGx3a5qbcvKCKzTCAC9V5op1OXCCLti3YieUIDt4HTcCI6uxObkSMirOUzQgcchV
 5xFw==
X-Gm-Message-State: AOAM533SR7IFXjSWuJUPt+8fk0X34rXB4gGB1kM1uonZOABYdSUuj+iG
 9nUz0gY0TDEp4zNM83RqhO+bXQ==
X-Google-Smtp-Source: ABdhPJzhFC5MnbVlCw95sMop5xCn8FjnlLM2ZmtVXznZRxY77CLmYGUe/53p1b9WNGHPLjw1eozhDQ==
X-Received: by 2002:a65:6884:: with SMTP id e4mr630624pgt.71.1623778726964;
 Tue, 15 Jun 2021 10:38:46 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id mr23sm16168435pjb.12.2021.06.15.10.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:38:45 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:38:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210615173844.GA604521@p14s>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
 <20210604091406.15901-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604091406.15901-3-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/4] rpmsg: ctrl: Introduce
	RPMSG_RELEASE_DEV_IOCTL
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

Good day,

On Fri, Jun 04, 2021 at 11:14:04AM +0200, Arnaud Pouliquen wrote:
> Implement the RPMSG_RELEASE_DEV_IOCTL to allow the user application to
> release a rpmsg device created either by the remote processor or with
> the RPMSG_CREATE_DEV_IOCTL call.
> Depending on the back-end implementation, the associated rpmsg driver is
> removed and a NS destroy rpmsg can be sent to the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 7 +++++++
>  include/uapi/linux/rpmsg.h | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 4aa962df3661..cb19e32d05e1 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -98,6 +98,13 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
>  		}
>  		break;
>  
> +	case RPMSG_RELEASE_DEV_IOCTL:
> +		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
> +		if (ret)
> +			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
> +				chinfo.name, ret);
> +		break;
> +

Please move the content of this patch in 1/4.  

>  	default:
>  		ret = -EINVAL;
>  	}
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index f9d5a74e7801..38639ba37438 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -38,4 +38,9 @@ struct rpmsg_endpoint_info {
>   */
>  #define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
>  
> +/**
> + * Release a local rpmsg device.
> + */
> +#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
> +
>  #endif
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
