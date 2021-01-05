Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87D2EA2A8
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 02:10:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A088DC56638;
	Tue,  5 Jan 2021 01:10:52 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F361CC56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 01:10:51 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id r9so27826573otk.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 17:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=//v3nEDqI/fknyujCjSI+soM4pOu12qYcTNNDEQN8zY=;
 b=giw0pLGn4GccxW37Cg4PpxpFl1jHyDWYdmiQROH6AXIy3ArQLQonIh8fUh/BaG1L+7
 em/SOGu4t6qM5bTAlX9nbOTcfL7KXVYpYjYoqQeCPfS7/XaG1vwbs7pMVPOXl7fqOy2s
 kJkCQHgkzKVVhchki19tVzakoebGrxbpSbxvTNO3tDf9sKmbSM/AMHjuHUTBmOSkfRN0
 CwHpYqkrrfplwhMYfRKiTyYHNKr0gDZSOEgyZ3dQ/FigA2NjoxRsyeLEkkg9px1uy8O7
 a3cHNbfzGLxvw8D6zU8V0iVzW4VEgFkUnwz0E04IVONIKXJNhBAn0AXPgna1f1v65BuN
 A86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=//v3nEDqI/fknyujCjSI+soM4pOu12qYcTNNDEQN8zY=;
 b=eMxKA7JbJ1nPERA+0lyLl2hHqKCBqbga9Slu2BZyzHaGl6BafG64dFkXunV7DyqR78
 XIQzPDphfmXrdfwpUXLt1vDwkTRssS99gQXll/+RCVsJQQKwS2akd5jnPUvDhnGfc0t1
 dE0DuJHO0xneMEUT4pCDS92oXsmxEmh5wyURhWuXeiyJCW7yA85kKqo4mQrRwzvTF017
 DnYziLVaath8BHbdW2QexzBHxyLLnfDgM0gT+YSjHoUz1xw7gTcc0gstuuu7LLjrK/75
 u5+aTFDZiZvu6uQSbmAmBnMJVgY5zh+d1u+SIkfpsCorc43rbXOYGM2MYVdmwQqIbPMr
 iOWg==
X-Gm-Message-State: AOAM532rsljfYvYcO41Ud8ZFQ1STrZv3JP6cck0i8cbFYgSe2MstjGD/
 mp10zTc1x1NjzcvWlScNfpiGyQ==
X-Google-Smtp-Source: ABdhPJwUlzQRCUsYORUXzlU0YpSidv080/49H75fNG7tPQx5Bs/Vvx9zxWGzeUaO8nF3FbvuBIgI+Q==
X-Received: by 2002:a05:6830:1de8:: with SMTP id
 b8mr52892246otj.204.1609809050780; 
 Mon, 04 Jan 2021 17:10:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n22sm13760778oig.32.2021.01.04.17.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 17:10:50 -0800 (PST)
Date: Mon, 4 Jan 2021 19:10:48 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O8mOaSHUIJYEDw@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-17-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-17-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 16/16] rpmsg: replace
	rpmsg_chrdev_register_device use
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

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Replace rpmsg_chrdev_register_device by the new helper
> rpmsg_ctl_register_device to probe the new IOCTL interface.
> 

This again implies that rpmsg_char was broken in SMD and GLINK during a
large part of this series. Your strategy also has the side effect of
having changed the name from /dev/rpmsg_ctrlX to /dev/rpmsg_ctlX,
breaking my userspace.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 14 --------------
>  3 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index d74c338de077..6c7bb84f7da9 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1681,7 +1681,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctl_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40853702f54f..a39457c57705 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1138,7 +1138,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctl_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..c81dfb374b64 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -81,19 +81,5 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  					  struct rpmsg_channel_info *chinfo);
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
> -/**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> - * @rpdev:	prepared rpdev to be used for creating endpoints
> - *
> - * This function wraps rpmsg_register_device() preparing the rpdev for use as
> - * basis for the rpmsg chrdev.
> - */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> -{
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> -
> -	return rpmsg_register_device(rpdev);
> -}
>  
>  #endif
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
