Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F344943553D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 23:26:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A2EC5C857;
	Wed, 20 Oct 2021 21:26:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC887C5C854
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 21:25:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DBD610E7;
 Wed, 20 Oct 2021 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634765157;
 bh=FyjIvgN19cerzRzei6cHIuWikxQhKlEwCYI5A06JPs8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VYg3IsPtDeulwKvrJYgVOANpN52FVCp6PpgkjPNr8yz/wdzla0xnrIhMMyOeYFEbh
 zf9VBaL/hTuwTO17DbojNmyPIh2NZb9BGxlpEiH7CNWgi0kVhvxMHb3llrMcTT1Ob2
 IWqnyU6kmejiin+OgJd3OwOh8h+425E9at6xmKM/YDOjeH75yMQonKV8dfTu0s2W53
 ipU0TPmVm/chw5V/guCHxvsgnNQ7jf3V6h+XHwmOknQH6YGSpnu0inYLa6R+Lch9X9
 NVXoEMp00s4tO4wZ/Vjfv0Uoy/zcuY7S5YTTM1nLGgz8+sHLiJlMpQOSmlTpFAJAti
 RWd4qhXZzGvKw==
From: Arnd Bergmann <arnd@kernel.org>
To: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 arm-soc <arm@kernel.org>, Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 SoC Team <soc@kernel.org>
Date: Wed, 20 Oct 2021 23:25:51 +0200
Message-Id: <163476513253.4063285.3056228321667597294.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
References: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
MIME-Version: 1.0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 SoC changes for v5.16 #1
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

On Fri, 15 Oct 2021 17:16:03 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 SoC updates for v5.16. As
> you'll see it adds a new STM32 MPU SoC.
> 
> regards
> Alex
> 
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 851feb4943ea2a4d2eaf7cc45f0d5b8b73f1b36f

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
