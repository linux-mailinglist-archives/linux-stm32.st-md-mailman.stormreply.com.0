Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC7791B05E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 22:29:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D03A3C71280;
	Thu, 27 Jun 2024 20:29:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97887C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 20:29:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59E21CE2E48;
 Thu, 27 Jun 2024 20:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D203C2BBFC;
 Thu, 27 Jun 2024 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719520149;
 bh=b/0aNRPKXl+pJqUGj/VmecpemqeGNH4lJFUTEQRPRiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HW62N1IA8g8PIp+7o+yoQhE0hOXTHkRgKocLCbgHI0RLPk+UFoPuCaGY2ZZGjri4b
 fc8VwD+KoLHMAljmElaUY793rAo3nXm7W6885i4xvIIDYbgd//GXTGjZNGa5fzTDYY
 bQHJuN2Rp390mMzefwCVUAmXZgYSzTee40UsNb9F0f4wtzm9WeMyST27nj+PUeoDbF
 CZTc2whCBRq9aLn3irP6dW1/OZVjr+Lj5AOe/+T/dwWBsFNEHhUdSt+7ih4cgYmJn9
 vmdxZ2n5L4WAwVCDrT0NIu/zae3YK+41Ft3dyPCAoUGxk7XbGtQYcbzx2drU9jRq5S
 EZjuAOv1T8s1w==
Date: Thu, 27 Jun 2024 14:29:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <171952014620.474983.15354726969773132715.robh@kernel.org>
References: <20240618115912.706912-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618115912.706912-1-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>,
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


On Tue, 18 Jun 2024 13:59:12 +0200, Olivier Moysan wrote:
> Fix warnings on DFSDM dtbs check
> Unevaluated properties are not allowed ('dfsdm-dai' was unexpected)
> 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: 11183ac07a74 ("dt-bindings: stm32: convert dfsdm to json-schema")
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
