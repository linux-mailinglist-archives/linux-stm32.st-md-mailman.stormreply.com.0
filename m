Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023832DA19
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 20:11:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E6EBC57B75;
	Thu,  4 Mar 2021 19:11:36 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A17BC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 19:11:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id q20so19637272pfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Mar 2021 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V8gX6BLRp5VTtpTwGxCWHd1uYqGAa6Y56JCNNo50CEo=;
 b=ipvXcYweUEz5TS/xc4BHVGvCyArCaLaHVI1tfvZ5BJHQyXql9vlhqf3PZTWCX9Jc6r
 s5RxCEH5BO7F5NoKO6+sGuKvkfOYCCzweKWKQ+6JNpBhXMPP7BqHW3SwpogalD0OeRn/
 QOCEwo0swmxcHL+e0NQIGKyNmSxHigpv4swqVTBDJpL+hNngdx5N7g/PfMBQiv/jN82k
 oav1PrsZIdfGZJgWScHC6Dmq9rgtf0Od8PRi0L+SrZRUlmfS2kMOuh9LdIdazP0Dxw9L
 dkbTaioQ+P6Jfm/w9Q/WE53mTfvQ6fLIcmq6YSmpf/VUf0M9LnbNQdkrVVLdf2WFr0Mu
 UGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V8gX6BLRp5VTtpTwGxCWHd1uYqGAa6Y56JCNNo50CEo=;
 b=URkLYtrhLu2veRpduEDw4JBUI01CSSDl8gg2YMUOwRF17/hjCrXWJ1TXBZjuKJ+X0j
 YsC9u3NQcf0K6zI0P0Aqdv6GudZgUkD/c9Ga999Bxk0RRkRM7pjGEnFVS2Fd+cpa5G5y
 mvyr4Q97Yg7aYiAtk3ukhn9KdU1lw7BAN5FUb0Yx9fHk7u22XGXtpukA5Ez2TkGaW8jp
 bZ0Alen0uQKQDGkKxXHOikLr+Qx/gmsplq3HJoLpGmlI37vZLHCoWATS8Gk8DOCQHqBo
 pUIs5uTvVWRqI2pZljDZXvdOGybmGTZcPFp5hVEu1RkAnhpNYY64d5eRvax2u+ZvBW1P
 DxKQ==
X-Gm-Message-State: AOAM532PAc9vr4NtGxpmhv9wdLtWySzfHNzzdLpucbYFF6qnQSiCfwfj
 4PTLT0wuGxll3DH3Jl5UyYFnnQ==
X-Google-Smtp-Source: ABdhPJyaBnKH+Hurc5YUT8rqKvUynaxhKbr/WowkCCfpFo2hdsry+fYZiqjB+V75/Hs+Yxi3DttC9g==
X-Received: by 2002:a62:1e41:0:b029:1e6:fe13:b78e with SMTP id
 e62-20020a621e410000b02901e6fe13b78emr5177583pfe.26.1614885092044; 
 Thu, 04 Mar 2021 11:11:32 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id m12sm37318pjk.47.2021.03.04.11.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 11:11:31 -0800 (PST)
Date: Thu, 4 Mar 2021 12:11:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210304191129.GE3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 08/16] rpmsg: glink: add sendto and
	trysendto ops
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

On Fri, Feb 19, 2021 at 12:14:53PM +0100, Arnaud Pouliquen wrote:
> Implement the sendto ops to support the future rpmsg_char update for the
> vitio backend support.

Add a new line, otherwise it is very easy to read.

> The use of sendto in rpmsg_char is needed as a destination address is
> requested at least by the virtio backend.

Same here and throughout the patchset.

> The glink implementation does not need a destination address so ignores it.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index d4e4dd482614..ae2c03b59c55 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1332,6 +1332,20 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  	return __qcom_glink_send(channel, data, len, false);
>  }
>  
> +static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> +{
> +	struct glink_channel *channel = to_glink_channel(ept);
> +
> +	return __qcom_glink_send(channel, data, len, true);
> +}
> +
> +static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> +{
> +	struct glink_channel *channel = to_glink_channel(ept);
> +
> +	return __qcom_glink_send(channel, data, len, false);
> +}

Just rename send() to sendto() and trysend() to trysendto() and ignore the
destination address.  The same goes for the next patch.  I would fold patch 08
and 09 into 10 to help get the big picture. 

> +
>  /*
>   * Finds the device_node for the glink child interested in this channel.
>   */
> @@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>  	.destroy_ept = qcom_glink_destroy_ept,
>  	.send = qcom_glink_send,
> +	.sendto = qcom_glink_sendto,
>  	.trysend = qcom_glink_trysend,
> +	.trysendto = qcom_glink_trysendto,
>  };
>  
>  static void qcom_glink_rpdev_release(struct device *dev)
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
