Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D038E859D5B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 08:48:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88058C6C820;
	Mon, 19 Feb 2024 07:48:17 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2128.outbound.protection.outlook.com [40.107.13.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0294EC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 22:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsNMKYXMeq4u989EDx5QHaCRx1LC8NhiODUUP5xAEVTo0otblf+6UkkXiPj7cdWGA6PlKPzDVnYWiFPO4qfs65yDuFIZnEPSEmkUL2knCIjeVlCPBhfv23WCl5+AHlWEYpkeJz1ftxy7tagwsUm+UbYwRrWaJ3iFYb4gaPuqXZtJqyxOTopgva5Ha/sZnnfK50dW2JZi3/aIF6NH9WIb2nYHeivHSaMtT2J35WkaRc3FrREA8ARrR0m9fPuhTDT65WV0Bj6IXcC5QBtJxqerP3Ki5YuAleuBbRAPSzGJF2KhMjsKd8+aKLzmJPUdGaxWCpSpnRaM28bDih9MY+L5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQNmmOqiQ+gSaPNcqFZpoXHPHkDDxxndySbu7ZpRVEo=;
 b=Lqhv6KbRm16mv4OkVgUEWEexmm8TwLagwDYQeJbmLEXe8t8t/bTu9UnOlzkGO+K7VY53ekXjTIZiWBhrdF2eiFG4y/OQ7+FV0EVaXkRKPOrhz4Aq049vpQkC2hYLptIbLrlhB7D7lwqU6NJH1crJvl/u2cw3zQSlbcNUkJYiY8FYscWU9Ckt3E54Jid72mN5Qv9nOClDh9oN6Lvv//ygqQsCtbE7c4akZMEzu81i0NfD250XGS+AeT5aGcoxbrMBzIIOLh7qTDJFEmD44v20C47qMr10x+eZd6q698mTyAleyz6228ZBJ30Ce1j/dkI4+64Q0o8m36G2SRnO3QC2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQNmmOqiQ+gSaPNcqFZpoXHPHkDDxxndySbu7ZpRVEo=;
 b=jaGS85hUaOu2FmvFVZ9GHlTuZ6Ok7aG3se73l8iCHrFfiPMrUIuvQJqkagZEMSvzWAlLPjTrMak4OBcoeURck3MSr09VHy5xwCZwJx+62x2JB1ApkWkVbz+HYcMdGXdV2bfeUx7zE2ctZJmHYPZvECJSQI61IEa0fnBpFJ7YWLs=
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
Date: Fri, 16 Feb 2024 23:47:07 +0100
Message-ID: <20240216224709.9928-1-l.sanfilippo@kunbus.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: FR0P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::18) To VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:803:4e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0413:EE_|PAXP193MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: 693dd5d1-c3ea-41f3-550b-08dc2f41502e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6ZMlVOi7srl3om4cqW+LtQ5EsdbDzSUanfaWfuxyQyByEVw0zYhgezWTaM36DAe4NkHGmRyJaBGL1/PZVLAzKk2FptA02/fJex3xjIZ65GuEOnE4EbK579OHjFSUIkzuwF0KB9mgYGUYbLRA+Jlei9VIpm+M+EcKjO1XCB3re3QY5BaS6ZAEWWpDJJc4Q96Kk/M4iDBexrsHDd6r5qBZ4c2rt9SljGOnHj4KN6knTBhC1gM6w6CR0w8/wCOpkyYOgSiLtINpkz8RWAZ+BMcbxmwv1oYPZ4+KcrwyHXRwtv+2cRoA4TeODFMnl3CX4gxKIQv6uH+0Cs5n3xiz1q3m2S+8BZ63XnlDOCrC3Oq0Qb1i8PtMUewr9eiVyuIoULDrx9OuyAGnM5MbQxScazUl/EJiYEUL8dUHKLmSyU8d/1ohUytOIlT1MODb6/xwsQ0IHBIEjpNwzZppmtcZuVzi96C4RIzbyk37MhCruoB5J7XGPmhkYIsbV647mTZfBo35K233SCh3zbWaLiB52ZFnRowudhf8JWummI5UolLBbzQQLODKzK/9fs0D/Etlznc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P193MB0413.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39840400004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(66946007)(8936002)(66556008)(4326008)(66476007)(8676002)(7416002)(5660300002)(1076003)(2616005)(41300700001)(83380400001)(36756003)(316002)(6666004)(478600001)(6506007)(6486002)(52116002)(86362001)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/QdQYcac3Cn9ncDCtyxZhPjVMsOQ0ipavKSRZlzLl53org6iGx9i/rDKOr3P?=
 =?us-ascii?Q?X5AWQhZK8h0gF0jmyvO5I/VQO05iyvSrriKMpRe7r5hM9XBv2H7t1/UuS+qK?=
 =?us-ascii?Q?ubmU0F9F6lAa6/mY2prJW6F8VhoiyjIkVHDgDry0LcbeDmMIz0Zjsi10N0yi?=
 =?us-ascii?Q?cCBFd9QaxfcyAwO+gtC6nCjcUesPWjaz6d/kwMWIM7o21PmW4AWVyrOJMyg4?=
 =?us-ascii?Q?EwKn7PpUUGOMz+YRxrztSu3aTuM5N6WKYdmkkAqEwAVZtkCOJlFsnSMxRAcr?=
 =?us-ascii?Q?KmzQSL51fQQ/lwKIvuI3RWdni5ccVvjuvkjJMZtQDwrjCVWoxzdqPcEVf0NI?=
 =?us-ascii?Q?XkaRtj8skj9SVWekmyJUanIkEHi06uO4ktIGhwzBR7w11woaXELKJ/0O8cr8?=
 =?us-ascii?Q?nIflNiwDb93cBLXgOpWZPZ/O/6GRmXxtBDjVgQe6DW51aqgQjDGqm+Qg4t7S?=
 =?us-ascii?Q?1piBWzkLnQKwlOf1YU81IV++NEB80sRw3cfw6H0tnbr+uleHjKpRMKNIHbt6?=
 =?us-ascii?Q?6OkZDe77815ctn3fcsf0j4LPqpT237yx2fbfB7pQ/Gg7z+0C/+oTONKJd6sE?=
 =?us-ascii?Q?245zH5qKbnWiTGNS8c6R+qdxmjCtJwb/vlwMQMD/phZIFkQrckblxzzu1nFZ?=
 =?us-ascii?Q?YBcn7L4h5b67Ngv2mHAKg3rvZN2Lm3/CHowJdunE2ezJIfWo3qM8IornFgEd?=
 =?us-ascii?Q?p8uSBQmkqBqKS+o/I3pJbwQNYv98QZsv2nnauYB6PP1ze8+PC8/xj0O3Pz1I?=
 =?us-ascii?Q?H/x3g2ng3zMcVOcNZDZTVOTproJ0d/ze3v2jylVHzqMH6uqTgDM5l/dTHuBG?=
 =?us-ascii?Q?SkZgrTY/7qoSF8L/NYFrfHZUVgzwdwHGcJXUVBHSXUXNAGBSaLnyYc633vMh?=
 =?us-ascii?Q?AK3aaAc6rVASLoSHwyztWfAQ2xt8LWE5W80Ma/OYIpnvYQXSm+Ibf9q6T50q?=
 =?us-ascii?Q?pAkiqcPongRrBb0k/VZp7Dp8BnXMvAV9g8FV7g2q0MsVbQNF8E7RSkT7gcRd?=
 =?us-ascii?Q?eUhpvxjDcrb5t7Y9HVyaPLsAMsh4ex4vDKDTB7jbuBqLwX58efgzqzAfr94n?=
 =?us-ascii?Q?gKCiWiS2UY5A9IOvwkeTyW82Ct60Bk7sgw9TEwuRXMvpXBmZV3IZxDuhKsmW?=
 =?us-ascii?Q?xQ2VgAN4Ia7F9j7ro1fTUFmILuTA1CjummCn+RHdfovbtcFt+Sk0hvwdQpdr?=
 =?us-ascii?Q?PytNkSUs/Uv8HkNw5fybFtCG9Heazl5x7MJuomSkZatz6obj4fNQHNRmPPMV?=
 =?us-ascii?Q?BiJdQqIelm68adswagrO+Z2PAfceQctdMIZ+7614zmxfnmEIRbBcnDqMGHKz?=
 =?us-ascii?Q?xfRo4M0fCt9e/vHRdzrfuLFMOVhVYIdXrOCEePkxPicY9M8IAnMRT2vMkZbB?=
 =?us-ascii?Q?HD6M2Gq2Do7Ek2hnL3RDsPRhHIyQ0gJCfSFs56iIuD1Ah+TUvX50HXKN2BIN?=
 =?us-ascii?Q?ru2ikOf6jnPTsJwPUMKhso+iZzAICL8Otyieqculeh/09HqV93fQ9r3eeA3n?=
 =?us-ascii?Q?loy1HPQJ6Wyd8B5yYH3cUemSd9Z+2OVIxaSQOTXPYvkhu/BwXGPMQPEEqq/t?=
 =?us-ascii?Q?FYmwCHVnvuYQz04+CHRGHBgfkDtv1CZyhwpvn4yGI6RxdhclPDNpDNuDWM88?=
 =?us-ascii?Q?BAbiQeVSyso77R3ZFmg6CJkUBxtd7kCSlfKGypdtZdv7bX90TOdv6krWdvj7?=
 =?us-ascii?Q?xymDHA=3D=3D?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693dd5d1-c3ea-41f3-550b-08dc2f41502e
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0413.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 22:47:54.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP6qpxMKUZlu5+UYK56t8kJRDUoyGB1DwQfVlC8W6ewPuCspG+tHh5PvDmkxvOTSiFkeTmz7L8CBYF9TahzA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1872
X-Mailman-Approved-At: Mon, 19 Feb 2024 07:48:15 +0000
Cc: Lino Sanfilippo <l.sanfilippo@kunbus.com>, linux-serial@vger.kernel.org,
 lukas@wunner.de, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 LinoSanfilippo@gmx.de, p.rosenberger@kunbus.com, mcoquelin.stm32@gmail.com,
 ilpo.jarvinen@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] serial: stm32: do not always set
	SER_RS485_RX_DURING_TX if RS485 is enabled
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

Before commit 07c30ea5861f ("serial: Do not hold the port lock when setting
rx-during-tx GPIO") the SER_RS485_RX_DURING_TX flag was only set if the
rx-during-tx mode was not controlled by a GPIO. Now the flag is set
unconditionally when RS485 is enabled. This results in an incorrect setting
if the rx-during-tx GPIO is not asserted.

Fix this by setting the flag only if the rx-during-tx mode is not
controlled by a GPIO and thus restore the correct behaviour.

Cc: <stable@vger.kernel.org> # 6.6+
Fixes: 07c30ea5861f ("serial: Do not hold the port lock when setting rx-during-tx GPIO")
Signed-off-by: Lino Sanfilippo <l.sanfilippo@kunbus.com>
---
 drivers/tty/serial/stm32-usart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index 794b77512740..693e932d6feb 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -251,7 +251,9 @@ static int stm32_usart_config_rs485(struct uart_port *port, struct ktermios *ter
 		writel_relaxed(cr3, port->membase + ofs->cr3);
 		writel_relaxed(cr1, port->membase + ofs->cr1);
 
-		rs485conf->flags |= SER_RS485_RX_DURING_TX;
+		if (!port->rs485_rx_during_tx_gpio)
+			rs485conf->flags |= SER_RS485_RX_DURING_TX;
+
 	} else {
 		stm32_usart_clr_bits(port, ofs->cr3,
 				     USART_CR3_DEM | USART_CR3_DEP);

base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
