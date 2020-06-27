Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94820C203
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jun 2020 16:18:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E16C36B0D;
	Sat, 27 Jun 2020 14:18:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF5C1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jun 2020 14:18:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC7DF21655;
 Sat, 27 Jun 2020 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593267487;
 bh=cIt6opZa+yAA6PsRPnToKEVJTOvIWVfLvMCDwYPe3Xk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTMsD6U1Gd9Qs59wnuvSXVIWP5yBbcKqUWOEqIRqRg003TxHdGjemMqUAOW021M3y
 LDlPtAuI31mU3xn8qrXtq2QDqTSP5QolxLsRAKvrYHTzpwdnUsjZGyjJuFuLOycqOU
 AnY4+beRGssrk+yVQP7fbEVlO0Tvb6GdFd3ZedEA=
Date: Sat, 27 Jun 2020 16:18:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@st.com>
Message-ID: <20200627141801.GA1945477@kroah.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
 <20200520133932.30441-2-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520133932.30441-2-erwan.leray@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: add generic DT
 binding for announcing RTS/CTS lines
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

On Wed, May 20, 2020 at 03:39:31PM +0200, Erwan Le Ray wrote:
> Add support of generic DT binding for annoucing RTS/CTS lines. The initial
> binding 'st,hw-flow-control' is not needed anymore since generic binding
> is available, but is kept for backward compatibility.
> 
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index 75b8521eb7cb..06d5f251ec88 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -35,9 +35,11 @@ properties:
>      description: label associated with this uart
>  
>    st,hw-flow-ctrl:
> -    description: enable hardware flow control
> +    description: enable hardware flow control (deprecated)
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  uart-has-rtscts: true
> +
>    dmas:
>      minItems: 1
>      maxItems: 2
> -- 
> 2.17.1
> 

Did this get ignored by the DT maintainers?  :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
