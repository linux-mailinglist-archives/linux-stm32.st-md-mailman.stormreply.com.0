Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B0A71198
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 08:44:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA8E3C78F7F;
	Wed, 26 Mar 2025 07:44:32 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A8EC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 07:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbmi3kxGjXO1yKXRizoVSZxk7Lr5E+rcgruYZL9VRaA2O+ipiU+4Jg20bk6kymT6S2644H1BOD51ptCibKQinRU5gZu29eXsKEykrPpWZupga7VjyW3Q02qkOFST67Oz65OUsCLY+cZC6RVMQEQHXy/6VH7a6M19WGMQH/NCAjOddlqB31dyofQWIIFDszmZYIiaYExv/XRPnS008OXBwWJuggtObIpbOHMhGIkw3BY7CAbeAMQIgkFIsuj+A5dqEpTcISnj/Rh2ZpkawXi2LDWmjb0ODYPjHwFl/gkmaw0X93NzYLYDFOkqxDVRROZnGnAnVXw9xgsLV8upEOpCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKphW6u5Q14BhA2gL22AsHQ8GVOjVy7z4bygIduhTzw=;
 b=Rcjft78aL+3s+cPOy+c4T/6EOsTZYZtRJWsd+EXTP+GhAjjIdEpJwoJUc/JmHqNxSiq0hL5/ne5utI0lEDZp1FJlRATs7Ii4ZTAFjOIsGnSQUFhuANNe+UyeQ+vpCPeiMtOFXasqOpkow4weuWXFoGO1NlRN9RNsV65q1j2eiMhYHRMJbBgPEYgl6FnZkovyUMiDnCzTAi861R+tocGybtFeY98OSGPAD1z03MQuOb8H1reJq7wNpNkyaG/zCSPfxfoEN/89bsGC4AV2naqk8neH9F/29iqxgAUhsHCyQ26lqZK/juSMAONnGV5vovuZNJt4TBLG1Vy2H1AfLNJV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKphW6u5Q14BhA2gL22AsHQ8GVOjVy7z4bygIduhTzw=;
 b=q5jL3NQ8u61/Ug2mKxqE0MVmIorAr2x/RkObK5q+jKeCGTk+uEJYMVKq1QeBurvSKlX3EF310ZKueAUd4pazUgJXWXkWNgsMR0+DGpWylgBthJT4CZLv0MqeiJCf495+3GqFD+FqwU4rfIMFxIbxL+QcM9S7/LDHRjwIamzLj1XjQTkITFpDYR6I7x2LCPG39l+UwcnWJ+1fc2sSZoud8vrkvZxacukNgNSVPgHL7ZTQTG138OKkHAYLsXaglejpTOooh0MuIWECkKFY8cDaiXuEiZD2vjZUe/UMGi1vbc9yXEGMtA1eIgL5x9BSXrsCC1ZzGMvFLep8DTzh8CnMEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 07:44:29 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 07:44:23 +0000
Message-ID: <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Date: Wed, 26 Mar 2025 09:44:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
X-ClientProxiedBy: AM0PR10CA0080.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::33) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DBBPR04MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f548b2-238b-44db-7c12-08dd6c3a065d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzlNeW43bHpOS0RYUVhZZmxTTGdtVXFlYTRSQUZ0RzBVVTlBbkZEWXV3TU82?=
 =?utf-8?B?U1VaQU9ObzNWVVVuaHlFRmVxWDNJeFNhTXpjSDV3bmdadlZKSWxXNnZScTZS?=
 =?utf-8?B?NEtMVkdESWl2RnV4ZjlGamdSMVZUb29vMHpOSVE5blRmWGo5NzRqK2xrc295?=
 =?utf-8?B?RjRycU1uS3IvZC9jQVpuUW03UDJ4Z3BzaWR0RnBIdGE5MllPcXNXUlQydGNw?=
 =?utf-8?B?eWFTSW4wRHAxeThrWHFiSk4xRG9yVW9OUFpzS29FRVllT25CdCtKVjlPK2ll?=
 =?utf-8?B?NEFGbkoxdDNZWFYybDVZSFBqOUdUc3JqMDBWWE9ONmxvRHdDNms4ZDBFL2Vw?=
 =?utf-8?B?emttZmtMcGR1UUZQck5aU2FkOFFvblEzTGR3NGVsOGt2WU5YNTdRZkRCaEpI?=
 =?utf-8?B?Q0VsN096bCtXWEVwUXJLU1B6dU9rL1o1anptbGVIVUVXOTVtTmhFUjVDS2px?=
 =?utf-8?B?VDdrRGNaR1RUV1MxZ25tYXA3WXBlK2ZOcWczQU5jbEd5NEpDV25pcnZkYk5W?=
 =?utf-8?B?QUFVeGU3ejFDNlJ4RlpGK3FFcWltbHhSMUNrZEd3UHhnYkxiUk1LMkg5empq?=
 =?utf-8?B?THBqM3llR2ltQ1lTcTRibmZjdUJpR2NDTWJray8rOFJrTWMwbnI0cUY4dkMy?=
 =?utf-8?B?bUZsWjFGa0d6WDd1Z2FXWjRQdHlpNUxzYVRmNU9wdVFkbTRvUWgxUnNObVkr?=
 =?utf-8?B?anhkQktCRmIvdDdvOTl6Mkl6M0V3Ri9XTFpYNVFZTFNZZ0NVOGRnSzZ1NGdT?=
 =?utf-8?B?Z2dHWUFjaXNNTDRrWklEQ1BpYnhGYzRjeEZBRTVQU1NmUEZUUnppSGpxTWNh?=
 =?utf-8?B?Q3dDN2k2czdnZWFmVkVqOUpjNlNBcXZaTU1ZclI2RW5HS1RndG1vdTg5RGR3?=
 =?utf-8?B?RnB0Mk5JbHRUUTFqb0k3QVJEVjBoUFdSaEE5RDZoOHZKVHU2WlR1dVFUVXVS?=
 =?utf-8?B?MldZSnVqcW41SnhCc3dIT2FwR0t0cDhoVjVwaUo2UFFrSEN5a3hudmFDMVFB?=
 =?utf-8?B?YTJTQUhwdmVmWDlsVSsyLzlBa3AvaDVNYXU2bVdWYWxScVJoT2FaZjh4UmFR?=
 =?utf-8?B?MXM2S1pQTXR1MkRDT0JKUWFCbFM1cUNoSjRFbWtPZFF2TjVCYUdOQVB2bi8w?=
 =?utf-8?B?MU5GQ0o1WjdhVStFWnBEQ3p4NTlqcVQrYUtMNktuQU9pOEVJN3BMdDA5N3cz?=
 =?utf-8?B?Y0Y5aWsrcVlraDM3dFNEUEc5eUpZUHZuQXZxdFVOWHhQZDJYdEJVWHBKdGdE?=
 =?utf-8?B?aU11alZmaVVMSnA5eHRiR3ErRjViS0xGNmt0RmVnbmhoUitpT3FObXpCQjRM?=
 =?utf-8?B?TVpqemdGVTlLdWgrajgyaksxcXlWeitrbXRGOWVaR0pkZFFGNUlMc25WZ2hE?=
 =?utf-8?B?eExpOVpRNVVIOUhQNTBaUjRuU1ZLb2EzYk5yT1FZRWZERzJSdUtEeDNScUc1?=
 =?utf-8?B?MWI1b1dkb20zVlFvOTBLSW9WRU5DZXE5TnF2MlFYcEJ0SzFsRmtMZEpQaHhI?=
 =?utf-8?B?KzZrOXR1K2FEWjJSYVdBNTRnNUZkKzRKaUV4dFZaOFhPbk1rdC9KOXRYREYz?=
 =?utf-8?B?b2t2cDFuQys2VFhWeDJPNkJsNDd3SG5iN3pMWm9LRVdIMXN6NW1JL21zM3p3?=
 =?utf-8?B?MHFraFczeDlIOW14WndoaC85cHpDMVhhOUtlbjZCSDFMdlZ5eTI1Ym1admtk?=
 =?utf-8?B?MkdoaW1uMG1LT2hLcXI5c00rbWRlUU5va21uOXhqaElRZVNpdHM3aE9vb3Uw?=
 =?utf-8?B?Q0U4N3ZhRzlaa2U4ZGxJcDRVY092NGkxT05KcHdsbDBTN1dLaEdqend4MWEr?=
 =?utf-8?B?L3VuVFYwRThva1VYOG1EOWJldWQ0bHprUlI3Wm9PVmlxU3RNTDI5Z2RzOGti?=
 =?utf-8?Q?TfqYcE73MWUuq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUhWN3V0QVlWNUswUVBFdnM1b083OHpLQVF1d1dETWNrNHVScHBhbnV3SU9C?=
 =?utf-8?B?S1BYNjQ5ZDBnVG4xaTZhTTRkT0Y0N3dVdHZ4UGZJUGZ2RDNsVVRWVFp2ZnVJ?=
 =?utf-8?B?ZXZ0Ky9XVjlnb2NuUnpPM2RsbXZVWWVJM0plSjRsVEdmOXliaGhUUWlQRzJi?=
 =?utf-8?B?RC83VUwveDBXNVJ4blZpdjMvTCs1MUVyMlZneGFxa3pPdHhCUkxaR0VxQUgy?=
 =?utf-8?B?UTVuMWhhaFFVRGR3VERsbmdVUEd2ZDNFQWpUQlZxaXh6Uk9MRlJBOFhPR284?=
 =?utf-8?B?c0JDWExmdzN4TGsrdTlxQUhaSTJhckpKWE9ORHJDeWlvMEZEWllQUzNhRlgy?=
 =?utf-8?B?MzN4NktiVjUwUGRWek9Zb2VGWWU4TWRORTlrVG91UUsvQ05tMGRQKzZ2Vnp4?=
 =?utf-8?B?NnJvUVRxaWZub2lya01QSm1GeW1JdENsK0FYL0lVNlpJVFF3M0pqaWZ2UWto?=
 =?utf-8?B?NElmZC9MYTNiaUtuZkxOVy9lQVVSTzdLZ1Q3eTEyK2wxZmI2YVBNeUY5eTVl?=
 =?utf-8?B?cmg1Uk5YTmhxK2d6NDlwZnZpRU52SDNaUGhBbVcxZ0l2WTV0NUFPNHFrbGZr?=
 =?utf-8?B?Unh3L2ZmaEE5djhPNkl3TmNGaFV1dWxZeEI3RXg4TTB5UE9scGEwVGlpUjg0?=
 =?utf-8?B?ZmVpb1RqRlNxSkdzSTRoVlBlOENpQnBSM2ZnbjQ3Mjd1enhqZ0JZMC9OZ1VK?=
 =?utf-8?B?YTRUbEF6bS9KL0hKcktlRnZkblRtd1U2UlUxUnBKZ2hHTkZjaDRzeHpxamZ6?=
 =?utf-8?B?VlI0eUhJUVR2NHJoMGZ5amxvTUZWejNPUEtDUGZ6OWI4K3E3M01UN3VYUUd3?=
 =?utf-8?B?MkdzS3pBamxjem9sZWs3RGpLWUxzN2VXUHZvMEErbkV1b25JRGU3L3hzV1Fv?=
 =?utf-8?B?U1NrbHU4SnpFSWdlK2IvUzZEQUp3Z0JpMG1Db0Z5MXpoRDV0TGZmTUhlUDQ1?=
 =?utf-8?B?L2d4Nm9YREsvdHoxWTl5TlhJWVlEanc2OGdIQXJkR3I0TVBWREF4MnhjQVFt?=
 =?utf-8?B?SXFZOGJXa0lraDVadWZHS1BJOFQ5M0dlaDM3L3pJUnZ3d255UTVJQ2F4YURP?=
 =?utf-8?B?OHc5Q2RSNVRlSDJiSk5wc3JqZXcvSFJCTks0RG55MnEzNS94Vnluc3ExQktk?=
 =?utf-8?B?RnFsalRwRXo1bHZhYmpMYUdqS0kwS2wvV2dLNGZlc3JwYkZoMkVhR0VhNStG?=
 =?utf-8?B?Vytia3Rrak1MdVAydzg5VUxRQ0g1eVlnU2xNRkJaREIyLzNNWmpBVHVxK3JR?=
 =?utf-8?B?MTlycmQ3dVhEbEZ6bit1WHgxdjQzR3RtbnJaZVZ5YzVOLzJaM2ZiMnc5SFh5?=
 =?utf-8?B?cFJld1E2eFAzVWlKaVNUMEZHWHRxYVozOFpONlYvdVlNL0hnbkUxejROMk5s?=
 =?utf-8?B?MldxQ1M4SkFWNW9zYU1ONk00ejNIV3BabEx5clFyN04vWENJWCtVZHhZRGlF?=
 =?utf-8?B?ZWkxMVZ3QVV1RVkycXkvZ0Fyb1J6QXE2YlFHZGQzOXB3TmxnZkk4aEFqak5t?=
 =?utf-8?B?MUZVMjN4QXNFOTZqbmhaSWtJOE5oUUVmcFNjQllZRmsyWGdmSnNNblBXUElw?=
 =?utf-8?B?MUNuS0FoR3YrbVhxTmxiZ0RDVUVuRXpueWRuYk53RHNzRXFoQUhicXRjNnZv?=
 =?utf-8?B?c3RTVXNIK0hSMU55YWtnbFlFZHlHbk5Cd1Y3WXQ3OUVsamF6dlY0MFk1a3Zn?=
 =?utf-8?B?dkQyOVNnTk1mYVg2eHo0aEpOb1kzVnVTQzBkeENXRnQ5VFdJbGk3RDRHcGdn?=
 =?utf-8?B?YVBXaE1GMm1qblVJUmRTTXlqTmVTZ2k5WDk5WHpHMkF2QUxQNFlBVlJ2Z1lr?=
 =?utf-8?B?NUhYb3NxZFRIcWFHd3ZqVlEycTkreGF4TnVCVWRJZnRkL2oraHJtQWhvcEIv?=
 =?utf-8?B?d2xDWENJUlBwUml0RWllMlN6ei9BQ0g2RnNZemMwbENMWjdoRkRnMThaTDhh?=
 =?utf-8?B?eFhBSEVjR0kzWndHOU9jQnpoU3dKbkdPSVdvMlJNU25xMy8zb2FhQzNWQzhM?=
 =?utf-8?B?VXJnVE9DZVZLSjBzQW5vSGpZdFEvREtnRE1hWUJ1d0JBTjNITy9ZWjhVWldJ?=
 =?utf-8?B?SEk3T2NqNzRMMEMzWHpwc0FRanM2cTR3Yk5yTGk5UU5rd052bzg2V1hOTEpE?=
 =?utf-8?B?cDhtdnZiYWhiY2IvejRYVVJ5a1pYRVNQYmxyODNaR2hiUU5zOXQwTkV0VGcx?=
 =?utf-8?Q?CPlAJoua6ot1/XouFumzZUU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f548b2-238b-44db-7c12-08dd6c3a065d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 07:44:23.0212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxyM6R7+GMPlLZ87sEnMsaWJs9UHKn2+cDJMcp9e6Ml7CuwcwgEGaHNWLVq7YCzGqmBqi0BXJbocQCQTWT/j0b1P6AkRE8fQ5JNh5R6ev/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515
Cc: NXP S32 Linux Team <s32@nxp.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMy8yNS8yMDI1IDM6NTQgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDI1LzAzLzIw
MjUgMTQ6MjEsIEdoZW5uYWRpIFByb2NvcGNpdWMgd3JvdGU6Cj4+IE9uIDMvMjUvMjAyNSAyOjUx
IFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gWyAuLi4gXQo+Pj4+Pj4+Pj4gK3N0YXRpYyBp
bnQgX19pbml0IG54cF9zdG1fdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+
Pj4+Pj4gKnBkZXYpCj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gZGV2LT5vZl9ub2RlOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtX2luc3RhbmNl
cyAqc3RtX2luc3RhbmNlczsKPj4+Pj4+Pj4+ICvCoMKgwqAgY29uc3QgY2hhciAqbmFtZSA9IG9m
X25vZGVfZnVsbF9uYW1lKG5wKTsKPj4+Pj4+Pj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpiYXNl
Owo+Pj4+Pj4+Pj4gK8KgwqDCoCBpbnQgaXJxLCByZXQ7Cj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVj
dCBjbGsgKmNsazsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgc3RtX2luc3RhbmNlcyA9
Cj4+Pj4+Pj4+PiAodHlwZW9mKHN0bV9pbnN0YW5jZXMpKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YShkZXYpOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXN0bV9pbnN0YW5jZXMpIHsKPj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIk5vIFNUTSBpbnN0YW5jZXMgYXNzb2NpYXRl
ZCB3aXRoIGEgY3B1Iik7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7
Cj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgYmFzZSA9
IGRldm1fb2ZfaW9tYXAoZGV2LCBucCwgMCwgTlVMTCk7Cj4+Pj4+Pj4+PiArwqDCoMKgIGlmIChJ
U19FUlIoYmFzZSkpIHsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZh
aWxlZCB0byBpb21hcCAlcE9GblxuIiwgbnApOwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBQVFJfRVJSKGJhc2UpOwo+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+PiArwqDCoMKgIGlycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKG5wLCAwKTsKPj4+Pj4+Pj4+
ICvCoMKgwqAgaWYgKGlycSA8PSAwKSB7Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cihkZXYsICJGYWlsZWQgdG8gcGFyc2UgYW5kIG1hcCBJUlE6ICVkXG4iLCBpcnEpOwo+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IMKgwqDCoMKgRnJvbSBjb21taXQgZGVzY3JpcHRpb246Cj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBUaGUgZmlyc3QgcHJvYmVkIFNUTSBpcyB1c2VkIGFzIGEgY2xvY2tzb3VyY2Us
IHRoZSBzZWNvbmQgd2lsbCBiZQo+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+PiBicm9hZGNhc3QgdGlt
ZXIgYW5kIHRoZSByZXN0IGFyZSB1c2VkIGFzIGEgY2xvY2tldmVudCB3aXRoIHRoZQo+Pj4+Pj4+
Pj4gYWZmaW5pdHkgc2V0IHRvIGEgQ1BVLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaHkgaXMgdGhlIGlu
dGVycnVwdCBtYW5kYXRvcnkgd2hlbiB0aGUgbm9kZSBpcyBwcm9iZWQgYXMgYQo+Pj4+Pj4+PiBj
bG9ja3NvdXJjZT8KPj4+Pj4+Pgo+Pj4+Pj4+IEl0IHJlbGllcyBvbiB0aGUgRFQgZGVzY3JpcHRp
b24gYW5kIGl0IGRvZXMgbm90IGh1cnQgdG8gaGF2ZSBhCj4+Pj4+Pj4gY29uc2lzdGVudCBjb2Rl
IHBhdGggZm9yIGNsb2NrZXZlbnQgLyBjbG9ja3NvdXJjZSBldmVuIGlmIHRoZQo+Pj4+Pj4+IGlu
dGVycnVwdAo+Pj4+Pj4+IGlzIG5vdCByZXF1ZXN0ZWQgZm9yIHRoZSBjbG9ja3NvdXJjZSBsYXRl
ci4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IElmIHNvLCBpbiBteSBvcGluaW9uLCBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIHVzZSB0aGUgc2FtZSBTVE0KPj4+Pj4+IGluc3RhbmNlCj4+Pj4+PiBmb3Ig
Ym90aCB0aGUgY2xvY2tzb3VyY2UgYW5kIGJyb2FkY2FzdCBjbG9ja2V2ZW50LCBhcyBib3RoIGZ1
bmN0aW9ucwo+Pj4+Pj4gY2FuCj4+Pj4+PiBiZSBhY2NvbW1vZGF0ZWQgd2l0aGluIGEgc2luZ2xl
IFNUTSBpbnN0YW5jZSwgd2hpY2ggd2lsbCBoZWxwIHJlZHVjZQo+Pj4+Pj4gdGhlCj4+Pj4+PiBu
dW1iZXIgb2YgU1RNIGluc3RhbmNlcyB1c2VkLgo+Pj4+Pgo+Pj4+PiBUaGUgYnJvYWRjYXN0IHRp
bWVyIGlzIHN0b3BwZWQgd2hlbiBpdCBpcyB1bnVzZWQgd2hpY2ggaXMgdGhlIGNhc2UgZm9yCj4+
Pj4+IHRoZSBzMzIgYmVjYXVzZSB0aGVyZSBhcmUgbm8gaWRsZSBzdGF0ZSBwb3dlcmluZyBkb3du
IHRoZSBsb2NhbAo+Pj4+PiB0aW1lcnMuCj4+Pj4+IFRoZXkgaGF2ZSB0byBoYXZlIGJlIHNlcGFy
YXRlZC4KPj4+Pj4KPj4+Pgo+Pj4+IFRoaXMgd291bGRuJ3QgYmUgdGhlIGNhc2UgaWYgdGhlIFNU
TSBpcyBrZXB0IHJ1bm5pbmcvY291bnRpbmcgZHVyaW5nCj4+Pj4gdGhlCj4+Pj4gY2xvY2sgZXZl
bnQgc2V0dXAsIHdpdGggb25seSB0aGUgY2xvY2sgZXZlbnQgaW50ZXJydXB0IGJlaW5nIGRpc2Fi
bGVkCj4+Pj4gKENDUi5DRU4pLgo+Pj4KPj4+IEFyZSB5b3UgYXNraW5nIHRvIHVzZSB0d28gZGlm
ZmVyZW50IGNoYW5uZWxzIGZvciB0aGUgc2FtZSBTVE0gaW5zdGFuY2UsCj4+PiBvbmUgZm9yIHRo
ZSBjbG9ja3NvdXJjZSBhbmQgb25lIGZvciB0aGUgY2xvY2tldmVudCA/Cj4+Pgo+Pgo+PiBJIHN1
Z2dlc3RlZCB1c2luZyB0aGUgQ05UIHJlZ2lzdGVyIHRvIG9idGFpbiB0aGUgY291bnQgZm9yIHRo
ZSBjbG9jawo+PiBzb3VyY2UsIHdoaWxlIHVzaW5nIG9uZSBvZiB0aGUgU1RNIGNoYW5uZWxzIGZv
ciB0aGUgY2xvY2sgZXZlbnQuCj4gCj4gQWgsIG9rLgo+IAo+IEkgdGhpbmsgaXQgaXMgcHJlZmVy
YWJsZSB0byBrZWVwIHRoZW0gc2VwYXJhdGVkIHRvIGtlZXAgdGhlIGNvZGUKPiBtb2R1bGFyLiBH
aXZlbiB0aGUgbnVtYmVyIG9mIFNUTSBvbiB0aGUgcGxhdGZvcm0sIGl0IGRvZXMgbm90IGh1cnQK
PiAKClRoZSBTMzJHMiBhbmQgUzMyRzMgYXJlIFNvQ3MgZmVhdHVyaW5nIGEgZGl2ZXJzZSBzZXQg
b2YgY29yZXMuIExpbnV4IGlzCmV4cGVjdGVkIHRvIHJ1biBvbiBDb3J0ZXgtQTUzIGNvcmVzLCB3
aGlsZSBvdGhlciBzb2Z0d2FyZSBzdGFja3Mgd2lsbApvcGVyYXRlIG9uIENvcnRleC1NIGNvcmVz
LiBUaGUgbnVtYmVyIG9mIFNUTSBpbnN0YW5jZXMgaGFzIGJlZW4gc2l6ZWQgdG8KaW5jbHVkZSBh
dCBtb3N0IG9uZSBpbnN0YW5jZSBwZXIgY29yZS4gQWxsb2NhdGluZyBzaXggaW5zdGFuY2VzICgx
IGNsb2NrCnNvdXJjZSwgMSBicm9hZGNhc3QgY2xvY2sgZXZlbnQsIGFuZCA0IGNsb2NrIGV2ZW50
cyBmb3IgYWxsIEE1MyBjb3JlcykKdG8gTGludXggb24gdGhlIFMzMkcyIGxlYXZlcyB0aGUgTTcg
c29mdHdhcmUgc3RhY2tzIHdpdGhvdXQgYWRlcXVhdGUgU1RNCmNvdmVyYWdlLgoKQWRkaXRpb25h
bGx5LCB0aGUgcHJvcG9zZWQgaW1wbGVtZW50YXRpb24gdXNlcyBvbmx5IG9uZSBTVE0gY2hhbm5l
bCBvdXQKb2YgZm91ciwgd2hpY2ggaXMgbm90IG9wdGltYWwgaGFyZHdhcmUgdXNhZ2UuIEkgc3Vn
Z2VzdCB1c2luZyBhbGwgU1RNCmNoYW5uZWxzIGluc3RlYWQgb2YgbGltaXRpbmcgaXQgdG8gYSBz
aW5nbGUgY2hhbm5lbCBwZXIgaW5zdGFuY2UsIGdpdmVuCnRoYXQgdGhlIGRyaXZlciBhbHJlYWR5
IHVzZXMgYSBnbG9iYWwgc3RydWN0dXJlIHRvIHBhaXIgU1RNIGluc3RhbmNlcwp3aXRoIGNvcmVz
LiBUaGlzIGFwcHJvYWNoIHdpbGwgb3B0aW1pemUgdGhlIG51bWJlciBvZiBpbnN0YW5jZXMgcmVx
dWlyZWQKYnkgTGludXggYW5kIGxldmVyYWdlIHRoZSBjYXBhYmlsaXRpZXMgb2YgZWFjaCBTVE0u
CgotLSAKUmVnYXJkcywKR2hlbm5hZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
