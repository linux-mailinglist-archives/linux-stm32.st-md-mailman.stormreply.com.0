Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3C5A51DE
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 18:34:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F0BBC04004;
	Mon, 29 Aug 2022 16:34:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D8C8C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 16:34:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B31EB81160;
 Mon, 29 Aug 2022 16:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BADC433C1;
 Mon, 29 Aug 2022 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661790853;
 bh=EHNP4RzQnuQOX+7RxLEAqc1syZDl49UGa8ehhKTXRQg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cDp7X8gBmpAOAKJ8Rlu6UmYCh/TwfAd+Jwhm1G1Jt0ADl/0+xpDQqwt1xfPELrpMx
 ldgBmtZYVf7Ppsyy3Pytt6xBmXCK6ejuba3d7PxD8NolqsJPBsZepd0w9dBLtnRFfV
 ONSDgqTK/PV84hBTcRtABTBs1RaIeKNRoOpAa3CJOPACNNqoRQ8KCvkDNT7jCAuU0S
 kb2ekjtAWyRQD1WjoPZRpVw+FP+Oe+/QVHD6QAmMR/6FyMdCw2MqByS5BbA8lB9y4G
 04a3AvVZ9ZNMS6LkZqYUQinoBzbvgdpDDaze8B1XDISXxfQSH8AviJsLmWtCdeHzfX
 fOJH30FPzz/NQ==
Date: Mon, 29 Aug 2022 16:59:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20220829165950.268433ca@jic23-huawei>
In-Reply-To: <20220829141029.GA1470207-robh@kernel.org>
References: <20220823145649.3118479-2-robh@kernel.org>
 <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
 <20220828180050.51c3e857@jic23-huawei>
 <20220829141029.GA1470207-robh@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
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

On Mon, 29 Aug 2022 09:10:29 -0500
Rob Herring <robh@kernel.org> wrote:

> On Sun, Aug 28, 2022 at 06:01:41PM +0100, Jonathan Cameron wrote:
> > On Thu, 25 Aug 2022 15:04:33 +0300
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >   
> > > On 23/08/2022 17:56, Rob Herring wrote:  
> > > > In order to ensure only documented properties are present, node schemas
> > > > must have unevaluatedProperties or additionalProperties set to false
> > > > (typically).
> > > >     
> > > 
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
> > 
> > Applied to the togreg branch of iio.git and pushed out as testing for 0-day
> > to poke at it before I push out as togreg for linux-next to pick up.  
> 
> Thanks.
> 
> > Side note. Some odd entries in your cc list...  alsa-devel?  
> 
> Blame MAINTAINERS:
> 
> STM32 AUDIO (ASoC) DRIVERS
> M:      Olivier Moysan <olivier.moysan@foss.st.com>
> M:      Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> L:      alsa-devel@alsa-project.org (moderated for non-subscribers)
> S:      Maintained
> F:      Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> F:      Documentation/devicetree/bindings/sound/st,stm32-*.yaml
> F:      sound/soc/stm/

There is some logic to that entry I suppose.

Thanks for explanation!

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
