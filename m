Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA504EA7E7
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FE8EC60467;
	Tue, 29 Mar 2022 06:33:00 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26D30C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476006; x=1680012006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=ZbRv/twRm4kA9xCGu4gpMNUovCtrBxQMre8O78UsqzArEN65ExYH5OnT
 p35CVjpyeybkqQmfpVUMRXs1KG8d/OBciqNLtg9VAbA6VnWLMCyUPAiOC
 emmSSf2V630MO6tIgvKN2uu2IK6wIoL54a6HHzlIv7VQnG23ygEAw1dSI
 TTSUQJAD2CN6uOhlxaRWaAq/ij+NT7L4RGFS0MZ0HQ5gKsrV+5B2K6AKJ
 VV8DK/Oa6X/UN13vhmvZWZZw+e8SFYMBxBgH7fqpSE5RjdMJ5bMPEy0Sh
 9Tg//0dxy63pJQvoF4s3sT1or4UIFNBtDPSl4sOK2jhVSwJ7yz2NBkHPy g==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935295"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 28 Mar 2022 16:00:05 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 28 Mar 2022 16:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1648476005; x=1680012005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayM215iKfS3RVxHHf6+6kiEWl9gC2cMSZOj/C1/hktk=;
 b=WuV252Nu+GZzN74VzCmlspBKd0dca8X2+xSzsUDOC+VBkSdAcRJKkpz9
 V6ZhUvtyzJXo40EU/KoKsnsMA+udDgpFrmJjA0OOrI8Du6AE/IqQXvbD0
 l7/oi3cIclt6kdqSsBk62dD3jTXzpYH4IITmDIWCq1j5VlQdR/7ht0rkB
 UzXa+gf9sB2fMmE9Y4BJg30hxvVMBs2s+cV3pKJsYN741b+m12/z4LAVK
 Ghd0BfGmPSMkfRYy9LlDPSTztxPRWJXf02LYJ3AALa7lqL+bNoPBea5QD
 q3OLZ+wYdDSKr/JtyC5EC84xkLnc6lGkLWsLSzPCKdl/McKEhN7OLwWQj g==;
X-IronPort-AV: E=Sophos;i="5.90,217,1643670000"; d="scan'208";a="22935294"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 28 Mar 2022 16:00:05 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 20160280065;
 Mon, 28 Mar 2022 16:00:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 28 Mar 2022 16:00:02 +0200
Message-ID: <2100132.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Mar 2022 06:32:58 +0000
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>,
 linux-renesas-soc@vger.kernel.org, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-oxnas@groups.io
Subject: Re: [Linux-stm32] (EXT) Re: [RFC PATCH 0/1] Categorize ARM dts
	directory
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

Am Montag, 28. M=E4rz 2022, 15:21:08 CEST schrieb Jonathan Neusch=E4fer:
> * PGP Signed by an unknown key
> =

> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally
> > categorize
> > the ARM dts directory in subdirectory for each oem.
> =

> [...]
> =

> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> =

> Nice idea, thank you!
> =

> A few notes on categorization below.
> [...]
> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> =

> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.

Please don't mix the names for arm and arm64. It's very confusing if the =

vendor directory is named differently for each architecture.

>[...]
> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> =

> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.

This seems to be some generic devices common for all ARMv7M CPUs used in =

Cortex-M CPUs. It's also used by some stm32 .dtsi.

Best regards,
Alexander



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
