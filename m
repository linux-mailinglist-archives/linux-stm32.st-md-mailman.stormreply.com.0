Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E9946A4E
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Aug 2024 17:13:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 050ABC712A2;
	Sat,  3 Aug 2024 15:13:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA97C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Aug 2024 15:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32B98CE0225;
 Sat,  3 Aug 2024 15:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBDCC116B1;
 Sat,  3 Aug 2024 15:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722698024;
 bh=nm5cQkyRZVUeKzhFs1HWWxL1TF+UFk5CcqlIwj2tOzk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LyEZKGg23ciGyzuv/ViKG+lhWMW0xwIy+G/9YszNWN3e3/W/F4jOsZNhDatR5x1kn
 ctW9Vi0ZMl2+YjV3zUNuubkOpwElaMOFANLliZLNOFNhuwLOGmeOD93jIqe5nsGJb8
 IMxuesWYW/edUDdKv/9t/5yxJrScQpKovDeqkA+TKbenoLSGpnk0BNhQmeVqnBxpMV
 PdxJyYI/76lqYrHQbzUp7cNKeXTGWf0WSjl1+22W4Z3oF5teO7s7bZVOu9QS0bLiUT
 nzrPQ8Wyo+nm2XgsNr3NoPQA5L+R08HaDufq2qIx9Qo0pQ7suvWAXypfk9SE/t+MMo
 stzuZoyndklPA==
Date: Sat, 3 Aug 2024 16:13:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20240803161334.5e627178@jic23-huawei>
In-Reply-To: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
References: <20240730084640.1307938-1-olivier.moysan@foss.st.com>
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

On Tue, 30 Jul 2024 10:46:30 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> The aim of this serie is to add scaling support to STM32 DFSDM
> peripheral in the analog context.
> 
All looks good to me.  I'll leave it a little longer though as
some of the dt-bindings patches don't have tags from the maintainers yet.

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
