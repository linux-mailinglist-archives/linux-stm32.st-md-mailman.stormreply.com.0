Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75A14180A
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jan 2020 15:32:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21558C36B0F;
	Sat, 18 Jan 2020 14:32:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A715C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jan 2020 14:32:42 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 046A72469A;
 Sat, 18 Jan 2020 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579357961;
 bh=2gpBuuvhYqy8RvrcBZ6bAFOgb2g6EP4XMMQ95aGZvKA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0GL8Sn03Xa52kpQ5+KYaDSu2O5damtoCfh914pmIzR1RJ0uoqJTGmjBL+smWd3DhC
 eofUbsfz99ZMPKpe1VakxqNVaBnlJwftR+9Mi5ZBF17402M3timem9g35dIx+p+klp
 tIEQP2CwbuYIrNghF2HSrfDv+U2VJ72qZUaMGB2U=
Date: Sat, 18 Jan 2020 14:32:35 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20200118143235.71a67b76@archlinux>
In-Reply-To: <1578921266-6025-3-git-send-email-fabrice.gasnier@st.com>
References: <1578921266-6025-1-git-send-email-fabrice.gasnier@st.com>
 <1578921266-6025-3-git-send-email-fabrice.gasnier@st.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: etienne.carriere@st.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: dac: stm32-dac: better handle
 reset controller failures
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

On Mon, 13 Jan 2020 14:14:26 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Use devm_reset_control_get_optional_exclusive() instead of
> devm_reset_control_get_exclusive() as reset controller is optional.
> 
> Nevertheless if reset controller is expected but reports an
> error, propagate the error code to the caller. In such case
> a nice error trace is emitted unless we're deferring the probe
> operation.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/stm32-dac-core.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 4d93446..7e5809b 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -147,8 +147,16 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	priv->common.vref_mv = ret / 1000;
>  	dev_dbg(dev, "vref+=%dmV\n", priv->common.vref_mv);
>  
> -	rst = devm_reset_control_get_exclusive(dev, NULL);
> -	if (!IS_ERR(rst)) {
> +	rst = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (rst) {
> +		if (IS_ERR(rst)) {
> +			ret = PTR_ERR(rst);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "reset get failed, %d\n", ret);
> +
> +			goto err_hw_stop;
> +		}
> +
>  		reset_control_assert(rst);
>  		udelay(2);
>  		reset_control_deassert(rst);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
