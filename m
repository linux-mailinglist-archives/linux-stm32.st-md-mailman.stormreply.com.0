Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D6F32F06D
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 17:55:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E33DC57B7C;
	Fri,  5 Mar 2021 16:55:16 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B81D4C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 16:55:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s7so1702455plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Mar 2021 08:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5oX7JDjpyFM6sShOZapWIE6sOYsNksokkCB2Em8FcMw=;
 b=EqxN9e8rDjI2I2gJOSPPG/q05JnU5yymLBDDd9p6ny16eovxkKkAUbrCkuQSTOB2WH
 g6zlxso1OMmg9Ebdk6Nbnx5o4aQNreFt48edMlEaavtiJJ7mCrS65A3BOLEdjVhSZ+mg
 svQQmF4n7dUqon7+f5JiNK/WxfI40+U7YPB4bBRw/Kp+EaQmtNgMxtI9sp7A7OxE3EjE
 o7KtladbbuHryn65Vt1m/aXtqDmcRDiV/Bass2bcD0rWOKHvsdb54zCUGsLPAeLZK2Qu
 kwjtxw9epGtY+6puNn5zLVMj+37z++zRhGSFrBWhgb8EC2qCS0sCjNMal2DihjLtBYY/
 lBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5oX7JDjpyFM6sShOZapWIE6sOYsNksokkCB2Em8FcMw=;
 b=QQvmq9msoYlAk4toPnvqfSQQNvlIfqs18rlWQr2CrEMlAtKv/zuYn5WQq8wOGzHHEV
 d8aqbuxSB6IVs1k/NvjCf44yFsr5L6AocDcT95SIc/1vyET6iFHOlZOFLYNww3HwgTjq
 YQA4664x8H2dK7FX+OogIZPCo2L2Qp4L9OlZ8nUIHwY0bgh1xhHl6LTZVyT76hIxvqVS
 M6sCGYHcZDg3R211G53pViPX+paTNz3jpqNEMoDYfNua4X0/HBcfNXJOcuGo+akDUz9u
 lbcqsriipAmi5AfSpDZwlyqHxyo6Hfyqjg3t7wLMcF4ydSywSfaXp1N/ViQAr//VKpT3
 WZpQ==
X-Gm-Message-State: AOAM531GTKBG+7/rAfgSSVKh86XDq/NgecRG8j6SNey8afopFVuhUI9X
 f0/ZDz2PqhlZ3MAWycZJEG3gtw==
X-Google-Smtp-Source: ABdhPJxstzqvocrEH0wIvecZMQR/AbxctNSmn+OMgpLPNverTVBu8owjd2rr+kRGcTeQBx+lLo4/RQ==
X-Received: by 2002:a17:90a:4d07:: with SMTP id
 c7mr11296018pjg.104.1614963313231; 
 Fri, 05 Mar 2021 08:55:13 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id mw13sm2794442pjb.42.2021.03.05.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:55:12 -0800 (PST)
Date: Fri, 5 Mar 2021 09:55:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210305165510.GA3885132@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-9-arnaud.pouliquen@foss.st.com>
 <20210304191129.GE3854911@xps15>
 <e0f60693-3184-55c1-db67-1725a5f9c24d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0f60693-3184-55c1-db67-1725a5f9c24d@foss.st.com>
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

[...]

> >>  }
> >>  
> >> +static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> >> +{
> >> +	struct glink_channel *channel = to_glink_channel(ept);
> >> +
> >> +	return __qcom_glink_send(channel, data, len, true);
> >> +}
> >> +
> >> +static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
> >> +{
> >> +	struct glink_channel *channel = to_glink_channel(ept);
> >> +
> >> +	return __qcom_glink_send(channel, data, len, false);
> >> +}
> > 
> > Just rename send() to sendto() and trysend() to trysendto() and ignore the
> > destination address.  
> 

Apologies for not being clear.

> Function prototypes have to match with rpmsg_endpoint_ops structure defined
> below. So seems to me not possible to just rename the functions.
> Please could you clarify if i missed something?

I don't think rproc_ops::send() and rproc_ops::trysend() are used anywhere else.
So replace them with rproc_ops::sendto() and rproc_ops::trysendto() where the
destination address would be ingnored.

> 
> > The same goes for the next patch.  I would fold patch 08
> > and 09 into 10 to help get the big picture.
> 
> I'm going to squash all in one.

Perfect

> 
> Thanks,
> Arnaud
> 
> > 
> >> +
> >>  /*
> >>   * Finds the device_node for the glink child interested in this channel.
> >>   */
> >> @@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
> >>  static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
> >>  	.destroy_ept = qcom_glink_destroy_ept,
> >>  	.send = qcom_glink_send,
> >> +	.sendto = qcom_glink_sendto,
> >>  	.trysend = qcom_glink_trysend,
> >> +	.trysendto = qcom_glink_trysendto,
> >>  };
> >>  
> >>  static void qcom_glink_rpdev_release(struct device *dev)
> >> -- 
> >> 2.17.1
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
