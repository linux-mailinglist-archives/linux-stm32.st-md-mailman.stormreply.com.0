Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6032141805
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jan 2020 15:30:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 820C5C36B0F;
	Sat, 18 Jan 2020 14:30:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DD69C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jan 2020 14:30:53 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09F202469A;
 Sat, 18 Jan 2020 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579357851;
 bh=jfvpugoRaJiaAZmEMxDtm22xX+OLmTaCZAns9JDGkys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i0S03MHU7UpyT/JtNyiZqYkXMqCl0L7m3VILZk0LrEsxiEP/h7/21q3ekz5GpRAsp
 VB8BP6+LV0OZh7K0oyrxYE3YrGQRduRgNd3om4/rV1Tf7KqqqUse9g/KcANpAmimS8
 FwPOLxoMebXZ11T9+4dWQ+2ctTmdGV2SJ3dD6caI=
Date: Sat, 18 Jan 2020 14:30:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200118143046.4e6a6b95@archlinux>
In-Reply-To: <1578921266-6025-2-git-send-email-fabrice.gasnier@st.com>
References: <1578921266-6025-1-git-send-email-fabrice.gasnier@st.com>
 <1578921266-6025-2-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: etienne.carriere@st.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] iio: dac: stm32-dac: use reset
 controller only at probe time
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

On Mon, 13 Jan 2020 14:14:25 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> From: Etienne Carriere <etienne.carriere@st.com>
> 
> This change removes the reset controller reference from the local
> DAC instance since it is used only at probe time.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Makes sense.

Applied to the togreg branch of iio.git and pushed out as testing
to let those autobuilders poke at it for a few hours.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/stm32-dac-core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 9e6b4cd..4d93446 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -20,13 +20,11 @@
>  /**
>   * struct stm32_dac_priv - stm32 DAC core private data
>   * @pclk:		peripheral clock common for all DACs
> - * @rst:		peripheral reset control
>   * @vref:		regulator reference
>   * @common:		Common data for all DAC instances
>   */
>  struct stm32_dac_priv {
>  	struct clk *pclk;
> -	struct reset_control *rst;
>  	struct regulator *vref;
>  	struct stm32_dac_common common;
>  };
> @@ -94,6 +92,7 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	struct resource *res;
>  	void __iomem *mmio;
> +	struct reset_control *rst;
>  	int ret;
>  
>  	if (!dev->of_node)
> @@ -148,11 +147,11 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	priv->common.vref_mv = ret / 1000;
>  	dev_dbg(dev, "vref+=%dmV\n", priv->common.vref_mv);
>  
> -	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> -	if (!IS_ERR(priv->rst)) {
> -		reset_control_assert(priv->rst);
> +	rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (!IS_ERR(rst)) {
> +		reset_control_assert(rst);
>  		udelay(2);
> -		reset_control_deassert(priv->rst);
> +		reset_control_deassert(rst);
>  	}
>  
>  	if (cfg && cfg->has_hfsel) {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
