Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF68432582
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 19:50:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA96C5A4D5;
	Mon, 18 Oct 2021 17:50:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EB8EC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 17:50:35 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3B7C61074;
 Mon, 18 Oct 2021 17:50:30 +0000 (UTC)
Date: Mon, 18 Oct 2021 18:54:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20211018185445.3b6d9963@jic23-huawei>
In-Reply-To: <YW2mYKpWSPzGvzUa@robh.at.kernel.org>
References: <20211014131228.4692-1-olivier.moysan@foss.st.com>
 <20211014131228.4692-2-olivier.moysan@foss.st.com>
 <YW2mYKpWSPzGvzUa@robh.at.kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/7] dt-bindings: iio: stm32-adc: add
 generic channel binding
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

On Mon, 18 Oct 2021 11:52:48 -0500
Rob Herring <robh@kernel.org> wrote:

> On Thu, 14 Oct 2021 15:12:22 +0200, Olivier Moysan wrote:
> > Add ADC generic channel binding. This binding should
> > be used as an alternate to legacy channel properties
> > whenever possible.
> > ADC generic channel binding allows to identify supported
> > internal channels through the following reserved label names:
> > "vddcore", "vrefint" and "vbat".
> > This binding also allows to set a different sampling time
> > for each channel.
> > 
> > Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> > Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> >  .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
> >  1 file changed, 93 insertions(+), 7 deletions(-)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>


Thanks.  Series applied to the iio-togreg branch of iio.git and 
pushed out as testing to let 0-day take a look at it.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
