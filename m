Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C168B55AA66
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jun 2022 15:18:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DFC4C03FDF;
	Sat, 25 Jun 2022 13:18:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E1EEC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jun 2022 13:18:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4748361300;
 Sat, 25 Jun 2022 13:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C288C341CA;
 Sat, 25 Jun 2022 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656163116;
 bh=DrvYsHNixQGAFxZ5B9o45TBNbqBktYaLq5jvaKUH8Tc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=usAhrIS5wLWHr9hU7Do3gZcWvMC4Oeze1rkLQlqxian1RZ4QQIXbBhzWt2vE6roOv
 h5Sb+F/3L6++RBecYlOK+/fKWRJ9ym5nf86uqhRmfj1hA/GX7s/AZvZAJEWx7MK+G1
 WjtrYmqtpIaSuUNZ+7hjjnUNTSqE6HPkDiSXlsFudVcD3DDc7qBHhyLXGU4kjd2zSp
 hvJ4CuVgysdhorhnAngH26w2Avw3ksAbGOVHB5gl9/Gd+zfnFyIbFEQVEQF0kG4Net
 Qxs1BfQbAQQAuYWK2N4RMk0X61Dq6Ts87F1diYTYuaJz30o7bp9PW5Q58zMRjtuvlu
 QwEmR6sMofWDg==
Date: Sat, 25 Jun 2022 14:28:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20220625142802.51ee9637@jic23-huawei>
In-Reply-To: <20220620154738.801706-1-olivier.moysan@foss.st.com>
References: <20220620154738.801706-1-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] iio: adc: stm32-adc: add checks on
	adc state
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

On Mon, 20 Jun 2022 17:47:36 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> On ADC startup a calibration is launched.
> A prerequisite for ADC calibration is to have ADC in disabled state.
> After kernel boot, the ADC state may be unknown as the ADC may have been left enabled by boot stage.
> 
> Call ADC disable routine systematically before launching calibration.
> Adapt ADC disable routine to perform disabling sequence according to current ADC state.
> 
> Olivier Moysan (2):
>   iio: adc: stm32-adc: make safe adc disable
>   iio: adc: stm32-adc: disable adc before calibration
> 
>  drivers/iio/adc/stm32-adc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Series applied to the togreg branch and pushed out as testing
for all the normal reasons.

Thanks,

Jonathan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
