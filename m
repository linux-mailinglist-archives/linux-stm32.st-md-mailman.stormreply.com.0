Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E011A7459
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 09:10:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2C91C36B0C;
	Tue, 14 Apr 2020 07:10:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7C0EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2020 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [157.50.0.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CFA6206DA;
 Sun, 12 Apr 2020 18:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586714993;
 bh=KvvVL4O/277aJbdbXBvwqPERBOm9+Bv6KLT8QTuv4zM=;
 h=From:To:Cc:Subject:Date:From;
 b=w+3hJt5/xqWcvDyO97BZEb7+ZEa7zW4Mbf5oiloYlbd4WzthZF/hm1ykeDka3C5w+
 rHcMPFBC82G3Vrd48IF1ABsAKL8i7DaTXzEs2IIKlrQQ+NiD57WKPlUimhh3DR69ZJ
 /QWLrfeWOkTcCxbPXNtaGpeMhV+jg5jDKpp3Dpu8=
From: mani@kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Sun, 12 Apr 2020 23:39:21 +0530
Message-Id: <20200412180923.30774-1-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:10:13 +0000
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Add software flow control support for
	STM32 UART
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

This patchset adds software flow control support for STM32 UART controller.
This is necessary for the upcoming STM32MP1 based board called Stinger96
IoT-Box. On that board, a bluetooth chip is connected to one of the UART
controller but the CTS/RTS lines got swapped mistakenly. So in order to
workaround that hardware bug and also to support the usecase of using only
Tx/Rx pins, this patchset adds software flow control support.

This patchset has been validated w/ Stinger96 IoT-Box connected to Murata
WiFi-BT combo chip.

Thanks,
Mani

Manivannan Sadhasivam (2):
  dt-bindings: serial: Add binding for software flow control in STM32
    UART
  tty: serial: Add software flow control support for STM32 USART

 .../bindings/serial/st,stm32-uart.yaml        |  15 +-
 drivers/tty/serial/stm32-usart.c              | 143 +++++++++++++++++-
 drivers/tty/serial/stm32-usart.h              |   4 +
 3 files changed, 155 insertions(+), 7 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
