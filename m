Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18168009
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 18:12:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065B9D2A3B5
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 16:12:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8187AD2A3B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2019 16:12:20 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9944E205F4;
 Sun, 14 Jul 2019 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563120738;
 bh=jQ0f569z2zUiXdImrPkJu/Fo2TGV+neywvRzlzhGgrA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PSjJbnPIDw7/YQwyII6FXeqylpSOLkQsP48YfC+L+kwj2Y1lAZ/A4dVA8M6yp6T9s
 biqbxmYYYElipW9E91i3xFmwHFfLR/jM5h2ElZY4bse0b9ahjAyzTRyIDgyqIVXRv6
 q2ZfqviNOJiqwbuInLSgljaqEt5bOy6K1GpVdf4s=
Date: Sun, 14 Jul 2019 17:11:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190714171141.12fc2d1d@archlinux>
In-Reply-To: <1562148496-26789-2-git-send-email-fabrice.gasnier@st.com>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
 <1562148496-26789-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: iio: adc: stm32: add
 analog switches supply control
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

On Wed, 3 Jul 2019 12:08:14 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On stm32h7 and stm32mp1, the ADC inputs are multiplexed with analog
> switches which have reduced performances when their supply is below 2.7V
> (vdda by default). Booster or vdd can be used, to get full ADC
> performances.
> 
> Add documentation for:
> - optional booster-supply that can be used on stm32h7 and stm32mp1.
> - optional vdd-supply that can be used on stm32mp1 to supply analog
>   circuitry, selected by syscfg.
> Mark these as optional, since this is a trade-off between analog
> performance and power consumption.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Seems fine to me. Applied to the togreg branch of iio.git and pushed out
as testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes in v2:
> - Rework since: "Add missing vdda-supply to STM32 ADC" series.
> - Add booster-supply regulator description
> - typo: input switches
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 93a0bd2..4c0da8c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -47,6 +47,12 @@ Required properties:
>  Optional properties:
>  - A pinctrl state named "default" for each ADC channel may be defined to set
>    inX ADC pins in mode of operation for analog input on external pin.
> +- booster-supply: Phandle to the embedded booster regulator that can be used
> +  to supply ADC analog input switches on stm32h7 and stm32mp1.
> +- vdd-supply: Phandle to the vdd input voltage. It can be used to supply ADC
> +  analog input switches on stm32mp1.
> +- st,syscfg: Phandle to system configuration controller. It can be used to
> +  control the analog circuitry on stm32mp1.
>  
>  Contents of a stm32 adc child node:
>  -----------------------------------

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
