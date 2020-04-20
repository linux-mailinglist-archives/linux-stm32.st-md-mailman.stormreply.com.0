Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBF1B126F
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 19:02:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F1CC36B0C;
	Mon, 20 Apr 2020 17:02:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9874CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 17:02:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.46.94.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2FB820CC7;
 Mon, 20 Apr 2020 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587402137;
 bh=aksiYpWTvag3k42u0M1b1NrjxY8yKocMPEw91TQYxEU=;
 h=From:To:Cc:Subject:Date:From;
 b=bM5TEFM6C5MJE7Kcy6aNRoG0fjnGHLSHqXpkrnuuYUVe4H9Ivr7WigZ0IzlLMZ5R6
 ggHj/GRUmCAAiaBJmz95FdNW6UpXR1wn4Io//QLjuSabgrWzfYKpzwBhnFUWkdRS0S
 7PcmuXjFHlv/Vt6tf5kpQEzocBySnhWsaLV7oqtE=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon, 20 Apr 2020 22:32:02 +0530
Message-Id: <20200420170204.24541-1-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/2] Add CTS/RTS gpio support to STM32 UART
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Manivannan Sadhasivam <mani@kernel.org>

Hello,

This patchset adds CTS/RTS gpio support to STM32 UART controller.
Eventhough the UART controller supports using dedicated CTS/RTS gpios,
sometimes we need to use different set of gpios for flow control.

This is necessary for the upcoming STM32MP1 based board called Stinger96
IoT-Box. On that board, a bluetooth chip is connected to one of the UART
controller but the CTS/RTS lines got swapped mistakenly. So this patchset
serves as a workaround for that hardware bug and also supports the
usecase of using any gpio for CTS/RTS functionality. As per the sugggestion
provided by Andy for v1, I've now switched to mctrl_gpio driver.

This patchset has been validated with Stinger96 IoT-Box connected to Murata
WiFi-BT combo chip.

Thanks,
Mani

Changes in v3:

* Added Andy's reviewed-by tag
* Fixed minor issues spotted by Fabrice

Changes in v2:

As per the review by Andy:

* Switched to mctrl_gpio driver instead of using custom CTS/RTS
  implementation
* Removed the use of software flow control terminology.

Manivannan Sadhasivam (2):
  dt-bindings: serial: Document CTS/RTS gpios in STM32 UART
  tty: serial: Add modem control gpio support for STM32 UART

 .../bindings/serial/st,stm32-uart.yaml        | 14 +++++
 drivers/tty/serial/Kconfig                    |  1 +
 drivers/tty/serial/stm32-usart.c              | 53 ++++++++++++++++++-
 drivers/tty/serial/stm32-usart.h              |  1 +
 4 files changed, 67 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
