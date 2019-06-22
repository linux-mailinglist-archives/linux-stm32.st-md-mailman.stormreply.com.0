Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD74F4C6
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 11:36:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A376C5DBF6
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 09:36:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A90EC5DBF6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 09:36:43 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5B922075E;
 Sat, 22 Jun 2019 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561196202;
 bh=eXC8Xq9kLci/NGLyBfxyNU889cVJ+lqdS50qW2RhjsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nTQtIPcxBLV3ybuRfTtxjC4XTFwE+Gh5YXhMygJKNNLNrDDnXeSN/jK5izqRCx2vr
 jNJ64iiYnqA5fQgqr1JI8vIUTzByd5MCkAgG4+d1HUviunMy32fSgcgXJPQTxc+N3r
 zD4Sntl1TNsAd4Nk+HYZTt/wBbugEDDOCfQOr5nI=
Date: Sat, 22 Jun 2019 10:36:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190622103636.63148958@archlinux>
In-Reply-To: <1560947398-11592-2-git-send-email-fabrice.gasnier@st.com>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
 <1560947398-11592-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: iio: adc: stm32: add
 missing vdda supply
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

On Wed, 19 Jun 2019 14:29:54 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Add missing vdda-supply, analog power supply, to STM32 ADC. It's required
> to properly supply the ADC.
> 
> Fixes: 841fcea454fe ("Documentation: dt-bindings: Document STM32 ADC DT
> bindings")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to ignore completely.

thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 8346bcb..93a0bd2 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -38,6 +38,7 @@ Required properties:
>      It's required on stm32h7.
>  - clock-names: Must be "adc" and/or "bus" depending on part used.
>  - interrupt-controller: Identifies the controller node as interrupt-parent
> +- vdda-supply: Phandle to the vdda input analog voltage.
>  - vref-supply: Phandle to the vref input analog reference voltage.
>  - #interrupt-cells = <1>;
>  - #address-cells = <1>;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
