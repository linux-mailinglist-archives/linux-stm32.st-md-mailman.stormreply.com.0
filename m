Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CAA475325
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 07:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63D74C5F1E6;
	Wed, 15 Dec 2021 06:49:07 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19B8FC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 06:49:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o20so71537417eds.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 22:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5c4Y2EZIe2jTzIgDwq+5ULEM5PC+1wAhegx/cChmgDA=;
 b=vJaKSVnRh20kOaT/NtP+8Zy4DupSqY9Duly/ZXpuvdwYNzRhZjJ46kwjPO1DXFMy3e
 P5ibgH/LHjnPR8nedeGoPKc0WfkT8jXg/I9Db2dUH7HTtS2ozkrUIQuipfmfUrKmdios
 FrHwF4ubpWEhpeHFndJ7v+U8WSbUXiONZGlBztfWmsMUPEeAzDCaoEVKlgZJOrJ6K6je
 zWXW1C9KQi1HC70HTAJNEcdTI55MCbqadFRjnPe/wQYeG42lUtQyYooey8LCBqeuMjoC
 1+Bim+m2f16RlNHSMhHg+kHXmzfSIP4CVHPfGD1dxe6TCRBDCGzhV9jss6j8ZgSI/rxS
 Nvaw==
X-Gm-Message-State: AOAM531O+gXaUcOOiecOB1LbZQ/fnIecOerHeL49zl/ssR/QUF/n5Fg9
 vI8E2qVEVMkIsfYgK5631JU=
X-Google-Smtp-Source: ABdhPJyriWwORnVntwdo6aVlHnp8hfkLwlO/XGAJQkPjX7l4/X9i08gGHm5/S0C5dC4T6U4jZ1dWww==
X-Received: by 2002:aa7:d80d:: with SMTP id v13mr12964158edq.7.1639550945669; 
 Tue, 14 Dec 2021 22:49:05 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id 23sm305145ejg.213.2021.12.14.22.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 22:49:05 -0800 (PST)
Message-ID: <3fc784f1-5985-1553-c39f-8472cb63b1af@kernel.org>
Date: Wed, 15 Dec 2021 07:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211214170646.25775-1-arnaud.pouliquen@foss.st.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211214170646.25775-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2] tty: rpmsg: Fix race condition
	releasing tty port
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

Hi,

much better IMO.

On 14. 12. 21, 18:06, Arnaud Pouliquen wrote:
> In current implementation the tty_port struct is part of the
> rpmsg_tty_port structure.The issue is that the rpmsg_tty_port structure is
> freed on rpmsg_tty_remove but also referenced in the tty_struct.
> Its release is not predictable due to workqueues.
> 
> For instance following ftrace shows that rpmsg_tty_close is called after
> rpmsg_tty_release_cport:
...
> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> index dae2a4e44f38..69272ad92266 100644
> --- a/drivers/tty/rpmsg_tty.c
> +++ b/drivers/tty/rpmsg_tty.c
> @@ -53,9 +53,19 @@ static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
>   
>   	tty->driver_data = cport;
>   
> +	tty_port_get(&cport->port);

Can't this fail? Like when racing with removal?

>   	return tty_port_install(&cport->port, driver, tty);
>   }
...
>   static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
> @@ -139,6 +156,8 @@ static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
>   
>   static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
>   {
> +	tty_port_destroy(&cport->port);
> +

You should not call tty_port_destroy when you use refcounting. The port 
is already destroyed when ->destruct() is called. (It has currently no 
bad effect calling it twice on a port though.)

> @@ -146,7 +165,17 @@ static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
>   	kfree(cport);
>   }
>   
> -static const struct tty_port_operations rpmsg_tty_port_ops = { };
> +static void rpmsg_tty_destruct_port(struct tty_port *port)
> +{
> +	struct rpmsg_tty_port *cport = container_of(port, struct rpmsg_tty_port, port);
> +
> +	rpmsg_tty_release_cport(cport);
> +}
> +
> +static const struct tty_port_operations rpmsg_tty_port_ops = {
> +	.destruct = rpmsg_tty_destruct_port,
> +};
> +
>   
>   static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
>   {
> @@ -179,7 +208,6 @@ static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
>   	return 0;
>   
>   err_destroy:
> -	tty_port_destroy(&cport->port);
>   	rpmsg_tty_release_cport(cport);

Couldn't you just put the port here? And inline rpmsg_tty_release_cport 
into the new rpmsg_tty_destruct_port?

thanks,
-- 
js
suse labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
