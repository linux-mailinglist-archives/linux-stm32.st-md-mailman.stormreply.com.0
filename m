Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A438ABEAF9D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 19:06:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5622EC597BF;
	Fri, 17 Oct 2025 17:06:07 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09B8AC597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 17:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoK+hk3sqxNpGA9oTM1UL53O0fZPdYyJ77a8bZkbuGOHNYqREYg3wXQYKeAGkbcy4pUgl/S4EBK9KQoWQTa4Xps7o/Dm2TpinpNM5xNH5lyJxTOS6eW6G/IOaq1aAXpJPMt0RMdki/gnUdZEdpeTZ48bfKMYFyS8AU/lRYfCnjMgx27KmpD52LYLvCFi2blfxDQJzOiiC3YAa9NtB+p2BYGtnFiN5Ze/OIyorlRSeliUSJEKl1Q+lYDkCC4kF39V5CgX+KD38Pngc1qD2dIdcH/viaMCCg+iMJC24L6keQvEvHRd5PTjGLRRl7TcZVOxmBc35i8V0VOaq8g7YafyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/nqA2whF64M+PT2HrTbvBkDecn9Alf8Pc19+d2U/VE=;
 b=RfyuJCNSPrmqbpIDxaSBO7Z9vvKdTJqJ+07s9fnpKSwa/iTtGeBzqWRcuGxWO4b9539IStdeeHxM8G+RLEkiB+WNaFBoFFa1xFDGzkS0K4PwOi/EzrC3LsbtRkIF8/D9o0MXBmiRYkXyILVaIgd893+I+f6AW9tFu77UUq3chIrv7vmWwvq71PW3e7c9pLugp7rjxjK7aH52K5RP0Ghev4vWe5/UKRbR4F4f5oiY3yEX8j/sE4S6EPzA2Nw7dDJgbGzkGOELOvhuo55Ma1ROUMrkS57lSQs35TeG3uLW0WEsdfmeNmYuU/Wwdhf3IoutS6GoULfadlbVK/6qefgDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/nqA2whF64M+PT2HrTbvBkDecn9Alf8Pc19+d2U/VE=;
 b=u93qkuWVoYVgBbyanzRWzObm0JjZLSlqifErmoQPnQPPhEjERMy530wCXcBzoooSrhtDgaYXeEK5h6cKktO2RdlCNzaqWBY9JH+lbAAwqDG9Xpch+IJca9O2nLkVi1pEmvaLjyMoMdlNBSh4qFmNfzqHzWLqLaxnQPRAbq0oNbA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TY3PR01MB9699.jpnprd01.prod.outlook.com (2603:1096:400:229::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.6; Fri, 17 Oct
 2025 17:06:01 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%2]) with mapi id 15.20.9253.005; Fri, 17 Oct 2025
 17:06:01 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>
Thread-Topic: [PATCH net-next v2 00/14] net: stmmac: phylink PCS conversion
Thread-Index: AQHcPqo1mbWk7z7YKEGbWzZDU76xm7TGkvmA
Date: Fri, 17 Oct 2025 17:06:01 +0000
Message-ID: <OSZPR01MB7019B9CA4E027DA525477D6EAAF6A@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TY3PR01MB9699:EE_
x-ms-office365-filtering-correlation-id: 8ea41dd2-d005-41c1-def0-08de0d9f7304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|13003099007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XZH7U1ESZdWCh+J87zWbKrmJJj1xn88Db4DK7p3nhCwQ3jer9iT5N+ztdSsm?=
 =?us-ascii?Q?UOrhLhHUw63LgWOt/HY74osBDD0v7wrktE+3BbfPX8nbuxNZQ38dpx9qtBSq?=
 =?us-ascii?Q?ZXrEdedCMy36yrz+LYpaELfCirL6JUAnop7CZBI9h8UFyPmhvuXELgCSsWvP?=
 =?us-ascii?Q?YFAzUKOfIvRzKtpbNecg+xaGCE3jurGb2T6Nx1qSFt5HGgmIxvjI4dxQUI46?=
 =?us-ascii?Q?zDR73PnrEc0EEaNYE+8iPfZyS0EmgB6+o+rlEe8k2DiHnhKUXuha/Bs2ZCH3?=
 =?us-ascii?Q?8iZIfBbZIIUY/W6moVYZ4+R+uUlvceEYFdyATf5Zjxvy+vj1AReNcN0iArxi?=
 =?us-ascii?Q?e4D82SPS2KijhjPKINjwU/ImDbAskgaH5s4Y/1oghmbUmdhGQaSt5lp8gguV?=
 =?us-ascii?Q?Kz6gRQ1X/mH7+JiD52mui8Uw4AMJFpwLdn9J3YkUpsK4R/rtoh/A649l30g2?=
 =?us-ascii?Q?EkCRV4uvi6Hn4hDu4GsC23e9yhIrt2azXjFSJsnNwoQhJtiCkGx79TCQVRUu?=
 =?us-ascii?Q?B0OrpWSszM7mUEeoCI93p0yduc60Z41UCMT4bMtakYtKR5shbqIxDfjdvdP1?=
 =?us-ascii?Q?fztLNCzr+UK4xGH4reptO32/ngoGm+xmiwTiEs8TP5VqK8cF/qrG5aEQmiI6?=
 =?us-ascii?Q?6QQo/c13LBqeFh6Yh8vckYxcxsqYV0d2T/FWxQ77J1WyeKzCUJcOU9jG0Vie?=
 =?us-ascii?Q?X3JAN5GCyw2v7JF1+H/nswrscflvxh49EtPHMA3EjCAlkYK6ZnkTXABOHg1g?=
 =?us-ascii?Q?dZuRlU+/TnV9k/1YA4XhHlWaSGB7Xm+a61xxqKolQjDdyNywScJdpntpN4EM?=
 =?us-ascii?Q?v/YwEUr2dg+BddFFT5j11/MDHgOo5Hnz9BNsao0r1aEyA/6VjAV3DzGLxdmX?=
 =?us-ascii?Q?CoBRxQOFxtRyMi8PG8AEzcDYQ1IuKLKiXWC/wUQ+fO4EcEDIYfapbFLz/bFQ?=
 =?us-ascii?Q?A9/DM4XdGOiSJMLWqdhr4bGW/0KHK4JRhPCLJItLXf259CEAlmvCC3lYsvjp?=
 =?us-ascii?Q?AxB1VuZWsEAdRfNiViYXifQ3cFYeTA42xe2mAkAAczuWlb9cYJYAZJzRAVTz?=
 =?us-ascii?Q?HxsZE9YBYcR9R49lek2XktAZLWPIsACFlQ6mZIUmVYaRc4j/Fr4wjH9UTtNw?=
 =?us-ascii?Q?Icx4AQbkELNksOgseYelKzvVQf9uCQuECsDo1Tf7Lwi1TRhr+ESoVoynJT90?=
 =?us-ascii?Q?5SGwCL9jNPw85zLaR3e2K/kJIddZUB/sKF3vw0dsJHO88n2IJSo96/0+Z2GU?=
 =?us-ascii?Q?kupXs1RJFpnJuc8nFP6ERKNtqREW8zEW+lknwa27Rtz1y4+QqnTb9wWThL6e?=
 =?us-ascii?Q?xgJhWiBhQ9jWiBSSNLDwM6LR1wSmmpbAFS59ZB7awKz17xaiZzhvSeWJFzcv?=
 =?us-ascii?Q?dlzQ7/hUSuB62nwbFqtzGvJdKq347lSZr7AgHgQHgcoHkFobUciVGevrY0du?=
 =?us-ascii?Q?bDr/FJiHbnuDt6Kjo7a5wEqvOxIu+4tFamkmK8tFCMEtviwC6xivvg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB7019.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q26kuhMTwfbvafow6S9PginPbbIeheGzN+u9q4ju88CXPKBn8ypigHzLagQZ?=
 =?us-ascii?Q?5p8vphPVVyFNfsPp6GNbfBZJfnamO85/KAU+PAcWGUwdwJ/jD4J0WNGnEDzO?=
 =?us-ascii?Q?NEW1Z+ZWq/51yleCL9hT4pG5QHxdNNG/mV8TwzvDuc8eOj7aPkTDfTUymHY5?=
 =?us-ascii?Q?wX0QE66/ZgSOy5LnyRJ+uBG1l+Qgt27xvuJ15W+Sl65r/l2kQAhXhnGAKID/?=
 =?us-ascii?Q?y4RM2fMATOLUPKJyf8zBlog9wCJ14zQcmg9945Y3cWGAe9HCSu+LNlzYcd+/?=
 =?us-ascii?Q?TfHGdB3plcfgIqbz5dU0nzsNsmEALBsZKlOk0xTrQsabG2fSN9SlN8GwlJ8l?=
 =?us-ascii?Q?hkmjVLa4cGMGCYKvSRktLvX+qPIRmxpLro52GZmH1+EizxV0FM5BdOQAkC5d?=
 =?us-ascii?Q?EYQ9ZcyNYIJ5ARSDGKIq6/oAYoK8IIDEDL3+xq1OhaweJLUVpPbkbVtju7no?=
 =?us-ascii?Q?hBSv/1wEhVGqg+3IfHoPOoYUIb/hP/10k9R0XU9JJxzoVfK/5NC4XZj5Lq9/?=
 =?us-ascii?Q?LaSCqyptZlrtSJnBfofff9yse5r05DaYkg0axVOPjUJvvz6uw5vjQQqa7bZH?=
 =?us-ascii?Q?jtbiYeP85WnbgZ54D4iQihX/BW+4lpk7NuSUWAi5Ie64pFMhvlCVAa7yrLjs?=
 =?us-ascii?Q?iLdxaI9SLcMKQkybF6MtuaDApkk/+2AyGLipMTBo2DeY9rE/f+LTePhieUwQ?=
 =?us-ascii?Q?kp4qIl2g46GSM8cNeP01uYhKuoRYnSK5M/gtqslIdnkMcrBpNKuleHDBttDc?=
 =?us-ascii?Q?7aA+eWM4ddpyqogAeZ0EN5g9oUJsS7AjWNTDt5e/x3xhU489a85005aeIzzI?=
 =?us-ascii?Q?nGTvS3fmw/kPiIDhPo9orByMaemMS8YEjuyZ+GSnudha6UJoHXkaRZYnKhOm?=
 =?us-ascii?Q?W+brhK80blaxFCNkudZYlkfVobZBW4eB5F6B16ickqBZPhb4j3ml4rIUdMus?=
 =?us-ascii?Q?leBF1OYme7pqZOBMtL56SpZsDcCtq1ucoADuoKHwU7+vSB0j9PRoeq82VWEG?=
 =?us-ascii?Q?HPNcFlv1y//p4q+Pj2uovi2oWaEcmyqifMicdRwG8KTEB1BXyt5q2duSfDlt?=
 =?us-ascii?Q?LZ3DC/fQ51RfF04jXPe6hevgj8NapV3k47BE90HLjky/SVOFa81ZZjiWjddK?=
 =?us-ascii?Q?QX6u9i6tZQYzSqRHlK5mmyh5QAbz5XNcbhZe4yc6Zxl0s78Zf2JZWA0ttJhp?=
 =?us-ascii?Q?3jgMIr+1DdmqUp8mG8LYFd+7IEuZerO23wgtlNcilNvIg9KgafOFcoy3NJeH?=
 =?us-ascii?Q?80FLMLTLBdkV6MtsxwznxnjX9ENLwzGlXCyF8sLVPlMf8EfBtsDKHuifeZN/?=
 =?us-ascii?Q?g8agVPNlLLUcFKGmpiXA/QuVqQTkxR0tFfmXa8osxA0lQNCEXp0Ut1pdlLq+?=
 =?us-ascii?Q?ebB3dCbkMEXDElE0HU/evh/BVJLDwbOUJkDbLxls3vqM2WcjHv0BLU/TbZDu?=
 =?us-ascii?Q?VurFmaSksJoGLI8QJ3i34eqbgCbXn4jI4SmRa3cH5Oo85mtDX8YcszXwo2RB?=
 =?us-ascii?Q?kamIcQwS3SV3UbMSirSzrURjy+1msawtCATfpzMnss+cBMOYzvTdkgj9qlGP?=
 =?us-ascii?Q?PBlgjDDhZQbFFAVldLWpm5ylniUIRwA1PxRU41yM+Gqrw1EFsprcBqj4I4H7?=
 =?us-ascii?Q?FWSPQrmMQIJMsBQIXBUypkU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea41dd2-d005-41c1-def0-08de0d9f7304
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 17:06:01.3240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1kHXetG7D1X/9kMH1v19vax4l5NBfpjsKC1NliftLsV9EXkSbJ6ZIZpof4HWOL1+csRniLHfsxuBSCA2CKAjPptc2KmR2pWvcqUGp/c82sCiWe+htmCbVctncL/8PWJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9699
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, Simon Horman <horms@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "Jan Petrous
 \(OSS\)" <jan.petrous@oss.nxp.com>, Rohan G Thomas <rohan.g.thomas@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <olteanv@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: phylink
	PCS conversion
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

Hi,

> From: Russell King <linux@armlinux.org.uk>
> Sent: 16 October 2025 15:35
> To: Andrew Lunn <andrew@lunn.ch>; Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Alexis Lothore
> <alexis.lothore@bootlin.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Boon
> Khai Ng <boon.khai.ng@altera.com>; Choong Yong Liang
> <yong.liang.choong@linux.intel.com>; Daniel Machon
> <daniel.machon@microchip.com>; David S. Miller <davem@davemloft.net>; Drew
> Fustini <dfustini@tenstorrent.com>; Emil Renner Berthing
> <emil.renner.berthing@canonical.com>; Eric Dumazet <edumazet@google.com>;
> Faizal Rahim <faizal.abdul.rahim@linux.intel.com>; Furong Xu
> <0x1207@gmail.com>; Inochi Amaoto <inochiama@gmail.com>; Jacob Keller
> <jacob.e.keller@intel.com>; Jakub Kicinski <kuba@kernel.org>; Jan Petrous
> (OSS) <jan.petrous@oss.nxp.com>; Jisheng Zhang <jszhang@kernel.org>; Kees
> Cook <kees@kernel.org>; Kunihiko Hayashi <hayashi.kunihiko@socionext.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Ley Foon
> Tan <leyfoon.tan@starfivetech.com>; linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> Matthew Gerlach <matthew.gerlach@altera.com>; Maxime Chevallier
> <maxime.chevallier@bootlin.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Michal Swiatkowski
> <michal.swiatkowski@linux.intel.com>; netdev@vger.kernel.org; Oleksij
> Rempel <o.rempel@pengutronix.de>; Paolo Abeni <pabeni@redhat.com>; Rohan G
> Thomas <rohan.g.thomas@altera.com>; Shenwei Wang <shenwei.wang@nxp.com>;
> Simon Horman <horms@kernel.org>; Song Yoong Siang
> <yoong.siang.song@intel.com>; Swathi K S <swathi.ks@samsung.com>; Tiezhu
> Yang <yangtiezhu@loongson.cn>; Vinod Koul <vkoul@kernel.org>; Vladimir
> Oltean <olteanv@gmail.com>; Vladimir Oltean <vladimir.oltean@nxp.com>; Yu-
> Chun Lin <eleanor15x@gmail.com>
> Subject: [PATCH net-next v2 00/14] net: stmmac: phylink PCS conversion
> 
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that this
> is to workaround the breakage that I've been going on about concerning the
> phylink conversion for the last five or six years.
> 
> The problem is that the stmmac PCS code manipulates the netif carrier
> state, which confuses phylink.
> 
> There is a way of testing this out on the Jetson Xavier NX platform as the
> "PCS" code paths can be exercised while in RGMII mode - because RGMII also
> has in-band status and the status register is shared with SGMII. Testing
> this out confirms my long held theory: the interrupt handler manipulates
> the netif carrier state before phylink gets a look-in, which means that
> the mac_link_up() and mac_link_down() methods are never called, resulting
> in the device being non-functional.
> 
> Moreover, on dwmac4 cores, ethtool reports incorrect information - despite
> having a full-duplex link, ethtool reports that it is half-dupex.
> 
> Thus, this code is completely broken - anyone using it will not have a
> functional platform, and thus it doesn't deserve to live any longer,
> especially as it's a thorn in phylink.
> 
> Rip all this out, leaving just the bare bones initialisation in place.
> 
> However, this is not the last of what's broken. We have this hw->ps
> integer which is really not descriptive, and the DT property from which it
> comes from does little to help understand what's going on.
> Putting all the clues together:
> 
> - early configuration of the GMAC configuration register for the
>   speed.
> - setting the SGMII rate adapter layer to take its speed from the
>   GMAC configuration register.
> 
> Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> the nail in the coffin of this code. It should be the transmit
> configuration (TC) bit. Given that when the link comes up, phylink will
> call mac_link_up() which will overwrite the speed in the GMAC
> configuration register, the only part of this that is functional is
> changing where the SGMII rate adapter layer gets its speed from, which is
> a boolean.
> 
> From what I've found so far, everyone who sets the snps,ps-speed property
> which configures this mode also configures a fixed link, so the pre-
> configuration is unnecessary - the link will come up anyway.
> 
> So, this series rips that out the preconfiguration as well, and replaces
> hw->ps with a boolean hw->reverse_sgmii_enable flag.
> 
> We then move the sole PCS configuration into a phylink_pcs instance, which
> configures the PCS control register in the same way as is done during the
> probe function.
> 
> Thus, we end up with much easier and simpler conversion to phylink PCS
> than previous attempts.
> 
> Even so, this still results in inband mode always being enabled at the
> moment in the new .pcs_config() method to reflect what the probe function
> was doing. The next stage will be to change that to allow phylink to
> correctly configure the PCS. This needs fixing to allow platform glue
> maintainers who are currently blocked to progress.
> 
> Please note, however, that this has not been tested with any SGMII
> platform.
> 
> I've tried to get as many people into the Cc list with get_maintainers, I
> hope that's sufficient to get enough eyeballs on this.
> 
> Changes since RFC:
> - new patch (7) to remove RGMII "pcs" mode
> - new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
> - new patch (9) to simplify the code moved in the previous patch
> - new patch (10) to rename the confusing hw->ps to something more
>   understandable.
> - new patch (11) to shut up inappropriate complaints about
>   "snps,ps-speed" being invalid.
> - new patch (13) to add a MAC .pcs_init method, which will only be
>   called when core has PCS present.
> - modify patch 14 to use this new pcs_init method.
> 
> Despite getting a couple of responses to the RFC series posted in
> September, I have had nothing testing this on hardware. I have tested this
> on the Jetson Xavier NX, which included trial runs with enabling the RGMII
> "pcs" mode, hence the new patches that rip out this mode. I have come to
> the conclusion that the only way to get stmmac changes tested is to get
> them merged into net-next, thereby forcing people to have to run with
> them... and we'll deal with any fallout later.
> 
> Changes since v1:
> - added Andrew's reviewed-bys
> - added additional comments to patch 3, 11 and 14.
> No code changes.
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 65 ++---------------
> ----
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 66 ++---------------
> ----
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 25 +-------
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 68 +----------------
> -----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 24 ++++----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 47 +++++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 23 ++++++--
>  include/linux/stmmac.h                             |  1 -
>  15 files changed, 104 insertions(+), 245 deletions(-)
> 

Although RZ/V2H doesn't have PCS, I tested this on Renesas RZ/V2H EVK
and found no regressions.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
> 
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
