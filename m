Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0E14D17F
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2020 20:55:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2AC2C36B0B;
	Wed, 29 Jan 2020 19:55:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87D93C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 19:55:41 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A37912071E;
 Wed, 29 Jan 2020 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580327740;
 bh=fwWGUU+gCrYf5nvq9LL1bXiyrYuy3gLMO1C6gOKMELw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKAFWRMXC5sFkVi9wSEqhp4wSayQhd4uCHnel0IrA3KHEABvPqvWs2Ey8MtKgKCqa
 aLuwMBtpyNXQpdgFqhEB8MENWERbBoZYRvEVoYzSOV1I3SCpPXz2VV9FLKcFVsv7Zx
 AxVfYAHuqsnLp/AhkYSTeZryoQamIpGe5OMTbuWM=
Date: Wed, 29 Jan 2020 19:55:34 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20200129195534.63a20b21@archlinux>
In-Reply-To: <20200121231309.GA17359@bogus>
References: <1579095941-18648-1-git-send-email-fabrice.gasnier@st.com>
 <20200121231309.GA17359@bogus>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: iio: adc: stm32-adc:
 convert bindings to json-schema
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

On Tue, 21 Jan 2020 17:13:09 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, 15 Jan 2020 14:45:41 +0100, Fabrice Gasnier wrote:
> > Convert the STM32 ADC binding to DT schema format using json-schema
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> > Changes in V3:
> > - Fix minimum and maximum syntax for uint32-array properties as pointed
> >   out by Rob.
> > - update example to better show this syntax e.g. st,adc-channels = <0 1>;
> > 
> > Changes in V2:
> > - Take almost all of Rob suggestions (removed reg generic description,
> >   added minItems, maxItems, st,max-clk-rate-hz range, drop some pipes,
> >   simplify clock-names, remove unneeded allOfs)
> > - For now, keep all in one file despite there are lots of if/thens in the
> >   bindings
> > ---
> >  .../devicetree/bindings/iio/adc/st,stm32-adc.txt   | 149 -------
> >  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 458 +++++++++++++++++++++
> >  2 files changed, 458 insertions(+), 149 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
