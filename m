Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2B98BF545
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 06:34:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AFB1C62EFE;
	Wed,  8 May 2024 04:34:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28553CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2024 04:34:33 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44844JES025211;
 Tue, 7 May 2024 21:34:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=PPS06212021; bh=nOi6sSV2XjHaweLUTv
 x0U8mh4DE36kqPHkLF31mzwy0=; b=NuS/gRpljMMDh1JGT5lrQs1hkp1mjSYnvc
 vUDBzaSTkU7t6Y8WcGEL4gc0SWiwrhv8vzSiGrRW3aaXFdTbcd13QZkccsTi/z57
 5WF4+LsyiRFuVQbxTXd70Jk2HHaIwJ1VG6JdO5O24YhCuN2D0nTM0YRUSqHDn0bO
 FvZYFLfM+QL0vPRHkb46yxrcO9/2ZYXUmNINls3bRibnWltB+1tWtZBwKwDBEoIE
 CM8jf0DexHNxKKgLUkTfPg3jJLvJyDFo3uOlKbakUyFp3RQXjan7xCDw0tIDClEU
 SGat7cMXKcc+8jAQKpPjJIXllL9ed5Pah/iEDsyO4DYT/i9eF9Fg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xyse18e06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 21:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkcdU8/h37an/FZAGf2FH7u62xl79ampEG+IbSXKHbZ7ReIZBTR+KGnUBtu7hs+5+m8ygE24UO47wcEuZ/VWtwyemHpfnGl10Qh4CkWc9dHwGBfdm2nM7iNLShTcsljrtLuUTgJ8/nDbeVo8TZrnEEu9sR2v1Nkmw2oAtZi3osFru+t5rXy1qOxy4vkVbSVcjq2pWABdJ03FBOVlyVR9OzFQZigmVXE/uG7h2AifWde3KdVgNRwSw3ei5wxhd9OzFAPs3UImWfoOf0vPQkOS5vjE7bD5sQnMRuZBUrIj2I/FXwhpd2+1v6W4D00tVy3Ohe6PiKJso/D6WEPhGizWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOi6sSV2XjHaweLUTvx0U8mh4DE36kqPHkLF31mzwy0=;
 b=aQSV9cVyZmCXtld9JyvcDXEH/yVIqI8R/v12KXkv/g4zBODoK0sUwIvFr24TkeQsvfVwIoTal7ij1rcS41/kL/nIeE73FCYEjjYOunLlqfPYEXKVm60z1KfSF8BzEDR6JxN3topuarjLH5w3rNw3g7lF/WTYa6nNcry7VBaS1IfwlfAIEZVPkfRaE5wymIy5OBW/tct/KRl2VigHVJy+GIR95lPX30z3bZuY/LExm4IlMU+sDheqGUO3gZBtoUjj5CHs42TToT07hHSfDD4u3dj1/1tITfHUSi6bT5/UcryXhh4sHYMtAUbJ5KWAFxWiNDtL1B1EyZ1OFhEqFLBB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 04:33:58 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 04:33:57 +0000
From: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
To: "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "horms@kernel.org" <horms@kernel.org>, "ahalaney@redhat.com"
 <ahalaney@redhat.com>,
 "rohan.g.thomas@intel.com" <rohan.g.thomas@intel.com>,
 "j.zink@pengutronix.de" <j.zink@pengutronix.de>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "leong.ching.swee@intel.com" <leong.ching.swee@intel.com>
Thread-Topic: [PATCH v2] net: stmmac: move the lock to struct
 plat_stmmacenet_data
Thread-Index: AQHaoP6ANjX5QN2utUe7TH8ifOlQmbGMv85a
Date: Wed, 8 May 2024 04:33:57 +0000
Message-ID: <MW5PR11MB5764AE899B469E1A980E584695E52@MW5PR11MB5764.namprd11.prod.outlook.com>
References: <20240508041557.2394088-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240508041557.2394088-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5764:EE_|CY8PR11MB6962:EE_
x-ms-office365-filtering-correlation-id: ddca5766-2bce-43c0-5e3e-08dc6f181376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|38070700009|921011; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ILu5l8TznYmbUhazAsPeQWoTNXUIdeEGXyTJOt5zrgY17+NZkFd//f80JyMF?=
 =?us-ascii?Q?ILPXolqQ4ISzRmRpvIe7nPGNjjyC3Ak8bmumhiaAghDSMn2tSUWG8YfP4E8a?=
 =?us-ascii?Q?Li+fh40yJkHOwwT8jVt4R0GJr2/v/7CQ2eSHIelEfPJCD2tDhYAhJaAaNEJN?=
 =?us-ascii?Q?GFbm13rOoXoo+F8L8a1hlHPQDcrxoV7p5rjsDcYS4pQUoYF2DINi/4SpHQo3?=
 =?us-ascii?Q?aTMFC/YEnRZj1Ei+uW6P9HbGHvbklRxtbaX2p3fDT2yQ2GxA8b8VdPRZaVia?=
 =?us-ascii?Q?n4HxM6iSg9QOWJgFMorG5iL38NOFO21HnWUfSIu/kFJ8XDIy/6hmVCuzXIQH?=
 =?us-ascii?Q?1NtkwPX27IrHWFoX+fNZbo/jViXJcto/R1lvVoTNSn33B0HO4rvLNRhU5ID9?=
 =?us-ascii?Q?1X8te9lVyeBKGbnT9Rp1A4dLVstZ3/iH/vvwoOaN9NyspjRSmwi1c093aOb2?=
 =?us-ascii?Q?9/qGNgGNM0WRvdS7dRLcj2Hpjv5KQ3YR1YUGCjHSUgVHehNr6CEk1IddU0sT?=
 =?us-ascii?Q?Nsg98Aioxk7DfIDVBqMb5u73oz16SmOcZi+sZtkjOYzVbSfIdRyokq4sTzVs?=
 =?us-ascii?Q?3huTZo0F+CCGDpjJqK6UkNjiUSGiwMiYTCB7DPXX5z8OdjSNYqWnVbpKb8QL?=
 =?us-ascii?Q?6RmI823wqT2vt/ELw5wJmhve6XiDypo6FtyoHcSFa/PjrOJMRLIVkfpIeV/3?=
 =?us-ascii?Q?P1n369BGWnWX0ftaNmNIii3dxAfr7rdgFhyEvbIoDGo8Mm7r4zHwg0Gp3plA?=
 =?us-ascii?Q?QGWnY2dXmrFEhnMrJkORSQwsqEe9IxWbdjtxMWP/DtMsK/tk/rVXtdgYlVil?=
 =?us-ascii?Q?z1AwtqdNLId4aiVsU0+vdASiMGvsc4JhE9YbrViUndDmoGJAagYGnDU5f997?=
 =?us-ascii?Q?zrvCxcL/0eU7sa96ksURszp3N63WNR0DRVxtlTos+oY1uFXkO6uviClBcMnc?=
 =?us-ascii?Q?uTY/xvceg+OAoCmKUPsFjibqZO0XFIwuw4UwdFTVsQ6DcjbIxAhG4Xs0SKA6?=
 =?us-ascii?Q?zgw7zevHImTDT7W2zjxcNs0vg5keh0N1003RgUAfh1pzPNPFHOiLf/aW4FLU?=
 =?us-ascii?Q?iHUqaE6nGO4bHdhcqZLEZTeA8Q1FbPtAg8n1HY0fZYPflPzPh/PvW/dSftN5?=
 =?us-ascii?Q?uo8XEiNXXPMm8eIsLkcMdX1GZh7E3FaARt9rs4WAiTAgOCErvNcLAlwIQTwd?=
 =?us-ascii?Q?NnxieigZhcDIOX43S9CB/doHfpBXPIvQo2suqBrcUgQABBdk6yHMmzBP2pnJ?=
 =?us-ascii?Q?c4Od7p40mCdheR8xvDA1vgHGZfUomJ5MMZyy5Z1zB2LLHjsFY617AP1faPve?=
 =?us-ascii?Q?QYcnLYZtzrG1fA3W0O3BfqUzB9a9iLYx6lVDB5E4DEZiNFqqhEZk3SBtiu6L?=
 =?us-ascii?Q?kbJqR20=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009)(921011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L6bYJZq2BPfHHFoYpr3mcAHEyk3cEbyR+G/CIUAcs4TiKBfL7FKqCoyyGHRf?=
 =?us-ascii?Q?HDR4JadPcxOCvaWC/3x2AvrvXPJL5JpNpaLSk5FHoLupQsNVuAX/BfXH0Psz?=
 =?us-ascii?Q?p7pHRCp3FzDlGwL+hiQXo6QoWxjpd5n9rFzo/FbZXZAO5ozgeDt0u9yrdVyt?=
 =?us-ascii?Q?x0/qKKMus/k0Eay/KkSrVSZgOs0Bhi2uIVFwAtcuJagHpY+XgzbaF+xEWvjq?=
 =?us-ascii?Q?UbTjSTMqmsqu5ZsHhPOhOoixgnETzIdehEXNmZqf6wfUrg1mHfe1OFHebvrd?=
 =?us-ascii?Q?LqOkXKPduKt5yGBZ8EnpVcd9Q2dfCb35iVhHSk/gsN0pnv6g+cKg7XH1G9ra?=
 =?us-ascii?Q?5hfxlNHjddbetAHLXE6ZhNfJP1Iu+xQ9p65M4yCLLt8ZRnXn5i8/el4yeHaE?=
 =?us-ascii?Q?Kf3LfjcZMQVyIbkFzLAbFTfC0MUQHDTm1e/NatajdAJnMJheArWeM3V35wLl?=
 =?us-ascii?Q?Sk+ClzepAj9EQkYGpJIXFZNtNv6p274PMPqU/qlaEZ+jFMns5EiRiub0bOrV?=
 =?us-ascii?Q?Bd7PgjqIR9EO7sA0T1M2r48HzQ90vVx4hmJpl5jtUE5FBO5bpPImBM4/Glc5?=
 =?us-ascii?Q?Q71FaI7VFEvbYcgHyC+IlUpxgmPGdpmTqiBtJdtgRRgdn0haO6KJ38EvClLy?=
 =?us-ascii?Q?qKDstL5quGQdRLT26U3o+F7bZq7JdWx8U75MeEZqApdgM0lOibaY32qN1P6Z?=
 =?us-ascii?Q?8c6kEnSZpSMfawsEBJMfGGQXVQChBJNSpWAuCy4fUA+bU1y3Eg1OTg+pGfYk?=
 =?us-ascii?Q?QQFX9E6TQT5NUczxg7KhUbV5EgllXAAS6blE8rk4WLaBNHAZsTdOiYN5aHpB?=
 =?us-ascii?Q?RXL08e3SPl+zLXW8VA8HWCGQo1H+NNx8jjtu1LEOW3A9ERKOMl54uB+4kAFD?=
 =?us-ascii?Q?fss6rMoDx4Jh4sWtWNdVaErniSkMxXHTp0ENtxq3e4y+AsJuH1MbxpiBSIYz?=
 =?us-ascii?Q?K5PWbM1NJOl11Kvodmzr3f9De9Gn5KKtheHBLfGL/EhmXmovJFbyyHkKt9e/?=
 =?us-ascii?Q?28uE84XE/BVmN+dRXqlH85cVMt2244sbOrfWb7PIVoEbf3QlJ24QM7or2ZDD?=
 =?us-ascii?Q?oFHOS7cjxptRnqwoEbf9GjRLE4AiZ0YoNwh68E+9Jn42+0w9WpdfmJ2AzVMW?=
 =?us-ascii?Q?39vRZLVGtms8IBOjNFJRJQ6GipXash9BxqIHWbvPnK7sFVBJpV8q9IR1tG84?=
 =?us-ascii?Q?E/DUJlF2AG8c1OhzLDOETFxoxaoRVtMuOJybVINBBPKMKeOTumSzjAS0NPpz?=
 =?us-ascii?Q?HjglFEs7wRwfJSX8HN8BOlZe81X0sohsQ1BJYw8ycgmu7FzbtuZelnBZekdX?=
 =?us-ascii?Q?61iUB6GNncyScP86jmnNFGtqwech2ZsYHlQ7m5aeLTHByVa+tNYhdD6BFNJ8?=
 =?us-ascii?Q?saJdZbwjLyt4MJdYCqYsRY0OJnxgdxJL/HvjSNitV2h1dqIPnFKJ025sC8Sv?=
 =?us-ascii?Q?x54IzbQt1nvd5kyPP+dt9Q7YrJzcb6Vg9RhxLmWd0ciO/JgBROCwOsTGlTmk?=
 =?us-ascii?Q?frUmEFzac0J+DL1zpC9gMQuZCyhJtYbMt2O6nvL34oAaPARk4aTtyRw3qG2u?=
 =?us-ascii?Q?KxsUcgyvc22M9UOeSuWud0f70W19mXNRVSCb8vv0?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddca5766-2bce-43c0-5e3e-08dc6f181376
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 04:33:57.5674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qmcu3X9Cb4Hvi+VS60QYbmGyzXwd80eXb0IU98cEPAhQWdigxx2IblX8Y+VPZo1tmK7XbGX9CmcqZ4MW8yoBRkmLWMRUHnOoegpHxjJK/zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-Proofpoint-GUID: LzH4NJiKpGnPjffTOYDxjRoRPhDeJPsw
X-Proofpoint-ORIG-GUID: LzH4NJiKpGnPjffTOYDxjRoRPhDeJPsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_01,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080031
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: move the lock to struct
 plat_stmmacenet_data
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
Content-Type: multipart/mixed; boundary="===============1040427312659237475=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1040427312659237475==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW5PR11MB5764AE899B469E1A980E584695E52MW5PR11MB5764namp_"

--_000_MW5PR11MB5764AE899B469E1A980E584695E52MW5PR11MB5764namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I missed the mutex lock that needs to be reinitialized. Please ignore this =
version and I will send a new one.

thanks
xiaolei
________________________________
From: Wang, Xiaolei
Sent: Wednesday, May 8, 2024 12:16 PM
To: alexandre.torgue@foss.st.com <alexandre.torgue@foss.st.com>; joabreu@sy=
nopsys.com <joabreu@synopsys.com>; davem@davemloft.net <davem@davemloft.net=
>; edumazet@google.com <edumazet@google.com>; kuba@kernel.org <kuba@kernel.=
org>; pabeni@redhat.com <pabeni@redhat.com>; mcoquelin.stm32@gmail.com <mco=
quelin.stm32@gmail.com>; richardcochran@gmail.com <richardcochran@gmail.com=
>; bartosz.golaszewski@linaro.org <bartosz.golaszewski@linaro.org>; horms@k=
ernel.org <horms@kernel.org>; ahalaney@redhat.com <ahalaney@redhat.com>; ro=
han.g.thomas@intel.com <rohan.g.thomas@intel.com>; j.zink@pengutronix.de <j=
.zink@pengutronix.de>; rmk+kernel@armlinux.org.uk <rmk+kernel@armlinux.org.=
uk>; leong.ching.swee@intel.com <leong.ching.swee@intel.com>
Cc: netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-stm32@st-md-mail=
man.stormreply.com <linux-stm32@st-md-mailman.stormreply.com>; linux-arm-ke=
rnel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-kern=
el@vger.kernel.org <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] net: stmmac: move the lock to struct plat_stmmacenet_da=
ta

Reinitialize the whole est structure would also reset the mutex lock
which is embedded in the est structure, and then trigger the following
warning. To address this, move the lock to struct plat_stmmacenet_data.
We also need to require the mutex lock when doing this initialization.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
v1 -> v2
 - move the lock to struct plat_stmmacenet_data

 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c |  8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 16 ++++++++--------
 include/linux/stmmac.h                           |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net=
/ethernet/stmicro/stmmac/stmmac_ptp.c
index e04830a3a1fb..82b7577fea9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -70,11 +70,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *pt=
p, s64 delta)
         /* If EST is enabled, disabled it before adjust ptp time. */
         if (priv->plat->est && priv->plat->est->enable) {
                 est_rst =3D true;
-               mutex_lock(&priv->plat->est->lock);
+               mutex_lock(&priv->plat->lock);
                 priv->plat->est->enable =3D false;
                 stmmac_est_configure(priv, priv, priv->plat->est,
                                      priv->plat->clk_ptp_rate);
-               mutex_unlock(&priv->plat->est->lock);
+               mutex_unlock(&priv->plat->lock);
         }

         write_lock_irqsave(&priv->ptp_lock, flags);
@@ -87,7 +87,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp,=
 s64 delta)
                 ktime_t current_time_ns, basetime;
                 u64 cycle_time;

-               mutex_lock(&priv->plat->est->lock);
+               mutex_lock(&priv->plat->lock);
                 priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &curre=
nt_time);
                 current_time_ns =3D timespec64_to_ktime(current_time);
                 time.tv_nsec =3D priv->plat->est->btr_reserve[0];
@@ -104,7 +104,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *pt=
p, s64 delta)
                 priv->plat->est->enable =3D true;
                 ret =3D stmmac_est_configure(priv, priv, priv->plat->est,
                                            priv->plat->clk_ptp_rate);
-               mutex_unlock(&priv->plat->est->lock);
+               mutex_unlock(&priv->plat->lock);
                 if (ret)
                         netdev_err(priv->dev, "failed to configure EST\n")=
;
         }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/=
ethernet/stmicro/stmmac/stmmac_tc.c
index cce00719937d..f1e4d755a484 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1004,17 +1004,17 @@ static int tc_taprio_configure(struct stmmac_priv *=
priv,
                 if (!plat->est)
                         return -ENOMEM;

-               mutex_init(&priv->plat->est->lock);
+               mutex_init(&priv->plat->lock);
         } else {
                 memset(plat->est, 0, sizeof(*plat->est));
         }

         size =3D qopt->num_entries;

-       mutex_lock(&priv->plat->est->lock);
+       mutex_lock(&priv->plat->lock);
         priv->plat->est->gcl_size =3D size;
         priv->plat->est->enable =3D qopt->cmd =3D=3D TAPRIO_CMD_REPLACE;
-       mutex_unlock(&priv->plat->est->lock);
+       mutex_unlock(&priv->plat->lock);

         for (i =3D 0; i < size; i++) {
                 s64 delta_ns =3D qopt->entries[i].interval;
@@ -1045,7 +1045,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,
                 priv->plat->est->gcl[i] =3D delta_ns | (gates << wid);
         }

-       mutex_lock(&priv->plat->est->lock);
+       mutex_lock(&priv->plat->lock);
         /* Adjust for real system time */
         priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time)=
;
         current_time_ns =3D timespec64_to_ktime(current_time);
@@ -1068,7 +1068,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,
         tc_taprio_map_maxsdu_txq(priv, qopt);

         if (fpe && !priv->dma_cap.fpesel) {
-               mutex_unlock(&priv->plat->est->lock);
+               mutex_unlock(&priv->plat->lock);
                 return -EOPNOTSUPP;
         }

@@ -1079,7 +1079,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,

         ret =3D stmmac_est_configure(priv, priv, priv->plat->est,
                                    priv->plat->clk_ptp_rate);
-       mutex_unlock(&priv->plat->est->lock);
+       mutex_unlock(&priv->plat->lock);
         if (ret) {
                 netdev_err(priv->dev, "failed to configure EST\n");
                 goto disable;
@@ -1096,7 +1096,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,

 disable:
         if (priv->plat->est) {
-               mutex_lock(&priv->plat->est->lock);
+               mutex_lock(&priv->plat->lock);
                 priv->plat->est->enable =3D false;
                 stmmac_est_configure(priv, priv, priv->plat->est,
                                      priv->plat->clk_ptp_rate);
@@ -1105,7 +1105,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,
                         priv->xstats.max_sdu_txq_drop[i] =3D 0;
                         priv->xstats.mtl_est_txq_hlbf[i] =3D 0;
                 }
-               mutex_unlock(&priv->plat->est->lock);
+               mutex_unlock(&priv->plat->lock);
         }

         priv->plat->fpe_cfg->enable =3D false;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dfa1828cd756..316ff7eb8b33 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -117,7 +117,6 @@ struct stmmac_axi {

 #define EST_GCL         1024
 struct stmmac_est {
-       struct mutex lock;
         int enable;
         u32 btr_reserve[2];
         u32 btr_offset[2];
@@ -246,6 +245,7 @@ struct plat_stmmacenet_data {
         struct fwnode_handle *port_node;
         struct device_node *mdio_node;
         struct stmmac_dma_cfg *dma_cfg;
+       struct mutex lock;
         struct stmmac_est *est;
         struct stmmac_fpe_cfg *fpe_cfg;
         struct stmmac_safety_feature_cfg *safety_feat_cfg;
--
2.25.1


--_000_MW5PR11MB5764AE899B469E1A980E584695E52MW5PR11MB5764namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I missed the mutex lock that needs to be reinitialized. Please ignore this =
version and I will send a new one.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
thanks</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
xiaolei</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wang, Xiaolei<br>
<b>Sent:</b> Wednesday, May 8, 2024 12:16 PM<br>
<b>To:</b> alexandre.torgue@foss.st.com &lt;alexandre.torgue@foss.st.com&gt=
;; joabreu@synopsys.com &lt;joabreu@synopsys.com&gt;; davem@davemloft.net &=
lt;davem@davemloft.net&gt;; edumazet@google.com &lt;edumazet@google.com&gt;=
; kuba@kernel.org &lt;kuba@kernel.org&gt;; pabeni@redhat.com &lt;pabeni@red=
hat.com&gt;;
 mcoquelin.stm32@gmail.com &lt;mcoquelin.stm32@gmail.com&gt;; richardcochra=
n@gmail.com &lt;richardcochran@gmail.com&gt;; bartosz.golaszewski@linaro.or=
g &lt;bartosz.golaszewski@linaro.org&gt;; horms@kernel.org &lt;horms@kernel=
.org&gt;; ahalaney@redhat.com &lt;ahalaney@redhat.com&gt;; rohan.g.thomas@i=
ntel.com
 &lt;rohan.g.thomas@intel.com&gt;; j.zink@pengutronix.de &lt;j.zink@pengutr=
onix.de&gt;; rmk+kernel@armlinux.org.uk &lt;rmk+kernel@armlinux.org.uk&gt;;=
 leong.ching.swee@intel.com &lt;leong.ching.swee@intel.com&gt;<br>
<b>Cc:</b> netdev@vger.kernel.org &lt;netdev@vger.kernel.org&gt;; linux-stm=
32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mailman.stormreply.co=
m&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infr=
adead.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.or=
g&gt;<br>
<b>Subject:</b> [PATCH v2] net: stmmac: move the lock to struct plat_stmmac=
enet_data</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Reinitialize the whole est structure would also re=
set the mutex lock<br>
which is embedded in the est structure, and then trigger the following<br>
warning. To address this, move the lock to struct plat_stmmacenet_data.<br>
We also need to require the mutex lock when doing this initialization.<br>
<br>
Signed-off-by: Xiaolei Wang &lt;xiaolei.wang@windriver.com&gt;<br>
---<br>
v1 -&gt; v2<br>
&nbsp;- move the lock to struct plat_stmmacenet_data<br>
<br>
&nbsp;drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c |&nbsp; 8 ++++----<b=
r>
&nbsp;drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c&nbsp; | 16 ++++++++--=
------<br>
&nbsp;include/linux/stmmac.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&nbsp;3 files changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net=
/ethernet/stmicro/stmmac/stmmac_ptp.c<br>
index e04830a3a1fb..82b7577fea9e 100644<br>
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c<br>
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c<br>
@@ -70,11 +70,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *pt=
p, s64 delta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If EST is enabled, disa=
bled it before adjust ptp time. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;plat-&gt;est =
&amp;&amp; priv-&gt;plat-&gt;est-&gt;enable) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; est_rst =3D true;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;enable =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; stmmac_est_configure(priv, priv, priv-&gt;plat-&gt;es=
t,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
iv-&gt;plat-&gt;clk_ptp_rate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_lock_irqsave(&amp;pr=
iv-&gt;ptp_lock, flags);<br>
@@ -87,7 +87,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp,=
 s64 delta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ktime_t current_time_ns, basetime;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; u64 cycle_time;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;ptp_clock_ops.gettime64(&amp;priv-&gt;ptp_cl=
ock_ops, &amp;current_time);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; current_time_ns =3D timespec64_to_ktime(current_time)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; time.tv_nsec =3D priv-&gt;plat-&gt;est-&gt;btr_reserv=
e[0];<br>
@@ -104,7 +104,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *pt=
p, s64 delta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;enable =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D stmmac_est_configure(priv, priv, priv-&gt;pla=
t-&gt;est,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;clk_ptp_rate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netde=
v_err(priv-&gt;dev, &quot;failed to configure EST\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/=
ethernet/stmicro/stmmac/stmmac_tc.c<br>
index cce00719937d..f1e4d755a484 100644<br>
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c<br>
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c<br>
@@ -1004,17 +1004,17 @@ static int tc_taprio_configure(struct stmmac_priv *=
priv,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!plat-&gt;est)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n -ENOMEM;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_init(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_init(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; memset(plat-&gt;est, 0, sizeof(*plat-&gt;est));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D qopt-&gt;num_entr=
ies;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;est=
-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;loc=
k);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;=
gcl_size =3D size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;=
enable =3D qopt-&gt;cmd =3D=3D TAPRIO_CMD_REPLACE;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;e=
st-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;l=
ock);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; size;=
 i++) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s64 delta_ns =3D qopt-&gt;entries[i].interval;<br>
@@ -1045,7 +1045,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;gcl[i] =3D delta_ns | (gate=
s &lt;&lt; wid);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;est=
-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;loc=
k);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Adjust for real system =
time */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;ptp_clock_ops.get=
time64(&amp;priv-&gt;ptp_clock_ops, &amp;current_time);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_time_ns =3D timesp=
ec64_to_ktime(current_time);<br>
@@ -1068,7 +1068,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tc_taprio_map_maxsdu_txq(p=
riv, qopt);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fpe &amp;&amp; !priv-&=
gt;dma_cap.fpesel) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EOPNOTSUPP;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -1079,7 +1079,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D stmmac_est_configu=
re(priv, priv, priv-&gt;plat-&gt;est,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-=
&gt;clk_ptp_rate);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;e=
st-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;l=
ock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; netdev_err(priv-&gt;dev, &quot;failed to configure ES=
T\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto disable;<br>
@@ -1096,7 +1096,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,<br>
&nbsp;<br>
&nbsp;disable:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (priv-&gt;plat-&gt;est)=
 {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_lock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;est-&gt;enable =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; stmmac_est_configure(priv, priv, priv-&gt;plat-&gt;es=
t,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr=
iv-&gt;plat-&gt;clk_ptp_rate);<br>
@@ -1105,7 +1105,7 @@ static int tc_taprio_configure(struct stmmac_priv *pr=
iv,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-=
&gt;xstats.max_sdu_txq_drop[i] =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-=
&gt;xstats.mtl_est_txq_hlbf[i] =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;est-&gt;lock);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mutex_unlock(&amp;priv-&gt;plat-&gt;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;plat-&gt;fpe_cfg-=
&gt;enable =3D false;<br>
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h<br>
index dfa1828cd756..316ff7eb8b33 100644<br>
--- a/include/linux/stmmac.h<br>
+++ b/include/linux/stmmac.h<br>
@@ -117,7 +117,6 @@ struct stmmac_axi {<br>
&nbsp;<br>
&nbsp;#define EST_GCL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1024<=
br>
&nbsp;struct stmmac_est {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int enable;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 btr_reserve[2];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 btr_offset[2];<br>
@@ -246,6 +245,7 @@ struct plat_stmmacenet_data {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct fwnode_handle *port=
_node;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct device_node *mdio_n=
ode;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stmmac_dma_cfg *dma=
_cfg;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mutex lock;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stmmac_est *est;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stmmac_fpe_cfg *fpe=
_cfg;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stmmac_safety_featu=
re_cfg *safety_feat_cfg;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW5PR11MB5764AE899B469E1A980E584695E52MW5PR11MB5764namp_--

--===============1040427312659237475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1040427312659237475==--
