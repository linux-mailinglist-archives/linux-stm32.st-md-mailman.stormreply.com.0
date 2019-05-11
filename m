Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A21A766
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 12:08:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD08FC424C4
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2019 10:08:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C477C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2019 10:08:40 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBB3E217D6;
 Sat, 11 May 2019 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557569319;
 bh=SsM1ofarQZfVphiOzN1Muff7BbA5Z1fF8eufyrWWeQI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HAXe6MeobDUFP7WvrCs1xsgjUoGOeAmEG9RNlbuH+Ab7ZuTAzxqpPSMxZdkfT5wtQ
 aQsGa/YmucANFbQql6kff84p7mospL8kV8nxz1TrQyR+xpNWlZI8bFaiPCfeDi02Hb
 VoB5x2tTwt28/2zhixssWI4f11DWdWK3ai+hQEbw=
Date: Sat, 11 May 2019 11:08:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190511110832.24f58e4a@archlinux>
In-Reply-To: <20190507143615.28477-2-dev@pschenker.ch>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-2-dev@pschenker.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 David Laight <David.Laight@ACULAB.COM>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] iio: stmpe-adc: Reinit completion
 struct on begin conversion
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

On Tue,  7 May 2019 16:36:12 +0200
Philippe Schenker <dev@pschenker.ch> wrote:

> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> In some cases, the wait_completion got interrupted. This caused the
> error-handling to mutex_unlock the function. The before turned on
> interrupt then got called anyway. In the ISR then completion() was
> called causing wrong adc-values returned in a following adc-readout.
> 
> Reinitialise completion struct to make sure the counter is zero
> when beginning a new adc-conversion.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Hi Philippe, 

To me this looks like a fix that we should consider applying to stable.
However, as it is in the middle of this series I'm not going to take
it via the fast route (during rc's). If people want to backport it
they will have to wait until after the next merge window.
If anyone has an urgent need, then shout in the next week and I'll
pull this version out and we can restructure the set.

Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> 
>  drivers/iio/adc/stmpe-adc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> index 9ec338ba3440..b3872eb37293 100644
> --- a/drivers/iio/adc/stmpe-adc.c
> +++ b/drivers/iio/adc/stmpe-adc.c
> @@ -65,6 +65,8 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
>  
>  	mutex_lock(&info->lock);
>  
> +	reinit_completion(&info->completion);
> +
>  	info->channel = (u8)chan->channel;
>  
>  	if (info->channel > STMPE_ADC_LAST_NR) {
> @@ -105,6 +107,8 @@ static int stmpe_read_temp(struct stmpe_adc *info,
>  
>  	mutex_lock(&info->lock);
>  
> +	reinit_completion(&info->completion);
> +
>  	info->channel = (u8)chan->channel;
>  
>  	if (info->channel != STMPE_TEMP_CHANNEL) {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
