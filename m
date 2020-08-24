Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1210250C0E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 01:05:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92511C32EA7;
	Mon, 24 Aug 2020 23:05:04 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B35FAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 23:05:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id p11so2601969pfn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X2bDf9/Jh5O4dn/SVRaVejguPnAWqDhOLxYT7jsQ0lo=;
 b=S29hMBzZm/KhA8G3HWd/QdpGC/ll7oRB/rtoB/ePawsHT9ZEni7ZMGlkfSU2W87Jev
 bYKTR3t2KIxoIi2zUHUZLIQdf1yxBAbw4YqzSjbhE025RZol/a/a7Qpz5h6+GHuGdkXH
 5dTZTZNi3vQxdOpyKcOh3eM7/jaN7A66mYCBRsTZAuBoiJxDfouGdkNyYrEK8Www9QLU
 Cf96hq3qpmkoKT8g62sBe0uTcnm3shaUInJwiWjb4RAqd+hoPP4IyGPkLcaeC5nL6Enw
 Z1ul0uCf91GVsRMt1JEWT6xEF4zvI58gWOUCgvybBYPrd3R6ETv9+CBMBCG1e3v7BRtZ
 RBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X2bDf9/Jh5O4dn/SVRaVejguPnAWqDhOLxYT7jsQ0lo=;
 b=E2bl+7fx4qteeuQ4nTaxjQgOjfMQWXhJdoyzLbw179Fc88bg709GcTngz4j24mpb8z
 HCrdMvmuOCthOKv8otMYDB5M9kQ++6zcl+omN2jwcVLMv2k26m71I9AKJbUAP98sKe7N
 bIjxi8KXAPfLyhSARVJsMKEz3fVg8w67US8QeGNkof0YycNDaFUA7JddI4TdPAyWMqLu
 uo0zQMaLgip00sW8nyF9LuTPZCcQWxqoR2nQZxwE7d8iMKSWfdMVNrmIuW/Q84q/0Lxe
 XMR80YaLtKLaWDCLpGFhrZXnigpcv0RIaw+1KC5Xzn6eIwQGe9M1kN5DdPDf7vVn7nbe
 DRIw==
X-Gm-Message-State: AOAM53067R+CatEXG5qyPYjvUnrvifnr3wbwlbmAxZvjZo15OAKTMZ6Y
 S1xYI/HHS/+ia4gEiv2xRiHmcQ==
X-Google-Smtp-Source: ABdhPJzh7kGfegUrOPIRZY16urZmM3tZ4mq3dsbLyp8UwpLs/4xzGu9bCJxD62qQxhgyhTM+E1bgOg==
X-Received: by 2002:a17:902:7d8c:: with SMTP id
 a12mr464777plm.327.1598310300089; 
 Mon, 24 Aug 2020 16:05:00 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id j3sm554040pjw.23.2020.08.24.16.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:04:59 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:04:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200824230457.GF3938186@xps15>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-10-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731114732.12815-10-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 9/9] rpmsg: ns: name service announcement
	endianness
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

On Fri, Jul 31, 2020 at 01:47:32PM +0200, Arnaud Pouliquen wrote:
> The endianness has to be fixed to ensure that both sides can
> decode the message. The Little endian format is used according
> to the generic virtio implementation.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_ns.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index cc2bd47c415a..b478e2b55213 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -33,8 +33,8 @@ enum rpmsg_ns_flags {
>   */
>  struct rpmsg_ns_msg {
>  	char name[RPMSG_NAME_SIZE];
> -	u32 addr;
> -	u32 flags;
> +	__le32 addr;
> +	__le32 flags;
>  } __packed;
>  
>  /**
> @@ -57,8 +57,8 @@ static int rpmsg_ns_channel_announce(struct rpmsg_device *rpdev, int ns_flag)
>  		return -EINVAL;
>  
>  	strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -	nsm.addr = rpdev->ept->addr;
> -	nsm.flags = ns_flag;
> +	nsm.addr = cpu_to_le32(rpdev->ept->addr);
> +	nsm.flags = cpu_to_le32(ns_flag);
>  
>  	return rpmsg_send_offchannel(rpdev->ept, RPMSG_NS_ADDR, RPMSG_NS_ADDR,
>  				     &nsm, sizeof(nsm));
> @@ -84,6 +84,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  	struct rpmsg_device *newch;
>  	struct rpmsg_channel_info chinfo;
>  	struct device *dev = &rpdev->dev;
> +	unsigned int flags = le32_to_cpu(msg->flags);
>  	int ret;
>  
>  #if defined(CONFIG_DYNAMIC_DEBUG)
> @@ -101,13 +102,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>  
>  	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>  	chinfo.src = RPMSG_ADDR_ANY;
> -	chinfo.dst = msg->addr;
> +	chinfo.dst = le32_to_cpu(msg->addr);
>  
>  	dev_info(dev, "%sing channel %s addr 0x%x\n",
> -		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> -		 msg->name, msg->addr);
> +		 flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> +		 msg->name, chinfo.dst);
>  
> -	if (msg->flags & RPMSG_NS_DESTROY) {
> +	if (flags & RPMSG_NS_DESTROY) {
>  		ret = rpmsg_release_channel(rpdev, &chinfo);
>  		if (ret)
>  			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);

Please merge this patch to patch 5, I don't see a need for doing this
separately.

Thanks,
Mathieu

> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
