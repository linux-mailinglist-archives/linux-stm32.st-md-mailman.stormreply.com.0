Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA0822557
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 00:02:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45979C6DD69;
	Tue,  2 Jan 2024 23:02:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCDDEC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 23:02:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A93A61290;
 Tue,  2 Jan 2024 23:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C14C433C8;
 Tue,  2 Jan 2024 23:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704236564;
 bh=TRpt+/kCQxAAj+2PRhnf8dKyATkaXO2xGNy9/hzVgqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iIZ9OZIM7lmG+4UIJmU78c1JTd4jB9gEu0EqEd4kjS7gBbYv7QoSzeHoJ2/MjT+As
 CzuOvgXTvvN73qUvzoJN29CiOCCFMgmwViXddmi8J7dAVbT7n2lH0IG+8xxfhqXYxS
 smg9KXsLwV9muB672CEz5KS/pxNqIYXdiFfi5jru0l2nwpZ8p1gvn0AJuQVDs0yNkH
 DqrCSrT6rEdjZC/oe3o2m5WySWC2w/MlgD4qXkui37QvUYW6ToQE5LMY1JBJtBUcEp
 6I6IwDauJdrsa87T699HeHyUaC/BsiFf0wFzE0Hfef9T7q6SNRxp3A0mNZB+DesET7
 nX4Hgni3ykPEA==
Date: Tue, 2 Jan 2024 15:02:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20240102150242.5d556770@kernel.org>
In-Reply-To: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
References: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/2] StarFive DWMAC support for JH7100
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

On Fri, 22 Dec 2023 12:09:58 +0200 Cristian Ciocaltea wrote:
> This is just a subset of the initial patch series [1] adding networking
> support for StarFive JH7100 SoC.

We shut down the development at the end of the year:

https://lore.kernel.org/all/20231205101002.1c09e027@kernel.org/

looks like this patch got dropped during the break.

Please rebase & repost.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
