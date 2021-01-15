Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7A2F88C9
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 23:50:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29C5AC424C0;
	Fri, 15 Jan 2021 22:50:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90D61C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 22:50:05 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o10so15475202lfl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9KSr8/xWSCyHW7tN9xnYcCbpuAtDjpL1+6SsF6x/c8=;
 b=m0G/IYzZj3G7d8stfAQn9ESWdEifj4TTtPEV1mAA6XZixfSweCE/9vFz9AI/zkVHOi
 h2maiRt5yA8tL/AuQ8CzG0stziso5ZC1tKUpMTrqugyG1suaHt0t+YJtNsREYarAT2u0
 ikMzgiAzmms1fYZ3wRF84D8dcE4V05U40k1I5g4Hk8AXcHtjZY+1f1pWKq7xMQ0YxmP9
 jhF0W3YFwtW1XQ6dY28BnVo+jY1uc4hLT+Q1EJx43JXr1MxF6r/JDtjUMVqhk6elRmua
 qgocTuvk3N0qAxet5KZsYLooYRD5wKCmfihh6zwIYjxgQ/b5jOQIo56LxceGu4BuNGoA
 imhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9KSr8/xWSCyHW7tN9xnYcCbpuAtDjpL1+6SsF6x/c8=;
 b=kGebid5Fr82BjUT2pN/E7CP5LNk4kJ4/59y/PmCRWXL0Zq6xrGW63NaT/Tya1xSiw6
 mxOiKqXae5u3gdhjPpp+SYvx85xFhqClvIGUCza3xeLo705YSzTEtX8d6QnAqIRUsigD
 /xXG7Ermr0RFBai5ZrpewoqoZqLa+nhVTz2/mHnS5BglL/xbv20b83OWYBfd5AkLMJKz
 YtVnnGaCe02OWW/hsm+aXMX7pJy306ybECQnfdhcGhkZQ5ng2aTL8+VkVWUVy9fB1is6
 19njT+QR9v8NLOV/ZpSTAK2eQEy2zTnqc7vExcyDGs/yZg7k8oqSqy6g0Brph2QAnWnH
 4KNQ==
X-Gm-Message-State: AOAM5319n/NZ5UyB+Y0KV6rsZ1YnYiQLU89t8fovegAVGoMINLlydVO6
 rHXE9UtXglRGUxrb+wh7W4d46J957vLdVmvKdEn5Fg==
X-Google-Smtp-Source: ABdhPJwlRs6Es/A2YqSiBPXLgGTbo0FkuYbgKqGxUpEC1Rcbcg7AwYKokJ8VGaSpGDmS90BJvJCL9sTpvN3hSQwD5Rk=
X-Received: by 2002:a19:6557:: with SMTP id c23mr6095888lfj.157.1610751005247; 
 Fri, 15 Jan 2021 14:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20210105140718.122752-1-marex@denx.de>
 <CAPDyKFoQfm2ZtPdsZSZtOCDH-FJqNzihYqZny-vUdK4Q4tWTzQ@mail.gmail.com>
 <b83c1112-010b-a40f-319f-84c755424b0f@denx.de>
 <CAPDyKFo5Sqxj31owrnmz1sTZqgW_PtZM2H=pDPBz+9hc0W0hHA@mail.gmail.com>
 <77dd612b-23f0-1f77-797a-9cde512926e3@denx.de>
 <f91fbdfc-453d-78a6-970a-5d6eecd443b2@foss.st.com>
 <ccef7ae4-8cd7-4434-9632-917a4fb92f53@denx.de>
 <ad4a108e-81f1-daf5-9921-9884ed06d237@foss.st.com>
In-Reply-To: <ad4a108e-81f1-daf5-9921-9884ed06d237@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Jan 2021 23:49:54 +0100
Message-ID: <CACRpkdY=n_-5giDVyqvSbCF7wy_-Xf7RfOrQbxrCQ+jC9b2rXw@mail.gmail.com>
To: Yann GAUTIER <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] mmc: mmci: Add support for probing
 bus voltage level translator
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

On Thu, Jan 14, 2021 at 11:13 AM Yann GAUTIER <yann.gautier@foss.st.com> wrote:
> On 1/13/21 3:45 PM, Marek Vasut wrote:
> > On 1/13/21 3:21 PM, Yann GAUTIER wrote:
> >> On 1/13/21 12:52 PM, Marek Vasut wrote:

> >> I also wonder if this HW detection should be done in kernel, or if it
> >> should be done in Bootloader. But it may be more complex, to add the
> >> st,use_ckin in kernel DT if bootloader detects this translator.
> >
> > Lets not attempt to hide inobvious functionality in bootloaders, the
> > kernel should be independent of bootloader where possible. And here it
> > is clearly and easily possible.
>
> OK for this part, I understand it will be better not to hide this in
> bootloader.

We all agree. I am against bootloaderism, the tendency to toss all
complex hardware detection over the wall and call it
a bootloader problem.

Let's proceed with Marek's solution.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
