Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6NAXLOHvVmrPDAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:26:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEC675A0BD
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 04:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=LhfzmIzN;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96856C1A979;
	Wed, 15 Jul 2026 02:26:40 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012062.outbound.protection.outlook.com [52.101.126.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86321C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 02:26:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcKt23DLBh6ibkhAVD7zgHe9N0EHFFvj3p3HMum2tqGUhsm/OJuBoXRXO8OX/LXOuKv1nx25tcZ+s7VF+V3aJdgGbu7d/SoIet/xN5TdyJyFFR3UpbgCxAsn1DyhY76oq8NUDQu0tOtmXup+0wAmsEICyNz3AdVM3L1B/6qn3RbI/liUr3VWQOqr9415cQ2lHZ91hFhae1SGXAvo+kfpSli6xxK+OQqxWCxnERoXI2QI12o6HCkiDu7aTiuQvbYzM+ChrZjULpDliMOvi1ntUr5HPOFUeZm/NsrBxhGwwEJujaoJRPhR1KabidT3WF6worMl5nnlD0ZB3fsqP63pmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhCSqtz0Hk1TZgl3rTbNV25DL0mhgXL4AqqTJXC3P7I=;
 b=kPcApMfEx2jifmoVDsy25DGrar6TCoVm6v4MsBK75Ltp/95HRqDDn3sk7T4Oljxa85N+BEUOrhRqlV0RYrss0+5SoP/+ZUWba1RK/s5j6nItr3AuAkwFWhrxS05Mudx+HAQx49BO2eFeLOLTrPrF/MthWigwwzGokCdOv4OJUN0v42YBVeuV6fXE1YK5SeO2BtHOyzy4SDalKd+zeCa9+5kxO923Uz7ey/RERJN+fKfTsbw+9IYr931BmCNy+Xk/pvSqOTIZvi4WuzRXWWSk/yw7XUVDykXA+TyZW36znK7YFHShyDkUNpBFSsDkmX5IoYWnKhPsIx2xA1Kup+izdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhCSqtz0Hk1TZgl3rTbNV25DL0mhgXL4AqqTJXC3P7I=;
 b=LhfzmIzNM+nh7lSQYR9ZXEwqGysy6Zz4d2DWTg321RO93PU6b/iVBF5XFSTcgzA+ZBmF6Zdv9lf/R+xOJwQJXhh7LLRhw/vsiSxMWfRGraxUQPXugfZoGhGaF3ld3ujKTtE7ZrlyMtMyvk+s3Q3A0gfgmJMYWAHsggReIo/dY2zXoPuVXGxox1WOAHDClrfs8n0rSM6NlYj693mBGfXXVNEPTvr8sMc0hnWM2ZlTU2ySX0BKCLO89OVOCpiH+H2hMlowHH5KTN+/nfJOmLktJzIFA6Y/XL3ONf8/DQWNNrgBfas9T+RaLZixW6d0miLY8CuVu9YYbD56PNjJy9mcGg==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB5938.apcprd06.prod.outlook.com (2603:1096:101:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 02:26:33 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 02:26:33 +0000
Message-ID: <b37f87ca-237b-4e11-a6a3-ab79c5ae2dfe@vivo.com>
Date: Wed, 15 Jul 2026 10:26:29 +0800
User-Agent: Mozilla Thunderbird
From: PanChuang <panchuang@vivo.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
References: <20260713131005.306069-1-panchuang@vivo.com>
 <20260713161215.00001cc3@gmail.com>
In-Reply-To: <20260713161215.00001cc3@gmail.com>
X-ClientProxiedBy: TPYP295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ad3af1-3659-4edb-6c73-08dee2187cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|23010399003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: R0k2765aROsme6eNbXdL2jNL5c6Csv5NaUL6wXReyHUbKGczXVtbTTo33vVCrI9jyTywOCysrKnjkPS8yks4YlUc3nPDPEjTk3ShqIz6jFH2basWjelSQFNY2CwWKKjm79hC6l98Y11sKo0N9G5llPls/YyuaMUX6ThfXyBKoQjZEcO3ssRb4UIwzn1CdoFbhfZy/vkMk056+cPcEH5E+qukq42TPJAGKsqjABdNR1zhhavDDBFNob1fR9VZV7cRFejhLpLHYWPCwF1FOLUPCqNGfFQYCVn3r2HZ/7bKrGJ5PDBVwCMt/ppoMW2Sl6N1591eFC/PrOSK7XuWlUnV5Ha8Q44Wak7g085axI2tq1QJWHZ5NV6IJYYhPfR9jOZf+OYltoyenGWvtoRjE2qAISXviB71juXwej03aXnCw/mWYkrLVVYM0RXOJ9L+qyeuDRpgq25wDW97woeFghpsSMCaxdIzpKk2rA5DDx0EL5YmjB/wCkWTe4ezME+wtt+x3lsjhLhbilx5PLAdBt69BTP9qQ7T9ZuqZjHcFZUv6T32NKPqapbUAl84Uybp0pyuhYITKjxb6AL7zO5S0NMK4Cyy4f2f8T59/AUvpQwJx2FfBgc0547kizETJs1WOLYEI5rYESJbLxnX1RrbTef5n7v4qPiRDLPV3yT7oNqcDyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXVxazAzSE1IQW02cGxlU3ptc0kzcHJzSUFsaWl3WjErTHczVDZDbmp0NEJK?=
 =?utf-8?B?L3pxZ2FvTDZUWGg1aSs4RzR3a0dQM0pnTFFEbjQwakRZR05QZDFyNHBmWXVO?=
 =?utf-8?B?L0xscHR2dDl0RzNJcVVNSC9IbzIvSUFMUE80YWFMUms5eVByN1V6eGtLVnVI?=
 =?utf-8?B?WXU5aEpjM2ZQcXI2NENINlZSYUYzY2hpd1dLOThGRmRFc2dwNzE1UVQ4QU1U?=
 =?utf-8?B?WGRIUG8ySmlvS0RDdTRiZlczZHYvQ2dhWW5EMEJGdEJyN0UrSGJpczBWRU9i?=
 =?utf-8?B?TTF3aks2Um9aZzdrbkk4Zkw5MVNOY3QvY0xSTnBPSy8zRmRWUEhEVElOdmFh?=
 =?utf-8?B?eU9tWDA2RmlEaHhDUnV2NUtSYjB2dUNnYjNlMGxySGZ4VHNtNHhUK3pSOW04?=
 =?utf-8?B?Rnp4Y3ZKRTNwc2ZZeHBwNmQxZytDMlRIZ2QwM0V0cDBzSmVKQklQUE9NWkpr?=
 =?utf-8?B?ajhkdHVoeVFlak1SQXRSZnpLZ0JJYjkvbmJoMmp5QlFKdFVyT1RGdTFqNFhp?=
 =?utf-8?B?eFJIOGN2eDVGdmhYNmd2citqcjZRWVlqQVFQWWpNUFJuRklVQVhGaG9STDNm?=
 =?utf-8?B?RWVsSFlPbTE0UGZ5TVkybnNoR3lBamhBY3VXUVZuUTkwRmxUT1d6dVZyRnQv?=
 =?utf-8?B?YVY1Y2x5bE83NWJ5TmxWT1cxL29hRlpnRDdiaGdHQ05UNDZGbmVrcmpvcHZ2?=
 =?utf-8?B?QWZ5aDVzY1pHRFNEVjJjbHVZbEtSb2ZIQUJIaHdsdGVrRmNVRi9XMkFqdlZR?=
 =?utf-8?B?Z3pxSEUrVndxL21TNjkwMDlzTVdvNlMrbk5UT1RGWVd0TWZaNGMvYVFlV04y?=
 =?utf-8?B?dm40d2FwMDZpOVhjN3EzNVBlc2k4QmZyVVc2MDFYOVQ1cjlaTEhaTWF4RmVM?=
 =?utf-8?B?Uk4rSXhyNnRwZTRIejNyWkgraUhHRi9BY1dXU05wdVRYekxuNEM1ejdEN3gv?=
 =?utf-8?B?RWkrOUNRKzE2SjZPSmxjSHVCSWJjcDJmT2JBR3ltY0hUN2t4RTFhWmFvdFlH?=
 =?utf-8?B?RTNldVIrUTJQR1R2cmxYRnoyVkQrbTFlMGpYMVNHcWZRdjFsanZLaGxUcitx?=
 =?utf-8?B?dmNGWDNGWk8xenl6c3lnZk91U1JwL3g0YjR2ek82eEtwSWk5RVdiM1JnZEd0?=
 =?utf-8?B?UUlRVW1IeS8rbko4N2ZHc0g1aksySkNyRWVUQnI3MHNkN09tVGExWVRZcmIw?=
 =?utf-8?B?YW5Vci90UGJhY2MyL2V3VkNFWG9xWUVQK1FKZDljS1BBU3FIOFByblVYK0Rn?=
 =?utf-8?B?N1JDT1hQZ1F0WjJOaFlaWUZEVERDNHlCYXNBSmROSU5zVGh1LzhZMnVsdWV2?=
 =?utf-8?B?QWJOVnJrUmtwVlMxTVpLVFpXSUdsRnVJNUFIRFEwUWkzZEVTb2lIWHg5VVlq?=
 =?utf-8?B?aGtpK3hHcTVKQ2U0RHZrRS9YTmtTNHU2bi9wNU4zcVFSZG42MlZOWloyeUV6?=
 =?utf-8?B?RWdYR05sVlM2a3pscTU5Y2xPT1hUMHlROWlTQS91TTc1R1VYNnJJVElMT3B6?=
 =?utf-8?B?ZHNTcTJ2TFVjNVl0LzJHUHYvVCtJZmo3N1ZOZmQ4dlRGeHZOTlVnUHllalVI?=
 =?utf-8?B?NGxrUlBHSVhtV3FzYldVQnNGb0I5VWVTdURyb2ViWmlqb0dsQmpzN3psOHda?=
 =?utf-8?B?T0pscy9sVHpvalN0bDBpODgvMVBpN3BaQVZsMmdMaWh4bEhjOU1Qc2YvUzhl?=
 =?utf-8?B?Vk5qQmZoK29ZV2hkSnRseUxKTUpvZmg5a0lxd2o3K2dSWDdOWG9sMkliZW9I?=
 =?utf-8?B?OURhdUdoUFVuUDNSL2JOaS81RmhOVS8rZVpsTnMwTFZuZ2Y0ZkRGd2ozcEpY?=
 =?utf-8?B?eVE2TkF4WlZRU0gySlZXWXNESE9YdStQQnBVc0NHcHc1cEpSWGxwdTVKckJj?=
 =?utf-8?B?bGNQNDh6ekV4K1hacmJqejdGa1BkZ0MrcytwYy9ZV3pPQUxUcjR1aXlOUkpx?=
 =?utf-8?B?ei94NW5ZbUlPaUZieGo2aDZJbkdLbGtaTkNvV1h3Y2NmVEJrN0dTOEFiUDN0?=
 =?utf-8?B?cFdFZi9UbkhhSmNCZG9yWFJKNDVDdmdEUnJEUmt4MDM4cGZ0dEgvNmVQY3dl?=
 =?utf-8?B?R2RIeWFwSzRHUW9HQWwvMUdxMEJxQnNUUVRJVk5tZ21JMXhCVGEzOGlvalVV?=
 =?utf-8?B?b0ZkSFc4dmhOaitGb3Jrc1ZyYzNtcll6NGRsVmQvaEJvY3V4c1gya1d4MDBk?=
 =?utf-8?B?dE1ObFQ5eDB2RUNDay81RzBYdzNJNjB1SHpFRis2NjlCUWkwUkdoVE5XSTRL?=
 =?utf-8?B?K2NKdmJKYkRCS29OZTRQSXg1VnFCb3ZCcVhmaFhONkdENGhhOHFWVEVaTDB4?=
 =?utf-8?Q?Ze3zPdfLrdCPaaZpxR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ad3af1-3659-4edb-6c73-08dee2187cf8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 02:26:33.8670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKtcKDjkexrqQro5UGGFTlp61qju2MEtQFpQZKLAfGXrB/XonLDGKTe97um8JACu0wkP9/CQDyvIokkzFNh3TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5938
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:COUNTER SUBSYSTEM" <linux-iio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 "open list:TI ENHANCED CAPTURE \(eCAP\) DRIVER" <linux-omap@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] counter: Remove redundant
	dev_err()/dev_err_probe()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joshua.crofts1@gmail.com,m:vigneshr@ti.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:jpanis@baylibre.com,m:david@lechnology.com,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:wbg@kernel.org,m:joshuacrofts1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ti.com,vger.kernel.org,gmail.com,baylibre.com,lechnology.com,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,vivo.com:from_mime,vivo.com:email,vivo.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEEC675A0BD


On Mon, 13 Jul 2026 22:12:00 +0800, Joshua Crofts wrote:

> On Mon, 13 Jul 2026 21:10:04 +0800
> Pan Chuang <panchuang@vivo.com> wrote:
>
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
>> automatically log detailed error messages on failure. Remove the
>> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> ---
> I think you can drop the commit hash and title from the message.
> Otherwise LGTM.
>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Will drop the commit hash/title in v2. Thanks for the review!

Best regards,

PanChuang

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
