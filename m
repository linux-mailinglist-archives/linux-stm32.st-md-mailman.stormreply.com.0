Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B7CC7B36
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 13:50:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51CF7C01FBF;
	Wed, 17 Dec 2025 12:50:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013068.outbound.protection.outlook.com
 [52.101.83.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0FDEC01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 12:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sf8X9Xjg+0bEds3yZR/ue5lj/LeUDbEr/rU92RegZvCBrSveDNsuM8yet3uqYKxrOQSXIGEyX2WNO0oXzaXOs0o25XP2QouI5DRuOOa4JE2qqtREUtj2SSfAr8tZS7ZFnljV9mvqX4fyNRXlwSqrw5OGJJZdruSVY+hcwZKmcegkmyARg0yRS54jRI47DKxuJli9Di23uXF5ZBoW2E0AV3GH2GTcaQs/62RKKvwlHcllnMXF0DdMeamJkofH9UigEnfbe7rTcEj0Dr+CnBhlAr04wvYGp8RvQut7qcHoEiYHJ737BzVO6FYWwnHdd9u5A6/l0ldcePrDDb18Lu9X8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nITZEm2C38F9RlpUbj5heIJM6wca/r/qAguViqFOmjQ=;
 b=DVwoDmt2AQzK+0wrkg4UHkDhzSOiLA0X/EDu4KMFtD1EyDTxV5NmIzSELTWwRQer0lJUrrpb6kDhcnD5AiS9yc/WrYOWtz3HnWY5kM2/aaWQ4TpnSyhYA79t/5FOjozTvUB+3VBH5bwMYtJRtAkGSBAhN9xsPQ2xcXpRJW7nk5wzz+uVQLxO9Z/TywiWmSrna+pUOug9wvpBuuPypUR91RzeFjptRb8bwszRxrj/FMI8tsjaRZzvO5YexPV3LTb9tsAi+GVOqZbg0WZ7Irar3OQZsKuqJcczB8wMjoihtqD4Z6OizBz1TmQIyct7Gl47xzAsj36rQbjWn8x+EOoq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nITZEm2C38F9RlpUbj5heIJM6wca/r/qAguViqFOmjQ=;
 b=RtfndEgmXnez+RE45Uz3G7mJXpfSuWEpAbbiNtdYY9nCRhFe8AxtEM8inYGx/lHCklspwB/LOEVq0ReieQWl9xuyl0TB1lFW9tW1LR9T/Y6NPxrkbDWknnyUJMMOJWxlhyeK3LBAV2ZJhXeOLAXIunAE0u737J29IN8OLSi1Xr/0UGTPkc6n4xQY1Nduuv7y8vtVc3BxlB6SUTOie0HxzVdA5sN46kszYXxpIJBhNyGdqizIAQO6Hwq+91CNfhqvoq+ex8I8zUKEo7eNBqLueEHckZbC06D7oCO+SAaqclcfVtBtifgk5fRo9bjq7Si49s/e5jvSJ4haHt5wfLZeRw==
Received: from AS8PR04MB8497.eurprd04.prod.outlook.com (2603:10a6:20b:340::17)
 by AS8PR04MB9047.eurprd04.prod.outlook.com (2603:10a6:20b:442::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 12:49:19 +0000
Received: from AS8PR04MB8497.eurprd04.prod.outlook.com
 ([fe80::24f6:444b:9e8d:6aec]) by AS8PR04MB8497.eurprd04.prod.outlook.com
 ([fe80::24f6:444b:9e8d:6aec%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:49:19 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Hariprasad Kelam <hkelam@marvell.com>
Thread-Topic: [PATCH net] net: stmmac: fix the crash issue for zero copy
 XDP_TX action
Thread-Index: AQHcZO1pj0nep9pNq02KfA412DHJhbUlwQSAgAAYKSA=
Date: Wed, 17 Dec 2025 12:49:19 +0000
Message-ID: <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
References: <20251204071332.1907111-1-wei.fang@nxp.com>
 <aUKPHdtAPDnMqB7X@test-OptiPlex-Tower-Plus-7010>
In-Reply-To: <aUKPHdtAPDnMqB7X@test-OptiPlex-Tower-Plus-7010>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8497:EE_|AS8PR04MB9047:EE_
x-ms-office365-filtering-correlation-id: 2d28fd59-dbf2-4ff3-10fa-08de3d6ab1c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|19092799006|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1oEyNV8Hqr70br3qJUc5xPlIe6i4ZWR8SngtfRf3aF+uoHdGXQLLOEN4EPTn?=
 =?us-ascii?Q?Y1FTEVmZA6kSl87Mi5D6W1TK4QozZcPixhjZOcELZ8xwG1Kpt0BCv0d9eR0H?=
 =?us-ascii?Q?NNZRpjs55rN6VHAaSTtS7QE0vNEUMStMUX799iO0C1RYLBSgDDibfEaw5pFz?=
 =?us-ascii?Q?mYhfhhPuQBHxjnsO8ELAj5kCFnZUTtK12fYSg2ldaUpZx2iWGjeSDxPhHZYe?=
 =?us-ascii?Q?e7v3cc0TUEQm0xZuot9hJSQgSt+5dFOp4fAT8e65Vc6O7MQSJ9Pb9DWAZ+Pk?=
 =?us-ascii?Q?2NT646iuz4dBoSmxPkp111QRnu2C35Eu14koIsJKfjIZ/Y5RF1w2MxVLkPuk?=
 =?us-ascii?Q?w9JfXg87qvH00V/VBzy2KtrbPI2AY0cMjcLxDuDNO49b+/0SRpNegzPTb2qd?=
 =?us-ascii?Q?8eNKm0mUTSoX7QMCqPLqzkYQV+ZIaVb8g42P8IsbDZGZy31F24OmoKJw+KjB?=
 =?us-ascii?Q?ObEwg7zcybK8DjGFggD3R93zDveoui2xhB+BffoszZFrRl1OhoK/Grn1DIme?=
 =?us-ascii?Q?tWthE1QqimJXDQMDQiGkyRCe5BykvCnQdOtJ/LJkKEijXmvoiX/1ohXNDb/Z?=
 =?us-ascii?Q?Z5fw6LlgYXEHKGpjaEIXaWZuiaqTGnXWQVbtQU7Omu7YToSilA83OLoMDfpm?=
 =?us-ascii?Q?YQfTETEGSCzp1qwuTuYGyxWjp3+P7RQrm7AJ085n6fh8k0iLvBOEafwkY8zH?=
 =?us-ascii?Q?7/BCYDpGsiaD7YofrGStNOx6bNtfxZ9QwHst+M/I14shUP+zpEbxoQ5rnv5T?=
 =?us-ascii?Q?l46oCId9xplZXYv23HOwpRBiFikKIIGnJAIl5WJnR2XoHHnEWDV+KrEKs3B5?=
 =?us-ascii?Q?PWuoCYowq380XPd+SruVd+K5gOemh6Qxt/glOznDv6fmwg4OXENAGbkYCwSx?=
 =?us-ascii?Q?dbLJTeZq2WzlnJZtd/ghka/w+NO60ZxYakNL9Mmv71MWBA15lAbLNF2bkawf?=
 =?us-ascii?Q?9HsxfWSAWg2KillxVL8jSQRs1Zaq5+IPYXyVVo9eeuOEqnE6ydEUrAGLmZlz?=
 =?us-ascii?Q?sqFVEfvbnMeB3a9m3Cm70B0LwBPt6MeeyL472xd/tEclLv61fp3DpXckEPMZ?=
 =?us-ascii?Q?o34m1uKCXO5KkJmy5JOaG1vwVz7JTjxps4xl2DvMXa8UayaIVgGXkZdQVkdP?=
 =?us-ascii?Q?8HHKWtI3hkBaYS23ZGYXTGUdtZ9945pFLVpCjgL7nFVqnri3BliURf/hi4br?=
 =?us-ascii?Q?EnCKrp/o9mTaaxFFzgyZZALHrNLXOTTFaGhnVu7SZ47fb7brXxGhX47IS+ta?=
 =?us-ascii?Q?Z8T09lFvNxO6KeTr12oVjM/f+sJZqzSu4bu7Ytd8XUNhCAWmdMOyUTEGn6AB?=
 =?us-ascii?Q?kVfwl+2qw54HR5bjwh9O3xo8oI/mWyVIJkw8jC2YVzI8eIFDpJq9JIjP5pR4?=
 =?us-ascii?Q?Z/JpevLTIiJaRGXjdD6brFI7HJOe59W0L46foO4cAB1n1DLAf3dJVyAghypP?=
 =?us-ascii?Q?kQ4bOdRmAMAxL2F9LNa7KoeUYYXtmKkVOPtvGdb9BlSvpnO/wmkRyIAv4PdG?=
 =?us-ascii?Q?PmSio8xyl/i17VhIeL5Po3Hsj941woN+/n1u?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8497.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j/UCb50zDNTtGKY+QiqxyN7Qlte/MGcW1RVIsy9I/UMQbALdJ07c9G56Il7Z?=
 =?us-ascii?Q?1+xr+0rKxF1waA0bmIe56R9aR1x+VK3c8V+Qw7HxOSpZARbn1alkONJOy7c3?=
 =?us-ascii?Q?cs5Nl38E15srI4c1efQSNof7UUiUB9xKz9QFW4+5+8pKgfXjC0PCkw72gi1o?=
 =?us-ascii?Q?fXc9/diIqECtPbqdx+cGGf8ulLrOCCKFZ9LHJ0mVMv28wbenImW+8a0pw+YQ?=
 =?us-ascii?Q?rIH9WLA0Jf/a96P+iqU+inSR/pahlFJj+C30HV4KI52tjTWOPQvktZ8Y5On1?=
 =?us-ascii?Q?Xh50E7Se19z6QYaOWkhun5fGZbtGS+MkIX/HUYvz3VOKwYzfEb0FhentHccj?=
 =?us-ascii?Q?LrQ2X0nMJTSCiy8KKH+6URVUIx5Ze9Zz5C1sC49SefiCLGHCHKc/EkPl34Ar?=
 =?us-ascii?Q?M+xmNmXCo5T2S/Fgg1ejR5Cnv7Ag8lp3QsLF769J8nq67fYZSrJhtdzQAHw0?=
 =?us-ascii?Q?Zg129Takh9M+M/+oSadAHfcB9o2lSe2jny6K5UnvdxfVBPYGvqAneVHwTfot?=
 =?us-ascii?Q?ZKUouDrwdYIck3bcZKYY349YAhE8vkypIvlScjMF6mDxCBkiVDnRxZdJNiNT?=
 =?us-ascii?Q?Z0ZC9Jy47keZ1for9Tevb/knZvw4Bj1TkuHccZCwU5T8/sFe9rzn+O0gXrMX?=
 =?us-ascii?Q?Bm8oTasuvTImhg7xEm3ace4a6Fk904FcwrFv2Ye8fItTcYci1PgdiO6eCmme?=
 =?us-ascii?Q?zgavDbGFV3FJG4RzHeA07SXdznhxZ1QFhzzzdCJWF1zllzi04HbzymehNp8K?=
 =?us-ascii?Q?fAD60xBKLuTGlIkVyw3tvsWziDWU2phA7Q6ZEozG4KjDhq5/HMTiCKPXW+81?=
 =?us-ascii?Q?4IM7Oxivn3IT3FTDklA/jX4Q5FT2AXl8NMSYHEtZxFicYJqurbjaeUoD+ezP?=
 =?us-ascii?Q?WIszMrSo6YcbYH2yYo65a6/VCqiVfS1TpeKJQVNIuaew8uCABKS63C4P0g0j?=
 =?us-ascii?Q?7wxIsTGif2jdE3CVp9wQ3jdoV/lJVzoj3XC5P+b8zcQ7JM8hb4vnaam4PIlt?=
 =?us-ascii?Q?LF/6UhFrg19NkneMgg8JnYjLPjoBIp8dbTVXUtIO+sHfpQShe2g+FawfDzdu?=
 =?us-ascii?Q?GXVxpssarjoy18aMm/oVPZgzmAiab5rzy5aWAIlnIfzwc91SFEPAIBs8M8qn?=
 =?us-ascii?Q?lLoDOeUUgU2PTSH1eVzmPLg7q5Ha1TreXauvNmkj/MLQCjamUrusnZC5C9uK?=
 =?us-ascii?Q?m/4XwzpC/9kA13Eq3ujh99wsKVrfM1UwmXXxqiv4Jaxphm5l1R98xwBh2MZi?=
 =?us-ascii?Q?ft0ZDHBsRqFI5X+Ik6xw0lb7hpTRWI8mynOlvb5b3CDKJ2lgCpeUvXFY5eDC?=
 =?us-ascii?Q?243PWR6iT8JADWZSjd+ZOvooFbUYn7FK9kST7g+3s8Of2Hnfg4JC0IuQEzag?=
 =?us-ascii?Q?D8lUsoRMcl7vcXHpLlbk0rlrIkRmSFes9WwD9n9b/tYSPaJ6RJc1vF5ushnZ?=
 =?us-ascii?Q?6p5uMJh+QJRrwe4hwX2xaJ4p+lHpi7HlGyh5ENkqHp6O5N/5BPMcnZ3xYNMB?=
 =?us-ascii?Q?hS+mhWRWyom65b9fhcg8lyKO0luttaLYnVQAQ/j4CKmshR+k6EndqXfxyweD?=
 =?us-ascii?Q?HnwOSr63LYx2AlFspkE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8497.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d28fd59-dbf2-4ff3-10fa-08de3d6ab1c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 12:49:19.0763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0o4eLK4mKQ5f63h7SUK8pxRImmMQht2omYOEBpAawhaURyLfKZteIAh4NS/UANtRfUTjhs4sAmqp27/so43kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9047
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "0x1207@gmail.com" <0x1207@gmail.com>, "sdf@fomichev.me" <sdf@fomichev.me>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "hawk@kernel.org" <hawk@kernel.org>, "ast@kernel.org" <ast@kernel.org>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix the crash issue for
 zero copy XDP_TX action
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

> > -	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, false);
> > -	if (res == STMMAC_XDP_TX)
> > +	/* For zero copy XDP_TX action, dma_map is true */
> > +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, zc);
> 	Seems stmmac_xdp_xmit_xdpf is using dma_map_single if we pass zc is
> true.
>         Ideally in case of zc, driver can use page_pool_get_dma_addr, may be
> you
>         need pass zc param as false. Please check
> 

No, the memory type of xdpf->data is MEM_TYPE_PAGE_ORDER0 rather
than MEM_TYPE_PAGE_POOL, so we should use dma_map_single().
Otherwise, it will lead to invalid mappings and cause the crash.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
