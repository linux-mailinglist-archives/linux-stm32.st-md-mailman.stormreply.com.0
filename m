Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AC14B6B27
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 12:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283FAC5F1F9;
	Tue, 15 Feb 2022 11:34:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C278DC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Feb 2022 22:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644791284;
 bh=VMbcSuC7p0n3hqLa0/U0n6fD5g5ZwGHCadLUz5+JSTo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=jehhaWYglRmmUxbESbfmnG7Gl1WBrF+wlKpKoCzwIqXoVc1ClFyYw3+Fb2Hf1VhbP
 fybXfsXUmIuh1X69cien5CxJ2Zgtmk5wdswcaozKcYiPCN56mH5j1lsa8DhQUVEXS2
 FdlGzTZtPf/+8xNAEAKtasGVr0h6DEt/Z17rvOEM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1nsR3E0FLk-00ZMLp; Sun, 13
 Feb 2022 23:28:04 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Sun, 13 Feb 2022 23:27:28 +0100
Message-Id: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:s913s5qBkaysiWGAuTn1tH4rldqCkA6d7se/P2ylN3mokt+xD8S
 sWBy0zVPYNQoU7I5IuAbAnIHu4ZJq6FAUSC/Ftgs5OCVQX3xWB1TqbbPkjC1JvtxaMcQeyK
 sWTz3APtcttuWfM0F5VNYEt24Mh3amfwKpEB0zF/GDX+C6U7t4EWr+BcLN4Ar+/BSCwR7FD
 5/u4lZj16gv24srLDYYKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M8VF88O1Ql4=:iv7XomjXUXLf/Tb/pRttb3
 gsdZNHWr5av8EBV+cPJC9PLg5GtBuE3tf0//WWmREwM7RSz/DFgWSkZ+4+TSl+Tf6+tE84Oo6
 TUeVSVowivRsH94agVyvDP1vxb0dw1iP/v97bih0Qd9l4Km8Cnvp9D0tEi5qHm6uMJkv3ERH4
 xgCjxqpo0RuCek/xfDvXRBj1asmkP6wIMnp9cYoWasrxehcbqQLQBXBWhNzHq3jWSRz9W1AXz
 6OYAWFDv97UjDVDWfetGU2JtUwek8OmnTbRV/GP6vjJOpJx1qqym8Xt4tt2Pb9fGkfvusq0ii
 qlCh3xK97d+QiVaA/MqN0Ehe/iaOKLZ4A4qI6LCTW1poWBC345yhvaz+lwEFnoLFcn+JIrBMY
 7E3OeyIPTQ8CcBECK6TeelaDOnoj7C+JEFllmvDu4l+J0ULkVPSu2v6LkxRUDrOXnegvw/f30
 hzf/oSefCZridh7Iu4qu9BDg0B1u1aIrCNwvoylC1t3poAlEva1neBkmxopxjEDtLPlp8AoBH
 qz/YUQ8/5spbjELj2JlAjQFx4fBHr5clKpQ1TCBK3D1TBeQTYqJPQgnEmPBdU3u46FhSm05dW
 AsPFoFD/uSi+1JTfrmv6y+IVfEQu8sus3INldFBCf3aTM8Btj3E2vqCqZY8gVAflrcPqoye7u
 UkaeCPj3l+7XY/WOrremevMkjCm3UldjWeWOjT662Qx8yXg5S8aDo/M7Me4WotPd52cUuUtKM
 6jdsVxpBoC97sgYzwPP2MPKjVDkehsXdo6Fv7nnEaIdqvNeWHOpOpAnicfRI5J0gMHUjq8iYb
 bi5bOAS9TL/upLb/r3ZI80FPLp247+eEKL7HFdQ6aeaALMePVhiHWookz/EGhylvqt/Pyphht
 ZzMmUYTT5FBJoUystMo+zYP1mGJZSqBPiuVWGBmNe4HyJXsdaXymsZPJGqKfcYuvoX86nqOvw
 0TDRgBSkDFjR3j/sIlEQvBomP7QZZ5esDXA5IFiyOD5WEmQ341DzOlbH1tSA3ePfXRL6E9g1z
 45p28V1dkgaBps1j5f60z2oC74ViV1EvILS66Tr7EajpK3PjLeSovtcrkacnrksb2pZdfzZzl
 dceviaVdpK/g0w=
X-Mailman-Approved-At: Tue, 15 Feb 2022 11:34:11 +0000
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] Move RS485 implementation from drivers to serial core
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
against tty-testing.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
