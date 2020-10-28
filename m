Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD329D103
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 17:30:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DBC5C3FAD5;
	Wed, 28 Oct 2020 16:30:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A02FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 16:11:19 +0000 (UTC)
Received: from localhost.localdomain
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4E28247E1;
 Wed, 28 Oct 2020 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603901478;
 bh=Bcg+wKJo6rtReGrEUk8tmH6CZizphpfjXMoWvABxpag=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5T501bSCGF+QUANjeMBwOpujCyHbk71d3gP3clOW3i85A8Y8FmkUdo8d/uSKZK4z
 CcQ2c7hQ9Kh//gXsGKRSBTwOq+g9FDG3dxRK0U7sljMv/dkaIgPAJOTKi7C1VHeHVY
 eh6/loWmNf5ljxNs6gkJA6AxqXV0kIx8w7cHPDds=
From: Arnd Bergmann <arnd@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Marek Vasut <marex@denx.de>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>
Date: Wed, 28 Oct 2020 17:11:10 +0100
Message-Id: <160390142116.3083385.5825045270224124019.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <4ac236b3-b980-f653-f644-53e586570724@st.com>
References: <4ac236b3-b980-f653-f644-53e586570724@st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 16:30:15 +0000
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.10 #1
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

On Wed, 28 Oct 2020 16:28:33 +0100, Alexandre Torgue wrote:
> On v5.10-rc1 STM32 boards cannot boot. It is linked to a change in
> regulator framework which highlights that our supplies are not well
> described. This PR fixes it for STM32 boards that I have on my desk: ED1
> and DKx.
> 
> I assume that same patch has to be done for other STM32 boards, but as I
> don't have schematics I can't provide it. So a round2 has to be done for:
> - stinger96
> - MC-1
> - Odyssey SOM
> - DHCOR /DHCOM
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 01eea23687ed0aa4e251f80ae795fc586e68343a

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
