Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0AB386
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 15:08:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98348C35E08
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2019 13:08:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46D6CC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 13:08:48 +0000 (UTC)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4745E208C2;
 Sat, 27 Apr 2019 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556370526;
 bh=jnM29zihc11tw81fyprayFzfy6HR3G1+ASCKRlaGmIs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qJiuiipfOPiLp/ykpz8Fkv25u4WxlQUI9m3oqzrpZOVw9/xJY+M68FkZ/daQHCsh+
 M/4nS3olJgIYBPhut20Pt3e7pQWLp7v3VN++Xu6gRPiew2j0dPZPj4LlEF/4tEDZ3c
 WXMDbv3W8UR4UGwg+LT6nuREnmGOHthrT00jETj8=
Date: Sat, 27 Apr 2019 14:08:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190427140840.38acb922@archlinux>
In-Reply-To: <b53b8078-e5ef-1b38-771f-3e34d387c790@st.com>
References: <1556110286-1526-1-git-send-email-fabien.dessenne@st.com>
 <1556110286-1526-2-git-send-email-fabien.dessenne@st.com>
 <b53b8078-e5ef-1b38-771f-3e34d387c790@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] iio: adc: stm32-dfsdm: manage the
 get_irq error case
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

On Wed, 24 Apr 2019 14:55:09 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On 4/24/19 2:51 PM, Fabien Dessenne wrote:
> > During probe, check the "get_irq" error value.
> > 
> > Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> > ---  
> 
> Hi Fabien,
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan

> 
> Thanks,
> Fabrice
> 
> >  drivers/iio/adc/stm32-dfsdm-adc.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> > index 19adc2b..588907c 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -1456,6 +1456,12 @@ static int stm32_dfsdm_adc_probe(struct platform_device *pdev)
> >  	 * So IRQ associated to filter instance 0 is dedicated to the Filter 0.
> >  	 */
> >  	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		if (irq != -EPROBE_DEFER)
> > +			dev_err(dev, "Failed to get IRQ: %d\n", irq);
> > +		return irq;
> > +	}
> > +
> >  	ret = devm_request_irq(dev, irq, stm32_dfsdm_irq,
> >  			       0, pdev->name, adc);
> >  	if (ret < 0) {
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
