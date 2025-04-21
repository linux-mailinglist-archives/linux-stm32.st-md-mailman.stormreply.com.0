Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B87A95012
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 13:18:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3692AC7802E;
	Mon, 21 Apr 2025 11:18:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDF19CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 11:18:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D52684A58A;
 Mon, 21 Apr 2025 11:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45781C4CEE4;
 Mon, 21 Apr 2025 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745234283;
 bh=USOlz+eqtQB3+FtKVUspdDKmHiwUiEaAqh+xoaci2Lo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u+mQihMeljmxRToq4vLWJkTWNB90Va0fKqkBYzu8vYC/MxjJU+CG72R4LBbJjLo91
 BoCMnbHxkzQ4LOxaYbDmIgJ3nuQN1MPCHL8NgOEvFlsGvdRUSoWFv0CfMKT3FZVeL0
 IRECzDhQsSUeucp1L8AUQhNisZ3q6aICkBfUhTkIGIaHjWJFvNa/AAHnTMmqgJn/jO
 psgr+Q6iCj5qDorPs38PyrAyftZMpqSug/e2BC/U96v26UwTTTbEqbWdyW//8Tp143
 bSrG78Fde/w6848U8BZXQom1OxXevS9DAtMMEs8A0QXlLOfFyH8P74CUfbmzAfuOWF
 TkMaau80HEy7Q==
Date: Mon, 21 Apr 2025 12:17:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250421121752.5a7a178e@jic23-huawei>
In-Reply-To: <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, imx@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: prefer aligned_s64 timestamp
	(round 1)
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

On Fri, 18 Apr 2025 18:05:42 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/18/25 2:58 PM, David Lechner wrote:
> > While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
> > I found it very time-consuming to check the correctness of the buffers
> > passed to that function when they used an array with extra room at the
> > end for a timestamp. And we still managed find a few that were wrongly
> > sized or not properly aligned despite several efforts in the past to
> > audit these for correctness already.
> > 
> > Even though these ones look to be correct, it will still be easier for
> > future readers of the code if we follow the pattern of using a struct
> > with the array and timestamp instead.
> > 
> > For example, it is much easier to see that:
> > 
> > struct {
> > 	__be32 data[3];
> > 	aligned_s64 timestamp;
> > } buffer;
> >   
> After sending [1], I realized that some (perhaps many) of these would actually
> be a better candidate for the proposed IIO_DECLARE_BUFFER_WITH_TS macro rather
> that converting to the struct style as above.
> 
> Case in point: if the driver using that struct allows reading only one channel,
> then the offset of the timestamp when doing iio_push_to_buffers_with_ts() would
> be 8 bytes, not 16, so the struct would not always be the correct layout.
> 
> As long as the driver doesn't access the timestamp member of the struct, it
> doesn't really matter, but this could be a bit misleading to anyone who might
> unknowing try to use it in the future.
Agreed.  

These timestamp inserting functions have always been a bit weird. I kind
of regret not just leaving it as a per driver thing to do, but that ship
long sailed.  I definitely want to keep the layout apparent in the drivers
though so this approach only applied to 1 of the ones in this series.

Jonathan

> 
> [1]: https://lore.kernel.org/linux-iio/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
