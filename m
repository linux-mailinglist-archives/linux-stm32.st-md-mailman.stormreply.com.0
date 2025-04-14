Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2AA884F9
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 16:31:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C15BDC78028;
	Mon, 14 Apr 2025 14:31:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F56DC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 14:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg8CzjWCE5IMyC/xj+f9o8TfbMa2XvZofSeNwl639RBHUMRFk06lq9AOayDcKsHs7gfTFDDiBNrFnoVXK5f66H59+72gspFBP+aV0Zk4tLwy66EUAcK0nSVbGVkW2112WGACQw4kOEYFeiScrhHff7LSB4UMdiIgTB7eBbZSFhBAm90C0UXTiLzwmS95ot+I4Ra5w7keg5MijMkU++dz4bimTjz82yWGBKiQb1kJQ5dHynbmi1lqGqpFs53k7fMHXCqp3GUzOwVFFb3ZCPfN3f5VWOd5YnTSp6h1Dh3BB2lSqa2Vi+MTdauRPG6TIrTwesH2lDtwz04MTw7RoaaU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BC521sZtFhjJkdqprb/2NfIdK5dbWjZn2/nx0i98o8=;
 b=F9VNEkX2CfYODBGeHAO5GMu1/Fwff/Y1cw92N8a2KANu9AWKb4slwap9XWQInv5jLXu9pqIyeGqTfRSr2R+JYz4aQJYzrTx5otvFgFP4LXxZFvX/eus8wyylJvMoDTlZJQzOnKNF8fUnWdHhRFdc085eLorIKVcp3U0dfqHP+0k80A7WdSpD8758zIhsVDuRwNIf88w7NeYr3WM7Rlc/F4wYFpdXb/cTgtt8Uguc/jNdVIDRRCcR0WNNwmYcWaSD+SPG6+JDY0NE1cwfomkVO1Y/kVwFYwESrIr4rUC0VMqOSfKesGQTgJTbaXJlNRUIUJu7PymzjO4budIX+KcKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BC521sZtFhjJkdqprb/2NfIdK5dbWjZn2/nx0i98o8=;
 b=rIE6bW7Fd/mQvlzfHrh3RTyzqlp8lNxwoKbW7LczCA0VeH0x6FnUELzmD4xfAE3X4aHYy1CefoDtV43wTil0t7PUk/m1Mc4bX+qOgM+rNHAAxMAhCvQukZlHza2+FsjkR7daP0kXZHnbd08t3Us5Z/Y+WEdL5PZeW4cbrf+AYEI9+9rN2G6RBENYb174zq26/GjtevV/5OvoUTChPFXUCG5qi1KRRJe4zZPioP7kV1nPkXckdhu3enSDUPCgJt16q2AmgNi5QnreU383PfPtFvfA4aSVjwLcHOx0Lh1q57pu1LVLoAP+s7lnnNFjgWiK+89IfTrKLlEppQKFsTtL9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS1PR04MB9239.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 14:31:11 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:31:11 +0000
Message-ID: <9636d9ac-7329-ead3-4a99-ea662acb6408@oss.nxp.com>
Date: Mon, 14 Apr 2025 17:31:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
 <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
 <67daf656-0e08-471d-afce-22ba8f2fa1f2@linaro.org>
 <c14389a1-1904-450f-98c5-a55351518ed7@linaro.org>
Content-Language: en-US
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <c14389a1-1904-450f-98c5-a55351518ed7@linaro.org>
X-ClientProxiedBy: AM8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::27) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS1PR04MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: 43fde3af-8551-41c9-b414-08dd7b6100ac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1hhblVrWkUxRjNhS1hScXVzSDh1cVkrMlF0MWRIdzM5bjlsRGVlUWVYajN4?=
 =?utf-8?B?MWRZMmhBdXBNSXU1M2pxcnRvcXBTYUFqSURySldNcDNjVXREZHhuWng4WmJx?=
 =?utf-8?B?QzdYdE1icCtZL1ZkT0FYblJORE9Zc2VHWVduMWRSKytrMmNKQzd6LzNEa0lv?=
 =?utf-8?B?TU5HQ1EzTWJxUE1tbStNcm56TVBGOTB4dHI3NXUwVndxLy9veFQ4OWo5eng2?=
 =?utf-8?B?dGN2bXB2Y1ZYZHU0ejliQytqdUkyc3JvVkNkVEtlaWRBWWh6S2JHYWZRYTRl?=
 =?utf-8?B?V0RyZmZiUWJCTjdpT2NRTzR3R0ttV3VwUE8reHBWdW8zK1BNK3Q0cWsranFT?=
 =?utf-8?B?MHk1NVB2c09tQXdwRHd4L1pnUVVab0puRktYd3lDZzhENStBajRFZmF3TEI2?=
 =?utf-8?B?c3A1ajV0bkd4clVpL3hGeGV1ZzZoK3g5MThOTGpSazMvZi8xWVQzLzhoU3hR?=
 =?utf-8?B?Vlc3RmhjU2kwL1F0a0JSa1JHNTc5NlUreFF2QXp4c0JQcnZrdWhuQjhCanFi?=
 =?utf-8?B?WUtRbjY3Sjgvd0ZML05oT0Y5UENJalkxMi8zUit5eVl2VGtFOWxuaTQ2UzEv?=
 =?utf-8?B?dU0zSkRsY0JHbS9md1cvNWdqcDRpRDlNREQwbHViZ3lxa3NiMDdkaW1TRW4r?=
 =?utf-8?B?Z3dWNTdFM0RmRzhxR1NsbmNIYVFNVWxCNXF5UUVqTThvTVhybFJzT2ZqUTky?=
 =?utf-8?B?RjdoOFJtUmExRUhBMThLeUNqMU1BWndYUnJQWDkyOG9PUTd5MkVUNXR6cm5s?=
 =?utf-8?B?UWFBNm9yWXNCZm5lM3FrR2hINEt1c0Nnd0VJUFRKYy9wWkM3Mzk2VHA3UDEv?=
 =?utf-8?B?T0tXMW5RcXJRNUZXVytQaDV4c0V3Um1IMHVPNmN2cHo5TWVLMlZUN1lYRUxR?=
 =?utf-8?B?MlBVUDlLSEtjY2FIL3UyZHZva1FDK2FEaTJPb3ZFS3ZMTHhuNTBsNUk4TFJj?=
 =?utf-8?B?UCtsbStycFBueE0ydGpjNStxY2JyQjd2WHJoYUNtUXMzaTZhK1drc05UdUFP?=
 =?utf-8?B?ZnkwMENRaWE2NndjMXhyMGtRV0R0Q0FNVXY2cXU2VzQ5L2t3T1l3Y2FRNFJl?=
 =?utf-8?B?Y0Y1ekpHS3BUMVR6VUUzeStVOXhNNDA5bEF3YnZ3ZE5kVVB6VDd0Z2p0YTFF?=
 =?utf-8?B?UDJUakFHR1dZc3EzdkRFWDd6SzNLTytYOXJjZTdzUXlreEJEZFk2ejBMTWg1?=
 =?utf-8?B?elZTWVBZcStQOElMSWREcFI2KzhKWGdVUHMwTVJlTU9lTk5TWXpLZ0hXWUU4?=
 =?utf-8?B?YWRoUUg2WkhMUUpMSGVjbjBwSGNFbmw0cDJFR1ZFVHdVK1dnTUVuWmo5ZUZa?=
 =?utf-8?B?UEcyclduVk1Sb1IwaFdlR2tIM2RXU20weHVZaGdkV29TMWdyVXBxK0ovRnc2?=
 =?utf-8?B?emR6aVVtR3dqVnZZdVp6SXg3bUp5N05sajhEbGZZcGFEN2h5aDJxOUppM3p2?=
 =?utf-8?B?VUk2MXF3dFpWcTdvZVQwSnluTktDUWZZcEF0Q1lXbHNxRUVXYWFoenh5M1h4?=
 =?utf-8?B?ZHJNVkpLRnNQZGQ5K2g2aVJDb2F3R1dQTzlvN3A2U3NDQU5KOTJWUWJFUkQ5?=
 =?utf-8?B?cmNCWDgxcHFxeHRBeGdhQTVPOThBR2taWUljT1VLSk9GbkJXNHlFOWJTbXV6?=
 =?utf-8?B?SlhPWk01aVJFMjJaemk4VkNFaHN2VkRZZVpXQ2VRMXJ1VUFvR2grVUYvYnFp?=
 =?utf-8?B?OVdKV3ZaQWdpalJmSmlSV1pGQi96YjRLMUQzY2hXLyt4R1JMeWpNN3hwSUZX?=
 =?utf-8?B?RGEzYklOQTgwcitXOTYvU292aGxLVTFNNXJuaGRxbmtvYktUVXNRR0R5OU9S?=
 =?utf-8?B?UmtEN3JYYlhDa1oyUGJ5aDVISlZJOTF3YmZQMEFQSDlsak5qaHJLeXpHNmEv?=
 =?utf-8?B?ZUtPM1k0OGRibWpLeVhSc09yVkpxM09wUlFsNjk1U0o2Vmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjNKeVMwWkhWMXAweDBGdXFKakNjdWt6d2RhYXNkcHhaVXRLVnB1bXg5ZlFl?=
 =?utf-8?B?aUhGMXlsUnJ2TGo3a1lPYXRDeTJFcHhPRVpWdHBTWjVIa2hLYVN3N1I3NDdL?=
 =?utf-8?B?WEtuMmE5bU8zd2xHeW56T3EyZVZYWTJBV2xhTVlsVEVoRFd0YlpoQ0lSclpO?=
 =?utf-8?B?NWhsTTdyL0pmM2JCdzBtS1A3TWFSejVXY25sVGYyRUxFUDloOSsyRTRvMVNR?=
 =?utf-8?B?ZVkyY2RjTk9GTEVldG9xNHFkbVNXbkd6V1Bub2tGV3lNOXFLaHg3cVc5UTFu?=
 =?utf-8?B?WGtxYzJ1YUE5OFo0amlKL2pYK0ZzcnpjSzJ3RDByV29ucnRTSWw5bDlzb1N4?=
 =?utf-8?B?d2x2bEVrcXdOTWl5N1NHS2RRWmM3dG4reWtnanpTWlAzZUx3Z09XRWwvYXEy?=
 =?utf-8?B?eFRDa3JHZkVnczh2N2JrT29wcnptUDE5cFlXeTRkdDNRREdzSXozQkF1amFR?=
 =?utf-8?B?YnVJWThsWDluUCtIMlBhcXhJRGxSVWpTWmQ4clRKbmc5aGZYTGk2bEx3UGd5?=
 =?utf-8?B?ajBFV1VFeDBRRFdDRWM2ZVFBdGFVWmJWS3VEcjkzNjZ5ZTkzWTZyalJaZkZw?=
 =?utf-8?B?VWpVbnNOdHRqbEd0bmZ1NVh6OTlmaWRJQnhHQ2VvR2VsL01OVUNLTHg0N0Uy?=
 =?utf-8?B?SENvc1VXRHhJQ3BuL0ZOeXg5VXROWEFHa3pjYlJnZTU3RG10VGh2UjVFdkov?=
 =?utf-8?B?bDlMSnRtM2F4RERCb29pN2NtUDllbStrUllQckRVZmI1dER4dEFkMkpUZUR0?=
 =?utf-8?B?WCtqR0poS012bGoyN29FOERCVGV4cXZBOFp0czJyZjBMMVhHRVdLYlh2cWZI?=
 =?utf-8?B?WGNwei9OeHFDdTFLOHkrQ0NpY0F3azhiRHJ4M3daWGhsbURWZXAyUWtWUHJX?=
 =?utf-8?B?cENwZHdCTVRrSXNzRVZHUUpvWnhjV05UYVhMR040b1FWQnJqTElveTByN2Rl?=
 =?utf-8?B?MlQ2dmVnd0g1dUczZ0ViYys2VTdpRXl5TnVMcTBORVhrQ0I5Y1V6VWlvN05S?=
 =?utf-8?B?empWV0gzWDNRNWQ0bXhGRHhLRjh4NjJOcXB5MGoveGdPMnlGSEJqM0lqY3dU?=
 =?utf-8?B?dGtXcEE5Tmx4Q1hMVGgzYmhXMXgrdjVnWXlrUmRzV1BJZUdmb3NyUkNaSFU5?=
 =?utf-8?B?M1k0dkE4NEFITVoxVTMxeTcwQ2ordEc1dVFkdk1iYTJFeU0rM2NCMXlvOFEy?=
 =?utf-8?B?YUxFSXRYZEtWTllJcWkxL09PTVNYdjJRa0JZcU1FRVpLRkZBS2x2b3QremhW?=
 =?utf-8?B?R3lnZ0N3VFhubkc0c1pyNDYwTW14U3lHRmRNa0dMOWQwZmtwWkUwcE82c0Rq?=
 =?utf-8?B?SWhlZldaK2xZQ29KUnBYOWR2TG94dUJudW1KaFowc0ZtYVB2aGNvYjlvblRG?=
 =?utf-8?B?S3BtRC9USS83RHg5dEdIbGdNbnRET29GQ0xoSERGd3h5Z0FiVTZKdmhTM0pn?=
 =?utf-8?B?ZytvbTlQaDdvZVM0UG1jWHdEbUFTMTVXeVlyS3Q3V3FrM3FyTWNGVG5XVUs4?=
 =?utf-8?B?TTZFazJ3NGhOUTk1YmZwVzVzclEyUTVkenFLa25LYXZTTmg1SjE1T0VMdDNP?=
 =?utf-8?B?NDRkb1dqb0xPTUxCaFA4TkRqV0NuS1EzNnovQ3hPaU5FcVlFRFdhdXNzdFl6?=
 =?utf-8?B?K2ZDZmVrajRlSmx2TFJDNzRneDFPYjAxRUcwbDdKTkF6MnB1VVlQbUY5Z0U0?=
 =?utf-8?B?Y2F0M04xOUQ4cHoxWjF4R3RHdTdFYWtkbEJHaHZqRndsTlNTRzVzRWJ4YUNo?=
 =?utf-8?B?aW1JNzBCdnNpa1BmNzFCNVRmYk5McWFPckM2c2llT0QyOC9vU1pGRXpSWnNk?=
 =?utf-8?B?UXJmblhEczEwUE5Zc3Y2cnBVYTBzMkM5aHNxVGhaMnlaaGdQOXRDZHB4dGlw?=
 =?utf-8?B?c09DZ0VsSW9iNGsxYmUxcXRxR3ZjRjdJdXM2blkwcjRFcWRzSFlhZXpwRnRN?=
 =?utf-8?B?TGsvSGUzWG92aFNTZkVHTHI1RnpmOHNSYVpZNzZCUHArY2dyWDZPREkxSVVF?=
 =?utf-8?B?L2M2MSsxbldmbVh5MnBqamJPc25QK1FmRmltV0JmR0ZrSUpqTUF3WFV0aFIx?=
 =?utf-8?B?UUlRd0haMy8yTXZ4R0FOZTRocXhvN1RySFhmd0lQOXM3c2t2QmNXcXpIN1hS?=
 =?utf-8?B?eTUwNzZrZzQycWcxVkpPOWQ0b016amE5NHpwMlNaT1lWcU9XOEVhNFZyRm9Y?=
 =?utf-8?Q?qIV64qmEH7d/ZNVP+i+wQ+s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fde3af-8551-41c9-b414-08dd7b6100ac
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:31:11.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHP2ZA+bnNeLo9Gj8euEyL7kY0zx9HO1+TcCvc4AEK4a5ET7LO9u3mFn6PhpMKkONARK6o0u/Qz6K/2u92iNsG4LILbjDIeKIpXyhRtqMSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9239
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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

T24gNC83LzIwMjUgMTA6MzcgQU0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDAzLzA0LzIw
MjUgMTc6MjEsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiAwMy8wNC8yMDI1IDA4OjMzLCBH
aGVubmFkaSBQcm9jb3BjaXVjIHdyb3RlOgo+Pj4gT24gNC8yLzIwMjUgMTI6MDcgUE0sIERhbmll
bCBMZXpjYW5vIHdyb3RlOgo+Pj4gWyAuLi4gXQo+Pj4+ICtleGFtcGxlczoKPj4+PiArwqAgLSB8
Cj4+Pj4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YXJtLWdpYy5oPgo+Pj4+ICsKPj4+PiArwqDCoMKgIHRpbWVyQDQwMTFjMDAwIHsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJueHAsczMyZzItc3RtIjsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4NDAxMWMwMDAgMHgzMDAwPjsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDI0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBjbG9ja3MgPSA8JmNsa3MgMHgzYj47Cj4+Pj4gK8KgwqDCoCB9Owo+Pj4KPj4+IFRo
ZSBTMzJHIHJlZmVyZW5jZSBtYW51YWwgc3BlY2lmaWVzIHR3byBjbG9ja3MgZm9yIHRoZSBTVE0g
bW9kdWxlOiBvbmUKPj4+IGZvciB0aGUgcmVnaXN0ZXJzIGFuZCBhbm90aGVyIGZvciB0aGUgY291
bnRlciBpdHNlbGYuIFNob3VsZG4ndCBib3RoCj4+PiBjbG9ja3MgYmUgcmVwcmVzZW50ZWQgaW4g
dGhlIGJpbmRpbmdzPwo+Pgo+PiBBRkFJQ1MsIHRoZXJlIGFyZSB0d28gY2xvY2tzIGFzIGRlc2Ny
aWJlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlCj4+IHMzMmcyIHBhZ2UgODQzLCBzZWN0
aW9uIDIzLjcuMyBUaW1lciBtb2R1bGVzLgo+Pgo+PiBUaGUgbW9kdWxlIGFuZCB0aGUgcmVnaXN0
ZXIgY2xvY2sgYXJlIGZlZCBieSB0aGUgWEJBUl9ESVYzX0NMSyB3aGljaAo+PiBpcyBhbiBzeXN0
ZW0gY2xvY2sgYWx3YXlzLW9uLgo+Pgo+PiBwYWdlIDE5OTQsIDQwLjUuNCBDbG9ja2luZywgdGhl
IGRvY3VtZW50YXRpb24gc2F5czogIlRoaXMgbW9kdWxlIGhhcwo+PiBubyBjbG9ja2luZyBjb25z
aWRlcmF0aW9ucy4iCj4+Cj4+IMKgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB3ZSBzaG91bGQgbm90
IGRlc2NyaWJlIHRoZSBYQkFSX0RJVjNfQ0xLIGFzIGl0Cj4+IGlzIGEgc3lzdGVtIGNsb2NrLgo+
IAo+IENhbiB5b3UgY2xhcmlmeSBmb3IgdGhlIFNUTSBpZiB5b3Ugc3RpbGwgd2FudCB0byBjaGFu
Z2UgdGhlIGJpbmRpbmcgPwo+IAoKWWVzLCBJIHN0aWxsIGJlbGlldmUgdGhlIHN1Z2dlc3Rpb24g
aXMgcmVsZXZhbnQuCgotLSAKUmVnYXJkcywKR2hlbm5hZGkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
