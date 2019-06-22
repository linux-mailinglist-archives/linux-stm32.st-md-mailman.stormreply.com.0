Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 954394F4B6
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 11:33:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53FB9C5DBF4
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2019 09:33:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5ADCC5DBF3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2019 09:33:14 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FF7B2075E;
 Sat, 22 Jun 2019 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561195993;
 bh=I0NwKMdM7grA72wdghATYuLC9S2scyeIRrURUSdnpWc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fjYvZv6SCiSgFIbOvVkdSfPQMb3qP+hXn19RP8kVFsA+lDN0AXzmkMQhD7MlJOTjg
 ZkYP+qzVkxjnbrhWrqB/kjGwGGIn/h/kadTwkoc2V+ouCWMCHhhbEr73mbQ7KKrY1a
 yWlr8ul5/WMbgUn74wcqKyiNNfBqiaCvoi1GYyJc=
Date: Sat, 22 Jun 2019 10:33:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20190622103307.50ba052b@archlinux>
In-Reply-To: <1560949431-22948-6-git-send-email-olivier.moysan@st.com>
References: <1560949431-22948-1-git-send-email-olivier.moysan@st.com>
 <1560949431-22948-6-git-send-email-olivier.moysan@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, pmeerw@pmeerw.net,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: adc: stm32-dfsdm: add comment
 for 16 bits record
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

On Wed, 19 Jun 2019 15:03:51 +0200
Olivier Moysan <olivier.moysan@st.com> wrote:

> Add a comment on DMA configuration for 16 bits record.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index d855a605eab6..ee1e0569d0e1 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -918,6 +918,11 @@ static void stm32_dfsdm_dma_buffer_done(void *data)
>  static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
>  {
>  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> +	/*
> +	 * The DFSDM supports half-word transfers. However, for 16 bits record,
> +	 * 4 bytes buswidth is kept, to avoid losing samples LSBs when left
> +	 * shift is required.
> +	 */
>  	struct dma_slave_config config = {
>  		.src_addr = (dma_addr_t)adc->dfsdm->phys_base,
>  		.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
