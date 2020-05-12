Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225D1D01A1
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2020 00:11:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFDE8C32EA3;
	Tue, 12 May 2020 22:11:25 +0000 (UTC)
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BAD2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 22:11:23 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id c187so1673380ooc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 15:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vb85lby5smdr9lABRmv+r/bmfnu8fDinRBVbOkh3wjw=;
 b=huCaBcxXcbOpj0IicoX5M36FeVxA20Z8SRa1SDXKVU0oS4neUu9aFpYTHV6u+y60O/
 QdhtevxsLsZQCAV873G1ILmHztJT/KKRW8I57VP7oMBoFzZ6jLAAat2pSHDP7p2qoJpp
 8morCmVx/CAnnOH7leznoRrkIHnRySBKXa8VWM7n2KOAP+zcQnsldcMy2plYfjBJ9S+A
 za/wDtFYzxqASEdgX5fjP3nNxzfHOPf8g+a3knffSDHaCm54yByNuEu5IYF54RVDDi+K
 YiU+3zHsgwi6WnB6i/jJxz9R0JB+Ri16+71+mu+aMY/4IbNEQdTFjFoMgkMyyf0oZuD/
 szrw==
X-Gm-Message-State: AGi0PubxEvkiI00Us4nb9soYXCUpl2+TGdbp5hWK3sWJqSvPLJTt4mU3
 AOkXj18m7dWw9lbGQYP9tA==
X-Google-Smtp-Source: APiQypJDa6xxDF1mECnAsxooolHAenXcUzoYJryZ/jaOLAe4RkkE9Z5kOjIQF1ih/KxpCTGR6wXarg==
X-Received: by 2002:a4a:3556:: with SMTP id w22mr13971182oog.20.1589321481994; 
 Tue, 12 May 2020 15:11:21 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 65sm1055089otd.77.2020.05.12.15.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:11:21 -0700 (PDT)
Received: (nullmailer pid 25223 invoked by uid 1000);
 Tue, 12 May 2020 22:11:20 -0000
Date: Tue, 12 May 2020 17:11:20 -0500
From: Rob Herring <robh@kernel.org>
To: mani@kernel.org
Message-ID: <20200512221120.GA25157@bogus>
References: <20200503154215.23654-1-mani@kernel.org>
 <20200503154215.23654-4-mani@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200503154215.23654-4-mani@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/6] dt-bindings: arm: stm32: Document
 Stinger96 compatible
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

On Sun,  3 May 2020 21:12:12 +0530,  wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Document devicetree compatible of Shiratech Stinger96 board.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
