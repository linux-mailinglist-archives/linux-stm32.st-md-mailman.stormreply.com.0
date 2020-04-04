Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF719E585
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Apr 2020 16:21:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0A35C36B0B;
	Sat,  4 Apr 2020 14:21:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C32BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Apr 2020 14:21:40 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4375206C3;
 Sat,  4 Apr 2020 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586010098;
 bh=7t82RrM++T30E89ZOhG5gQGEdfaKn84+qzeujIakTj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QI1PMeZ4PbbeA6Wp211RM+j9uwqkqCiW+K62B7GHmcRCR47xCrLEsT7epwk6ihJtG
 MFQ7zvLrXbo2RTUlu+V1GeOasysTob31U1wjQEev5A76znjVYIoPRkplJU1+S5/ICE
 j+Z7nCNof353uV40QkmFf7Ml7xGnWS/7PKbb+mKQ=
Date: Sat, 4 Apr 2020 15:21:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20200404152132.62382a66@archlinux>
In-Reply-To: <20200330232115.GA17380@bogus>
References: <1584641907-8228-1-git-send-email-fabrice.gasnier@st.com>
 <20200330232115.GA17380@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: adc: stm32-adc: fix id
	relative path
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

On Mon, 30 Mar 2020 17:21:15 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, 19 Mar 2020 19:18:27 +0100, Fabrice Gasnier wrote:
> > Fix id relative path that shouldn't contain 'bindings', as pointed out
> > when submitting st,stm32-dac bindings conversion to json-schema [1].
> > [1] https://patchwork.ozlabs.org/patch/1257568/
> > 
> > Fixes: a8cf1723c4b7 ("dt-bindings: iio: adc: stm32-adc: convert bindings to json-schema")
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the fixes-togreg branch of iio.git
I will hopefully send a pull request for this around the time
the merge window closes.

Thanks,

Jonathan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
