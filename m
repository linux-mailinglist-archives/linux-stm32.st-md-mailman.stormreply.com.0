Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C386B68EB
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 18:45:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDBC7C69073;
	Sun, 12 Mar 2023 17:45:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF19AC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 17:45:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE21A60F8A;
 Sun, 12 Mar 2023 17:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF26EC433D2;
 Sun, 12 Mar 2023 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678643120;
 bh=YEdUsPYrGcfGa+1Q3JmQqtfsYE5Mu9KqGWmOkv1vGKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Gk98wvfrmLxkM4Ks+krsYRFLGE6WEwv7U2tXorF44jRdMofBAiXmSqqZqI8CTSiN2
 OgYYzaj5Cg7CUn+r2S31ClA460gZ4dkvHFwjpfLEIwb/WVf2kAMpUMAWsi+5Tydj4x
 Nh/TtzDfdK55WHLLxNY+O5tjarroB1CDdJpU1S9WGISW3I9RL333LCPHFgGb29fqHF
 dbWgYQaZBogboZDqgiH/0x+FSQyLXOBV/AlJL26RUht6XZnCGDQTedFM3+BpUqPXG6
 KeYEMLYqX/DYy+62AH9YvN+vLPMlbW3iGngYV2AIXN6lary3MvfQVvBgOvlaVBBLTo
 k3rVFg2kAIvbw==
Date: Sun, 12 Mar 2023 17:45:24 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Tom Rix <trix@redhat.com>
Message-ID: <20230312174524.75e55ce8@jic23-huawei>
In-Reply-To: <20230312161733.470617-1-trix@redhat.com>
References: <20230312161733.470617-1-trix@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, yannick.brosseau@gmail.com,
 linux-kernel@vger.kernel.org, nuno.sa@analog.com, linux-iio@vger.kernel.org,
 andy.shevchenko@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: set some stm32-adc.c
 variables storage-class-specifier to static
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

On Sun, 12 Mar 2023 12:17:33 -0400
Tom Rix <trix@redhat.com> wrote:

> smatch reports several warnings
> drivers/iio/adc/stm32-adc.c:2591:20: warning:
>   symbol 'stm32_adc_min_ts_h7' was not declared. Should it be static?
> drivers/iio/adc/stm32-adc.c:2610:20: warning:
>   symbol 'stm32_adc_min_ts_mp1' was not declared. Should it be static?
> drivers/iio/adc/stm32-adc.c:2630:20: warning:
>   symbol 'stm32_adc_min_ts_mp13' was not declared. Should it be static?
> 
> These variables are only used in stm32-adc.c, so they should be static
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks Tom,

I wonder why these didn't show up in earlier build reports?
Ah well.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to take a look at it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 45d4e79f8e55..1aadb2ad2cab 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2588,7 +2588,7 @@ static const struct stm32_adc_cfg stm32f4_adc_cfg = {
>  	.irq_clear = stm32f4_adc_irq_clear,
>  };
>  
> -const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
> +static const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
>  static_assert(ARRAY_SIZE(stm32_adc_min_ts_h7) == STM32_ADC_INT_CH_NB);
>  
>  static const struct stm32_adc_cfg stm32h7_adc_cfg = {
> @@ -2607,7 +2607,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
>  	.ts_int_ch = stm32_adc_min_ts_h7,
>  };
>  
> -const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
> +static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
>  static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp1) == STM32_ADC_INT_CH_NB);
>  
>  static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
> @@ -2627,7 +2627,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
>  	.ts_int_ch = stm32_adc_min_ts_mp1,
>  };
>  
> -const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
> +static const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
>  static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp13) == STM32_ADC_INT_CH_NB);
>  
>  static const struct stm32_adc_cfg stm32mp13_adc_cfg = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
