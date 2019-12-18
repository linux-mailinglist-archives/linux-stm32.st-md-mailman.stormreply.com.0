Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F31123B41
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 01:01:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 855D7C36B0C;
	Wed, 18 Dec 2019 00:01:50 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACAC8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 00:01:48 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id h19so138077oih.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 16:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JP0u5snGp+xc8yKUTmrKXjEUcHiiNAHT0AftIoZKcgY=;
 b=fQY/YHLG7dsgo/kscCooPXF0dK+u07wg+sX43biLqr6Ta4Tf9KH6SENkJZ3a+1D7RA
 JVMjx+wn+Vj/xVcSFo/o4T5M7a6qEKxoPQUAscxEx5749/y4b+wyrT2N/+d5vlWRnLEL
 PyaFzBabe2nmJNxU8Rg1BQ/AQTlSFx6yqicqAfHpZ2trK/K9UzUulAsj1ftmLuBOfSTF
 HC83ECah4xONmeOtQ8nMUGCV+yJ1pR8L1BJ3Z4D0XW5qkMhX3WkPZyNB92mdp+vEtqOH
 8OEuzGsHKmktCm+e0PK7LbeVqJYGlym/u+abJRKc+ZTF9NIleZ9eRZ2Lhv6D3dbpoZD7
 JJQA==
X-Gm-Message-State: APjAAAVWrmZygNW7ujUd7tl915O5/WBoetjN6O7xsAWwApYATnMaI+JC
 u6Pthc+2QXEQru7qjr6KPA==
X-Google-Smtp-Source: APXvYqwuKoimb/fkC26Ulk74P68DdyeLLteEpSMqe8rqs1CwILHTcp7X1D54Jd94iGGt4cUdrtCBCg==
X-Received: by 2002:aca:bb08:: with SMTP id l8mr3144897oif.47.1576627307437;
 Tue, 17 Dec 2019 16:01:47 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m11sm169161oie.20.2019.12.17.16.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 16:01:46 -0800 (PST)
Date: Tue, 17 Dec 2019 18:01:46 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20191218000146.GA24153@bogus>
References: <20191217092201.20022-1-benjamin.gaignard@st.com>
 <20191217092201.20022-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217092201.20022-4-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/6] dt-bindings: dma: Convert stm32
 DMAMUX bindings to json-schema
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

On Tue, 17 Dec 2019 10:21:58 +0100, Benjamin Gaignard wrote:
> Convert the STM32 DMAMUX binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/dma/st,stm32-dmamux.yaml   | 52 ++++++++++++++
>  .../devicetree/bindings/dma/stm32-dmamux.txt       | 84 ----------------------
>  2 files changed, 52 insertions(+), 84 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
