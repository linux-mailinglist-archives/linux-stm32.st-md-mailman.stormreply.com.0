Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3F91C625
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 20:56:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EB1DC71282;
	Fri, 28 Jun 2024 18:56:18 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DC21C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 18:56:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 46B67CE4292;
 Fri, 28 Jun 2024 18:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C38C32786;
 Fri, 28 Jun 2024 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719600967;
 bh=nbZ4B4IuGzfJbPVBIOmAq3RdE0TDLUZCXRFXhHZu+Og=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gJshG7sAzkli8Ku4dDLbq7WqEPiAmGjfjwS28P42WdkkeNjV0Dv68mtlkPn0X5+lb
 gEZ02GOVBsAKsO5kxHT/coAxwFlaZw2cLlsD/ov7y3OTYuEydLxB+JDNuh2cbapWRF
 1cyXqblStMzwyVWxPEGmXln/zF4/nqXdjdare73iQaMZ7e3jiQMaH0jYHUEoE/zg7I
 D4F3LwVxJ3UW9AAJMSqJxdOiMxwu8m8ACWjkGD9T4Tt307HkAUuqI5WNfQBLZNBPio
 DUKs9kBsfNRZqvCfYv8kNxjk3fyxYmUFQJpBY2c8b4JdOKuT7rVL/++GMctkEX+ahY
 4znbyfQH/3NXA==
Date: Fri, 28 Jun 2024 19:55:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20240628195558.121de053@jic23-huawei>
In-Reply-To: <171952014620.474983.15354726969773132715.robh@kernel.org>
References: <20240618115912.706912-1-olivier.moysan@foss.st.com>
 <171952014620.474983.15354726969773132715.robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: stm32: dfsdm: fix dtbs
 warnings on dfsdm audio port
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

On Thu, 27 Jun 2024 14:29:08 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Tue, 18 Jun 2024 13:59:12 +0200, Olivier Moysan wrote:
> > Fix warnings on DFSDM dtbs check
> > Unevaluated properties are not allowed ('dfsdm-dai' was unexpected)
> > 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 
> > Fixes: 11183ac07a74 ("dt-bindings: stm32: convert dfsdm to json-schema")
> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > ---
> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
> >  1 file changed, 4 insertions(+)
> >   
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Applied  to the togreg branch of iio.git and pushed out as testing for
all the normal reasons.

J
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
