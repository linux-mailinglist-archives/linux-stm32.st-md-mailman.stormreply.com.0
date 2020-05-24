Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D81DFF0D
	for <lists+linux-stm32@lfdr.de>; Sun, 24 May 2020 15:09:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22FFBC36B24;
	Sun, 24 May 2020 13:09:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BDDC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 13:09:24 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F90C20787;
 Sun, 24 May 2020 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590325763;
 bh=2Yhi6AKFxMkREcrMyAjTyEAf6Iw0DqTol3b+5FGWzSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iWZTut5b8mxLNhLlCnMOxg/R8R2+jNVX9r8MLjATtcpik9eWu58nOyjiWkTIQMpsm
 PZ+70RsULak+qQgaOZEZWwEhK+yyxrOt/BvYWCNtGrI3VU8Cb4QjPS1deZvTckyiHi
 3jNksUCj8e2rkha0ulieGFwr8G1SGc6AiqaAXuj0=
Date: Sun, 24 May 2020 14:09:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Message-ID: <20200524140919.30b63227@archlinux>
In-Reply-To: <20200522130719.630714-1-alexandru.ardelean@analog.com>
References: <20200522130719.630714-1-alexandru.ardelean@analog.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: stm32-adc: keep a reference to the
 iio device on the state struct
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

On Fri, 22 May 2020 16:07:19 +0300
Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:

> We may want to get rid of the iio_priv_to_dev() helper. The reason is that
> we will hide some of the members of the iio_dev structure (to prevent
> drivers from accessing them directly), and that will also mean hiding the
> implementation of the iio_priv_to_dev() helper inside the IIO core.
> 
> Hiding the implementation of iio_priv_to_dev() implies that some fast-paths
> may not be fast anymore, so a general idea is to try to get rid of the
> iio_priv_to_dev() altogether.
> The iio_priv() helper won't be affected by the rework.
> 
> For this driver, not using iio_priv_to_dev(), means keeping a reference to
> the IIO device on the state struct.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

I don't particularly mind this approach, but an alternative would be to
change the callbacks to take an iio_dev rather than the iio_priv()
structure.  It's more invasive though as need to change what is
provided via dev_get_drvdata for the adc device.
It's possible I missed a path where this won't work for some reason though.

Up to the driver maintainers on which one they prefer.

Thanks,

Jonathan


> ---
>  drivers/iio/adc/stm32-adc.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index ae622ee6d08c..7e58c4443e3f 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -171,6 +171,7 @@ struct stm32_adc_cfg {
>  
>  /**
>   * struct stm32_adc - private data of each ADC IIO instance
> + * @indio_dev:		back-reference to the IIO device object
>   * @common:		reference to ADC block common data
>   * @offset:		ADC instance register offset in ADC block
>   * @cfg:		compatible configuration data
> @@ -194,6 +195,7 @@ struct stm32_adc_cfg {
>   * @chan_name:		channel name array
>   */
>  struct stm32_adc {
> +	struct iio_dev		*indio_dev;
>  	struct stm32_adc_common	*common;
>  	u32			offset;
>  	const struct stm32_adc_cfg	*cfg;
> @@ -637,7 +639,7 @@ static void stm32h7_adc_start_conv(struct stm32_adc *adc, bool dma)
>  
>  static void stm32h7_adc_stop_conv(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  	u32 val;
>  
> @@ -654,7 +656,7 @@ static void stm32h7_adc_stop_conv(struct stm32_adc *adc)
>  
>  static int stm32h7_adc_exit_pwr_down(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  	u32 val;
>  
> @@ -692,7 +694,7 @@ static void stm32h7_adc_enter_pwr_down(struct stm32_adc *adc)
>  
>  static int stm32h7_adc_enable(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  	u32 val;
>  
> @@ -715,7 +717,7 @@ static int stm32h7_adc_enable(struct stm32_adc *adc)
>  
>  static void stm32h7_adc_disable(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  	u32 val;
>  
> @@ -735,7 +737,7 @@ static void stm32h7_adc_disable(struct stm32_adc *adc)
>   */
>  static int stm32h7_adc_read_selfcalib(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int i, ret;
>  	u32 lincalrdyw_mask, val;
>  
> @@ -779,7 +781,7 @@ static int stm32h7_adc_read_selfcalib(struct stm32_adc *adc)
>   */
>  static int stm32h7_adc_restore_selfcalib(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int i, ret;
>  	u32 lincalrdyw_mask, val;
>  
> @@ -852,7 +854,7 @@ static int stm32h7_adc_restore_selfcalib(struct stm32_adc *adc)
>   */
>  static int stm32h7_adc_selfcalib(struct stm32_adc *adc)
>  {
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  	u32 val;
>  
> @@ -1228,7 +1230,7 @@ static int stm32_adc_read_raw(struct iio_dev *indio_dev,
>  static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
>  {
>  	struct stm32_adc *adc = data;
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	const struct stm32_adc_regspec *regs = adc->cfg->regs;
>  	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
>  
> @@ -1241,7 +1243,7 @@ static irqreturn_t stm32_adc_threaded_isr(int irq, void *data)
>  static irqreturn_t stm32_adc_isr(int irq, void *data)
>  {
>  	struct stm32_adc *adc = data;
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	const struct stm32_adc_regspec *regs = adc->cfg->regs;
>  	u32 status = stm32_adc_readl(adc, regs->isr_eoc.reg);
>  
> @@ -1879,6 +1881,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	adc = iio_priv(indio_dev);
> +	adc->indio_dev = indio_dev;
>  	adc->common = dev_get_drvdata(pdev->dev.parent);
>  	spin_lock_init(&adc->lock);
>  	init_completion(&adc->completion);
> @@ -1990,7 +1993,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  static int stm32_adc_remove(struct platform_device *pdev)
>  {
>  	struct stm32_adc *adc = platform_get_drvdata(pdev);
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  
>  	pm_runtime_get_sync(&pdev->dev);
>  	iio_device_unregister(indio_dev);
> @@ -2013,7 +2016,7 @@ static int stm32_adc_remove(struct platform_device *pdev)
>  static int stm32_adc_suspend(struct device *dev)
>  {
>  	struct stm32_adc *adc = dev_get_drvdata(dev);
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  
>  	if (iio_buffer_enabled(indio_dev))
>  		__stm32_adc_buffer_predisable(indio_dev);
> @@ -2024,7 +2027,7 @@ static int stm32_adc_suspend(struct device *dev)
>  static int stm32_adc_resume(struct device *dev)
>  {
>  	struct stm32_adc *adc = dev_get_drvdata(dev);
> -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> +	struct iio_dev *indio_dev = adc->indio_dev;
>  	int ret;
>  
>  	ret = pm_runtime_force_resume(dev);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
