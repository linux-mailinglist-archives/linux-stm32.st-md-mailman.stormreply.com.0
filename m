Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637084BEEDC
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 02:15:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D74C6047A;
	Tue, 22 Feb 2022 01:15:21 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63444C6046B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645492505;
 bh=LnNDspWH53byTON8/DT1vsFZkFZ06dal6CobvbPniSU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ByOUBjvZ5qQCgwW/ZyCEAd8zOtBSQ+R25pr77kXNo9duIknzJd6BY9GEML++kj5kW
 FhH+TkSsPLSlenykp8j8AVcLkp42h9R/fgS4Uw/OoCXhm6a6QaasiNSWXJ2KvLgFko
 SlbO99BbprztNnvK3L/Ur4DMDnui7VLpner+Hkfk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Venus.fritz.box ([149.172.237.68]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MA7GS-1nXpIZ1vHm-00Bff4; Tue, 22
 Feb 2022 02:15:05 +0100
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 u.kleine-koenig@pengutronix.de
Date: Tue, 22 Feb 2022 02:14:24 +0100
Message-Id: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:fwQhpe5itdtLuhIj4GdcRsArhXYdn4LSccPuJsacLIGEm/VTpGN
 NKVjX2InXVHVGuJSNyb6ZkEZBq9lDRgp1Kp1mp9NpSnjzNDlLcIIp69nDefA1qBOMAyMusU
 arpt1wDgkGzYZ633iMNBDfxEcLDv6h8ZaC8NvuTZAs32NfBg1gRudPEDTNgKNYcOgleJoQ4
 8rumNGGyPJzeeystnF87Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/J/4Umf8mTM=:2koxePhvpaurreLlmdVBi1
 cotdEguPZ/oyA28bLj20RGsxMiG3NFn1fYxfLM0gQTLKyRYJb77VVLWvk4jg0SO080DlgpWIo
 PNj8HC1Tu9AxEuC4l50vbxOIO0Aczka79ByThtk+9GVFTa7gVAJG/JIU9bvIkPbJitVcAFkMT
 3t+JsToy55pEixIr+IkeNApaVFyFS2cbl9jSJtQrESM+GceUqALZhoBZVSqM6cJHbZ9elDuQv
 35eeqHjZog1J0w0V7zNvRO2sb+IPNY9/1aDjvTuWJV4UK+jHR9EUkK7lYR7xLVdDdtF0vRCsE
 LGgWOh3zP2+L91coUFQFoiSVnLV5f0VnNJM0OwpVC0/vurdkdv5t5xNJTdxvO7E4oof6rTbOC
 WPmKv+0hdZsq3ofub/egPLND9PRFz7gb3RLE4Te7Tt70frNksGEQFeAExzLDyOiwpct1Eg1Ck
 +wqK2/a5n8K1zzTU6c9rVud47CMbPpvAywJQlx29oaH61LFLF/QvXHnt07AU1unFToJA0YmUS
 fwioZxEdrD7FPOzlKyufoP3t+J6jwawzdjmJ/wI9M1DAS2pUFWECCwt55hV/m5e9xFUAiKEsq
 fX50tKYYuG2GsMREyvYWRzKkuxpZWRjoQtUim6zzBIkcp1V6Q3aZnwQIudQzEjWZsezOvxn5Z
 mQ0kohW5l9xRa1x+CUUfdYj6ilVYw3ZbSe1Ya6yysWcN78a0banL6ALizXpIwh2btGssSk6yw
 Mov/1XVjEoIyzg/ewKtSvYirygAxc9rnVscK0u5jAdEZn2hx0d9cM9NynNA4aa50ZpYlE3Ly9
 PdNJEGdZBc05O8zP+ZGk+v4EPTR7BSblgLk/ngD4lE5X6wA1Vgfr7SSqUAKB1e0wiuH3RLNXp
 q0T8pDIVquS7dcb59q6JO7tFFlCvdExeu6UhizIP9ULUEooKVLAyzwdrk5q3rCI2HdSCJPGcm
 gfSL4sE8OSxX9AXsvb75/avee1MhZq3XF9jVPSdLHg7t77Twg4lINZj9/mQR85Hd4WpIEusLl
 k0zhSFFDpFN8UKT3jjmtJDeUuCwOHUtr20FU8H8rrRbREggZXf8HKwEQ+D6Yvr2mCPsje7XoN
 osSpPAhuR/+He4=
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, richard.genoud@gmail.com, festevam@gmail.com,
 s.hauer@pengutronix.de, linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-serial@vger.kernel.org,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: [Linux-stm32] Move RS485 implementation from drivers to serial core
	(v3)
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
- add a comment concerning the memset of a structures padding field
- correct typos in the commit message (found by Uwe) 
- rephrase all commit messages to make more clear that function 
  uart_set_rs485_config() has been extended by checks and other
  functionalities (as requested by Uwe)

Changes in v3:
- add warning messages if the serial core corrects RS485 values (as requested by Lukas Wunner)
- dont expose the macro for max RTS delays to userspace (as requested by Greg) 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
