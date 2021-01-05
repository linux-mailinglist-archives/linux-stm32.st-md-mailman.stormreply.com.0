Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723D2EA1F6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 02:03:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48DBCC56634;
	Tue,  5 Jan 2021 01:03:16 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED3EAC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 01:03:14 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id a109so27875287otc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jan 2021 17:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SBBTs+bvU9iy9EBWJDnY4qaMDeMg6PPS2w0qpSY3yQE=;
 b=cVeolfQsOycUWSJbpwu3LkQMr/DS38odCyzF18UWKZFcuNylWnEvj4z12vyjZ7a5aA
 PDgx+jGr3pbE7+4ADo/tkTsXyO3qXvwkwntexOQhz9OniKuSGUkbgHH4ehEELg/aAFTU
 rRwIoiTQaepYfpmHscGiPXYJcC49U9e4JrhxOXoE/5poWr/pI6aCKBQUJ+xAwk5J5A6j
 ph/caoL745Grhz4V5VdPDOFJC8MdmAv55Sfd78CE+UNCWvjNY0BSEAZ4ZsLuoAg8ugSS
 NIQwK67EXYyHV94dhjTcqQJE10R+nApS6oYqOUd6ixRamAAKs1pQ6+Fj1ppYKA+ePA/f
 RL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SBBTs+bvU9iy9EBWJDnY4qaMDeMg6PPS2w0qpSY3yQE=;
 b=BcTaGrJezut2HBtoeNNNOhyD8oj3EPwPVFZt6l4pkSqkEKzaz6OgQhFZoIOwo0av18
 7Srv9y4gj08xM30OaVE+YqpD7hD8yYXmeUpcUo9ONKFN/mjLbmiIBuy+Ouo4A3Ts+3/m
 cTBTvyb4vdOIG8hKZAmaDq9uLb1fQ60UAY1y+DVgGChvJ2sZn+KIbLCAMvJtofSTymuu
 41/2lzuJcEANfB7aDitAfNdCAv7Mxwll/v2iha5EPNulJK4HD9Ypcnc6wr3Id4ha/F9h
 3DmLVLW6lVXVH9VfxeNdyUEjzRq/LxPH6Hz1a7lluU+WPygKjU5/vLXe6EQQbtORqaaO
 yVKg==
X-Gm-Message-State: AOAM530OzjQqZEOcLIcTJm8LTjrW83amhSj5iDpBNQa5KyUpmh+Gv7pJ
 eCbnWZonYrEawnnygDEgeCmAUA==
X-Google-Smtp-Source: ABdhPJxCHMQuo1VLdZ9IiJnuuTZHNgMeEvrX5FkkWNXHfJzJv7EHGtUi2aT9wnaNlZemU8tohsfnDA==
X-Received: by 2002:a9d:6c92:: with SMTP id c18mr52506972otr.232.1609808593676; 
 Mon, 04 Jan 2021 17:03:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l6sm13572775oof.3.2021.01.04.17.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 17:03:13 -0800 (PST)
Date: Mon, 4 Jan 2021 19:03:11 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <X/O6z6ngPmML3nOD@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 11/16] rpmsg: char: check destination
 address is not null
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

> The name service announcement is not sent if no endpoint is created by
> default. If the destination address is not precised by the
> application when creating the device (thanks to the RPMsg CTRL interface),
> it is not possible to have a valid RPMsg channel.
> 

In the Qualcomm transports, the chinfo.name is used to identify the
channel, so there it's valid to create a endpoint without dst.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4b0674a2e3e9..8b1928594d10 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -305,6 +305,16 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct device *dev;
>  	int ret;
>  
> +	/* There is not ept created by default. As consequence there is not NS
> +	 * announcement and the destination address has to be set.
> +	 * this limitation could be solved in future by adding a helper in
> +	 * rpmsg_ns.
> +	 */
> +	if (rpdev->dst == RPMSG_ADDR_ANY) {
> +		dev_err(dev, "destination address invalid (%d)\n", rpdev->dst);
> +		return -EINVAL;
> +	}
> +
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
