Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878795A5A2
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 22:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC6B3C71282;
	Wed, 21 Aug 2024 20:06:49 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 786F3C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 20:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF5F2A41D64;
 Wed, 21 Aug 2024 20:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC7C32781;
 Wed, 21 Aug 2024 20:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724270801;
 bh=vq4i41ddTv1QbpXx1GaVqVWySCl8p9LHMx5IMZcoRA0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NfZvrrYluhBrsNSyj1NmLmqNgSKWZZojn8EyfObCElZtGO/IYitPjFE3VlwZxNjoa
 KwmEnU/ibMt7cA84u3Kg3NGsz+flkPv9PHU1dF2tuJ2diL+Ln2KAVrAUr5HEPSm5Sp
 27qURFqAMTgpvXrIs47qBl5ee0CRAoNfZh1zgcvC6mNDVmwGKHyL7SYsJiKWJl4Au5
 bHvumvdpW6eM0u7RIeu8w7R6jrmxoF8UWY9uBgajCKlx/01oXUSOMP88GaHu3HZ+FE
 foxUYl+1wTLMXXQz6dPIhejZ46sNGyj0ERg69wSvPmd/hN2A0cseqhg9HAnRZmEdJy
 iI+2HkX5zkxOQ==
Date: Wed, 21 Aug 2024 21:06:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Conor Dooley <conor@kernel.org>
Message-ID: <20240821210633.3741bf8f@jic23-huawei>
In-Reply-To: <20240819-outflank-variety-3fcb7ca0338a@spud>
References: <20240818172951.121983-1-krzysztof.kozlowski@linaro.org>
 <20240819-outflank-variety-3fcb7ca0338a@spud>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: st,
 stm32-adc: add top-level constraints
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

On Mon, 19 Aug 2024 18:13:22 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Sun, Aug 18, 2024 at 07:29:51PM +0200, Krzysztof Kozlowski wrote:
> > Properties with variable number of items per each device are expected to
> > have widest constraints in top-level "properties:" block and further
> > customized (narrowed) in "if:then:".  Add missing top-level constraints
> > for clock-names.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---  
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
Applied,

Thanks,

Jonathan

> 
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> > index ec34c48d4878..ef9dcc365eab 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> > @@ -54,7 +54,9 @@ properties:
> >            It's not present on stm32f4.
> >            It's required on stm32h7 and stm32mp1.
> >  
> > -  clock-names: true
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> >  
> >    st,max-clk-rate-hz:
> >      description:
> > -- 
> > 2.43.0
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
