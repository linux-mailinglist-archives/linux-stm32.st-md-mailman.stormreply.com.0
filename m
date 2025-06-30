Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8338AED3E6
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 07:36:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C30C32E8E;
	Mon, 30 Jun 2025 05:36:20 +0000 (UTC)
Received: from FR4P281CU032.outbound.protection.outlook.com
 (mail-germanywestcentralazon11022122.outbound.protection.outlook.com
 [40.107.149.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45B85C32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 05:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6IEtWeckxGnHu0lDOP1Y1scKLUefFpXHVuNFUVD93iKpJTyHYfgX4iqDxV1EBS+deaBBfAnltNa6wFnqdtXivbSRLkCKNEp3AZNXqKO8SYJaD0lV2V954VD9df+QB0Y8oJR42MBrCMobtLPBWOHgdDT4iFCPjV+WKUmkcHkMChwlE8GuK4SKU6L28lXLyeZtbZgmGt9jN1LZBUKhNhAfkCl8EXYft8Bs0ILMqR6G1kpfEGrn7iFAYPSp0NYWyHoCb+1/+UM02J2cWkd3EYBfW4xIjbjnM6vBoauFnoCIYljWBleKwX/m65VdOep+Je7crH8t5GnduIhshjkCziTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8AhFZHSAt8/9lzr7Q3w5TUpnX7QCvA5iu/U1UBwj6k=;
 b=tT0Z5bTe4NSZlsAJP5OiO9vF9kmasXg4TIdVc71XRLT7IXeyL/DEkxXc4tQuUNB5k/uCaMzGJTkI6ofmUW/6qL19wFG67E+xKSuj7S5dZZpDnKKiCEBetR7CwVJSTErz3pC7U+l0xvC2bYUN6scsGIb8yQ7hFnYIbo7ELFmLrCqpNizKzihCQXENKAmCnUQ5Sffa8dDecRAuUgwXEUbzkLoG1R2iAXo6tQr93C7Vr+sibbcziohweZjVe46b8rJQThGPrJ4XDfbpt4msy1vxEioKhbo19hGFtsCvVJh/zwZnvbECDaRdL+m34nB0HUpCl8xlbZC+LktfuOwcGUJezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eckelmann.de; dmarc=pass action=none header.from=eckelmann.de;
 dkim=pass header.d=eckelmann.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eckelmann.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8AhFZHSAt8/9lzr7Q3w5TUpnX7QCvA5iu/U1UBwj6k=;
 b=SZol2vtvM54sTlsblyxzP2/xnfhIK45ToUHSEcUh4pRthqwji7SjSgX8hrwTK19lWP/qO0/xbi0JGqvgZAqQ+CFUDBy4YYvS/zFYwoKWZdEQQZW+XHDjGFYt6z/72xk7T5q/Q6LG1yRUvLgCritPN9XNP6MjnU/QhR1TMbG5m4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eckelmann.de;
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:da::13)
 by FR2P281MB0268.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 05:36:16 +0000
Received: from FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7]) by FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3927:fe99:bb4:1aa7%7]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 05:36:16 +0000
Date: Mon, 30 Jun 2025 07:36:15 +0200
From: Thorsten Scherer <T.Scherer@eckelmann.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <j4nypsywtvsaryl7i5hxmkq3p6aahqdovmtswiiftq66mpthjc@5qyag5c64dtt>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
Content-Disposition: inline
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-4-bc110a3b52ff@linaro.org>
X-ClientProxiedBy: FR4P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::18) To FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR4P281MB3510:EE_|FR2P281MB0268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5161ddfa-bdb2-4019-2e4d-08ddb79808a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iYhYzp7aiam9+ASdAm9BDxHhxUVtvxVX2R/16C2Wn0NnvYHmq8vjzlo8aeoq?=
 =?us-ascii?Q?336/vs9baqqQdQyvafF6Ogu0MlHjkyMpGdaMINEdl3G4f+Ddk99mhUEWf1XD?=
 =?us-ascii?Q?h/HskVsystvJ0tqlSGie4RJavs/3iG6z+yawAFgPTaAOEkd3k2kuIDFvCE0C?=
 =?us-ascii?Q?JNbSvjiRuK09nodYc0TKReoU4dBhON71T12dCSmTiCjITVtXwPrmDEHY2e7h?=
 =?us-ascii?Q?2SWCLcm2wEnCVXNAwByzrK7uU5a+1ozA3gbeUlrlUPvNwWiMgUPZUU5uLTls?=
 =?us-ascii?Q?hqMgrscVY21n9Sj0KOIp1z05fnR5B3bUS5uQMtfTQ0Dkv0W710QppC5YAEDp?=
 =?us-ascii?Q?U1UwCQV/uky4bcLuIxNihHad0XfsjXAOtsbvvE8luvjsQfcbMR+LKFknp72X?=
 =?us-ascii?Q?w4ANyFP314YUcpsWJd9nvwcXW6kv+BTUMwHpQtZuNHMemBh/gRXozbkOROk0?=
 =?us-ascii?Q?W6TJmEPve+jAfF/Nx9/HYLPyAyAcekIN1Oy7tTNWf6R1fotn0W6WwttdBJ8z?=
 =?us-ascii?Q?E2m2dVIw27tj1TEYpgf6z1Ka8Ys4iLN1nEwCl/4c8FnbbTJFBf38bcvucmMO?=
 =?us-ascii?Q?fBrlwUX1N4U63xuV7ADDoPHNdtZa9JAy9C+H0EqE/UsEKDfW95JYhQWrajlB?=
 =?us-ascii?Q?M/mlzggyWMeVxZX3OSJQHFfUGHGLU4sn8hxuz9qGGbphXucTIiSkr1yXNFi4?=
 =?us-ascii?Q?9BlZQbqTgCNfd1UPAY1NEoUi7cH8eR7cTOyykJq6iJeoml49lark4UphTu7R?=
 =?us-ascii?Q?TfRRj1BngpPoPNUQzBt+dTo2ftIbMDAs9p2dCtLwGVu0i2xXjtwNPz781Cul?=
 =?us-ascii?Q?Tn5D19ZpNpvnUxHACVhZzH5ZaD1zDoWYbZBLKFVxL+pD8ZQlTKko3muEoWD4?=
 =?us-ascii?Q?9kOubnjngSY7RYpDzXRTjPJG8NE/dZ0StJeZTNq+b0vUOXUGAKqbp6Qp8BTY?=
 =?us-ascii?Q?BBGR+qOEUI6Jy0EHZMs+zn1Fj6oWQGP0x29dUvbhI0DiZRbCwmYF4i/gAwxi?=
 =?us-ascii?Q?EK2TMeg4KnsRH1C0azC++ynDjfjPf9LRcQJVrvSSwn7v267NrUAjOYrNtopC?=
 =?us-ascii?Q?D7Oh4lALmTmTd8UfPLBw0f3oW86Udb84PKl1aq+5mc3M4fP09z9irqZEGYQL?=
 =?us-ascii?Q?pCmI5XmN2Pf3sL8Q6Ezw0Tw1sQZPMijX7xIsQrJ1PBtY+kMvns7aqrtfbg7J?=
 =?us-ascii?Q?KXZMrssETCAwckkcckbzM/hVqPeebl9JTWWQX8ahypnfqXlKmkLSsTQ+wBLf?=
 =?us-ascii?Q?RLFUx2npsJD3N66QSsisk8qq59J3eblRtFNnpwuyfbLM/2h9896IqDYg6Yaz?=
 =?us-ascii?Q?J6GOqJBG2vhKOa5rvY6SIyP00KYRFZHfHeD565MtzXw+W4DKWXyeT9Qtvyyo?=
 =?us-ascii?Q?r4QzncAcqcrTgvsBnzEOJ8t8lAV6nKTQK751dEnSK92QdcqnOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EGzOFFMEY+zTLVA+Y0xsmvVT0LVuBRekWpsgL4lxVB3mqVlMfAlBbNLSxcCv?=
 =?us-ascii?Q?/ESjeIcyyfCh4sIbAD1pCp4HcY9PAUH3gj/qG4sNrzVb7wWSo9LqW6yXIfni?=
 =?us-ascii?Q?TxxwXCJKIbMFy2IOI9rCqHOGKgOwZtMq3rzkbtUC26ke46rDOgSdiVD4Dpa0?=
 =?us-ascii?Q?6OyDvGPGgDU9918Gb47y0EdepumGvtIri6P5AQV1WjgKsraJWZ8Cq9NovtqF?=
 =?us-ascii?Q?F/MVS+825rKqyKrnOaTijdbC3sHQDORaDb0J+S0ckc7vHR8x7JVzEsEk6AIE?=
 =?us-ascii?Q?CyfUmVJezivA9gSXPOblPjWmms1U0O731PYsx1QDSd6GN8lYzGSGlv2TgFKP?=
 =?us-ascii?Q?Ufe1DCwsEAof1P/Ks+zFIZfgtUoYT+cPI30naXrCG+eBT5NZV2e4+YNXmqTi?=
 =?us-ascii?Q?Pz9IpS+BxziRbd1QDZlLOtQqON5r5TAr/+66BYHWoPbOwf1ex6xLmy6V8jkt?=
 =?us-ascii?Q?nIIAkSSJRGb7xDQVLHajyj8MJDga5HppV7W5gVGc7G7fzemjSzGhSyaam1qk?=
 =?us-ascii?Q?iOr8hAhF/xapPbQS/wv4/kGQywbKW09QgN99hV2w5Bzrqe8RbhhcbYz5YPBW?=
 =?us-ascii?Q?wRODljdkcUqs4RWqh8rhcKHzJUTY40Sgtf4LMfN525joDop3pZImYybDfH0J?=
 =?us-ascii?Q?wL0YdVOeO6lVzCfZHn/zRzh3EyNDTogj/eG0pMWvVW7VMDC4cUyLpn/bN/Sf?=
 =?us-ascii?Q?fL/faU6xLm6zgzaMvGurIcGnRnzF8mZSaDeVnscMtqOSPJM6AFumB8V1+Cq/?=
 =?us-ascii?Q?MEfB48ywV66cYazMHpQ9xBD67ti+xcT5fbOiYUbSInfZj/+PLJ19U5xNZS/j?=
 =?us-ascii?Q?d8saQn2u1mBz/DOpLIBTrmQCmMr9A52ekpJOS3DeWZDiOi68RO9ebSFMY7VY?=
 =?us-ascii?Q?LItvxe2N8TJyHoJed4QttIlvUCaxoaZzs2t7l5srTmtralQ7HQrxYVBmJD1i?=
 =?us-ascii?Q?VP2280qTeER/RfzDgvs2xPJshfu2e4r7sOUAtYg1v24bBDyszTxPSoRRRQ4s?=
 =?us-ascii?Q?oUuMGwHNnDKiyZZWcNr1q4NPmyeRwpQoxFdhteQ1N4qnjFAiUJmQDi8uZw5i?=
 =?us-ascii?Q?dQRoHCdcM+2HSxjzJh591pTQMA+MkhzAg6v2O1s+Bwb8Rh2/KZKBxO3ya2Ir?=
 =?us-ascii?Q?9DS+gtjKsMxCzXUHLmg/51QuKgUVM2YaBur8e3J8dePscvxAiAC3+TF8fw3J?=
 =?us-ascii?Q?jeGTtd4zgBdnZLgyE/zC64aYq3LkbuJN4hCAZPZOZOtc5po3fVX8MD1JP4XH?=
 =?us-ascii?Q?tLL5FEZF0O/VsvLTAYHAKyuU2FVNYixyrNFQbO+M598QNHIiacwpsHSYHzHT?=
 =?us-ascii?Q?UzOSNMLB4SVnyQ98x3VDWxwCgm0D1Ma2LyrYI/5SiJHReaJGZi/iww0uBJD3?=
 =?us-ascii?Q?0lst8H8/+TqOWRHuf+tZYnGxePzdZIFAJGYbfMT0b/nRuvjHs02zoKsOp2Py?=
 =?us-ascii?Q?qvh48jK9jYFh+bhHEFnJ1xrBiYtjUfguc+bPArzSwKIsvXXZUV7cJJwwjIOS?=
 =?us-ascii?Q?FF8kCdMOdywZBYvZBL8shm7wifk+5yMBX6gc93M0EgrwdsIaMln+xXMrsTL7?=
 =?us-ascii?Q?S+uUIZD+MioIMr/Y8Uqvf/z1St8foKgYhe0L6SB5?=
X-OriginatorOrg: eckelmann.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5161ddfa-bdb2-4019-2e4d-08ddb79808a1
X-MS-Exchange-CrossTenant-AuthSource: FR4P281MB3510.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 05:36:16.6414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 62e24f58-823c-4d73-8ff2-db0a5f20156c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ux8y5tXkaZ6CtE21UuoG3W018FgJLVXXy1TV7y0GDcg5nfmksXxCsdbkZ209GQ7LmDnm2Flz685R4Rgsskw0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0268
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/12] gpio: siox: use new GPIO line value
 setter callbacks
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

On Wed, Jun 25, 2025 at 12:33:27PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Thorsten Scherer <t.scherer@eckelmann.de>

Best regards
Thorsten Scherer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
