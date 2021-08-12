Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B03EAC32
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Aug 2021 23:05:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F7F8C5A4CD;
	Thu, 12 Aug 2021 21:05:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 780FDC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Aug 2021 21:05:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F0D60ED5;
 Thu, 12 Aug 2021 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628802351;
 bh=M7CS3hy5FHYqtbakU+djiQ3z3fJ8w649qJ1OzlO1WCM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BCQbR738Lszwx1ov4c5R8zaN5Ri8aqSPVjYNd2cQKDMnBh4CzrmJi7E5CslVB7Loj
 W2sA+H5km8I02JHEqVABk11+I/15YrnxsRDmbHr8UrCnQz95Yu6if/3fbBkXx93pho
 yZZPywVjsTpcUQUcXBP2fAJzh24MQdgYYieC5EgZnUTcNGfvwvviz2GOI+KnvaQIIN
 Mag2chAFZX1RGtXpTG+cGWhw9NWC7YUODPFVuOjbCXGyk2VjBeKPjpnLJCKTi6edZs
 tSReZ2LYvqNogE9Ebc8Njg3p30t+a6D2ah4fJAkj1+oMB4Hw8+nSXFHSf5QasNhWuT
 tytIbq5O9PRjw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>
Date: Thu, 12 Aug 2021 23:05:35 +0200
Message-Id: <162880206112.1376011.3171809385171083085.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
References: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.15 #1
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

On Fri, 6 Aug 2021 12:58:17 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.15. A small
> PR containing mainly dtbs_check warnings fix for ST and DH boards.
> 
> regards
> Alex
> 
> The following changes since commit 15f68f027ebd961b99a1c420f96ff3838c5e4450:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 57798ff216ebf1145bbbd5ea014ad65a72c1d064

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
