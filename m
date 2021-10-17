Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F7430A5F
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Oct 2021 18:07:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B18B5C5C847;
	Sun, 17 Oct 2021 16:07:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D41C0C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 16:07:10 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FCC460E96;
 Sun, 17 Oct 2021 16:07:06 +0000 (UTC)
Date: Sun, 17 Oct 2021 17:11:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20211017171121.6f0bdabd@jic23-huawei>
In-Reply-To: <20211014131228.4692-1-olivier.moysan@foss.st.com>
References: <20211014131228.4692-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/7] iio: adc: stm32-adc: add internal
 channels support
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

On Thu, 14 Oct 2021 15:12:21 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> This patchset adds support of ADC2 internal channels VDDCORE, VREFINT and VBAT
> on STM32MP15x SoCs. The generic IIO channel bindings is also introduced here
> to provide this feature. The legacy channel binding is kept for backward compatibility.

I'm fine with this series, so just waiting for Rob to have a chance for
a final look at patch 1.

Thanks,

Jonathan

> 
> Changes in v2:
> - Add 'deprecated' to channels legacy properties in ADC bindings
> - Add set/clr service for common registers, to make code more generic in
>   internal channels enable/disable services.
> - Expose vrefint channel as a processed channel to return
>   the actual value of vrefp.
> - Minor code improvements
> 
> Changes in v3:
> - fix vrefint sampling time check.
> 
> Changes in v4:
> - fix binding
> - add dedicated spin lock for common register
> - manage probe_defer on nvmem read
> 
> Changes in v5:
> - fix binding example
> 
> v5 resent as serie index was wrong on previous post. sorry !
> 
> Olivier Moysan (7):
>   dt-bindings: iio: stm32-adc: add generic channel binding
>   dt-bindings: iio: stm32-adc: add nvmem support for vrefint internal
>     channel
>   iio: adc: stm32-adc: split channel init into several routines
>   iio: adc: stm32-adc: add support of generic channels binding
>   iio: adc: stm32-adc: add support of internal channels
>   iio: adc: stm32-adc: add vrefint calibration support
>   iio: adc: stm32-adc: use generic binding for sample-time
> 
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 108 ++++-
>  drivers/iio/adc/stm32-adc-core.c              |   1 +
>  drivers/iio/adc/stm32-adc-core.h              |  10 +
>  drivers/iio/adc/stm32-adc.c                   | 422 ++++++++++++++++--
>  4 files changed, 486 insertions(+), 55 deletions(-)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
