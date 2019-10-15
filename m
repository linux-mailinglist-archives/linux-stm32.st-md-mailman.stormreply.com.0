Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5584D7D66
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 19:21:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F34C36B0B;
	Tue, 15 Oct 2019 17:21:51 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40DC1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 17:21:50 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i16so17536550oie.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 10:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wMQYKbyhFA0J53uXBrOY3g9qc7SUK0PL+5SCKX00VUU=;
 b=jvMkqb2JJsRC5VQYXmZqc8fHDjoCO9mhH+LpPoalOxH++2qUlvb02LHooEJ13VKJsX
 jte61ib9l/FSN+DAEc6laun5bG4VeWdBumskyZLwzTGIHr9XSEAt5CIUXmNjyeJWT66v
 7tH0TfLPrLcpPhK4V7ZTPf/jhp7wJHzoAVATcf+1BgRRVjHFnAeDuXFh7RTeWRf85CNs
 RdRUNI4ZYLFitYA6t3fyV99rQgbQALFWIj2DfXxmbNdtJgN/IkO3/3GsvXkM3Oy/GKhO
 8D8mwpw4botpYAUyCjeZP7WZldAd4/TYePKGdxsa165SQqnk3R0orNz2WJBPAOahR0yJ
 TUhA==
X-Gm-Message-State: APjAAAW8EOBgiU+0wYzWZ40aaznKVDnTFswWSn0kOqtHv1k6xsXWDXaX
 XL9YR2ILROw3Wue6Tr/4Ew==
X-Google-Smtp-Source: APXvYqzqnTfEgidDenSlUfa7aOPOWYsLH7H0GHitbZ8rXyoGFRnAK2iUj2pxxTyIJqKthdjAV1LKQQ==
X-Received: by 2002:aca:dec4:: with SMTP id v187mr30817920oig.46.1571160108888; 
 Tue, 15 Oct 2019 10:21:48 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d95sm7245526otb.25.2019.10.15.10.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 10:21:47 -0700 (PDT)
Date: Tue, 15 Oct 2019 12:21:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191015172147.GA29624@bogus>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
 <20191007134410.10337-2-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007134410.10337-2-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: arm: stm32: Add missing
	STM32 boards
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

On Mon, 7 Oct 2019 15:44:08 +0200, Alexandre Torgue wrote:
> This commit documents missing STM32 boards:
> 
> -STM32MCU: F429 disco/eval, F469-disco, F746 disco/eval, F769 disco,
> H743 disco/eval.
> 
> -STM32MPU: MP157 dk1/dk2/ed1/ev1.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
