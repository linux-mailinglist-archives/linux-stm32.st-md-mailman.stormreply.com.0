Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949C1A8872
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 20:04:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34949C36B0C;
	Tue, 14 Apr 2020 18:04:35 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB0FAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 18:04:33 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id l21so557510otd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 11:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X8HnP8qvwXULBtvNF32k/xLU2uHML1H+p2xHE6J9vac=;
 b=o5XsCYvtbxaaynKnWZ2LjlYCV7SATI0mvyIM1HaSXh7Tl2udnx+vmm7XBiEN5r47h9
 ai0/HaZMh6IdYsjPhn38d2sRtDSjhgV4ldQDRH+kSeixviAZVjiI+7916J3u053t3by1
 kU+pw9tdY3sHdNCl07wIa/rLcmVLJoFyCH0jieDStrFiN8kepNYBvPVXrt5k+jZd9tv5
 4jD6XqoU8AoMBVFM55g48uHZTyDHu4pu70QZmlUj6G2LPTIEJm9OTOqL8ja8671mD4Kh
 4FGnVJu7eLuVS1JceoEjjGrEJgwx+g1qNNgsgz0nA0NTKuqiyoe+sX0/cieslZMWWsx/
 PUGw==
X-Gm-Message-State: AGi0PubTrOM88jt1f9xeV43msH416nhNKb+i7oe6WwzkTGxhA2YS7Bdy
 bKndD67f64t2zCAIOaQuYA==
X-Google-Smtp-Source: APiQypKU3vXmgT04leTbcZl+K+74cxsiUS9r32WTmebpcpqG/ivXWoMLBr8jyRZWS5laaRPbzqwoKA==
X-Received: by 2002:a4a:3ec1:: with SMTP id t184mr19168387oot.3.1586887472468; 
 Tue, 14 Apr 2020 11:04:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g30sm6238585oof.39.2020.04.14.11.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:04:31 -0700 (PDT)
Received: (nullmailer pid 19544 invoked by uid 1000);
 Tue, 14 Apr 2020 18:04:30 -0000
Date: Tue, 14 Apr 2020 13:04:30 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20200414180430.GA19162@bogus>
References: <20200403140415.29641-1-christophe.roullier@st.com>
 <20200403140415.29641-2-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403140415.29641-2-christophe.roullier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandru.ardelean@analog.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 1/2] dt-bindings: net: dwmac: increase
 'maxItems' for 'clocks', 'clock-names' properties
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

On Fri, 3 Apr 2020 16:04:14 +0200, Christophe Roullier wrote:
> This change is needed for some soc based on snps,dwmac, which have
> more than 3 clocks.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Applied, thanks.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
