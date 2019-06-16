Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE547572
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jun 2019 17:12:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B8FECFAEF6
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jun 2019 15:12:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3A0ECFAEF3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jun 2019 15:12:52 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5532084B;
 Sun, 16 Jun 2019 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560697971;
 bh=XYxeE6m6iVjdndgF4Gpsy/J7kmBHdL5js7nG2GNIyZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aerEuJ3rVFrEPfO49k463mid3L5f8cFSHgrCjjsakURRDaaAI0y1DwgI+mFwbsyPf
 WfF8K4nRyeLJz6Ra1+OSmTm/wXzqeuFozHaVudTxyy2eoUTrLn3TlTl/i9VyYbwUtT
 pfFctaleQ0BF0vMjakzUyq/Zyz/Tli9jMAsgbEP0=
Date: Sun, 16 Jun 2019 16:12:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190616161245.38168d94@archlinux>
In-Reply-To: <1560324276-681-2-git-send-email-fabrice.gasnier@st.com>
References: <1560324276-681-1-git-send-email-fabrice.gasnier@st.com>
 <1560324276-681-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: iio: adc: stm32: add
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

On Wed, 12 Jun 2019 09:24:34 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On stm32h7 and stm32mp1, the ADC inputs are multiplexed with analog
> switches which have reduced performances when their supply is below 2.7V
> (vdda by default).
> 
> Add documentation for optional vdda-supply & vdd-supply that can be used
> to supply analog circuitry (controlled by syscfg bits).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 8346bcb..3af48b9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -46,6 +46,12 @@ Required properties:
>  Optional properties:
>  - A pinctrl state named "default" for each ADC channel may be defined to set
>    inX ADC pins in mode of operation for analog input on external pin.
> +- vdda-supply: Phandle to the vdda input voltage. It can be used to supply ADC
> +  analog inputs switches on stm32h7 and stm32mp1.

input switches

> +- vdd-supply: Phandle to the vdd input voltage. It can be used to supply ADC
> +  analog inputs switches on stm32mp1.
> +- st,syscfg: Phandle to system configuration controller. It can be used to
> +  control the analog circuitry on stm32h7 and stm32mp1.
>  
>  Contents of a stm32 adc child node:
>  -----------------------------------

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
