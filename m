Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9CC3094DF
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jan 2021 12:30:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 788D5C5718C;
	Sat, 30 Jan 2021 11:30:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC348C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 11:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6335C64DDB;
 Sat, 30 Jan 2021 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006257;
 bh=lWKyvAttHUJclQA26tKpBDuv/AngcAy6vqDiPCUX2Aw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6YZTlC/Gp10AGRiJwHph/dv+mwNdCWU2pNCmcu/LjNPIJtxNyDV3zD97vp92tTt8
 r5CaMXnAM4flVGDzJorC7taoJH92L3Quhb5vFfR09DP4PkKb9fWwf4iHzANgaE95/E
 himzii7avo23lzaogAcza1vNiGFv4UZD6ZiPepN2nVAEUfnhQmHFYbaf2amlsYLoM9
 DHzUiJWp4sMmrZDJ+maElZB7P7krPyx9g2Tuf+fRp2HFLzY4X1mjeUGWbJ0pril0hD
 /Nww9y1h2ZzJn7k5tSrMZtvSa8cYho7K/ES6ijL62Z77+TeJIs9W7k1r7ec2zSO9/K
 cih/931YCgtuw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Kevin Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>
Date: Sat, 30 Jan 2021 12:30:46 +0100
Message-Id: <161200622954.2192465.3399195515252953534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
References: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.11 #1
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

On Mon, 25 Jan 2021 17:21:52 +0100, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.11. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e6777b8d35dc140033476b8f5ae21e8e5440baea

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
