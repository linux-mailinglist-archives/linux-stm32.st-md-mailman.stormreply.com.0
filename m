Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9B41839C7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2020 20:48:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15645C36B0E;
	Thu, 12 Mar 2020 19:48:16 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64FF0C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 19:48:14 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m3so7760021wmi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=My5hy+eOd+BUGnLYjJSbZOd3nYUzutH2HG2GVn4YySU=;
 b=AiSzVoHTgqpa1qac7d9U8arGecyjIGMg3cTXGJ8wlp5G007Eidw4MQ8r10C+dZx7vU
 waJujvvQ3bbzCUvTunqQ7YHn/yXmeCwHKzYquSTivGPIZU/5BVFq27lEdMg2Pim1oIEL
 0v8QKp1y6Q4deCwbn9he07U2CRFUHo0ve8poxzPjPbf1ZeF3OgfahrX3tA3YGkXDHK6c
 r6uBPe53trUhQ+DJ13jQPSNIDUR1xKpxwFdp1ZC9/KV6BYeBRzjR+NSl4WMioL2GWSRE
 dXj/AegDov5wW/VZJVPPUanYQpO8FlPyHs1wpfKcESCue6oA+/q7NhgeDZCvtkI7VUTw
 /E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=My5hy+eOd+BUGnLYjJSbZOd3nYUzutH2HG2GVn4YySU=;
 b=BnR1idhjwxbl1TIJct/AgGcP4lf1Z4eA0Kn1hH0lJglre/jpSio/fE4lo8Nrp+Wo4w
 ETAq9L9ID0FtRLyn9GBreIfgPsCTxFtirE44dvHBxkpUM+z7L5cD4O4YrAaTKr3FB/mi
 o2oGnj1TueYNllVqSqUNeARYn5xmNi9arjF0CuItzzK32PN5+xpOKkvvmt2bGOS01u3X
 BlC1PjTLjC1YNmT8WAbQ7hSJKg/t4pRFAjvy54CsDnTWu76XmdaBDYf//cRc3CbmMH6K
 P6mezVK2HW8+klzTrqVA0W9YOuLnAY2qu+4w/b7a+mlZ36Q8JKpa9X0Skc0xCfkMDkkH
 glTQ==
X-Gm-Message-State: ANhLgQ2a4L12ingudqBgEH9A/gIToaU/vTQr0HwKi5hlocRw6ayyyCGb
 IJxhgJFVD0nSAMCefiUMTmY=
X-Google-Smtp-Source: ADFU+vseCaW0oo7VMWsRQmbcHcBu9RZW4zq46TUY4mhg/yDNTUBrocjwJC+h98nGd0cnHrPixEVGnA==
X-Received: by 2002:a1c:ac8a:: with SMTP id v132mr6092078wme.64.1584042493588; 
 Thu, 12 Mar 2020 12:48:13 -0700 (PDT)
Received: from DEFRL0001.localdomain ([2a02:810d:1b40:644:cfdf:73ac:91bd:6a1d])
 by smtp.gmail.com with ESMTPSA id z6sm7271122wrp.95.2020.03.12.12.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 12:48:12 -0700 (PDT)
Date: Thu, 12 Mar 2020 20:46:25 +0100
From: Markus Fuchs <mklntf@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200312194625.GA6684@DEFRL0001.localdomain>
References: <20200306163848.5910-1-mklntf@gmail.com>
 <20200311.230402.1496009558967017193.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311.230402.1496009558967017193.davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix misleading
	interrupt error msg
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

On Wed, Mar 11, 2020 at 11:04:02PM -0700, David Miller wrote:
> From: Markus Fuchs <mklntf@gmail.com>
> Date: Fri,  6 Mar 2020 17:38:48 +0100
> 
> > Not every stmmac based platform makes use of the eth_wake_irq or eth_lpi
> > interrupts. Use the platform_get_irq_byname_optional variant for these
> > interrupts, so no error message is displayed, if they can't be found.
> > Rather print an information to hint something might be wrong to assist
> > debugging on platforms which use these interrupts.
> > 
> > Signed-off-by: Markus Fuchs <mklntf@gmail.com>
> 
> What do you mean the error message is misleading right now?
> 
> It isn't printing anything out at the moment in this situation.

Commit 7723f4c5ecdb driver core: platform: Add an error message to 
    platform_get_irq*()

The above commit added a generic dev_err() output to the platform_get_irq_byname
function.

My patch uses the platform_get_irq_byname_optional function, which
doesn't print anything and adds the original dev_err output as dev_info output 
to the driver.
Otherwise there would be no output at all even for platforms in need of these 
irqs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
