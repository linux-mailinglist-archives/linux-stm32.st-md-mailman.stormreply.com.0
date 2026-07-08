Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f22ZE8KpTmq4RgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 21:49:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8627729FC3
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 21:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=nyD4sRHr;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B62A6C712B2;
	Wed,  8 Jul 2026 19:49:21 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011020.outbound.protection.outlook.com
 [40.107.130.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C2F3C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 19:49:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm9m0/e9k0CDcY843NH2cWFP+ZHbbASxYK6bI+hV5F3eoo8634gJ8Fd6Vcf3tJy0gClfLkk7UklgUqoWWKWWaeMDIgxP/8krdqPHdc9cDWQ0qEopAY9fc6bdbFYRkz/kFLe5A/v4M50e0PRCWoQ0LpBHMLaLaZrTYHxzzt/L9lz+Oup5jnAXb5Ins91i01AH+StqNVla4IX3lAOcBX8PSB7wEQEimfj6YamYQnQo0MbUojeYgW4S/bcI8JyCElEBvjuIWDbPyKwhd60zPTwW0o1q3dZzli4LJt3Sd4SGfYTXBpkoX41bWn78BvVXOFrbZYWdHPdRsZagiiyA1HFAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bY65Yt+YpJjiyA6/scRol6oo+H/iiEQ/nYWrkX3Z5U=;
 b=h3XXpSQvzHv6EBT8npQi89JvoBOnZyVam35irg+pnsrQLA2s3b+XgT8N7PdrtFBiCpaYFsly9A1JrkVlevooy1wc2Q5etIRJm752UuH1Ky/egfDCDIKAjFHjX2ow1qxE7TuJ/IBbeqkYcJErPbb5b0R/NKwdyqG/1o5MJlKuQvPuM3ffq4O3XLCcAJnIudbuD+XX8R18f0ETj+B33iOEOuEL+pJamFDxkij5XKeCsaKcPC0DbsTRg21FW2ZMNFkex/YqDU4xS35v0ihUrcureIFpBFM13ueWVBFK1O3Ld9N0PR9eccxzsmiBTomoLGemou8wANU9/ucymG3P0rCPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bY65Yt+YpJjiyA6/scRol6oo+H/iiEQ/nYWrkX3Z5U=;
 b=nyD4sRHrbNmsnKNyPPhhDgyYKItxQimFrZs0uP5n5WglGBMpKJmVsBxFevG8hbr2fizONEyvFq0JOgtUC0QVWN37lPgO7VwQ30P80LkNzOc2pEBAMqEc8nl1FwQJNQtJioA76ImnNPDsGpBxfFL09t7tVfgmGQMQZAxrQzZkq2jpy8uPW6kGDd/i2JK+Hbb/Z/Wrm/2JflzCslbE4iPvu43lbHensB+iTix7EvUtqiV1lvsnqCTZfVX08+j/8qyyAntIJJG2KlUjab041Rnsh+ViVrbDdi5xty6F4dB8eLpQm9EyyvLzKZIpSTrCm0JYLYh1cRUsdw5PxXRoF1U0eA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 19:49:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:49:18 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:48:58 -0400
Message-Id: <20260708-dts-stmpe-v1-3-1f51d15bb358@nxp.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540138; l=1774;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EbMHmJuXuDRTB+DdRb34jpa/fO8dbsPQbwaIoRPivY4=;
 b=1K0/xSn0lD8gcANnSxiJNNYDvNLvqkqGFHOm1OfRHu+uOAE2rRX03Nttr26pgtvQOQAF88Xie
 i8kpGh+2sdjAobOrrL8MMoYUvuNyELyvCqTfT0lZP+D2/tY8Ctdw8Vr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: adeb2266-8741-4d5b-dbcf-08dedd29ff6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|6133799003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: dTP0V0hMrG6LBPer8kHjSfbKrrAz/gpaMpMvOn3WoFVirtIcA/5aNy9EdEN+Nu1aT2AJP+pflxwbDVQsweMlZwf4a1UXE5f99NHexkd6wMIoMUDaHVNA++LahuBmKRsp+pMc9F/41Sbgz1JEDuRsKG4DsMGDQ50YcRs3jF/uyyYgt0QtSvuXrpOAXN0nPn3wm/Jr81A0AWmS0ADWHfWAReebd4/DrhxL8s52+AVDDxCuG15yl8YF/QVloYVIFvNsxL718g9UKLoJ4X6UtJcYrCaUKGybfE1FUAGcbG6KqbH3NcY7OLX7D/heMr1N0WQHndsHjRmV866yDVLdUetv9hEyc2S3xt4An0b+i2uo+LRpytB5S7HL1hrLYOXcRnLV7TktPBeoQ5CE/zUrM/oQeiFXfXuBRThHwQLASXtSSneV2OzOMAV1IzIBsbR/Ga/ngWEoKdVBvN5EU5qNEI9gm7cJUXKgli/FPqC1oe8bIhDspcFjvaEZia/76VBJPJfUFqzaHf1UScsELpAMfAvTwrZdxJMmFWbzULVV6f4DuqKBLOet8BeFQtvKFaq9dnWxb7OJen46CTZpzyBFVkzZxqtxeva+MZhq62AQwmhxY6DCkBd7eoaC+AtltRwuaYRHex/V4+HfJDONeN+Nqtd5dIIcc/0O2JXk3H6XFmPOviuY4zddy1IbWsc1n2kmAa8NT1i62VtyRc4pA3eeR22T2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR04MB11799.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2Z1OVBMc2tCalB0c3NhYUp1a0lBTW9Jb2NtRGtBS2RiV3IxN09iaXFCNHFM?=
 =?utf-8?B?ZVMyNnQ4M3ZBZ2pGeFFSeVRvRTJLWVdXLytCMVNEd2QyajFScHRjdHVMdzBr?=
 =?utf-8?B?SG11VjFHV2dRc3RUbkpiY2xYUEVDYTA0d3VENkcwZ1pYS0pTVUtqYWUvaWxB?=
 =?utf-8?B?TkR6b2lzVzkvOE5UNi9hUFNOVWpqK1piSGhZZTN5YVUrQ2ZGZGNwVmRuVWhD?=
 =?utf-8?B?MFk4ME1ZYWNTeEFDYk4wQTRvOXF0bG4wL3pMaUQwM2gvT0s0dzAyK1BVcUNE?=
 =?utf-8?B?eXV0aGZwT0JYeWc5eHdPM0VJZkJjZFA1dXg5WW1DWWRGWURRWUlJMXJvOFJz?=
 =?utf-8?B?OTZxczBTMlRMMU93OGlHamJTRGFwZDNaWDJNVm9wT2s0MjR2UmRtNWQrNWVC?=
 =?utf-8?B?ajZMam1UME5La3RtL1Z2TmljSXA3V3BOU0wzTjFVOEwvYXpTMFM4OVZZU0tp?=
 =?utf-8?B?c0FBMzY0UC9VV0gwR2FIVEJDZUR5SlQ0dnlzcVlpbWkwZEI4dnRqbGtNTE9C?=
 =?utf-8?B?ZDN1bW5SUWxPNk10VXFWWVJXNGI2Z0VSbGpjMlo3TTNXRVdJb2xvdWswRHpT?=
 =?utf-8?B?UzJmdTFnT3pGUHArdnFKRG5KeW93UXh0S3pidGhCV1FwdnhFY1VJakluZ3pH?=
 =?utf-8?B?WWxSSWMvOCsybmk5Mzhua2xTY2JxbGJYNk54cGc3cWRrZzZJZFdrWVpxS0FP?=
 =?utf-8?B?c0RUVnZGcmcwejZFam1qVU5TSzBhelkzRnZKM1VQVG82b1MrL3VOa1VZNzFP?=
 =?utf-8?B?cjRMbmJ2WUNGaVdtOGQyS05uZXR5MTYrUno2OWJWOUZBVzJrNlc0QklYaDZZ?=
 =?utf-8?B?K0pSWTZ0TmpiQzVJbFBsb1pBSDMwbE10U1VsdEEya0hmWWloZGUwRTlrS21x?=
 =?utf-8?B?QkNpYThCcEVpUWh5MjF2eFllaS9TRmFEbGV1eGYwaFlmY2tDYUNVSkNJVTJk?=
 =?utf-8?B?eUhvVmxlTDVJdXdqK2hjQ2RRNlJhWkZJMFUrMzFmZUordXhCQjltUkk1bkNk?=
 =?utf-8?B?azRodG1oQmVaaDBESytVOEc1WUdDaEJNdFBlNjAvK0x3NkQreGZQQzhCVXR5?=
 =?utf-8?B?V01PWjB2MnVRUW5uWUNiTUQ3MmRUVFJhYjArVFlveU5jN1Z3UEJXWHkzRVBE?=
 =?utf-8?B?NmZPZG1KVXlyY2hVbmtZTUhtOUFjRVUrbkt6UitRMTNUY3R6THV2MzduamEy?=
 =?utf-8?B?MnE5Z0gyMmM3d0psWWoraW4wTlNaaXdvWlk1MW9iR2Fib3BWam5GWWFNN01C?=
 =?utf-8?B?Myt3RkdWbUZhTXVoSjhsYVh0YjRwNm1PZVQxVG5YT2FJV1pIait3SzB2UVZa?=
 =?utf-8?B?ZGloeFZPOWl0UHJ3U0pOeldPdzJITjNqbTJNVmV5c0VGVUd5U2RxR00vc2Rq?=
 =?utf-8?B?dUNFWUZIM1lHRGFwMFNBMHVvVFc4NnpPSjZlMStKYUwwNndjSnRwdTcyUXp4?=
 =?utf-8?B?dHJpdkdob29YQjUvdGY1N0tZZEhPV2haeENZQlk2UHg5UTBXWkhuYjhXbHlx?=
 =?utf-8?B?M3o4cWd0WWNldDVBRkZvTlo5ZUh4OW9ZT2RLRnVOWjU1ekVOa200QkgxdUk2?=
 =?utf-8?B?YVF3b1haY3Q1MGlJN3ZPVDNKT09YQmVvd1ZjVk5VM0loa1VXcHA5VFVkLzR1?=
 =?utf-8?B?MDgvdVRLSjVPcFc5bk1SUnpLcWRlUE5sdG85cFZSc2VKUk5ZRUh4UWhjRXFI?=
 =?utf-8?B?UGZoUHRhNnNnblh4WnNYN1Y1YXoyV3JSc29TMDNCdDlHblJ4SE5BVi9pQW15?=
 =?utf-8?B?SmhFbVg3ZGN0UTBoUHdkd2w1SEJJSGdMTmRzWlEyVXdrL0c0NHpzeU1VQSs2?=
 =?utf-8?B?QW5kWW83NkpTMmR5OHZEblpTR1NCVTFWZU9lRFcyL0wrRTNmVlpYNDliWGJT?=
 =?utf-8?B?UFBHTUxiNmNaeTdTR3F0Q3c0WDl1ZXRGOVE4WG9leGVrd3gyUkN6Nk1jWEtB?=
 =?utf-8?B?M3pLSkFQUWZOZGU4ZVNwVC9nNEZXVFlTSWxmZkY2NytmTk9ocG9MRXFPTWtl?=
 =?utf-8?B?UXBncXg3Z0hNZlNnNWVIeUNVbjJpcUdqRVNFVzUyVXlsaTVqUmVlUzFYL05j?=
 =?utf-8?B?ekpTZTQyUW44SjdGM1FPdU1EMVN2NXEvRXJjckpEZ0V6NjY1VUxta3Z5N00z?=
 =?utf-8?B?VDJabGIxTUhjY0QySUJ3cVVuNjF4amhnSVdIUDBVY0l0anFPUURuLzJEdmg3?=
 =?utf-8?B?TjZyeVcvYXNYVEZIbjQySlczNDRtNFhWbzlUNzRTTGJ3aDVES0lzMEtnMkZG?=
 =?utf-8?B?d2lJSy9FM1V6c2RXcDB2WDlxMkZhYTQ1SmFsM2sza3pkekV0Ym83dmNRU3hS?=
 =?utf-8?B?T0V4eWVhamFUZnpsT29SQXp2TXJUT2xpMkFDUEIyRVg3V0tHU1BidS9ySEkv?=
 =?utf-8?Q?c9e59+caN0gDZ8IDT7MCsPKpVovTgvMHlAzS+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adeb2266-8741-4d5b-dbcf-08dedd29ff6f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:49:18.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDEYFLJ1ACAw0HOtEq4Uowrse6OVpBID5PxrG05PnpcsTsJruOUZvGAgUdwA6Ma/eb8cyVJAzGA7cQUXLZ7uGQU2Ux8vvZ8wrlmf8sO/T38uG1wStiiNaiKSdfPuvAZ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: imx: remove undocument
 properties of st, stmpe*
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,devicetree.org:url,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8627729FC3

From: Frank Li <Frank.Li@nxp.com>

Remove undocument properties irq-trigger, id, blocks of st,stmp* to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Known other user (uboot) doesn't support this touch screen device.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts    | 3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index cd9a050fa906e..9938a63b5110c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -281,9 +281,6 @@ touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
 		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
-		id = <0>;
-		blocks = <0x5>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe_novena>;
 		vio-supply = <&reg_3p3v>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..af038ac472261 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -631,11 +631,8 @@ codec: sgtl5000@a {
 	/* STMPE811 touch screen controller */
 	stmpe811@41 {
 		compatible = "st,stmpe811";
-		blocks = <0x5>;
-		id = <0>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio4>;
-		irq-trigger = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_int>;
 		reg = <0x41>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
