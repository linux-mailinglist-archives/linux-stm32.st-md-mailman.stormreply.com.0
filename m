Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD4B8BBC
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2019 09:47:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7177C35E01;
	Fri, 20 Sep 2019 07:47:47 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07A1EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 07:47:45 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id k24so1918923uag.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxglbnyqNsy9IrMeX1phK/aGWuTchg+w3X2HNfK/9CM=;
 b=mRkPMjzvPBVfAeCHVbJTYmrEh8uq38ZKVM8E8AFU6NzBMCkin/nd1eIBhx73UcvIPj
 hZ9cLZl7VRnRHz0r9b+vw/tUY5l1L8pgCBGOVyccwzB3loxNIAfhw8f57iYt1IVFHmMG
 3ihqT7adb8ixIuRyXLY28hq5ZvJnUjZr99BB8J0MuUtrXiFlrJAhlWPEp5EDSLnkwd6j
 gjJUOVRjbfeyDNz7/rz7jmEHiaLot6qL149wtDhUGZaREGUjVZZCucZTaTlcf93XPL/+
 tkpHNvmoPXhsNOFXcMyryFbNn/lRqf4ubcSr7Nk6ZF/pyAtrNhtGObkvcyf+0/vSpDDJ
 xc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxglbnyqNsy9IrMeX1phK/aGWuTchg+w3X2HNfK/9CM=;
 b=BtXUnjWj0nxIfzj4gC4hISLuuGXoASYil7daZ+lDvqmc7t19QHmTSQ4zo5rwjdJ677
 QoVaP7ZD3YRqf5Kv9gNyTH/4U9/0e1ZJQN+tWL8psaTy3pUrpi8+f/+TKcf8e7GCrRVC
 lKAK3Yuz1qX0pyq6nBfrbEZmCxbTSahwj08zZLujSXcl66tqD8s2w0DJrd5aCaFvXvJa
 aUkWGgvtskwX2s82SDKHEHRlrSr+lvyBOkeadT0lS4KoHZLsUsulAEykDBgABEvGKKXI
 Q9kj4pA92EY8/f0atctLeoqeQQiiHOrLe/3wfJS4GRznGoOY1yFAgXtly45+ViC12Lqd
 azew==
X-Gm-Message-State: APjAAAW1K7DdBtmuBFDYylXKLGqB8oJUlVd3YnVUNbLnMafNZOGHVZqG
 zonn29itrRNjDbpCkL9vUAV0MxcNDlvaMTWLS1qOEg==
X-Google-Smtp-Source: APXvYqyIPD8otiC6oiySJICKUArdhKAFf1jxKg7NkboCvLV7vKR9MnpHuTM4AuE9NqL9JQuhAM9Efy4otC84oobLXJw=
X-Received: by 2002:ab0:1856:: with SMTP id j22mr8516177uag.19.1568965664676; 
 Fri, 20 Sep 2019 00:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190905122112.29672-1-ludovic.Barre@st.com>
 <940e3ce8-1a4f-7e03-dfec-25330051ea5f@st.com>
In-Reply-To: <940e3ce8-1a4f-7e03-dfec-25330051ea5f@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Sep 2019 09:47:07 +0200
Message-ID: <CAPDyKFoha6q1CmhLXREz8OAzd4UiBDKpHo46J1PLGMkf8CStpg@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V6 0/3] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

On Wed, 18 Sep 2019 at 11:33, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
> hi Ulf
>
> Just a "gentleman ping" about this series and
> https://lkml.org/lkml/2019/9/4/747

Thanks for pinging, I will come to this as soon as I can. September
has been a busy month, being on the road most of the time.

Apologize for the delays!

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
