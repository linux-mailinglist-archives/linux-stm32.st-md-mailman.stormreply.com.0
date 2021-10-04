Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6694207D0
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Oct 2021 11:05:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCC69C5AB65;
	Mon,  4 Oct 2021 09:05:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D09DDC5AB62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 09:05:07 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8E8D380D2E;
 Mon,  4 Oct 2021 11:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633338307;
 bh=SdoqJLKmubUagmXHnGxb49M8Qt5ZdbF/okH3GByeG98=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OOOW3ycLKZ5AX08jBnTL86jvCfKkQr0ebqwxPgZ4DeHeOovbNGxTxxntTlV7YC98z
 evuCKh+s4IIkXABNzj8Q1F2C0GiCQYdS8CBRYF+2B6az6aX6rcIqkM5KHq1PamGgho
 x5Lc0ysBKD7RuPEJsexrVY5tKo/hy/Fy8MeqYTxXucKNuJQnEX6VtUH2N6FmtFAfJu
 CZLNnanNJyERacGXN3o79fj8JyWu0ai+MwRmNNnBRkKfjlO8lyjw59+Ur4sicZUlCV
 CIVnXjYeyLSMMcItYMlDPYMS9bFqt7nrA1hVz+sDXYj5+udmIple9+TpM0j5FBmtoA
 RTNkF7HAQRW3w==
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20211004090304.8984-1-olivier.moysan@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <e8440a2b-521f-75f5-c529-e05c93e9a40f@denx.de>
Date: Mon, 4 Oct 2021 11:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004090304.8984-1-olivier.moysan@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: fix AV96 board SAI2
 pin muxing on stm32mp15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/4/21 11:03 AM, Olivier Moysan wrote:
> Fix SAI2A and SAI2B pin muxings for AV96 board on STM32MP15.
> Change sai2a-4 & sai2a-5 to sai2a-2 & sai2a-2.
> Change sai2a-4 & sai2a-sleep-5 to sai2b-2 & sai2b-sleep-2
> 
> Fixes: dcf185ca8175 ("ARM: dts: stm32: Add alternate pinmux for SAI2 pins on stm32mp15")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Nice, thank you.

Reviewed-by: Marek Vasut <marex@denx.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
