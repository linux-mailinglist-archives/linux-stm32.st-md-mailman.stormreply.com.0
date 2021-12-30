Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F3481E52
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 17:45:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CE32C5E2C5;
	Thu, 30 Dec 2021 16:45:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58122C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 16:45:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9ACBB81CA8;
 Thu, 30 Dec 2021 16:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA4DC36AE9;
 Thu, 30 Dec 2021 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640882736;
 bh=kdssX1byXxDeDWcE2+JpAQwaEjllqvPxeFbjcqxyKuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfVYl6pPHWLruTmlhVrgr4GdkrFUU8Felvxf5zxVCjLfhmZVqAhgQeOlJbl3kKuUL
 wiCseSwR5Btl1bKASzhEJ5fqZwEe7SOxg0Wg7sVvXA5m5LLCfkOqREOo5aB2FlPD0Q
 gZFsvDyxOTQaBpj4LnoUfM8WB/+1naA/yILoUg84=
Date: Thu, 30 Dec 2021 17:44:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Yc3h+fROLZwTFoOU@kroah.com>
References: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 David Lechner <david@lechnology.com>, Raymond Tan <raymond.tan@intel.com>,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Felipe Balbi \(Intel\)" <balbi@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 00/23] counter: cleanups and device
	lifetime fixes
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Dec 30, 2021 at 04:02:37PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Thu, Dec 30, 2021 at 02:19:25PM +0100, Greg Kroah-Hartman wrote:
> > Please rebase and resend the series against my char-misc-next branch.
> =

> this series is just v3 taken via b4 to collect the latest acks into
> account and then rebased to Greg's char-misc-next.

That worked, now queued up.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
