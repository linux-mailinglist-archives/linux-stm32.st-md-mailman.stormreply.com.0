Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC164859D5A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 08:48:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B76FC6B460;
	Mon, 19 Feb 2024 07:48:17 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2128.outbound.protection.outlook.com [40.107.13.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDBD0C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 22:47:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVqcw2feXeFVQqVBNAqEIi7H0s/XMiDRp0b4OgETSpEwkH1t2NKZEMEjK3inYyuJN+pOqRH3BbGVbtduUk3SnidQMP62OI6SB1FS4fzzUvjGZ7pKTlgfAN0EBQRMywRl9zYT0A11mHuKjWvHK15d9qaPQw1KsKAIL2lUihlW9EKcul0mcnlnA8dhdiE78WTZn+BmDLW62DOTXD4bDRrM2am6zLBFXpG4HeXM4bRgytGtSoIsSZZY9pwYc7uit2vhbnXw7OgeRug37uyHGDPB/1rIrmPlluudzZGwuqwfk/05Kuw7Ij03joPCGw3TF81gLWKp5kfahKXe3LpLFlshWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njOEwybEhsRFcXwQug2TFE1cmWhigSCzw8w+KGHPsX0=;
 b=nmFDiYv+55hZnfjLqQRhs5YEk0hXOiaqLZBCtAOqGQQE6waDkjaZ2OKgBBjALu1uFwj6ptQ56wjPb28NvRXHMAvQxsy1N0TVANwLcE/svgEpuqrT87Y4L+LSRsFcW8G1a31276nV4QA5e+DpfrepOy3MrPnFKg18Msq77QKiF+zfHLdWMAfOGi2dJP+JItuUNXek9FLBt42JGz4Wm5v9u4huONbRcMEBHqaBTeB+EcbHOzr1Ju2Qoq6u1SXcYO9fyhbbn0WdLVDdN/JPtwLIy9LsorkPyOU8uGLQO+Wc7zxYjsY+tmoN5TWrJ/Be7fDaP+MTEfOSLZtYWt+P8fEW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njOEwybEhsRFcXwQug2TFE1cmWhigSCzw8w+KGHPsX0=;
 b=s3Yu7YQLdo0UOC/hdZ4buZzM2yeaY9A36WFvN5zq0yhNgx7QrE0Lz/wvk7FfrohTEhmo9VLiIc2zEmjQD+aDjd93kCszuSMLwTuDx/857mbbaX4ckCrO8j5ybBHrwYXBgSHh0OB1nG4d6p6fy28x8Hz4lKO0TTLt9/C8oSMeWfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from VI1P193MB0413.EURP193.PROD.OUTLOOK.COM (2603:10a6:803:4e::14)
 by PAXP193MB1872.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 22:47:55 +0000
Received: from VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
 ([fe80::83c6:a213:7935:ae6f]) by VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
 ([fe80::83c6:a213:7935:ae6f%4]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 22:47:55 +0000
From: Lino Sanfilippo <l.sanfilippo@kunbus.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Date: Fri, 16 Feb 2024 23:47:08 +0100
Message-ID: <20240216224709.9928-2-l.sanfilippo@kunbus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216224709.9928-1-l.sanfilippo@kunbus.com>
References: <20240216224709.9928-1-l.sanfilippo@kunbus.com>
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:803:4e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0413:EE_|PAXP193MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: d5580570-c10a-48c0-1543-08dc2f4150b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2QjMyT1m+L3om0TwpqKkER+bEZlW6Yk5npVioKtZQUiKecxUiwYUXD4Yq9mmm/TGvXMxhHqWyILmGkOVHdCZDnzz0Ao4/idNY/V1arAddWS9ibrkXNn0XADhgJAJo4Nhsl9iullTCNMJ7EP0qqxubvvKATf9wV7qrjC0HWPYashn840v8HuQFIY6BKxXzcjn2iOFD7G6maNdSfxs4jOSQ/gkIstih0xe7nryZmU2qlJJLcZxUUktlJtLzYOLg8hvSRjz4HZTfxMxq/SP9LoapSPcekN94DgyZJDkFqxGXStB/4m4yNmsbs+O84bqt6KHIk64Ctbht+hnT1DQTCfPzlDdWWtb3dW7K62w2vpwr1U2LTumtdGnJlGQkSeUdO3+rpAzPgW865boICiqyzMWWQiYW1xqT8X3NajOrsYVSURp6kSsCi/WuZzmcOeQ5wIX1rjKaQJWXuDirM74Gy73RCynuovpOciqWhvHsUENC6Bw+GC4X8pE5RWqBKczSq1AXqfLA/Bkyih1Zm7xvusQcCyEbFESsEkaAiOVMCMCx3Z99X+vll9suR58Fn1mDwk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P193MB0413.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39840400004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(66946007)(8936002)(66556008)(4326008)(66476007)(8676002)(7416002)(5660300002)(1076003)(2616005)(41300700001)(83380400001)(36756003)(316002)(6666004)(478600001)(6506007)(6486002)(52116002)(86362001)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r3OlpzHsSVtBEuUd6rJPM0fQp+jTljtJWboPa6dQMqg007KfoGlihax/aOPF?=
 =?us-ascii?Q?Uqc7MJc0fOk5HPzceFvQaxF22uxNiGFxgLk6fGOQVfmpZzsmarXiexDxJywq?=
 =?us-ascii?Q?NcyJtwIgjvBDYrtxCG2wOyE0VOmTwAhP5HsN4lXRgwzx9ZapTXV72cL2uk/8?=
 =?us-ascii?Q?RBIf9bjIMeLciFKvLReYu49XmrlsgalerLpxgRwwnZ6C6g8tTTf76365zKRc?=
 =?us-ascii?Q?MchTU4NAzRAcqlsKV8mL1iueVX6hIiFZkqcHDQBjIs7feYJNeQLhkLIyRCFf?=
 =?us-ascii?Q?wWTMziM2zw2IpAoYBnSd/037Q9Js+Z0lMK/VxLSc3bRcT3r4Omok4zishUE0?=
 =?us-ascii?Q?6z2+r/Zgvs8ATYmnWO6iJhO0t94nyYndWnw8nSsZLPxpCvZMqvhjj53E1Cuh?=
 =?us-ascii?Q?pHquVpei3AGyh6yWteqowV5UVOOYZafZGh1wKtp0RtZXdptxCbkOln13lCKW?=
 =?us-ascii?Q?6sAFC2v/TakMUjGlPcjvXK5xCeaVpO1yg4cfpxF6dv4wFTVY+j/VazhDSMux?=
 =?us-ascii?Q?mDRsnAQFYD3FU1mK7mT32EZt+s6LcUbNZzUmklcS2ueeupUBUFYVP0b3roTq?=
 =?us-ascii?Q?Hd5UhPHYV1fG8CCZhO+2ZHwG8EuXmMaQBW9aDmbGRjNDLbhGorHTQPl26LuG?=
 =?us-ascii?Q?eRWnFs416zF/SHaEJQR9WPlKAg42V7rXUycI/e237p0mVjBuLPzALsP95ilv?=
 =?us-ascii?Q?iZbfIeLugiG1QNr4dfZGeP5/wAv1dXYImXoPaAbeRLemuWl9WJMPkVXU+1I9?=
 =?us-ascii?Q?pw8URVy3rZUUSXLBG8AAROrR0sge+lOWSJ/5+AqLlvXGNx4a61s5XErXDrQp?=
 =?us-ascii?Q?3L9GXH2xfufFtDUaDj9YOARKLE0OSzkoNzC3wLYEkDAP6MtH3hpnGiBGoIvo?=
 =?us-ascii?Q?WCgTI3MQryYCKbWKGgQANLZ9Hi0yi+A/515JINVqmxrQ+kD6us9USDJBRDu2?=
 =?us-ascii?Q?y30vqfkkBInNk1q2sFUoEL5i0+GCKisZLNCO7xQHhiocRM9BzXWkMexblv5c?=
 =?us-ascii?Q?gVwIREj36yH1kN6a5vmL/ftcxFOyKu2yNm0dK7z6RFWRgQpbeHiX2QOH90t2?=
 =?us-ascii?Q?xc6n+wvo5GHvSDHpaOcgkJWuiTUQGuOC1k57Ls3c3zjsfTnI6QZcy2bwN2ih?=
 =?us-ascii?Q?qS9K9HswKD8/mEfgb783Egjm+B+AG7nzAWXo5ZHK7me+SD7CmNaagiwtfAhV?=
 =?us-ascii?Q?7YcN0kq8WkhSAqnlAK6gAhtGgWOfa3S5eGxbxyONEa5QXo+QJE9ixUepfnnX?=
 =?us-ascii?Q?deklji2QYTaCCmCF4Ia3OuVaiKchOVgavpGKjWNfX6F31AGFc6+IhdPRk44h?=
 =?us-ascii?Q?8TvCALjtZHGGHPhCvB414/EwQ5roItfs1AT4gjNly6G/peqcY/MaC68pZdY4?=
 =?us-ascii?Q?LLoxCRIDkfkoGo3j1BkaVepCsu7Aoe6/9Fc6azbPT0JipazNQFtne+6NIMlk?=
 =?us-ascii?Q?0IN/MX7/2Ip/2kEm7ZfksZcDawv09eOr3Ubiyh3dwx5ewoI5s6ni8bj+p4nF?=
 =?us-ascii?Q?/h38wsBKPYnUP6XaSwZxFOoNxedr1SWOPRM18t4L53+n+gIpyYgNBPgg3/jk?=
 =?us-ascii?Q?r8+rCFrZ/etA0TQeRzL/Kx8UFWXHEGUSWhXq4+B9NQR0ZSvMTz0TLHYYCSHj?=
 =?us-ascii?Q?OXzxRM3khcz0NRL71DdehM6QhxeO9D4da34VHn/e6DbILvdHDkUmhw7pLifD?=
 =?us-ascii?Q?oeCwlQ=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5580570-c10a-48c0-1543-08dc2f4150b1
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 22:47:55.9012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaciCdylX8l3iwmgfbsTd03utZ8QYMRf5Cn1xMug/AHvbyeQSz6AuSPNNH8Yx0aSnfToW5AoVpMGbwUlwJNbBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1872
X-Mailman-Approved-At: Mon, 19 Feb 2024 07:48:15 +0000
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>, linux-serial@vger.kernel.org,
 lukas@wunner.de, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 LinoSanfilippo@gmx.de, p.rosenberger@kunbus.com, mcoquelin.stm32@gmail.com,
 ilpo.jarvinen@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] serial: amba-pl011: Fix DMA transmission
	in RS485 mode
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

When DMA is used in RS485 mode make sure that the UARTs tx section is
enabled before the DMA buffers are queued for transmission.

Cc: <stable@vger.kernel.org>
Fixes: 8d479237727c ("serial: amba-pl011: add RS485 support")
Signed-off-by: Lino Sanfilippo <l.sanfilippo@kunbus.com>
---
 drivers/tty/serial/amba-pl011.c | 60 ++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index fccec1698a54..cf2c890a560f 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -1339,11 +1339,41 @@ static void pl011_start_tx_pio(struct uart_amba_port *uap)
 	}
 }
 
+static void pl011_rs485_tx_start(struct uart_amba_port *uap)
+{
+	struct uart_port *port = &uap->port;
+	u32 cr;
+
+	/* Enable transmitter */
+	cr = pl011_read(uap, REG_CR);
+	cr |= UART011_CR_TXE;
+
+	/* Disable receiver if half-duplex */
+	if (!(port->rs485.flags & SER_RS485_RX_DURING_TX))
+		cr &= ~UART011_CR_RXE;
+
+	if (port->rs485.flags & SER_RS485_RTS_ON_SEND)
+		cr &= ~UART011_CR_RTS;
+	else
+		cr |= UART011_CR_RTS;
+
+	pl011_write(cr, uap, REG_CR);
+
+	if (port->rs485.delay_rts_before_send)
+		mdelay(port->rs485.delay_rts_before_send);
+
+	uap->rs485_tx_started = true;
+}
+
 static void pl011_start_tx(struct uart_port *port)
 {
 	struct uart_amba_port *uap =
 	    container_of(port, struct uart_amba_port, port);
 
+	if ((uap->port.rs485.flags & SER_RS485_ENABLED) &&
+	    !uap->rs485_tx_started)
+		pl011_rs485_tx_start(uap);
+
 	if (!pl011_dma_tx_start(uap))
 		pl011_start_tx_pio(uap);
 }
@@ -1424,42 +1454,12 @@ static bool pl011_tx_char(struct uart_amba_port *uap, unsigned char c,
 	return true;
 }
 
-static void pl011_rs485_tx_start(struct uart_amba_port *uap)
-{
-	struct uart_port *port = &uap->port;
-	u32 cr;
-
-	/* Enable transmitter */
-	cr = pl011_read(uap, REG_CR);
-	cr |= UART011_CR_TXE;
-
-	/* Disable receiver if half-duplex */
-	if (!(port->rs485.flags & SER_RS485_RX_DURING_TX))
-		cr &= ~UART011_CR_RXE;
-
-	if (port->rs485.flags & SER_RS485_RTS_ON_SEND)
-		cr &= ~UART011_CR_RTS;
-	else
-		cr |= UART011_CR_RTS;
-
-	pl011_write(cr, uap, REG_CR);
-
-	if (port->rs485.delay_rts_before_send)
-		mdelay(port->rs485.delay_rts_before_send);
-
-	uap->rs485_tx_started = true;
-}
-
 /* Returns true if tx interrupts have to be (kept) enabled  */
 static bool pl011_tx_chars(struct uart_amba_port *uap, bool from_irq)
 {
 	struct circ_buf *xmit = &uap->port.state->xmit;
 	int count = uap->fifosize >> 1;
 
-	if ((uap->port.rs485.flags & SER_RS485_ENABLED) &&
-	    !uap->rs485_tx_started)
-		pl011_rs485_tx_start(uap);
-
 	if (uap->port.x_char) {
 		if (!pl011_tx_char(uap, uap->port.x_char, from_irq))
 			return true;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
