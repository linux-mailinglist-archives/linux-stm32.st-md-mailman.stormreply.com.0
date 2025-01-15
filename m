Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F43A1339A
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 08:14:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2155C78F84;
	Thu, 16 Jan 2025 07:14:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E30CC78F7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 23:23:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 34BC5A425E8;
 Wed, 15 Jan 2025 23:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C834CC4CED1;
 Wed, 15 Jan 2025 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736983382;
 bh=ntnUUEYRWUl/PgEoKPF65jVBJ8fvSk7zrQV2c99N08g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=UMSKqnyNzlFOwc5UoulfKPqHVtNn8tslfQmIsKWtb66RLPyor/5n4vWyQTByOT7XQ
 i1zai1MPiyStb5PwNcEwlcNMtdMF6w8CyD5o3jLoge99Ob4D+ANQUsZuQyQNJ5V+g4
 hKX8Jy2GrJ1Ck6688jVfiFLNFObbFag9SkSs92coTc2tZVaNbRJExaPLVBWK8+iiC4
 J4KU2ihW69+Iokn+CC4GrAlDI7YBZWaFKQSYIKXpsm2ORYVzeuHVsSF2xQEZgCB2iE
 uITdxPoWedmFeX0XnqyUIB27nd3q6Fa6ZdMHMqljhn+yu3c0dcZXaCF4vauGtHS2+v
 gPUx2nkKe2dnA==
Message-ID: <54dc2e52123267e1885be09fbb91d39a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-Mailman-Approved-At: Thu, 16 Jan 2025 07:13:59 +0000
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to
	access the PLLCFGR fields
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

Quoting Dario Binacchi (2025-01-14 10:19:48)
> Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
> the PLLCFGR fields instead of manually masking and shifting.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
