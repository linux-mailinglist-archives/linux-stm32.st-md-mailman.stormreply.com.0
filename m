Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD594631DC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 09:24:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C1E6C79A62
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 07:24:02 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C281C79A20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 07:24:00 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v19so1983565wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2019 00:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=03TkoezjgkAZL2YmFuoEqna7NSM8InGqJI+3ARKjL1o=;
 b=FDJIw/XXd8rciEohBUKmddB8phPThT/PekIFiIN1cV+l66VsdC0Itam9we2NMoOqYP
 zBHeqKlzeTGyY3g/sM4yKyKMITVauqjdMGiSqi7Qe4u+ideDdLeEycXFIt1qMs8O091N
 IeEHWcipFxAp5FvVKok6cqbLm6foJ2Zf78DS35yfTVQp2IRNPHG4wJGKr5BCgRYX1fsC
 Gal52Dc2u9+vN7WHfgRi/AJPwy43zH8kL5FeQ6phfuf96q/RVuy7h5wgcKb5pNvQxq19
 j822OniI4eL5t2RDAoE5UHnZycbkUczRRXkOvxqbuVFHb0Bmuj/7/zlTbr6HBedkBEHo
 b7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=03TkoezjgkAZL2YmFuoEqna7NSM8InGqJI+3ARKjL1o=;
 b=A/HUnZpDzVXwwEkgZ7nmT5Ab1pFTmpHbiQD7OA2bmxn927xg5l2pQLjAsLgY4qj6VD
 gDQfNKIQnmdg8vOmaa2aMw72a+QUfKSIvqbsOMqjYmetwS6ZyslhxJErntrX7ZiUKIkx
 eo1LF15p/tNGTDfcFsk5WxX5b6mJdKfyLjD+pbxoo4Gck9ZeyBy7QWbRHXSHdQ+J+ly1
 2osckW1dPr7H+zCTJwlff3cRrzeC/P/ixDZ0C6pBbLQgJmY+AnpWrd3taMvypYj+jXDE
 daTwKGBbKlhrGJZ8X8nU8F+gu0jUnTJ/XBwvW+fxQ3ujwWBMeP1eWoTo5Ybec9GchvGU
 pUFg==
X-Gm-Message-State: APjAAAWNt6WUNKDV00jPA80YMshZrdR7L9vdTGYUxrcm5rpP/zfQNpGn
 lS2+dmT0FAUXhMUiHkqFGLB5LA==
X-Google-Smtp-Source: APXvYqwV3mcuJnhnz6QQouw2JqDfmNZCuA8kTITJotydtLJak8JAyntXVQPkwnHos7Fs8wIPg2lpNg==
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr20552772wml.126.1562657039819; 
 Tue, 09 Jul 2019 00:23:59 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id v67sm2225652wme.24.2019.07.09.00.23.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 00:23:59 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:23:56 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: David Miller <davem@davemloft.net>
Message-ID: <20190709072356.GA4599@apalos>
References: <BN8PR12MB32666359FABD7D7E55FE4761D3F50@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190705152453.GA24683@apalos>
 <BN8PR12MB32667BCA58B617432CACE677D3F60@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190708.141515.1767939731073284700.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708.141515.1767939731073284700.davem@davemloft.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, arnd@arndb.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, brouer@redhat.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Introducing
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

Hello, 

> From: Jose Abreu <Jose.Abreu@synopsys.com>
> Date: Mon, 8 Jul 2019 16:08:07 +0000
> 
> > From: Ilias Apalodimas <ilias.apalodimas@linaro.org> | Date: Fri, Jul 
> > 05, 2019 at 16:24:53
> > 
> >> Well ideally we'd like to get the change in before the merge window ourselves,
> >> since we dont want to remove->re-add the same function in stable kernels. If
> >> that doesn't go in i am fine fixing it in the next merge window i guess, since
> >> it offers substantial speedups
> > 
> > I think the series is marked as "Changes Requested" in patchwork. What's 
> > the status of this ?
> 
> That means I expect a respin based upon feedback or similar.  If Ilias and
> you agreed to put this series in as-is, my apologies and just resend the
> series with appropriate ACK and Review tags added.

The patch from Ivan did get merged, can you change the free call to
page_pool_destroy and re-spin? You can add my acked-by

Thanks
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
