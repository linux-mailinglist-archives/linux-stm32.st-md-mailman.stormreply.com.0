Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 195562E0D7F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Dec 2020 17:46:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEBF4C57184;
	Tue, 22 Dec 2020 16:46:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6385EC5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Dec 2020 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=yDaEVa5/CN2aXuAdrJIrpXOewRldlkldBKhnrVTMj/k=; b=FpH7nfB6UoVtvi7p0R0fTVNGTH
 Jel+akEJk9iE4s7FJ4zytcKKZH2uSePzwZeM9BeUO4OqCrHwrm4Y7ArWDqpdaEkaNTiwFcpTlG/f6
 F7pSihyaTb+TsxArfYhQKt3Jf2Cc9Hi1D75+q8pYG+eqzeHT4FmaUnmE4Ffy2Lr8T3/Hl9K3eKqFK
 p0wTCdGQVYnwVw7Pk37clLAf5KJqiT9wsam0R6NMjS3Ee2Y3HJsvOOljxW2Ndn17Um4Og0OEbaaVf
 B9cvwHEzxQycbEmQcDoWTSvTokYoIuoqrQhiMAWXrZ3qTCmtdvav8tpJm6nb9T1iuc5zfiQfrgwWi
 FAtZWFAQ==;
Received: from [2601:1c0:6280:3f0::64ea]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krknT-0006iD-MH; Tue, 22 Dec 2020 16:46:03 +0000
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross <agross@kernel.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <154570b1-cf26-6d7c-1641-d6a3528dacad@infradead.org>
Date: Tue, 22 Dec 2020 08:45:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201222105726.16906-2-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 01/16] rpmsg: introduce RPMsg control
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

On 12/22/20 2:57 AM, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
> index 0b4407abdf13..c9e602016c3b 100644
> --- a/drivers/rpmsg/Kconfig
> +++ b/drivers/rpmsg/Kconfig
> @@ -23,6 +23,14 @@ config RPMSG_NS
>  	  channel that probes the associated RPMsg device on remote endpoint
>  	  service announcement.
>  
> +config RPMSG_CTRL
> +	tristate "RPMSG control interface"
> +	depends on RPMSG
> +	help
> +	  Say Y here to enable the support of the /dev/rpmsg_ctl API. this API

	                                                              This

> +	  allows user-space programs to create channels with specific name,
> +	  source and destination addresses.


-- 
~Randy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
