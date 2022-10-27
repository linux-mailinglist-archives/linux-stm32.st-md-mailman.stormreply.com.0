Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A988610626
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Oct 2022 01:10:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA5DEC04003;
	Thu, 27 Oct 2022 23:10:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 797A8C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 23:10:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D3C95CE2915;
 Thu, 27 Oct 2022 23:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E68C43470;
 Thu, 27 Oct 2022 23:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666912230;
 bh=DJtlW8R7X3gH07Kyv1IwYCt6Y62ulGrlHHPtXSse2F0=;
 h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
 b=QE7c5uQNVVImJ6L/uYRiqD8k2KvcV6ojt3/Ny/IfnNmLEYlFzwqQ41ThiAoPnRyEs
 jVKq5ZrDm3QczAJ0odJqpYU7XrLGMWgpVkxOJZSjmwS0C+tHdlfapRel6fwXvaAZ8I
 7FJ1V/haBz2PpztIl1RQrYjtRN6dOWGdc6uLJ2lBDUe3g3fDXvXxp9uaJmkeblp22q
 nmN4nMZVPDbDz4M3LrlywuZ5WsA4Y2ejLVUoxz9oS5eFqAC9N1NNtxkIs+QS9kQ5mA
 P1Yz/K7ZyAxJQPzXk4182ery3e0UQi1H84J/J+1zffWG5LgIpc4QAJ+fHqCLgD6IZA
 uzlTZ2nyn2diw==
MIME-Version: 1.0
In-Reply-To: <20221021203329.4143397-1-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-1-arnd@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 27 Oct 2022 16:10:28 -0700
User-Agent: alot/0.10
Message-Id: <20221027231030.19E68C43470@smtp.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Patard <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 openmoko-kernel@lists.openmoko.org, Ben Dooks <ben-linux@fluff.org>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-kernel@vger.kernel.org,
 Christer Weinigel <christer@weinigel.se>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [Linux-stm32] [PATCH 01/21] ARM: s3c: remove all s3c24xx support
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

Quoting Arnd Bergmann (2022-10-21 13:27:34)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform was deprecated in commit 6a5e69c7ddea ("ARM: s3c: mark
> as deprecated and schedule removal") and can be removed. This includes
> all files that are exclusively for s3c24xx and not shared with s3c64xx,
> as well as the glue logic in Kconfig and the maintainer file entries.
> 
> Cc: Arnaud Patard <arnaud.patard@rtp-net.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Christer Weinigel <christer@weinigel.se>
> Cc: Guillaume GOURAT <guillaume.gourat@nexvision.tv>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Simtec Linux Team <linux@simtec.co.uk>
> Cc: openmoko-kernel@lists.openmoko.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
