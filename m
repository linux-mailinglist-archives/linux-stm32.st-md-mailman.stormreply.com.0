Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A335207A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 22:15:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1738C57B78;
	Thu,  1 Apr 2021 20:15:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EF61C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 20:15:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87A4B610D0;
 Thu,  1 Apr 2021 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308136;
 bh=fuOqNA8DOJlxAKS6JNMR4tbjB4yQtvLJUcYSsD7dFW0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jlc/GyE6cVAawBfEDAJJRIMlv/fznTzNj9imiymblA8t+SX+cKGCiBC/qgXYOH9oj
 ibXXOAr94VmMFs93lX640srKZvTJrZuU9gcsScJpJSASFkTouyjqeQw3SOTV+NZQ6U
 ogHNwNBVY0w/lpnTh2FDjyf0jpbekbr5Th45QptZ7v3waz+55TmvHHXDjyd63kb3kL
 Ju4x6xzoQ8RqehOHyexDEvkp9vlgBHP1R8vmxa2rpkHBqUcn/hHwNXrz7oIIP+1l5j
 PEol+Q0Kt4l1P25S5toJAMIy5a/5EFY19JKvbH32bnQCPwxTkyFPqMG1yaxRAZZVab
 o3GUdBwMGxnfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Olof Johansson <olof@lixom.net>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Thu,  1 Apr 2021 22:15:15 +0200
Message-Id: <161730808665.655497.4617378835159018275.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <48784f53-943b-0baf-d4a0-fcb7d3849b00@foss.st.com>
References: <48784f53-943b-0baf-d4a0-fcb7d3849b00@foss.st.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Arnd Bergmann <arnd@arndb.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dillon min <dillon.minfei@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT changes for v5.13 #1
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

On Thu, 1 Apr 2021 14:44:37 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT updates for v5.13. This PR
> provides mainly new board supports. A new MCU art-pi board based on
> stm32h750 plus a new Engicam boards family (SOM and carrier boards)
> based on STM32MP15.
> 
> regards
> Alex
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 24eab7796e6f15ea26e3f2a4883e0fa01494819c

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
