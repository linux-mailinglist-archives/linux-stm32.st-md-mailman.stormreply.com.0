Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E808C4FAD52
	for <lists+linux-stm32@lfdr.de>; Sun, 10 Apr 2022 12:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4466C6047C;
	Sun, 10 Apr 2022 10:47:24 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1526AC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 10:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649587635;
 bh=Z6/2/nnSkxxUcKhu74YF466O1KxzujfZbQWyYubnQSY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Sn1ycp2W/rpoPkZ8SxAeRsGs9vBrWbT1C/lgveHldaY1JkrIA9KdIOV4lwj5JrXB9
 2F7yqA0G6ENJ2gNOitGBiTG9NQ114nCR774Lsbs4cYaKm4BY5oYM6bCw0xKerAk2bn
 BvbxGc9VWsp4CHtkB8YS+DjjFKClP7DTnkUw6Qyg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([46.223.3.230]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1nINLJ3Tvj-00O0ft; Sun, 10
 Apr 2022 12:47:14 +0200
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Sun, 10 Apr 2022 12:46:33 +0200
Message-Id: <20220410104642.32195-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:HJBFMAK0JfWk5nA9U+NMWUeXctqAt8MuD7XqHlVkkV6Ko0mfc+q
 lElLK5n5asHe+7ROnK1JHV5CVPKuim3JlnzNqB6Nu36ttILYZwNOxSHUJdq3/99qblix4Qz
 5mB6k2pV3zjSmMqPaetu9SZ5SbPEbhyWo1m2bwcjYYqK9dtZ5Enm3EZL0DkrTNLDYvnBcGR
 qqM8AdlS8wBS3SxhinfOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eLGG9ig2nu4=:gxkZ+kk7aI2LDrthqRIqik
 Qg4DJndisPKmEbQW+aveyUBzhZ6MeOrCcTXSd6qegI9k6a0nGgMxGYj4kUIkPVjQ/KqDAws2s
 gnC+L1qoGQK+YMv78fbNAy4JWpUxgPQH8kymPw+XkKGTAsfaXi1eyiwNw3KqHhvLKF2vMzLwe
 GIII+Cn7rq9nRgF8Ilj/BacguUcP9UbhYS4EkLRGcWj6RwAChFKZiZkfkIgQilWwSJZnwQeLT
 k4Kha6iykeP80dsExaGCuXLrrZ1UX0cF2z8JQuVXSpRfqwtfzlpatZJ0qRF6YkQBV9LPZcBuf
 zExX8fNI0x6sMPYHFpyy5FAxTbQ37zij4RQWLj9unEVwlTcetOeH6ZH52ga2RC/Gdwp/wbCET
 8FrfCK6V26mBxujle+jU1DxRyo30eg2PgXAsTF+h5aWKpRDoTxWoz12jFs5dDIXVWON9yYJHp
 ORre2Bjxyl/wjjFdFZUM8mvgNsoypJJvmGi7lnHiA7aOK2wfM0x37SdPhHnWoS39j6/oSLeox
 gi8w2dD+Zjg+XlDLN+iFovzEXwB4yjd6qCYca6C3DpJYv2qXwvMmZWgvL8TO5XwDyH7RhP2KB
 FT9ccd96Lh4n72LRX+mYPT8bSUwzxAsX2MIVxNajvep4j0TzUI1HrGz7T0a+vrJTWstatH+hK
 ElszTX7cEp/fEIp/5Nw6OnjpPonkz/uucOR9ahfRqn0DWtOAo4FaX1hI/DuVMXWS0l2sdb7NK
 0breh6nEg3IPVXG0SvoG88d1EGJPo25P3LJaWNUJO+oYMM4Do1CMwWaAnBNUTitQcn5QENSDd
 Uekb1efbqpQNC2jnrSZ/yPGStYqXoQsxoxbzFgeLo4x/dYINwShQ+EnDuVFImBjwqv7J5H7I4
 fyB4SEsba6miyQkUifmNTIO6URR5HWOjNF4AdRML//ChfTdWa8ago9SkHHtSwNB1WAvGqaBst
 ubxGF3kf9lInl8JTbOhw+NsyoCVxH5qbvzzxygWdCdNrloza+bZCgsv2O+GJ+AjQKHpLQTlVy
 p9vtL1CKDLbz69gPtQdbezi0iVyBWBYMx+zta3kMU8N7H4yXHxGLbXm0mFy2otv3YpJqsA1y9
 ttzdSkt6qnAjcc=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 kernel@pengutronix.de, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 p.rosenberger@kunbus.com
Subject: [Linux-stm32] Move RS485 implementation from drivers to serial core
	(v4 RESEND)
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
