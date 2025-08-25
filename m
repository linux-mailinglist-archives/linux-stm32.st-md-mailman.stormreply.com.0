Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57781B33817
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 09:48:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A46C36B1F;
	Mon, 25 Aug 2025 07:48:35 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CA48C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 07:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756108093; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Mif53jBa6MJhiFA3/aeaKEpanFEPOgAIH7H2ZuUdsrAtRPu/MgbOT3DP6FBY2rj6ePbMjSECj12yIiQqzo9EC3onYNcemMOPA7kexfcK9xKDYPuR6j4sRJVelnLZBLEQG0X38Apa47eBKSzmFFuNz9vrZ2uFGldXO/K346zQY/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756108093;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=; 
 b=hTrQDB+vFRUoh2TzCLNct7ZH6mA+ZiLxyi08MHJ278n9kJefJSS8W0fZv6yV5vnJvzDAcQZhLzydoq1k/A5PczB6y4tbslyaC/qdgSZhpG/4L25+svqU468G3JXb+BZHKPSOMfmr/+kta3MYdiQArODPHxGvpuzc+7VGFRmUwYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756108093; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=80dzrh8aYZfGg2XUHBNmSgUetz0wp59La7rrflIHLYk=;
 b=F+CZpcEHNCcVVD5E2eusUhfW3VOUS/ZWUIpDXxI5z5QeKjtOV9RCcGxyZ/bOxE14
 x+XVoB1b6xaPLKM4peUQofBqgx8GIHy0CMMo5WJvpvX22tuJAS78545/+5x34SM4fh0
 HU9zR45BRWmSNqHl8sXRyIGwQroD2o9wsHxVH/9U=
Received: by mx.zohomail.com with SMTPS id 1756108090913704.2939268893988;
 Mon, 25 Aug 2025 00:48:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 25 Aug 2025 09:48:05 +0200
Message-ID: <2795210.mvXUDI8C0e@workhorse>
In-Reply-To: <175340605069.3513.18204498860033427106@lazor>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
 <175340605069.3513.18204498860033427106@lazor>
MIME-Version: 1.0
Cc: linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 19/20] clk: sp7021: switch to
	FIELD_PREP_WM16 macro
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

On Friday, 25 July 2025 03:14:10 Central European Summer Time Stephen Boyd wrote:
> Quoting Nicolas Frattaroli (2025-06-23 09:05:47)
> > The sp7021 clock driver has its own shifted high word mask macro,
> > similar to the ones many Rockchip drivers have.
> > 
> > Remove it, and replace instances of it with hw_bitfield.h's
> > FIELD_PREP_WM16 macro, which does the same thing except in a common
> > macro that also does compile-time error checking.
> > 
> > This was compile-tested with 32-bit ARM with Clang, no runtime tests
> > were performed as I lack the hardware. However, I verified that fix
> > commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
> > is not regressed. No warning is produced.
> 
> Does it generate the same code before and after?
> 

Yes, the generated machine code is exactly the same, at least with
clang, and I'll assume it'll be the same for gcc.

Kind regards,
Nicolas Frattaroli


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
