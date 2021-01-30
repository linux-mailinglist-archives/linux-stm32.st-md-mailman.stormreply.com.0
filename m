Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A72403094E7
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jan 2021 12:34:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C962C5718C;
	Sat, 30 Jan 2021 11:34:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 385E1C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 11:34:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E526364DDF;
 Sat, 30 Jan 2021 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006460;
 bh=Q8F+qBTC0HQUUMOXQcmJvGqSdv+trzUZuSsMttv4SD8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qczh69jq/uvFak1dNS3kcSWUEnRWIVV/P7VDb8Gtd33FkxB31gXXgKx+zH2n1c8cL
 9UbB4S8xVUz9iN5G+SsPxZBmQSCDvcRpkHmU3uKEhhlnr+v08IILtt3a6NVNH8sZpN
 wbQvHieUwtlGJtCFp5sE5lDrtXu0NUa360jeom33/lZNzgvVNNiPwsgbK5Li7XCRsr
 nqeqD0xNpNCCs8FKJGp+1Tk+60/tZbmMsgUOoUKDxMK8SevH4GHcqntBAOjvKSDflb
 6plIRgvH9PzmWf71+3ew6pcgvg/yjQgplE+clWdhnU7ctM6ALc3eiLZAZPCU3d2CP0
 4LhHqs4DuOe+A==
From: Arnd Bergmann <arnd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Date: Sat, 30 Jan 2021 12:34:08 +0100
Message-Id: <161200641681.2316427.4971661443078699062.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
References: <5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.12 #1
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

On Fri, 29 Jan 2021 09:42:37 +0100, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.12. As usual
> main changed concern MPU part. Main changes concern DHCOM SDMMC1.
> 
> regards
> Alex
> 
> The following changes since commit 83d411224025ac1baab981e3d2f5d29e7761541d:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 86a24899c2dbf12a6ce80cc48eea48ac60d053ce

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
