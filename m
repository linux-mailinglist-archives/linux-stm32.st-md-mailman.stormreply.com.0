Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C597B156551
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Feb 2020 17:05:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88D34C36B0B;
	Sat,  8 Feb 2020 16:05:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04256C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Feb 2020 16:05:00 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CB8021775;
 Sat,  8 Feb 2020 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581177899;
 bh=Euyw5YRT5MdLDsoMxRjF1gQchnvFaODdk1aaTO+peYM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I+IdUU7oB1pSPUncTKinXOjnafiCdiuY0GQwjCJZdsn0treXSpxmi9pPMiVZkZXsa
 uKtTbctn0wx59Zg4drSSoyQBLngCXC+wraY2H25POLakUFeA1rFaeWSLeLebfvblHA
 c4ui79vD/0uKZwhsZnNdadb4UAW3APjn4E+N8gQM=
Date: Sat, 8 Feb 2020 16:04:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200208160454.0f153bfb@archlinux>
In-Reply-To: <20200204101008.11411-2-olivier.moysan@st.com>
References: <20200204101008.11411-1-olivier.moysan@st.com>
 <20200204101008.11411-2-olivier.moysan@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: iio: adc: sd modulator:
 add vref support
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

On Tue, 4 Feb 2020 11:10:05 +0100
Olivier Moysan <olivier.moysan@st.com> wrote:

> Add vref supply support to sigma delta modulator.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> index a390343d0c2a..2afe0765e971 100644
> --- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> @@ -8,6 +8,7 @@ title: Device-Tree bindings for sigma delta modulator
>  
>  maintainers:
>    - Arnaud Pouliquen <arnaud.pouliquen@st.com>
> +  - Olivier Moysan <olivier.moysan@st.com>
>  
>  properties:
>    compatible:
> @@ -21,6 +22,9 @@ properties:
>    '#io-channel-cells':
>      const: 0
>  
> +  vref-supply:
> +    description: Phandle to the vref input analog reference voltage.
I note this in review of patch 2 but in general I'm not sure we should
be introducing this for generic devices.   It's fine if we have an
explicit compatible but there is no reason to assume a generic sd-modulator
uses an external reference.

Jonathan

> +
>  required:
>    - compatible
>    - '#io-channel-cells'

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
