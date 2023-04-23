Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8BA6EBF85
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Apr 2023 14:44:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5864BC65E70;
	Sun, 23 Apr 2023 12:44:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BC62C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 12:43:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A952E60DE5;
 Sun, 23 Apr 2023 12:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9619C433EF;
 Sun, 23 Apr 2023 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682253837;
 bh=ghEZ8PCdNUx1N3sL+g/P3RbX4qjb4FxNdoTBi3lckV8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u34JVo3WomZLACqYBj95p4PSR/OXsS1M4kI3IPNuNV3wsXmjrtDabFjozJyAQcqZx
 pQgTSxAWdcleRlJsTMYbKaN32uHhDIyLVNOU2d6TsL/JTENgFlIDPilnqOHWkXWgew
 jpZ1/bneptsoSK6jsODJgNa7vFY6EGnFF+m/ElfS1qKS8s1j070Y3F2XCsXquJi/Ip
 xyCvls9DQxmEGf5yPYLxUTEkImFmGtfaWa08As5YA4902ECBhL0WW+l5HojylDulvQ
 9YU2Br6/Ug8/gJQYM+a4pm7zfS3lonVa7FhpdpqFbCkTX1FeEX6szOCzl5Nu0mo7JL
 aNtOoi9hg3V/g==
Date: Sun, 23 Apr 2023 13:59:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230423135933.2dfb540b@jic23-huawei>
In-Reply-To: <20230421083858.2613289-1-sean@geanix.com>
References: <20230421083858.2613289-1-sean@geanix.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
 linux-stm32@st-md-mailman.stormreply.com, nuno.sa@analog.com
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: add debug info if
 dt uses legacy channel config
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

On Fri, 21 Apr 2023 10:38:58 +0200
Sean Nyekjaer <sean@geanix.com> wrote:

> Since nearly all stm32 dt's are using the legacy adc channel config,
> we should warn users about using it.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
This is far enough (I think) from the code touched in the fixes
(I'm waiting for review from Olivier for those) that I can merge
it through a different branch.   So taken this one for the togreg branch of
iio.git - initially pushed out as testing for 0-day to take a poke at it.

Thanks,

Jonathan

> ---
> Changes since v1:
>  - Changed dev_warn -> dev_dbg
> 
>  drivers/iio/adc/stm32-adc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 1aadb2ad2cab..e179b6611e4d 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1993,6 +1993,8 @@ static int stm32_adc_get_legacy_chan_count(struct iio_dev *indio_dev, struct stm
>  	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
>  	int num_channels = 0, ret;
>  
> +	dev_dbg(&indio_dev->dev, "using legacy channel config\n");
> +
>  	ret = device_property_count_u32(dev, "st,adc-channels");
>  	if (ret > adc_info->max_channels) {
>  		dev_err(&indio_dev->dev, "Bad st,adc-channels?\n");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
