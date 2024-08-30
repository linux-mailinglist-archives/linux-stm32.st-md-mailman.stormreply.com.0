Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE6965A96
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 10:42:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99E4AC6DD9A;
	Fri, 30 Aug 2024 08:42:02 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62BBBC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 08:41:55 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=giOX8NJ8u/GIYdfFHfEbwr4NB0H70BaMKrmrNTej8UYEImbRwXKtbVS7mDpxnELcR2IO0Y3Ac1WXz+cCsTDUcvvNl85nXZXznYiDC8yMuIPo82EzyjDRBbWDYjLSbUn7fjZI73QHQ5jGkWsU1Ccb63x7zcZDB/q0piL/DJ6Y6+Ofv8Q34UEgFwEy8u9uqBaN8fPKabWeBUinoPxOQYWWZpxD7a68Nd7XpBMBDF6ERtdGYYTTuqN+SWCQHImn5G3yBe3yV+RAlodmABTLS4KrReXwDO19D5QdE1vqzNFnrpTVBVIgJQZWjxOj1p9eRlg5v36/aFV/v8T7ZK1i5kS1tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2OrSvZU83LpfFGJsnX99Rko4uy6Mpga1oa1AGISaNI=;
 b=m06ek6islL5F8zvoW2l1Jniz9++QMKCXKar3lzuzjT429J51XAz8IimG8eFx1eMiI7BITOJWyoFYgDtc9vvV05vdCJuJnPYx3NS+Xrpw/cJUPoOBHWYUi0EQ1i1S3neJYsYkhSUEC0vlTE26MmDuGgKsFD4rjeNrrAGkePMFlUmkZJYG96eh3i8UBj54eZJCSfGw5VtzcZW6pwA+/RniUp/j6lTtYIQxh2ElLlvWIjj8OIJo5fBAyFDi/ZK7LmNk21Kzh41jxwbfQHk3dExPGrZyWckMhfVNq5NIFtyQ7Nsh4gnaGF29nds+CPuMoJRrmcxUi1YDoXTHcOUgUeZiHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=pass (signature was verified) header.d=arm.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com]
 dkim=[1,1,header.d=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2OrSvZU83LpfFGJsnX99Rko4uy6Mpga1oa1AGISaNI=;
 b=andX4RAOrWsTRpa/9SRBZ3/gN8KjWoMaSFjRfgQCsidGRkS9jDcrpzzYXacyM25tJTe9QygBQt2++UAPwb4MQjqhPBfaCw2lBbY3k+l6YTwRk1rnHazFYC0RaUiuhjd2HW8HcsNG4maqFSlKIuCnnJq2MLbR9essSD61YIbMR6g=
Received: from AM6P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::27)
 by DBBPR08MB5977.eurprd08.prod.outlook.com (2603:10a6:10:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:41:51 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:209:81:cafe::3a) by AM6P195CA0014.outlook.office365.com
 (2603:10a6:209:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Fri, 30 Aug 2024 08:41:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 30 Aug 2024 08:41:50 +0000
Received: ("Tessian outbound 8e666bd17457:v403");
 Fri, 30 Aug 2024 08:41:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45182cdb741fd5a1
X-CR-MTA-TID: 64aa7808
Received: from Lda68c1fe1438.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BA3382F-7254-4476-A184-4CB58C9E2734.1; 
 Fri, 30 Aug 2024 08:41:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lda68c1fe1438.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Aug 2024 08:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp8gKvMFGT+U8JfInLhcv+KhrlWlxeSaJRLdXhKWUmCS/78aWDy0FS56wKo5NCwCP4jbzAUHoYq3HTbjNe3oCEbd4B5gGrNFX4DHKjKARMZ0dwTXDpK71LiUYpi9kIl8E3c7KMEwxKWuucG30Oe7+hR9l6ck1YnqJK5PxqqqRTI7BUGcUS40kTCw5vecuGOwvgAazz4IvRGwLNcVeXi1t1sLcv1LiA6/o9UatwSEuM/xitpaVoTWmmSRzeZopjkl2BVyPcE7R0SE02d7fE0HPVZaOjcI4sLLmsmR8ZEitrW8MNV2jKImVyejpw9LroKOK6z5KFIc4VoIbiiHDZlnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2OrSvZU83LpfFGJsnX99Rko4uy6Mpga1oa1AGISaNI=;
 b=Ij3uvjMa+K6Mis/+E8+lOSS16wxs0nqiIWIu4MLN/XlCupGKgTacTFqMOvE4qHPLq/0SGdeMirBdi0Kq0lCTqkZ5a6JcRCa6823KPNTMQ3wNbu5nbpQ480hEUDOeMroW2DQC+1+sKUAtkY8dlCM1RTc2aP7wed2aYdzSOuz8iOtLzmHCsyo//5k+ECaW1HrbEPKSrqvONOcYgWCPT9+scyrlWCVtt6l7RMJRQz5+d69B8gDQz06xZGm/pCvS+ULlOaMvWfnLBlhqKLpZdCNON7R6p5RKyDNkrrMelgBq34YMQdC5JkON72n1OyPpuVdPGcloGBfUHT/sugcMaq6Llw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2OrSvZU83LpfFGJsnX99Rko4uy6Mpga1oa1AGISaNI=;
 b=andX4RAOrWsTRpa/9SRBZ3/gN8KjWoMaSFjRfgQCsidGRkS9jDcrpzzYXacyM25tJTe9QygBQt2++UAPwb4MQjqhPBfaCw2lBbY3k+l6YTwRk1rnHazFYC0RaUiuhjd2HW8HcsNG4maqFSlKIuCnnJq2MLbR9essSD61YIbMR6g=
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:41:34 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%6]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 08:41:34 +0000
From: Suzuki Poulose <Suzuki.Poulose@arm.com>
To: James Clark <james.clark@linaro.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>
Thread-Topic: [PATCH v6 00/17] coresight: Use per-sink trace ID maps for Perf
 sessions
Thread-Index: AQHa3B+zatQfeEkXTkqQsfoUosRsu7IJFP6AgAATBAD///EXAIAAEk6A///yagCAKnupAIAKk1YAgABr+gCAAR6NAIAAAJlF
Date: Fri, 30 Aug 2024 08:41:33 +0000
Message-ID: <GVXPR08MB7727FEAB74A87FA8CC1FF46791972@GVXPR08MB7727.eurprd08.prod.outlook.com>
References: <20240722101202.26915-1-james.clark@linaro.org>
 <ZqOwGWcYosGe9ru4@x1> <6476a228-847b-4804-9229-c11a881663c7@arm.com>
 <ZqOzio8Oco9ZFsDm@x1> <8068c8ff-a8ce-4bcd-bb19-2c25b45cf6f3@arm.com>
 <ZqO3gPcCCVh1r5WM@x1> <aab886f3-ebbf-4853-b26b-5cf70c801683@arm.com>
 <7b96894c-f5df-473b-be50-ee118ce3cfaf@linaro.org> <ZtCUUsJNj9Z1CRLK@x1>
 <8afae0a6-5322-47a8-a189-68629ea1991f@linaro.org>
In-Reply-To: <8afae0a6-5322-47a8-a189-68629ea1991f@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GVXPR08MB7727:EE_|AM7PR08MB5510:EE_|AMS0EPF0000019F:EE_|DBBPR08MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5169fb55-9a28-4e93-2575-08dcc8cf97d5
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?7ja2fQ5F3NIQhOTejAnmXeAXWA8TExOiUXD4/Yt+Vg2tpC3a5XBBtCjQw+jE?=
 =?us-ascii?Q?xbPikSTAR7cAY3f1BkLBklfHzJ3sH41DdYJlH70HXKh0++SlCJA9m592mopz?=
 =?us-ascii?Q?zZC+YwNejNsUozxnX1OT5yylRLsTDV36ZlOFaLvlyG8zYBeIogSWD/+ZDikV?=
 =?us-ascii?Q?8/onW4NFbDAi1qfHicLVTC3y41AYYD0gD0JV0++r5aJX05F3W9tpCv4o4hI2?=
 =?us-ascii?Q?NzfFiQI//NwPprbYyJmlb8b2/t72f/xBijeiPra9ujU1HBsEH6ttN4/YdDzs?=
 =?us-ascii?Q?UWvChSSWtG8YbiTiPgA78BF2eo0OfqBw83tgfiF4zGuiv5Zn0+X1s5/USBUf?=
 =?us-ascii?Q?FWx2/rOAIXsEhJd/L1arL/cn5yYo2RY2BIv2Y7roDA2UDojqeHizvr7xsMTy?=
 =?us-ascii?Q?U1DuyFFhnBaSXLbBj5/xivVBt+pbQc6tqur5Np9m5NRprsvMT28/VOhh7pol?=
 =?us-ascii?Q?VQMI+XIHFoJfTpmyLJmwOAH5wQdVB5hjltKahFVJWx1KSweHO/oHnluE/DCa?=
 =?us-ascii?Q?Brm4A29mN6TBxpZUsDhM6UtiYMDNDja4xWpKun3GmuEhNKUkKnz+BroU1iAb?=
 =?us-ascii?Q?o0pI/jdhRwW95KxDSIqMrlLpTuUtTjo+Wh9DxVSFsDJmIOAJRFCC6HRB9ApV?=
 =?us-ascii?Q?Kp4X6v3PmbilIvXqrlvHE+iy4HGkKq25fYgdhBIPvd/W5c6NFRN9393CECYn?=
 =?us-ascii?Q?AlXdoqgCmsH8Edhsq3uBk7gjONrqQ/7q+eydTJoyc+SpJw83tKH3u9FHBwMH?=
 =?us-ascii?Q?09EG/dxICSrk6eQoq3f4zhFlzL2XMKxq+TUnc1eIkDF8vr6kNsMcRL4byBdR?=
 =?us-ascii?Q?1PxwrsjRNiL9tGE/RK7/CJ99RFkFqZag/cFnyMnkbOIwgZs24gFK65BGwYXu?=
 =?us-ascii?Q?RsTvAtpc03OM4EOf9G5T/x+ROONt1XYr7TUnXE0omHdQnOvDyLzWIZyjfKF/?=
 =?us-ascii?Q?4RmpHYSVb4Ucu1Dq7UoLfdhbhKYzcHPlucL+qrtBX2nJlA65jThFHiZLU2WL?=
 =?us-ascii?Q?FIgkwJXeNpgEFATKz2IaFJtgG4o2A9u+hp5cEWrmEOFFb5DoP15K/VBGU240?=
 =?us-ascii?Q?RkEtG8oyv6K3nxvpGZRetRIt6UccwNnaKAR1QuJ5Xe8kPVyrVISxC3B2/sGC?=
 =?us-ascii?Q?SrHxwUEr9+CRGSDsRPimPPisfuWsrml6B00E+XBXIOuL7YH069qKh4mgKgMp?=
 =?us-ascii?Q?iXrT3dCAwiN6W715ACtPZd/IazDPvM92TXSZNhM2+5J0BdXc3b5hY1+DY09H?=
 =?us-ascii?Q?9lwS8FR0yjK0EPfNQNLjOce78OIRIzZFLxgAnk2WXPKKahG7SMkt5ql2UOxF?=
 =?us-ascii?Q?LxJElqDJ1yXAXWl5h2FDy8tjI7IF3nGYIucvPdHKAvwuMt9167oyR3CyvwhU?=
 =?us-ascii?Q?QVjl/sTmm6EmFf/1/mhkHNUR7+vVqoNzTDmfBheoa24MJRMHlg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB7727.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:6b::6];
 domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3376f917-a698-4f7f-6269-08dcc8cf8d9c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3mdDbSA4EiEJQva0RBaLUdmYtxfAyz/DbreVdLzah6S7qfh7LI3Ebep5GqAy?=
 =?us-ascii?Q?Wpb1T2bodPWflteJWSG6uCfZAz9XMy4Rw+CrckCAo8LH2bo8PtL/rg/Vfo5P?=
 =?us-ascii?Q?e0aOvpWsmkaE9gvyYMRK7Nvhpc5h3oxRFrZA6tlsaVHFOre5kkA4ArtBvxLU?=
 =?us-ascii?Q?BaZ2flgecnaq7a4QuVLYzXZxChAoQz+T16Kj53chKdg3MmCryaizx32B4jo2?=
 =?us-ascii?Q?y3x7PC6w4iIIYSzsuM8n1qkmml/sMjhqCW5zeVRsl1LzgWAe15CAhpvzX3sw?=
 =?us-ascii?Q?zaY1YYeUpYIevMzIf+8jIHwGA5rgK7meb1+DoEDXYGkdzsqRvj1kD8W++OD2?=
 =?us-ascii?Q?GpB3aSm3dCFgbLFDdbbxkS2TNP/ziODrGKNzczWrx0rR+EToL5WZW1dUfgyj?=
 =?us-ascii?Q?kDUL6wQKthgu9ZDfPSO5qe1HH95sCZrPOi1mHyHUaF/LbmOAZYRtxcBInlwV?=
 =?us-ascii?Q?7fjfR5TCjIUqqIxmNYM7Lp75qaJJKkqAGYmoBzNatyCMtDBU/Ys1ESZzIDai?=
 =?us-ascii?Q?ovtrEG8Abi+hnRMaE4yRil+X3eyo/Q7ncnpuaD+4AgrdEGV/1uFZxjH3tqf6?=
 =?us-ascii?Q?zIOk4jNarRydOtJbNAKGbYWqDHYyLlu8CNs7D6EnL5lJrgKMCig/7dJXAkiB?=
 =?us-ascii?Q?pqVCCsor/rmmX1HNa1IzBWNp0gpWX7plwO5h3ZXsutLqxMUGLIbmsJFuYrP4?=
 =?us-ascii?Q?ap6HZUt/BlGhg4cmTfflmGSFg/lRICa+I6/gBTHVYz7F5XPS6yIUI/KSNmUQ?=
 =?us-ascii?Q?07lQ20ghCcw5zh39tOc7wbuFCqbWf31Y97vr3bn2MkWQtAzkWc6HisBnXPJ4?=
 =?us-ascii?Q?R1kLqDFzS2Ek8WdYdxheGos/gJz8MttfKe0oh/r4GcsX3mKAI00o9SGHB3lh?=
 =?us-ascii?Q?QHhEdFugo7ufxVjvFPWCosCvmcaDeFzpUYCrYT/pWVst6WyRYOchavE5xh+v?=
 =?us-ascii?Q?P9HN8AZE9R1d6s6MG9ET8puWs84wvn0p35R0wfPFLhdY7y5ptMcznuAWT+AU?=
 =?us-ascii?Q?xe2M4F/LbMxxcRsDCsniFP5kHujwdlj6dCdKd+srcE+hoCJbXWVn9ViTTxbJ?=
 =?us-ascii?Q?jQ8IuD2XZPGhUwVdZIL756wY060LThA2o83H1r0VDCT5jn85g+henBgDwj2n?=
 =?us-ascii?Q?z/emzC41U0aFBpoNQX/kWVXWPPLFgjNBi+B/4MOQIwneIYsiVCechUOvlpII?=
 =?us-ascii?Q?Pd3O/AFZXN2WboQnHT8kW4gzMkfx7VAeTWUQp2zJXMr7xLNPstrJmMG24NLQ?=
 =?us-ascii?Q?rpmhTdnCJV+uJQpJZJpZnogniSP3SfO/vz3yq2F6/7qPoI4chNopqow19xzL?=
 =?us-ascii?Q?TvrMHp3y6KKgZSJUDIoXXuW/MvVT07Rzt3qoeTJRxJ82QimcbrF+rMWwegW+?=
 =?us-ascii?Q?kL2RtbPSEk7ZzPOJAL7ChBhbTnJ64dNyQkT3it/I5Mgg3nIbP9hnaCiQCgna?=
 =?us-ascii?Q?qKoNTDUJoYRgKjSbL8MNucaPZLhq2Jle?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:41:50.9475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5169fb55-9a28-4e93-2575-08dcc8cf97d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5977
Cc: Mark Rutland <Mark.Rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark <James.Clark@arm.com>,
 Will Deacon <will@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 "mike.leach@linaro.org" <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 Namhyung Kim <namhyung@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "leo.yan@linux.dev" <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
Subject: Re: [Linux-stm32] [PATCH v6 00/17] coresight: Use per-sink trace ID
 maps for Perf sessions
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
Content-Type: multipart/mixed; boundary="===============2313854288647714788=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2313854288647714788==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_GVXPR08MB7727FEAB74A87FA8CC1FF46791972GVXPR08MB7727eurp_"

--_000_GVXPR08MB7727FEAB74A87FA8CC1FF46791972GVXPR08MB7727eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

James,

Thanks for conveying my message.

Arnaldo, yes please go ahead

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Apologies for the html email
________________________________
From: James Clark <james.clark@linaro.org>
Sent: Friday, August 30, 2024 10:37:23 AM
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: coresight@lists.linaro.org <coresight@lists.linaro.org>; gankulkarni@os=
.amperecomputing.com <gankulkarni@os.amperecomputing.com>; mike.leach@linar=
o.org <mike.leach@linaro.org>; leo.yan@linux.dev <leo.yan@linux.dev>; Anshu=
man Khandual <Anshuman.Khandual@arm.com>; James Clark <James.Clark@arm.com>=
; Alexander Shishkin <alexander.shishkin@linux.intel.com>; Maxime Coquelin =
<mcoquelin.stm32@gmail.com>; Alexandre Torgue <alexandre.torgue@foss.st.com=
>; John Garry <john.g.garry@oracle.com>; Will Deacon <will@kernel.org>; Pet=
er Zijlstra <peterz@infradead.org>; Ingo Molnar <mingo@redhat.com>; Namhyun=
g Kim <namhyung@kernel.org>; Mark Rutland <Mark.Rutland@arm.com>; Jiri Olsa=
 <jolsa@kernel.org>; Ian Rogers <irogers@google.com>; Adrian Hunter <adrian=
.hunter@intel.com>; Liang, Kan <kan.liang@linux.intel.com>; linux-kernel@vg=
er.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.infrad=
ead.org <linux-arm-kernel@lists.infradead.org>; linux-stm32@st-md-mailman.s=
tormreply.com <linux-stm32@st-md-mailman.stormreply.com>; linux-perf-users@=
vger.kernel.org <linux-perf-users@vger.kernel.org>; Suzuki Poulose <Suzuki.=
Poulose@arm.com>
Subject: Re: [PATCH v6 00/17] coresight: Use per-sink trace ID maps for Per=
f sessions



On 29/08/2024 4:31 pm, Arnaldo Carvalho de Melo wrote:
> On Thu, Aug 29, 2024 at 10:05:02AM +0100, James Clark wrote:
>>
>>
>> On 22/08/2024 3:35 pm, Suzuki K Poulose wrote:
>>> Hi Arnaldo,
>>>
>>> On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:
>>>> On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose wrote:
>>>>> On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:
>>>>>> On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K Poulose wrote:
>>>>>>> On 26/07/2024 15:18, Arnaldo Carvalho de Melo wrote:
>>>>>>>> On Mon, Jul 22, 2024 at 11:11:42AM +0100, James Clark wrote:
>>>>>>>>> This will allow sessions with more than CORESIGHT_TRACE_IDS_MAX E=
TMs
>>>>>>>>> as long as there are fewer than that many ETMs
>>>>>>>>> connected to each sink.
>>>>>>>>
>>>>>>>> Hey, may I take the tools part, i.e. patches 0-7 and
>>>>>>>> someone on the ARM
>>>>>>>> kernel team pick the driver bits?
>>>>
>>>>>>> I plan to pick the kernel driver bits for v6.12
>>>>
>>>>>> Perhaps it is better for me to wait for that?
>>>>
>>>>> Yes, please.
>>>>
>>>> Please let me know when you do so so that I can merge the tooling bits=
.
>>>
>>> I have now merged the driver changes to coresight/next, they will be
>>> sent to Greg for v6.12. [0]
>>>
>>> You may go ahead and merge the tool bits.
>
> I'm taking this as an Acked-by: Suzuki, ok?
>

Suzuki is out of office at the moment and can't email but he said it was
ok for the acked-by.

Thanks
James



--_000_GVXPR08MB7727FEAB74A87FA8CC1FF46791972GVXPR08MB7727eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">James,&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks for conveying my message.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Arnaldo, yes please go ahead&nbsp;</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Acked-by: Suzuki K Poulose &lt;suzuki.poulose@arm.com&gt;=
</div>
<div dir=3D"auto"><br>
</div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto">Apologies&=
nbsp;<span>for the html email&nbsp;</span><br>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 James Clark &lt;james.clark@linaro.org&gt;<br>
<strong>Sent:</strong> Friday, August 30, 2024 10:37:23 AM<br>
<strong>To:</strong> Arnaldo Carvalho de Melo &lt;acme@kernel.org&gt;<br>
<strong>Cc:</strong> coresight@lists.linaro.org &lt;coresight@lists.linaro.=
org&gt;; gankulkarni@os.amperecomputing.com &lt;gankulkarni@os.amperecomput=
ing.com&gt;; mike.leach@linaro.org &lt;mike.leach@linaro.org&gt;; leo.yan@l=
inux.dev &lt;leo.yan@linux.dev&gt;; Anshuman Khandual &lt;Anshuman.Khandual=
@arm.com&gt;;
 James Clark &lt;James.Clark@arm.com&gt;; Alexander Shishkin &lt;alexander.=
shishkin@linux.intel.com&gt;; Maxime Coquelin &lt;mcoquelin.stm32@gmail.com=
&gt;; Alexandre Torgue &lt;alexandre.torgue@foss.st.com&gt;; John Garry &lt=
;john.g.garry@oracle.com&gt;; Will Deacon &lt;will@kernel.org&gt;; Peter
 Zijlstra &lt;peterz@infradead.org&gt;; Ingo Molnar &lt;mingo@redhat.com&gt=
;; Namhyung Kim &lt;namhyung@kernel.org&gt;; Mark Rutland &lt;Mark.Rutland@=
arm.com&gt;; Jiri Olsa &lt;jolsa@kernel.org&gt;; Ian Rogers &lt;irogers@goo=
gle.com&gt;; Adrian Hunter &lt;adrian.hunter@intel.com&gt;; Liang, Kan &lt;=
kan.liang@linux.intel.com&gt;;
 linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; linux-a=
rm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infradead.org&gt;;=
 linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mailman.sto=
rmreply.com&gt;; linux-perf-users@vger.kernel.org
 &lt;linux-perf-users@vger.kernel.org&gt;; Suzuki Poulose &lt;Suzuki.Poulos=
e@arm.com&gt;<br>
<strong>Subject:</strong> Re: [PATCH v6 00/17] coresight: Use per-sink trac=
e ID maps for Perf sessions<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 29/08/2024 4:31 pm, Arnaldo Carvalho de Melo wrote:<br>
&gt; On Thu, Aug 29, 2024 at 10:05:02AM +0100, James Clark wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 22/08/2024 3:35 pm, Suzuki K Poulose wrote:<br>
&gt;&gt;&gt; Hi Arnaldo,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 26/07/2024 15:49, Arnaldo Carvalho de Melo wrote:<br>
&gt;&gt;&gt;&gt; On Fri, Jul 26, 2024 at 03:38:13PM +0100, Suzuki K Poulose=
 wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 26/07/2024 15:32, Arnaldo Carvalho de Melo wrote:<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt; On Fri, Jul 26, 2024 at 03:26:04PM +0100, Suzuki K=
 Poulose wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 26/07/2024 15:18, Arnaldo Carvalho de Melo =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Jul 22, 2024 at 11:11:42AM +0100, =
James Clark wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; This will allow sessions with more tha=
n CORESIGHT_TRACE_IDS_MAX ETMs<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; as long as there are fewer than that m=
any ETMs<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; connected to each sink.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hey, may I take the tools part, i.e. patch=
es 0-7 and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; someone on the ARM<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; kernel team pick the driver bits?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I plan to pick the kernel driver bits for v6.1=
2<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Perhaps it is better for me to wait for that?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Yes, please.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Please let me know when you do so so that I can merge the =
tooling bits.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have now merged the driver changes to coresight/next, they w=
ill be<br>
&gt;&gt;&gt; sent to Greg for v6.12. [0]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You may go ahead and merge the tool bits.<br>
&gt; <br>
&gt; I'm taking this as an Acked-by: Suzuki, ok?<br>
&gt; <br>
<br>
Suzuki is out of office at the moment and can't email but he said it was <b=
r>
ok for the acked-by.<br>
<br>
Thanks<br>
James<br>
<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_GVXPR08MB7727FEAB74A87FA8CC1FF46791972GVXPR08MB7727eurp_--

--===============2313854288647714788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2313854288647714788==--
