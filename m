Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1119E570
	for <lists+linux-stm32@lfdr.de>; Sat,  4 Apr 2020 16:16:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ABADC36B0B;
	Sat,  4 Apr 2020 14:16:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E27CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Apr 2020 14:16:36 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C91A0206C3;
 Sat,  4 Apr 2020 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586009794;
 bh=jYh8ojEfBjWhcionJm7bLgdtcMaLtTKw3IPbO1FXFv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RqPr8qa75t3W6KS03U5hHpDlF4XP2X6lqAjJCAFU6vIZPD1LrQ++H9BcAGdjGxrPr
 DUkJVaLa15/fM9zucspy/AP1uQhw2WVq2t6qELZKy1M8Dge7qhAnEHiD845ewQntin
 poTmrHUrLuGuNa17buSgeJ0Jyk7IBoylskKvq704=
Date: Sat, 4 Apr 2020 15:16:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20200404151628.52576e43@archlinux>
In-Reply-To: <20200330232040.GA16570@bogus>
References: <1584639983-31098-1-git-send-email-fabrice.gasnier@st.com>
 <20200330232040.GA16570@bogus>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: iio: dac: stm32-dac:
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

On Mon, 30 Mar 2020 17:20:40 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, 19 Mar 2020 18:46:23 +0100, Fabrice Gasnier wrote:
> > Convert the STM32 DAC binding to DT schema format using json-schema
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > ---
> > Changes in v2:
> > - Fix id relative path/filename as detected by Rob's bot
> > ---
> >  .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  63 ------------
> >  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 110 +++++++++++++++++++++
> >  2 files changed, 110 insertions(+), 63 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to poke at it.

Thanks,

Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
