Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6624212AC
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 05:54:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DBF7C59798
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 03:54:51 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E65D0C59797
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 03:54:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c13so2619683pgt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2019 20:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aSWv/3E5xONuctyVCVpI+09Uko/UnXB8canipxV/tCA=;
 b=SNRqwJ7EZ+/CWo5k9NfHmkbROXRuPjzLmaJu4Rvhsi2l9ucWEJJyifU4TP5Ztq5eFf
 6yKDtee7U8Gt3U1ALOf2SaDQI2wHmrlXYvApMqK8XlX7Dap63oqg3JaVwGKD3YMSmDq6
 +0WcehHzxLN5r0deh1CF8RwD0p1D+2oHPRmQM0CJRfogIubkEe5u+1cLLMtL6erU83Oy
 ZBbLTl6s8SiHgA09T5XdzCdIm2uarVZjmqXuWvZZqFHp5VHApjuV5t8QPaKMJPgfz83E
 GHMtBBOyWce4MkW8aJ2mY29Kmb6Lm7Cs46J206H6T+oVs14QAKRL43wtfkxVlMoqS/n4
 L+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aSWv/3E5xONuctyVCVpI+09Uko/UnXB8canipxV/tCA=;
 b=ESbMcGe0H1OeUxg1LOjNMdC87q8KXhrrQ6kgGI5EQOOllFmnOzo7QIcZEsddczmWdF
 y3aWlvFDhZanUatuPDqx2K9eRX845T2S4TmMZ7+h37kSEtfABAo9v0J2jOPWtL+KBWU2
 orsxiojzkyeFTvQIf3RkinfoGS2zGsPpHgpP/aMu9OpkcpxVnHRynPc0dqECCdq3AgvP
 AXNUQAXCAqkP8Qji+TEqavzj8jngpLsZsCdzePXf9o/ehko4qaV1QjpVp4FsYLxvmiEF
 U/sqBjOj5Ax+FjvxsRWZzrOu7QyoqiR5SrnSTc9Jhuqk08Dr8uZxx1VqRfLBlupAUf3k
 HScQ==
X-Gm-Message-State: APjAAAWapTSF/A+sE0AYKWY48iz3NUZ41dEj+N2MpbI3b31Nd5ad4QY6
 2+q5oEaN5IAtr/bHpLBlMSL/
X-Google-Smtp-Source: APXvYqzoHXX1P5yhzflXLHPYow3wkn9VYYg/Butit6e08vzoVnsngfCu3i4rgBTsIxwoAWOQnOO4yg==
X-Received: by 2002:a62:5f42:: with SMTP id t63mr15660001pfb.83.1558065288251; 
 Thu, 16 May 2019 20:54:48 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6390:5018:b478:7b0e:49e:16a3])
 by smtp.gmail.com with ESMTPSA id s12sm12152355pfd.152.2019.05.16.20.54.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 20:54:47 -0700 (PDT)
Date: Fri, 17 May 2019 09:24:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190517035440.GA12863@Mani-XPS-13-9360>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
 <20190506100534.24145-2-manivannan.sadhasivam@linaro.org>
 <20190513180246.GA8487@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513180246.GA8487@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Document
 Avenger96 devicetree binding
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

Hi Rob,

On Mon, May 13, 2019 at 01:02:46PM -0500, Rob Herring wrote:
> On Mon, May 06, 2019 at 03:35:32PM +0530, Manivannan Sadhasivam wrote:
> > Document devicetree binding for Avenger96 board.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/stm32/stm32.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.txt b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > index 6808ed9ddfd5..eba363a4b514 100644
> > --- a/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.txt
> > @@ -8,3 +8,9 @@ using one of the following compatible strings:
> >    st,stm32f746
> >    st,stm32h743
> >    st,stm32mp157
> > +
> > +Boards:
> > +
> > +Root node property compatible must contain one of below depending on board:
> > +
> > + - Avenger96: "arrow,stm32mp157a-avenger96"
> 
> With which SoC compatible?
> 

I referred some other platform bindings (non YAML) and they don't
mention the SoC compatible with boards. Shall I just put it like below?

Avenger96: "arrow,stm32mp157a-avenger96", "st,stm32mp157"

Thanks,
Mani

Thanks,
Mani

> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
