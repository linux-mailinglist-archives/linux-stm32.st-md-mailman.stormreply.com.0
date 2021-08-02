Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877863DD722
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 15:32:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC0F0C597BC;
	Mon,  2 Aug 2021 13:32:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBB53C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 13:32:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1691160FC1;
 Mon,  2 Aug 2021 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627911169;
 bh=puYbUFN+ELiAKsMSCu8aPcfizFvxmdzFc6W44/WcFss=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vLGeUcacjmPVd9Jym1rch+TkjU4x91B0RRSTdk4KGDy3lyfdsRv5fTlnhOVwlPGpI
 GwGL0Y9/aYJztYaf48BAmNshSz7K280mK5Oym6aSLqKdx0ssG/ApceKj3U3akS0d6F
 6TcaC1x/Pga2cLX1tQvgK9b6FFkebuR/m9M1GQbmCu24aDmKWFAwZHxt9t3QuHIOaS
 UtmLF3VDoqAPMV+Aj4eNr5J/D8HxB06z5FS0PmV6wgP3pljvGy5XRx4MIfWHSzCKDj
 V+Cb8ahbrX+qGIiHUigv3/99QCArmz2Ozaf81Pxyl8OoYWlu1DP58iyZ1hoqql47Fs
 dDqSH0bTLRzlg==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Date: Mon,  2 Aug 2021 15:32:37 +0200
Message-Id: <162791113541.1139989.12661940653007966330.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
References: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.14 #1
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

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:58:54 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.14. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b07bf042e678f5eac856052d332869423e365af0

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
