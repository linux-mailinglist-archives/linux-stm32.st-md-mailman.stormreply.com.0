Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBF4B7BB0
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Feb 2022 01:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1B41C6046A;
	Wed, 16 Feb 2022 00:18:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B97DC5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Feb 2022 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644970718;
 bh=qCM/tv58byTKuTfcOO+5ZjAIYqyDsU/7yoiNZduPVbc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WqvGICTlO3QdrUi5MQ+zmFBuFLCQuHxsrFFnXwQ83v7S9qtTnarhV/KZ5qbNirRzp
 1Z4dsWzpe8DWJQMJOk5h/gpkQbom8kgZQVmdNZTkEwIRfukIMFnz82oQrbdYbGJJx4
 m12Xpz1XOFaeVipiezQgVpOxxEKfyNloiPpvPfYc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1nSPlY1DnS-00AaBh; Wed, 16
 Feb 2022 01:18:38 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Wed, 16 Feb 2022 01:17:54 +0100
Message-Id: <20220216001803.637-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:WAOnSBoen9V/5Ruce80Stg/qtCneLtlKhs4Efq3WOPNDl9vx812
 AjuNO6OVHB2qpJEhdKxARvGUBboW4QwT5JUbhIiKm870Of0oy1PrPKv11/BYFNHwFMcF1pK
 oXTiRPgTtBfY4hf10zi3f0WB134p6/jo/q09Yw+j1Cn8cFBywvpbxiq0Hsm0RZKnU9u6nNU
 0wzqd8bqcWglo34rlg9xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WciePH+zpns=:gVp0/EQtHdBFUAPDyztL58
 a+fRvQ8NtE/l5J+sdgdB/sIa8fYt2DvHdovXuAAL4L/Vka5J3GCXVWMmHYIcCBxP+PQ5cxAk7
 AfqI3Uld9xebHbosEKWVLnhKdM97q35K66UWrZJedNbjhlFZH+Bv7o7X/aPNOj2Bfm+iu5gCo
 /jFPMs7kLFh9CqQOZ3bN2IUOrk+0K0cx/Euv8MK1aG4742ifU7/8swp8AJW5gvrN+aKivDhgl
 Ltyi4h0r6YivyUI3Myv2vaKkr0YuovO/2xrPa7kSGdBK2SRMrlqaFpJk7Lm1lf/G0SMy/gWYr
 8YElUP1eD0i7XtqpENaUy87S+6/sAzm2lJChs50/c/yR59u/yndmuk8RNX9zUukejWrLkFBUY
 MKrSzm1DQy+w2aVOnKyHzbjhT7Y8ar9sRwMi7le1Lc9SPBFQYYKO0layj64o9YXq8eBsnc7on
 ZWgfLPgwPhvXNbQDPQOquUbSLQxCOSzr9LeJfPfjfAo42MCgEhzkEu5I95MVmzSrCRUJkkPM0
 ZkOAFFwHNK8N5jKAiQ7dDYJYSc+XiCexBsqQPXE3Ky/yF6NTkMK+Ejl6bqS4huMy+7w/y2BWn
 twjsW3N35QTEqqcCiAlvdo9AKOFzU6FF6exZ/tqUrs2Oi4OO4iIPL1rsNdK4y3yNQiw5ZIcun
 oiXwBCcCy4gzioGKFp+bC0rCBrNfY5YbaWuMB6toYlS/vDVtTvs052domh+pcnPbGedfpoo1Q
 TR5+hFWdv7vd9vLlVN33yRYbzGQlruN5QR9jM5YExvOMlSkoM+qkiJ+Z+2jb56AflA48Q1rYw
 PYyJ5mhkxuInLTA8z7YZ9Kv8SGGx6Q+yzahwXs9Ejg39eW1QaBZ/n1nb32XVIyxN8xUbkm/ys
 CLvehf234fMZQ4CuMwOvtABaD6mAedR635B2+kkG/BTWH1UkmNrlWMlR3JoBxekUxa64d9vis
 XwI0RYTGq7utHU4a6RCusjt+sS85XFnDVd4hTxt2QGCHpH9FfyBU2OSG297aKLixX6Jvlf05D
 vlYP7epc7dQdpRWO7HUfOzSsoOxcxKiLf6pV2EQ0OLcpQxRMzrl22K6LRWSqXaGJXTcg5TzQH
 uKuKr0ZKa/c984=
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

- limit the RTS delays to 100ms


Redundant code has been removed from the following drivers for now:

- atmel
- fsl_lpuart
- amba
- imx
- max310x
- omap-serial
- sc16is7xx
- stm32-usart

The code has been tested with the amba pl011 driver.

Changes in v2:
- use a makro for max RTS delays and comment it (as requested by Jiri)
- add a comment concerning the memset of a structures padding field
- correct typos in the commit message (found by Uwe) 
- rephrase all commit messages to make more clear that function 
  uart_set_rs485_config() has been extended by checks and other
  functionalities (as requested by Uwe)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
