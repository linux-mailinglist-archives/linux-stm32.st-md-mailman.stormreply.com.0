Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053AAFA1B6
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Jul 2025 22:26:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2617EC32E8F;
	Sat,  5 Jul 2025 20:26:47 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72857C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Jul 2025 20:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDkDwgfpnR/JgGmdYXTFunQZ9eYPziaXFOkMQRRz7ucidmbGgP2XISnmwKfhmL96Ku1flOu5veULuCMOALHP/ViDvW0ezL+MESc7Cd6Ipr26nETCWvgaDgnXtmf2GwIB6bHRrQ5LHYfZ5r9dbuGCt/bGhiTAa7TzS0pPHI7RAz0PWLx1LYGxDwI57Lf3dXdK4zhTXNBlGyA0rNIqaif50x1fhbbwEg+StezgD3jLahyjz5aTzrUYb39WL4X9fcdLjYhsrFTtWMM8wrz1Hj89PBsINI7L7uD1xZuriNsaGXTOge2AYLBvh+OMAbEW9RVspCxk8mdmjgnQmRTqlIJt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLGBCZFGrfH50B5hgLaBYDAnS4zeoqB8XXJGMug4UHU=;
 b=gRNDuGEHQJGlfJqXk5kw8m2dRmNRI3/J3uGDix5OZzquZceuyVM/tctllPn9YhYFaVAHQD/4ph5EZ1krBBER9SAxFY+Ppxjbve8yD6awMegayp+lkwmqRv59gFD5Yi5NbTsQf1yk3ZivHu08/3Cs8EMapuDpSbcTOoS42qWMZPekm1Si/H3gYcLubb4jZYD7wYVMR9Krcs98Ebn86runOrq48+XmPCm60CHmr9T3qXiBZI/2yuHnBVXaK69WY7LYvhR3XUSFPkYARON4pUElx+6g+p1CkDDY03J+8FWagLkTziyoqQSyuoWrSQKhiE2Jk2UK3DtrDJp/8Vsj6mzI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLGBCZFGrfH50B5hgLaBYDAnS4zeoqB8XXJGMug4UHU=;
 b=NaKrnXFJP6HHs4TD9MithunSGaY9Zirpf+qHBuk8QB8jskmgZOAmIqzTEMaTwpi3HZ3CN4Rkl7dnEPFvxjioEbt28eZnDAzV6pKs+yY6CpN3QgPC5xn+WHf4xV1f5jnZWWf0cmDgvTSZSsiZphch+IkdYDcDgouILK7AbB+NFnU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY1PR01MB10722.jpnprd01.prod.outlook.com (2603:1096:400:323::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 20:26:40 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%6]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 20:26:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQj6xeAgAALbTA=
Date: Sat, 5 Jul 2025 20:26:36 +0000
Message-ID: <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
In-Reply-To: <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY1PR01MB10722:EE_
x-ms-office365-filtering-correlation-id: 7cf56633-59e0-4507-0639-08ddbc023dc0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jjHZyM3gcmpirUr8oa0wYiZqmsk1N0eWrxcd0SPfzX00S7ptu522my+MSvEt?=
 =?us-ascii?Q?A1/GfIwUHcsev1MTiyqw7lCR6aR4pp/s7YljIlEPPIRksXjSmbYWXArFVU9Z?=
 =?us-ascii?Q?Yo2GQZ+x+88qm7KnBQhJX6T8UCe4UBhyObyMnSaQME6OHIfQMRGBARCy1T0q?=
 =?us-ascii?Q?ZYgR5tGd0vlgnNH/Cxfyph/6IRq4YF0iM4OhObfwYDltxIk6LQlC2HshJ/BU?=
 =?us-ascii?Q?lVLh6mM680akODlPKxrh/VjQJ9tZ9wWzN8gaeTd8KyPdnBPsdezCC2Hu3qki?=
 =?us-ascii?Q?ihbrT1biULghMj+M/owfTHijzv6KPVA00nyfgDfax/9+/ZgECy3lEAyO8BGg?=
 =?us-ascii?Q?ZDDqCM4GcdNuhGiLyKNsaQBIcGIQj9YfyfBY6LzFl6+uMCyaIGfFRqRcGGdb?=
 =?us-ascii?Q?wO5A6+nhcruayjYPLZQWWLD1od6XWnkK8UclG5xEl9VWtoZjMUU2Iv6IBbgM?=
 =?us-ascii?Q?mIw3Vol8ovLB5+Jg5A65Dc2pPqnbe4BjxAup/YN/6gdCijwGYTrXsz67Mqic?=
 =?us-ascii?Q?YceWdDX/UzpqzaCqmXs9FAnLwkXy/Yzh0eYSD11DUe6QkCZbZkjclytYCcdN?=
 =?us-ascii?Q?/ycfdtgBP7dfsNSLO4++ZiTBl2DZHTinnGtpvmmmlTW6BGwL/3VkSDhOfe5v?=
 =?us-ascii?Q?cemVqsXyKm3kRzqf6tqu0oXLxU9fb+eEseiLjmj8HzNPQVs0Wy3kaC3In5gb?=
 =?us-ascii?Q?KdA5OT3X6+18wf85Zc1w3rw87Z3j39Eg7XSPQbB4RdNL6zAkpNXAFj1b91mC?=
 =?us-ascii?Q?AHhKEB/J9ZAB12TdAG3t3cY/UmXMr3cFgnDCPUO9FiwFvsj6YNMxFm3GWhJs?=
 =?us-ascii?Q?DZ7Fu5t3u63KLB7V2+vzhesLhMq75wwLyJrVLIE2FHIdy36yT1q+ee2TmX5l?=
 =?us-ascii?Q?+rnlzyyc+QuhOUJcWFCydLVXValnkkgXJyRNjvgaAde3mbK1BZtmKlbNeEm6?=
 =?us-ascii?Q?ZIpN8jWgfejA6DBHOsnOl0OR4l/Dja0khCodTJvjilt+bK41bRmDkY3+9u3H?=
 =?us-ascii?Q?9IfRH+fb6L609dcY6Vx77arKcE2MVY1NHtkHpaeV6LHifts2AoBHdU+K3iSP?=
 =?us-ascii?Q?FpADXzfScSb1eNI4Hd+GXdf1mjyc6/HFPTjsTSwaXUWI+Cos2CyXvLfhdQ5N?=
 =?us-ascii?Q?G/o/Wn17uW158xC+TwDpSjdm/iDjENp6wl8TyDdAQMs6Dx5VZE+U/eM+1Tem?=
 =?us-ascii?Q?kXGUfFknptGBzcApKl0kl3B58Bql9wdxIgI6mkm3I9p2DU9Am9uS1Nw5h3Sm?=
 =?us-ascii?Q?xaqX8DpdoxbDQo+31OLLlMdRHU02vKL0t8QJ0OnsnCr2iGmjcIVJRkeeUO9y?=
 =?us-ascii?Q?JtC3AKscfyKG8h+tM2BS2NvLHMqXah0du8wGYg+XJiOu2jrGZal1Ea5ZzNWU?=
 =?us-ascii?Q?thDcbzj3yO3SHp4W5BrQl8FPQ743/I8et2JQqBXGLBkZGgU1o4VqaX86sYRU?=
 =?us-ascii?Q?8LMGGoDLFLQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JmHJPVL9AzOAZSIKECxyhoSS9ZLXmpyLRQL4Ac8ViYZfYa8m7BtqVUjyFwu7?=
 =?us-ascii?Q?DnWtwBH03cxS4lM0ex1OOVDULFEyfTcN8W4mueYYRI8+csgc4g3rnnsxDQVB?=
 =?us-ascii?Q?B/CBUCDvzeNwQS/h2UrYDvg3knzBRNK7bQ0NEAyFQkD6yDiuis9+Il0KepkS?=
 =?us-ascii?Q?tLyl8DHzR709atonMJ/l3RbKnV+3g8zcjcnS50wXjvfTnK3DbI4i0R2+whZV?=
 =?us-ascii?Q?KeBIJk2IhAX7Vrv+dRv/OclgqkqqqSEgEXX10ouWHiQ2Xv9xUjAVv1FOSW1W?=
 =?us-ascii?Q?9D6uKY+mjnrED7l9zP0a0A5ZQra71WER/7cfBhOKyji2MhJ48yH8ItkI4Mq/?=
 =?us-ascii?Q?CI1B/93NLtfzuLGv4PWn92sm3dx41kxB5JNUl/S0lZSEvnGBw6ZNqqUYnyx3?=
 =?us-ascii?Q?yRTg1/hxUiSipRrGbdf9muD12pgfNqtRKgK7qJT03ndrcRT8KP53H0pmhfVg?=
 =?us-ascii?Q?AyLnVm/0cLpPRb5jM7KzJaDpsdQcFiGqG05t/3qiQBjvS/UlJK4TEjL3mdPi?=
 =?us-ascii?Q?wPagzf0t5xsofSp39OOwjqOSTAbJl2bUIXBnQFtQhYPe/1NgxHIOmUr8SIDd?=
 =?us-ascii?Q?Sdl++pVCjK5Rh0YzsBT/gPU8B0f+tXajbc9kDIVRSem52uX62T5zkyLfE8k5?=
 =?us-ascii?Q?AGhIMfIXnFoO+WZJ+GdPpBLstHpZSlhv7SB3YIyCVzkYN2zaayTpopG0vkK3?=
 =?us-ascii?Q?u8m2Z/XyHrrRYdDCRO0moeSfoIKIyoSoifOvb3sSgKRCTuNfHN6Mg8hLAdsU?=
 =?us-ascii?Q?fPyPp8uPN3oF+DEFK1txR03PRe8ASheIkuSSrMH6MRBG9bn3dNAF57pAEQfg?=
 =?us-ascii?Q?ji8Xcvw7Z7E8S0YfovuMSe3UCB+8tNiZx+s78UEHF5dtUy3b1AWCQluhd7Vs?=
 =?us-ascii?Q?T0Rxgd9y4tHhYRwvfY3JjriuXJ4lJFmaAQEtFv9E+6rseezau1DEdlgA9f2J?=
 =?us-ascii?Q?bg2vra0aMX4x9qB11wZOsKsYx8f1hG81KBuvv/6iSW9WnqQ5aiVrtNm/7It+?=
 =?us-ascii?Q?YLwZvtzORr41HanrHNhR+j2ue02qVGECAyVZXAQ8ovSOIpRnXqrzRweG3BBR?=
 =?us-ascii?Q?ioXx84jWieaq71gMtCHOyryB3p8SFM5kJq7vDOpYDBBm+v2eDNrXlTnATMYH?=
 =?us-ascii?Q?sjG8vvTwq2Fcb45fzz1PNJw0di4+FxGrywa3XRKgly4Yf6q3SD+tESlIONlW?=
 =?us-ascii?Q?8JVkD337LfZ+4rHLjMnYOtEuftNxbnPcqrbpOuDjOilPRP95iQuESNE6jlgF?=
 =?us-ascii?Q?z2KuHp+jr4A9d5I80i4FGnoVJOiKxHW3RtobXp6Q7Fxw1/SfuUxEoZw/q6eC?=
 =?us-ascii?Q?reDqHb/W+NXqVQe2d8Cf2k+CTMt1Ott8EU/k11iSrZdPJCkN70o8yoYJcvWd?=
 =?us-ascii?Q?/92n6efMsLB6mi2CAmamDOwFY5ASiQ5C19zZ5KwKrQq1Y05zNl16EgYIKkqG?=
 =?us-ascii?Q?x1Khe6xHNF8BTjl/7xG4aazJmZhZzpH8wl3QJTyZVfzOivNKwjgL8PGjmABG?=
 =?us-ascii?Q?i24Y8NV/6xJzXddAHPMSeMIbHaA/3cgOp2SJJrIx8e0fOW5/uYSBTntjurFN?=
 =?us-ascii?Q?yHIxErLT4CpmY04RyMknRRbRqEBDeEth+MHk/KRVazW32ozboxumZloHSMz/?=
 =?us-ascii?Q?9w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf56633-59e0-4507-0639-08ddbc023dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2025 20:26:36.7887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1PlgBqoN7WghmlxIbbf1PhMFgtixKNGzXBsTvsCuzhmkZyytL3APVHZH9+x8fFMAOvCfEpFnv7y0oTNREJebAeqiVzTdWEGVmB3rsYm3jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10722
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac:
 dwmac-renesas-gbeth: Add PM suspend/resume callbacks
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



> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 05 July 2025 20:31
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>;
> Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>; netdev@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; biju.das.au <biju.das.au@gmail.com>
> Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM suspend/resume callbacks
> 
> On Sat, Jul 05, 2025 at 06:03:24PM +0100, Biju Das wrote:
> > Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> >
> > The PM deep entry is executed by pressing the SLEEP button and exit
> > from entry is by pressing the power button.
> >
> > Logs:
> > root@smarc-rzg3e:~# PM: suspend entry (deep) Filesystems sync: 0.115
> > seconds Freezing user space processes Freezing user space processes
> > completed (elapsed 0.002 seconds) OOM killer disabled.
> > Freezing remaining freezable tasks
> > Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> > printk: Suspending console(s) (use no_console_suspend to debug)
> > NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> > NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> > NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> > NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> > NOTICE:  BL2: SYS_LSI_PRR: 0x0
> > NOTICE:  BL2: Booting BL31
> > renesas-gbeth 15c30000.ethernet end0: Link is Down Disabling non-boot
> > CPUs ...
> > psci: CPU3 killed (polled 0 ms)
> > psci: CPU2 killed (polled 0 ms)
> > psci: CPU1 killed (polled 0 ms)
> > Enabling non-boot CPUs ...
> > Detected VIPT I-cache on CPU1
> > GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> > CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> > CPU1 is up
> > Detected VIPT I-cache on CPU2
> > GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> > CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> > CPU2 is up
> > Detected VIPT I-cache on CPU3
> > GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> > CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> > CPU3 is up
> > dwmac4: Master AXI performs fixed burst length 15c30000.ethernet end0:
> > No Safety Features support found 15c30000.ethernet end0: IEEE
> > 1588-2008 Advanced Timestamp supported 15c30000.ethernet end0:
> > configuring for phy/rgmii-id link mode
> > dwmac4: Master AXI performs fixed burst length 15c40000.ethernet end1:
> > No Safety Features support found 15c40000.ethernet end1: IEEE
> > 1588-2008 Advanced Timestamp supported 15c40000.ethernet end1:
> > configuring for phy/rgmii-id link mode OOM killer enabled.
> > Restarting tasks: Starting
> > Restarting tasks: Done
> > random: crng reseeded on system resumption
> > PM: suspend exit
> >
> > 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> > root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up root@smarc-rzg3e:~#
> > ping 192.168.10.1 PING 192.168.10.1 (192.168.10.1) 56(84) bytes of
> > data.
> > 64 bytes from 192.168.10.1: icmp_seq=1 ttl=64 time=2.05 ms
> > 64 bytes from 192.168.10.1: icmp_seq=2 ttl=64 time=0.928 ms
> 
> You should also test with the interface configured before suspend/resume and confirm that it continues
> working afterwards without being reconfigured.

Yes, I confirm it works without reconfiguration.

Please see the logs:
root@smarc-rzg3e:~# ifconfig
eth0: flags=-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC>  mtu 1500
        inet 192.168.10.7  netmask 255.255.255.0  broadcast 192.168.10.255
        ether 00:11:22:33:44:55  txqueuelen 1000  (Ethernet)
        RX packets 35  bytes 2208 (2.1 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 27  bytes 5368 (5.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 20

root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=1 ttl=64 time=0.866 ms
64 bytes from 192.168.10.1: icmp_seq=2 ttl=64 time=0.900 ms
64 bytes from 192.168.10.1: icmp_seq=3 ttl=64 time=0.938 ms
64 bytes from 192.168.10.1: icmp_seq=4 ttl=64 time=0.929 ms
64 bytes from 192.168.10.1: icmp_seq=5 ttl=64 time=0.890 ms
64 bytes from 192.168.10.1: icmp_seq=6 ttl=64 time=1.02 ms
[   75.812501] PM: suspend entry (deep)
[   75.849939] Filesystems sync: 0.033 seconds
[   75.855680] Freezing user space processes
[   75.861550] Freezing user space processes completed (elapsed 0.001 seconds)
[   75.868559] OOM killer disabled.
[   75.871788] Freezing remaining freezable tasks
[   75.877342] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   75.884724] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   75.939455] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   75.948464] Disabling non-boot CPUs ...
[   75.952584] psci: CPU3 killed (polled 0 ms)
[   75.957722] psci: CPU2 killed (polled 0 ms)
[   75.963385] psci: CPU1 killed (polled 4 ms)
[   75.967815] Enabling non-boot CPUs ...
[   75.968025] Detected VIPT I-cache on CPU1
[   75.968069] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[   75.968107] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   75.968786] CPU1 is up
[   75.968882] Detected VIPT I-cache on CPU2
[   75.968902] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[   75.968922] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   75.969351] CPU2 is up
[   75.969446] Detected VIPT I-cache on CPU3
[   75.969466] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[   75.969486] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   75.969980] CPU3 is up
[   75.987181] dwmac4: Master AXI performs fixed burst length
[   75.988097] renesas-gbeth 15c30000.ethernet eth0: No Safety Features support found
[   75.988117] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[   75.991717] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rgmii-id link mode
[   76.007851] dwmac4: Master AXI performs fixed burst length
[   76.008761] renesas-gbeth 15c40000.ethernet eth1: No Safety Features support found
[   76.008777] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
[   76.012353] renesas-gbeth 15c40000.ethernet eth1: configuring for phy/rgmii-id link mode
[   76.204477] OOM killer enabled.
[   76.207609] Restarting tasks: Starting
[   76.212024] Restarting tasks: Done
[   76.215550] random: crng reseeded on system resumption
[   76.220909] PM: suspend exit
[   78.612495] renesas-gbeth 15c30000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
From 192.168.10.7 icmp_seq=7 Destination Host Unreachable
From 192.168.10.7 icmp_seq=8 Destination Host Unreachable
From 192.168.10.7 icmp_seq=9 Destination Host Unreachable
64 bytes from 192.168.10.1: icmp_seq=11 ttl=64 time=0.663 ms
64 bytes from 192.168.10.1: icmp_seq=12 ttl=64 time=1.19 ms

Cheers,
Biju

> 
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
