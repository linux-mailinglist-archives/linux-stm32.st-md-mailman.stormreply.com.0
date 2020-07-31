Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0102348C4
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jul 2020 17:57:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6633EC36B35;
	Fri, 31 Jul 2020 15:57:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DC86C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=VA1JpIwa0xf99JyZG8jJMJXyum5SeKrub+r7dcAIqHY=; b=IFEBUo1QnZiuZ+0x+I8K1vxVBc
 B49t4O/QmjOrKf2n740yGK6WzpiuK9mPZihqyVF9GMTWQmV159Qu9DfDaBlE+fX9XWXMiipNYoNxK
 i9TDb+EiOfhGzqiWpqw1tzr+902wyFErta/uicBfGBPu0LY5gqFmpQbG37XWnh3Z0qffSbkWsLGdE
 CfXp0NU58hBH6eue1IDriSQlYUIU5OrodBBB4IkDBLAZHw2L25Bam8pUI7rkrPQwtg5GEoF/dAiew
 H97ljp690sUCK46v4QFA2931Gwrb/e6KVutgPRbnzoAeyMiIEKeV4rk5zrjEi1lOUFEr2AT+62xCj
 c5YHJH9Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1XOx-0003uh-Qx; Fri, 31 Jul 2020 15:56:56 +0000
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200731121043.24199-1-arnaud.pouliquen@st.com>
 <20200731121043.24199-3-arnaud.pouliquen@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3e5b748e-d160-4925-7b6d-535b620f5d11@infradead.org>
Date: Fri, 31 Jul 2020 08:56:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731121043.24199-3-arnaud.pouliquen@st.com>
Content-Language: en-US
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/13] rpmsg: introduce rpmsg_control
 driver for channel creation
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

On 7/31/20 5:10 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 900ec8f54081..c5afbf24e793 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -23,6 +23,14 @@ config RPMSG_NS
>  	  channel that probes the associate RPMsg device on remote endpoint
>  	  service announcement.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the name service announcement
> +	  channel that probe the associate RPMsg device on remote endpoint

	               probes the associated

> +	  service announcement.
> +
>  config RPMSG_RAW
>  	tristate "RPMSG raw service driver"
>  	depends on RPMSG


-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
