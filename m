Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6DD2EA189
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 01:38:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E799C56634;
	Tue,  5 Jan 2021 00:38:39 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 667F1C32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 00:38:37 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id j20so27828614otq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=27wBpppGsYVqhH9Tev4p91dfIlQ30H/+M8uOdR4nqag=;
 b=NE+fQuSOYQLbp22Vj1ifuOiTj3EgouqSiEOKuRuldyuaDevoKojUARocMb0UQ2QQPI
 g/9m8NWbT3ttoWh1J+fZ0nsdn6y1ZFbzeQLd9OVS4VtVt6D/3xBcpFw0408TA534aIqS
 DcZkDrumYyjhZhV1RcPZD6ZyTMC+9kCeTAx1XlDJ1ZQd08M32ZYMTzbWCIYQV17zUu5e
 VxIpZPXSUc/NWCCr79DMH8Rea/pymGm5l7cZlXIVOawAuSp+KQLXGlncbl99NCrFhtxM
 o0QGs/gO5X+b+37hvvSBY371rE+izdgqWxbh0Hy6I9TCPK4EtoyXzoSj9/po9l+aFGcp
 B1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=27wBpppGsYVqhH9Tev4p91dfIlQ30H/+M8uOdR4nqag=;
 b=CFnqlaLY5G3VjSZEz7zRUfIKOLDzHBAyf7WjfJ87DgJZO+IU+uMa5CaKY9kHahJuGt
 PwerLezoBRepTm54b7KoOls9HtaPbCYnyTUIfrQ6JGMdwJ5C9hy4IxPTuZFoihNU07wf
 D9qKbp+rIQcy71gTv95VSQ1G2iaCwNCKddbbkBJCfAFaxuvl35L3u9JFfsPsbc3Fq4RM
 XTfPSg+9mKjUFXVnaow/Niq3z34kv0hqf1evOBxR9Pb+mjeNvCq1Ye0dCPtP34Sb4/RC
 XbwLuaptlD4Wxe5oMukXBiNKApoXh8WX+7kQF0qIBoJPZv7ZAwSZ6p2w87jm34jNOLif
 TNhQ==
X-Gm-Message-State: AOAM530zhjMsMOTA407WVC0b8ZSd7ZrSV0OtB2MKHpp4xA7Xjy1Kt47h
 DMjFs7FunKheL/CltN+zHcsGUw==
X-Google-Smtp-Source: ABdhPJwzyq76S8h25XBXBt3EvdXIT7lM/bAZQGsQ/z66sUeQ2ltiUA7WRfzwckuKtOvKhdltLJxotQ==
X-Received: by 2002:a9d:74d3:: with SMTP id a19mr52939634otl.2.1609807116206; 
 Mon, 04 Jan 2021 16:38:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g92sm13707748otb.66.2021.01.04.16.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:38:35 -0800 (PST)
Date: Mon, 4 Jan 2021 18:38:33 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O1CRjINeCG8PkA@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-6-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 05/16] rpmsg: ns: initialize channel
 info override field
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

> By default driver_override should be 0 to avoid to force
> the channel creation with a specified name.The local variable
> is not initialized.
> 

The same problem exists in qcom_glink_native, qcom_smd and rpmsg_char.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ns.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index 762ff1ae279f..a526bff62947 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -55,6 +55,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
>  	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
> +	chinfo.driver_override = NULL;
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
>  		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
