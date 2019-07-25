Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A827D74D46
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 13:39:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61754C16344;
	Thu, 25 Jul 2019 11:39:28 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72E35CFAC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 11:39:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so44460987wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/KNocy2+ZfOQXTjSVoKpw5gYwyEUDk8UgKcJTP4ngYE=;
 b=MAEDyrQNT8xSuX9iSr/7BWAuVtiFFg0r91vvdxT2++HHJS9g3J0YPwvOtkJtKUq8Jv
 5iKmWqJK52t0LH1sXJk3PO+C21INeHi4V/ZYW7YuPXVIBflnQMtUHe6awRTT5dvD1DaE
 WpfQIVfVij+bSGThMlicGuVLRiLpF6rqQwZpgSsW3OX9UHyDapWCYIrbuJner3poxc++
 G0Bn8vzCLpCMRU3GuO3rYDre/AQ/pQH9pBaRn/BU0lkFmSiIGNMktCQBPARjaQkabMe+
 GuF14I1ZfrdG7ZX9sunB4JjQ9JvX8MVHFeTldfj+sF04kvwCNlmOmMZTYqLm/phbk5K8
 qnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/KNocy2+ZfOQXTjSVoKpw5gYwyEUDk8UgKcJTP4ngYE=;
 b=Pfdvv+T+ciHhCNAFEE9lrtupv4PzgfOkTr3VFXHYBe9oc52tt+1mf4iU8uSncrDZXe
 4CeAxF7yq+W2QIwY+y6RLyRwCjwcaySsJGOK+O9jihXdH9l000b6fWLOAdoP/Xi5ia8Q
 EPmDhIjR7AlR8AZlj3sEF0OzG6ZxyhV2sUJTSzQGrQWsGG40jBxyoGzWrACjcDzre83v
 9mOZQ63oT58GL5fzOLK0IYxH9W7swZfDmioWrerCBQzxZYTxHV8021qRvNyKWrht8nF4
 KhB1HCdDBjh20wyBPmYlHL39NpovOYFPD8aiyriXxCfhYzHM2QV4cObTUagHtVnuVhPx
 iFnQ==
X-Gm-Message-State: APjAAAVHueJfsJtcm6DnX1lKXeSn53LX2HZEJrYMZl+pavQF6no28Fmd
 VxCRxNncm+GLX5TbHfSaLlFZCg==
X-Google-Smtp-Source: APXvYqxKToM60L7WegP6mEG3X3RaqPtSEAUsT9RXfSRetFr+Hk/NVm3V8WF2BD26TvV4TjAbT9vnuA==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr77541522wmk.92.1564054766915; 
 Thu, 25 Jul 2019 04:39:26 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
 by smtp.gmail.com with ESMTPSA id p6sm53195376wrq.97.2019.07.25.04.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:39:26 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:39:22 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20190725113922.GA1703@apalos>
References: <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190724095310.GA12991@apalos>
 <BYAPR12MB3269C5766F553438ECFF2C9BD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <33de62bf-2f8a-bf00-9260-418b12bed24c@nvidia.com>
 <BYAPR12MB32696F0A2BFDF69F31C4311CD3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
 <a07c3480-af03-a61b-4e9c-d9ceb29ce622@nvidia.com>
 <BYAPR12MB3269F4E62B64484B08F90998D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <d2658b7d-1f24-70f7-fafe-b60a0fd7d240@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2658b7d-1f24-70f7-fafe-b60a0fd7d240@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 David Miller <davem@davemloft.net>, "lists@bofh.nu" <lists@bofh.nu>
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

Hi Jon, Jose,
On Thu, Jul 25, 2019 at 10:45:46AM +0100, Jon Hunter wrote:
> 
> On 25/07/2019 08:44, Jose Abreu wrote:
> 
> ...
> 
> > OK. Can you please test what Ilias mentioned ?
> > 
> > Basically you can hard-code the order to 0 in 
> > alloc_dma_rx_desc_resources():
> > - pp_params.order = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> > + pp_params.order = 0;
> > 
> > Unless you use a MTU > PAGE_SIZE.
> 
> I made the change but unfortunately the issue persists.

Yea tbh i didn't expect this to fix it, since i think the mappings are fine, but
it never hurts to verify.
@Jose: Can we add some debugging prints on the driver?
Ideally the pages the api allocates (on init), the page that the driver is
trying to use before the crash and the size of the packet (right from the device
descriptor). Maybe this will tell us where the erroneous access is

Thanks
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
