Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 591131187F4
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2019 13:20:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34C5AC36B0B;
	Tue, 10 Dec 2019 12:20:56 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A97BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 12:20:55 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id f7so7108860uaa.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 04:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+GXCkz0A083CnW2Auy3zOSjwo1M0I1o2oKHeSL9F3ck=;
 b=KyH5SEa3abXaiGToIC3ZdQDJPjQz7ehlNHa1ewyHS05ElloLcTSWUH0+HHxGSpmv35
 0zlWrNuW20o6rR7byo5kwkQGHdbqOsjtqAk71j96a9o1pdQ8ZalAOazL9CCburkIWQg3
 QHXevI2feYkETt3mDJ6WQBTmj6EZ2zjN/PiP6GJdTkujIbnhuW6Vce6LMqVPlCwGIfJt
 E8byyo1vnZ1FiSNFISAIBbopXvRnZtV3tsqzNmLNKEya3TQpuE8vYslVfw1+wssR+kLR
 KxGH+irE1aFPt39ROF9djLlen7lWYJ9nXFdNXFLZ3P2/XbWfdiiOcvpQVQe4QFLEAp4n
 WPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+GXCkz0A083CnW2Auy3zOSjwo1M0I1o2oKHeSL9F3ck=;
 b=ay/TvqY6JguWfI1DsOMKtxEOtc57t+Un9oYzrs9ek/NBIQHK1DV0qe2kT5NMENsmsI
 Ejq8Qeme0nG1tDa8dxJ7H0v+BCdDL+poPH4wpBGPl9enwK/6pZoRtoCWzOTg7NFSA1Ch
 ROLX5m2LeSNHRFTMRhDdvq1majMwhThJ2r4htp8cJ+JtyR139PFIGrrOeXuqeT3cuhjk
 TrxdXCVkNg1eao9K8r1RlJZHZ04BvFitbQP0qiZi/ouy8DtfSsQP4YnOGDyd9TGamFox
 Ky9P/SGC2WPfQU+7tzeH4xN7JckrL2HQ29YENcnjosBG/onXEqYkVXkuZ3fLpLBR4rhr
 /jyA==
X-Gm-Message-State: APjAAAW28cPD7ONq/9t3TkXJ42IGU7GEbRo8j5b1gYwwNdia+sLmtEa5
 c2RnkvMwflflyads9WZTCPWHIfnaXDY7ZZL8oonKLA==
X-Google-Smtp-Source: APXvYqyXodp8MezisX2Ogin4ZbF5PMroS3cE2mukEBRUXULiSnp8AsW1NNU4k9XYdJLiuEsKDM0ea9YUPKV0ekMZ3NQ=
X-Received: by 2002:ab0:4ea6:: with SMTP id l38mr29080701uah.129.1575980453850; 
 Tue, 10 Dec 2019 04:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20191113172514.19052-1-ludovic.Barre@st.com>
 <CAPDyKFooSJUn6UCE6QkFmJOCovm00ehz_nAPbiNQM3AcJT_bJQ@mail.gmail.com>
 <c8311933-d129-4618-b81b-aa627b7b6de0@st.com>
 <e80f76d3-0414-4f65-c2eb-4b09aaba3840@st.com>
In-Reply-To: <e80f76d3-0414-4f65-c2eb-4b09aaba3840@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2019 13:20:17 +0100
Message-ID: <CAPDyKFpkkqb3nr1wm7hjMqJCxH7QHArxSm_oWV=M55ga9+0FKw@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] mmc: mmci: add threaded irq to abort
 DPSM of non-functional state
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

Hi Ludovic,

On Thu, 28 Nov 2019 at 15:06, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
> hi Ulf
>
> just a gentleman ping about this thread.
>
> small summarize:
> This patch return an IRQ_WAKE_THREAD only when the variant is
> busy_timeout capable and a datatimeout occurs on R1B request.
>
> So the threaded irq is called only to treat this specific error.
> Normally, there is no impact on HW flow control or for legacy variants.

Yes, this should work.

>
> In your previous message, you seem to suggest using threaded irq to
> manage HW flow control (pio mode). But Like you mention below, the mmci
> legacy could timing sensitive.
>
> For the moment, I prefer to use the threaded irq just to manage this
> error. If needed, the irq threade could be extended later.
>
> What do you think about that?

Yes, that's fine!

I have another minor comment on the code, though, but posting that separately.

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
