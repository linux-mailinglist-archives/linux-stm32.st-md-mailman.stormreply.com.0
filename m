Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090B278E4C
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Sep 2020 18:20:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B527DC3FAE1;
	Fri, 25 Sep 2020 16:20:51 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7B4BC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 16:20:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t14so3004205pgl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Sep 2020 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mm59MF34JUHn/sNG+XsAVRaMRhXvrdKO3x6Jkh5KNIA=;
 b=TN31U+/6fwbpL7vRkIEMAZpIiyeUg08+VGuPCowIt2N9N7PIQBHPotgYi3YdlESSQi
 qKFjVJHiGKcmqUHBuGecJdTOzJsFzWRdMFQomp0Tn17AONyZTyHN2ttRdM+rm5AbbmS4
 NV+FIEm20YWPFYf2mPBFLCTnN3/XYvBV65hJcMZdbBCinFtXbRUv471wAXcUqiQSJYgD
 /JZJaGzLF/EkEPNP4BW03vVcuTC0ycTaK4QRBpXCfDoaK1b1gJNP7vf2l01qEwO+Tfmn
 EImVwevBDWx29QdQkh+Mc72YdLaSbjPZ99P4ZWroepy0nQzQyoLaknkqleEmf3qNFd5k
 0S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mm59MF34JUHn/sNG+XsAVRaMRhXvrdKO3x6Jkh5KNIA=;
 b=LxIdhvJinFydd1xLFR6vzQyd6FkabkrrHczZX0Ttb2Mt7L2uz72R/jS1/Zqs0JjRjU
 qgy7k7+Pqd7x7vfHI6Bl0VQ9dQrkUz8bkzxRQgluMb/H6dzPdLNrUh0a/mmBbDuCkZYC
 BXQuUU9/GI5A8EGhzytTLzARUCsfnFGMPUf7QYu4L+bOGlDnEdk1FzzMU/U8HS2CQbyR
 3Xy4DHH3dGxUilN27BbPwmyjciv9gAqH13+GYz4dumL4xR81kxqiCvyU/lGNkclgj7zN
 BAgl20vS8EKGkU/Ko8wd04IZpSqGLtB2GxcTrXqVcKmrwGaOL/7R0RbP8KcFWMjMtxjn
 E6vw==
X-Gm-Message-State: AOAM532lKkHJKYy6MjTw+WH3EYC0SKOZapXEcalaCq8QhjK65Q7GMcmY
 mu15cfcffJiYD0cq2MPqGgpW
X-Google-Smtp-Source: ABdhPJyoG/hQhlMEyUNWB3uBTgPZVsp0nko1WeZ01LzyYWkf415zmPMrp48gHZ+k8R5vamknCal3Nw==
X-Received: by 2002:a62:1dc1:0:b029:13e:d13d:a051 with SMTP id
 d184-20020a621dc10000b029013ed13da051mr38090pfd.23.1601050846581; 
 Fri, 25 Sep 2020 09:20:46 -0700 (PDT)
Received: from linux ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id fw4sm2413372pjb.55.2020.09.25.09.20.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Sep 2020 09:20:45 -0700 (PDT)
Date: Fri, 25 Sep 2020 21:50:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200925162040.GA4746@linux>
References: <20200923232535.241437-1-marex@denx.de>
 <0D1E174A-2217-4785-B4E5-79135AAF76F1@linaro.org>
 <5d0c9b8f-8f6b-a4c7-dc80-638e23749310@denx.de>
 <BD86CF01-741D-4ED6-9D08-B43049E9B816@linaro.org>
 <b93bb099-644f-ec0f-50ca-0c537c769e51@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b93bb099-644f-ec0f-50ca-0c537c769e51@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
 support on stm32mp15xx-dhcor
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

On Fri, Sep 25, 2020 at 01:12:12PM +0200, Marek Vasut wrote:
> On 9/25/20 4:21 AM, Manivannan Sadhasivam wrote:
> > 
> > 
> > On 24 September 2020 4:11:11 PM IST, Marek Vasut <marex@denx.de> wrote:
> >> On 9/24/20 7:16 AM, Manivannan Sadhasivam wrote:
> >>>
> >>>
> >>> On 24 September 2020 4:55:35 AM IST, Marek Vasut <marex@denx.de>
> >> wrote:
> >>>> Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dhcor
> >> SoMs.
> >>>>
> >>>> Fixes: 94cafe1b6482 ("ARM: dts: stm32: Add Avenger96 devicetree
> >> support
> >>>> based on STM32MP157A")
> >>>
> >>> The change looks good but what does this patch fixes? 
> >>
> >> The missing temp sensor, which helps you detect overheat of the SoC.
> >> That is esp. important on the 800 MHz AV96.
> > 
> > This doesn't quality as a "fix". Essentially you're just adding a missing feature and not fixing any issues. So please remove the fixes tag and resubmit. 
> 
> I would argue that if the system overheats and crashes, we want to know
> about that, possibly in advance so thermal throttling can be applied.
> Currently this is not possible and I think that is a bug.

No, this is not a _bug_. This is a missing feature that the current kernel
doesn't support and you know about that! The fact that you can trigger a crash
due to hw limitation doesn't qualify as a bug IMO. And you can do that by other
means also (CPU throttling without CPUFreq support etc...)

Anyway, I'll stop here and let Alex to make a call.

Either case, feel free to add:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
