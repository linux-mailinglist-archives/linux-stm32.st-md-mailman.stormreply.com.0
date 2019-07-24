Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AB772AB8
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2019 10:54:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6E59C424CE;
	Wed, 24 Jul 2019 08:54:32 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B76A1C424CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 08:54:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w9so32932514wmd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AxqsUQ9ydrbktURKrd3ST6ajH38XaMBsfLuUUxN1ep8=;
 b=Ijet24iFgEAcUFy4oNncn1QCmXqFqnMwKUvJmypA9g9ZUOTrpsLOw5etR1uVg7ATTp
 YAn2QdqOdk2Kva+Ac9H9mVP2TawOeadELXg1L+AtWlZQolQbvvLD7AgT4OdZ3YNUSDsI
 jFGOygNEhoA2cFVA+GlXwksPVGI8AuuJ7HjKsxBAlYRVJLSpUgIuNw2yUeIoqglwjsmA
 ZwFk9wWF7qaq2kRvZ8PmI5EsggSOEdTrvlqB9FtAOC1WGr25mgL0HSEk+8yKIdZOG41q
 G/BmZD06mgeO3Ar8E9X99SyEaURO2d1z2bUGuVsopZIGN1Vor0+HIUC2KKGPIIvdmsV1
 Fk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AxqsUQ9ydrbktURKrd3ST6ajH38XaMBsfLuUUxN1ep8=;
 b=fkPa3FfehRrR1rqGaxCxrw4bq6hRWQroKkuwSXEyWdgf+I+A5A3FC36lZvJFp2tlcS
 ebfhvhCPELWUfTFzS24X1mlH8iyTPa0w75e/nsYDmndwhMcB70lYlfFHF1l2RUNb6kbQ
 OXrfhefTeEWKOM7ix4LvQrkrmYPWzAQsghq1JEKz+rSwl7Er/nwm5fQKd1NKaN0pPUs5
 EvnOUCZFy/gxHJsLn+vD2Z5vuD3HCa/XJmgLavALlNy0kIB4qxNbIGpIyYpWjK9C9UpX
 NIKkxulCZZKk1QROCF43SmltqBmKobC880smTfQa83Mb4wUbwPT0ohwNnylHWufrpfnp
 pjvw==
X-Gm-Message-State: APjAAAXUhdZ44IoEYeVID1PWO8SY9i6buA7q7estIGk/jasFLN1JHtpE
 7sptKE5k3TExFt48Ied76uMbQQ==
X-Google-Smtp-Source: APXvYqwKIfUp/OjDiKIW3yUhz1A3lTcNVQMvMoMH8vowJ8g0DRAQsyJ5Lf4T9NdyDaRbrUzSg97b6Q==
X-Received: by 2002:a1c:6454:: with SMTP id y81mr48189531wmb.105.1563958471195; 
 Wed, 24 Jul 2019 01:54:31 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
 by smtp.gmail.com with ESMTPSA id x16sm33903820wmj.4.2019.07.24.01.54.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 01:54:30 -0700 (PDT)
Date: Wed, 24 Jul 2019 11:54:27 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: David Miller <davem@davemloft.net>
Message-ID: <20190724085427.GA10736@apalos>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723.115112.1824255524103179323.davem@davemloft.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, maxime.ripard@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 wens@csie.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-tegra@vger.kernel.org, peppe.cavallaro@st.com, robin.murphy@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, lists@bofh.nu
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

Hi David, 

> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Tue, 23 Jul 2019 13:09:00 +0100
> 
> > Setting "iommu.passthrough=1" works for me. However, I am not sure where
> > to go from here, so any ideas you have would be great.
> 
> Then definitely we are accessing outside of a valid IOMMU mapping due
> to the page pool support changes.

Yes. On the netsec driver i did test with and without SMMU to make sure i am not
breaking anything.
Since we map the whole page on the API i think some offset on the driver causes
that. In any case i'll have another look on page_pool to make sure we are not
missing anything. 

> 
> Such a problem should be spotted with swiommu enabled with debugging.

Thanks
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
