Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B36894C613C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Feb 2022 03:40:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 550C4C60495;
	Mon, 28 Feb 2022 02:40:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33798C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Feb 2022 02:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646015990;
 bh=V/wGp+G2pTyXDb4+jdBY8qODO5TCY8jft6x/5fyt1MI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=MuHRnmktUX1JB7Kzq2uXcT/BLonc7pPkW1eropMd8wlVp5ZsGsh6+w4rgOzShZYNU
 ach0CN12vdx8sVc/3mu0oZyJxLuBYLxM9RYvhQwwOUy5zDArvttWGvj8B05AWL4Vt8
 9nnZXE1jEw8cDZLWGVqesTQDL5083pjTbToTltCQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1nbUDx1ry3-00O1Tz; Mon, 28
 Feb 2022 03:39:50 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Mon, 28 Feb 2022 03:39:19 +0100
Message-Id: <20220228023928.1067-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Fd0ako0QTKO8TY2IaGJzF0tKjpC3R3VaGpiLtXqHh6ESVFhyIJ3
 vdEnDEx9TLif8A1pKe5zI2v+rp460XCuRZQ33h1Jr0Ouf1RLt25hWh8aUqd05470v5qZRqb
 llyQCTDfG5m3IK4T9tI1GrnQltF56Am4n3S/WMAC/hxWGmrwBiuyCkSC6HkaumeB2DuFJ5H
 Xh1CGOoapemzcPa0LHD9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YIy7rX8/a/A=:EFNEH3QlzSe5A3O9XR6qYL
 WpKiT8W8rIvZ7HGI500FaIh6yMRxj07sgI2WzsNW9P5jeFYopkmY/VwMTSPQVnKPSL3DnyNn+
 IbIUZfsd1uG6iYAAV9TXlHWio0vBSl8M3YXsRxpWYmmSrLIi9emyiuJkhewzXsOpcwW9fvU9X
 qH8GszlmTaMX3fZMQdJAsKlMXHR57YqqVcfKwxUuX/sGwwe5TG4VKDM5tOK/nmn1J5rj+vZyn
 vg7MzHoZX2ceWPvBEPRgc5eTBBcimVUN0njogtU3udj3VQJOf0r9qLMYYJLMemkbh9BXk0Rzs
 iBogRNB4USr5QmwGpbmSN4MudUZ5gvX2w/CUWS22AcqocqR5C51IepzzYa3JTVjMmHVzhSUda
 +QbPaSARKSWT5AkgLhdba1G5GE2+rUKmZobTKyeszWMmJVSAlWEhs7pixy6J14dEpC5T3xxE0
 lnZVRmE5VfB6RtxXUOm/UY09GK8B52yg4GHoAlcDqtdqMCOnJDNquXcgwMBYXq29rBT676Oy8
 P+tlKHQBNmpSDc2IzmxlBIQzikX2jbjw3m3Qj9CIQlDgEcSw1UkLHDOjiEV3dl3ED4sHCKfWm
 X1K8M/8i4nN0N4Hkc20ihbSyDhBzNSmxFv7E4BbW5hzcbZnqK5nCieZgeIRsTx2aTWjbcOHq8
 7RbPdeYzXSVWRrfr453PdXahsjkPqPPRA3CGn7ovoRCZbOWSbSM/CevplCuJPcheaHN8FXGE5
 ZcvYkv3LizNPId3Q/Muk3fOoN1WO31O1VgHgOux2ttHP4ZOb/Y0+1qm87C20eq26rHXEwPwpu
 3kokKiiu0+2SQmvB68CJreoOlK6Brmv6yaubvCjZfggLpNxVxBvYkuqAPwxdWKb5XCFUCHu7g
 fKCaKgNeBwPrlMGpUht1bFu0SgIIFAyiOAwk7hU/fpSXzUnPKltV9/Ubj2uo39IKx/wDr5xLD
 Jy87Dx+EPKc9pDhYrwuUupX44vmLNgrnf7yVfe3+JLikbzMzoHZY0Phnd+12kSipYfRFoK1UA
 SzefRACCzuAsKXL4AYbnDDMLh/jVxK2ebplBvL8KiLToYEsuFKMLEdqQDgnHNth3sQj8EkJp+
 p04qCeNe2e2FDQ=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] Move RS485 implementation from drivers to serial core
	(v4)
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

This patch series is an attempt to simplify rs485 implementation in drivers
by moving the following tasks out of the drivers into the serial core:

- ensure sane RTS settings: in case of an invalid configuration (both RTS
  after send and RTS on send set or both unset) enable RTS on send and
  disable RTS after send

- nullify the padding field of the serial_rs485 struct before it is
  returned to userspace

- copy the configuration stored in the serial_rs485 struct to the port
  configuration if setting the configuration in the driver was successfull

- limit the RTS delay to 100ms


Redundant code has been removed from the following drivers for now:

- atmel
- fsl_lpuart
- amba
- imx
- max310x
- omap-serial
- sc16is7xx
- stm32-usart

The code has been tested with the amba pl011 driver. This series applies
against Gregs tty-testing branch.

Changes in v2:
- use a makro for max RTS delays and comment it (as requested by Jiri)
- add a comment concerning the memset of a structures padding field - correct
  typos in the commit message (found by Uwe) 
- rephrase all commit messages to make more clear that function
  uart_set_rs485_config() has been extended by checks and other functionalities
  (as requested by Uwe)

Changes in v3:
- add warning messages if the serial core corrects RS485 values (as requested by
  Lukas Wunner)
- dont expose the macro for max RTS delays to userspace (as requested by Greg)

Changes in v4:
- use ratelimit warning messages and also print device, uart port name and line
  (as requested by Jiri)


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
