Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8B1CEA23
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 03:35:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C484CC36B36;
	Tue, 12 May 2020 01:35:23 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9BE3C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 01:35:22 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 72so9276658otu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 18:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x3kC4pf7M56k3t7zRQqBblO/EsPXVYUQiGQ+TYskIi8=;
 b=NxagmPM+X8FSKhBMdPW/r9ItMdA0VLnKzHa65iBs+6vVC3talbH/mwvDLyw+WemPfi
 XNp4GDbLTDTZVZl8Z8tg4a/WJ81a55QNKbQs7aXnTQhHb5BD1Sz49QRTMBgzn5kQxoIW
 ZM5MYGpovc5CZF7Dkk8baPmZAWINAdfb86m8rgmq2EBhOTZuRCYkvC0jkdtAhyZMx6ES
 f/MzW1kxTHijzLTUkbYLo5VzNJ3KgtPyy3l5X1UXG9xMXbsTBJa1rksQxRoRvnfVfO5+
 2a+udLKzZDeUptm8Nba1hQByF7AmU9qIQkt+1OujE5ayFzoDrqVEd9cdPsgxdiDzhOfj
 IJmg==
X-Gm-Message-State: AGi0PuZ+/LB0pynCBVM340dXem/SugVHNsPb+Mu+scLo3C1YSpERRQH/
 bxvR/GB5SYaoo2+Oukj+1w==
X-Google-Smtp-Source: APiQypKsl30cZFaQ3keApHQftWqKsHXq82zN/5Qa/ZRqSSe924LSGVgAN3i5HizLZ4TZae1D4rd06w==
X-Received: by 2002:a9d:4113:: with SMTP id o19mr14268278ote.354.1589247321540; 
 Mon, 11 May 2020 18:35:21 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r1sm2301589oop.34.2020.05.11.18.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 18:35:20 -0700 (PDT)
Received: (nullmailer pid 2259 invoked by uid 1000);
 Tue, 12 May 2020 01:35:19 -0000
Date: Mon, 11 May 2020 20:35:19 -0500
From: Rob Herring <robh@kernel.org>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20200512013519.GA2002@bogus>
References: <20200508134527.26555-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508134527.26555-1-etienne.carriere@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: stm32: new property
	for data access
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

On Fri,  8 May 2020 15:45:27 +0200, Etienne Carriere wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Introduce boolean property st,non-secure-otp for OTP data located
> in a factory programmed area that only secure firmware can access
> by default and that shall be reachable from the non-secure world.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> ---
>  .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
