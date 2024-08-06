Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD59495B1
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 18:40:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DE15C71290;
	Tue,  6 Aug 2024 16:40:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBB64C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 16:39:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 986A461043;
 Tue,  6 Aug 2024 16:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF5EC32786;
 Tue,  6 Aug 2024 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722962392;
 bh=I9H7A7FupsbFLzyt6LiuEeDW4TvHpRMJlvPZymABxTI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L49ZGAD63IjjcOZfz6f+kmlxItx4dH5ZlZmPRi1pQrD4SFDcuw0rMcQykXH1HlpPX
 LIO+dBTHM5yhS25UTAHWoIBzXC2v7/POfhHmLo3Ob0JO4fbAisiNfeeh6BpZoFwjDl
 8aEsKq3GWz5ioLnQquf1Z6qyBtfakQD9gSeN+4oYJKZ4Y+M4nVCfujcp2TCR6zPjqq
 lAw2PkfFOpB+bYYXHJ6gDxEiC/mrnWCTLfF0gMJno61RMJKquADdswx4rTHbiuTixk
 Uiwly4lKczYfXmp0KXmHaEEg+fRKaWJrM3eWrFBjnbkUMlqO4N1ekG9V0zpjXI6y8+
 AjfLwz8L9W4FQ==
Date: Tue, 6 Aug 2024 17:39:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240806173941.074d37ee@jic23-huawei>
In-Reply-To: <20240803161334.5e627178@jic23-huawei>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
 <20240803161334.5e627178@jic23-huawei>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Nuno Sa <nuno.sa@analog.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/9] iio: adc: dfsdm: add scaling
	support
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

On Sat, 3 Aug 2024 16:13:34 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 30 Jul 2024 10:46:30 +0200
> Olivier Moysan <olivier.moysan@foss.st.com> wrote:
> 
> > The aim of this serie is to add scaling support to STM32 DFSDM
> > peripheral in the analog context.
> >   
> All looks good to me.  I'll leave it a little longer though as
> some of the dt-bindings patches don't have tags from the maintainers yet.
> 
> Jonathan
> 

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to poke at it etc.

Thanks,

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
