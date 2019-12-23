Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E71299B4
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2019 19:02:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F149C36B0B;
	Mon, 23 Dec 2019 18:02:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D73DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2019 18:02:04 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2627420643;
 Mon, 23 Dec 2019 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577124122;
 bh=MLg4g5Ofa/wkZ1A5nGhyBam3JNTaXHswT+qU5Xu90d0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DDBWmD15tYJKGCh8E1rW4nr88u8YLoROxnQz5Hv9+/1+xNjhYJjDOn83dhC0u4ZBs
 AYk2iSXaNzDmzIaq9FQ7GEgiIVseqIC2eL8oWQnldtz7b9MFCYkFdyKc++VLcg0qFO
 FiFmvLk4Iu2v3KVty5JNpy2O76CjLGGcWbEKCmB0=
Date: Mon, 23 Dec 2019 18:01:57 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20191223180157.49b971f0@archlinux>
In-Reply-To: <20191218223032.GA8641@bogus>
References: <20191206100058.26767-1-olivier.moysan@st.com>
 <20191218223032.GA8641@bogus>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: iio: adc: convert sd
 modulator to json-schema
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

On Wed, 18 Dec 2019 16:30:32 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, 6 Dec 2019 11:00:58 +0100, Olivier Moysan wrote:
> > Convert the sigma delta modulator bindings
> > to DT schema format using json-schema.
> > 
> > Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> > ---
> > Changes since v1:
> > - add additionalProperties
> > - remove unit-address in example
> > ---
> >  .../iio/adc/sigma-delta-modulator.txt         | 13 -------
> >  .../iio/adc/sigma-delta-modulator.yaml        | 37 +++++++++++++++++++
> >  2 files changed, 37 insertions(+), 13 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
