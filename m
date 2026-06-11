Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EHguLE10KmpKpgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:39:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 492ED66FF04
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amd.com header.s=selector1 header.b=RAn9BM6a;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amd.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED80FC424DE;
	Thu, 11 Jun 2026 08:39:40 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010066.outbound.protection.outlook.com
 [40.93.198.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49828C424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2iyKkrXtafdg61YvMjO72GWjAIeax6hcfdHKwNdI66/m6JnUzVniHZOT7zpNiWppECVgn5XfiZrX8JBwsPpHfkmO3gFo+XE71fER/6dmsSyGkRmlkiKXvpolt6sZ9SqrFqd+YYP4BjHdZXOHqAocLrCw5BOV2RHs6G9NSuGt+EZNS5k9vySuerSiCmEBM88mP8IddCYns8nGY3o9C4x1vOktU+bGM9d3EpxQpXC7roD+vSdKrGfATN0dn0REo5Wlo89JtQhHT1Xh2vs3YvfHO5SbcL8cCOKBFfrAIhm9IM/tzPjvVlfE8BHYZVyuRzuzNnIxWDv3JOO816YtYYb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p58uwmBWqwTutDeQdxjhW3HoEXof2262loqjhbeHZSc=;
 b=cPA/iqk3yjaIC03BcQusFOw9ElbLHdJAO0eojxLUEcJ9eeWM3mVWGPJRcDCtyZdO2MEZ0owfasJHnESCxVhGjNkod/yxHWzYH9IIKnlr5W2t9NsGENrlUfyIglbW02KOa2PH3tAv4BtZ7GXBcRothWx9pkMgfwe33d1hY76jSJJebvI/bRVbC4aWabV+SUEv8Rlj3oaaTWf1vVTg+nkAs2gS7Nud9FIymLmB9dIwjLv8UU8T2x/cSxX/Nh50zvTKBnRzbsrVdnKiW6HkEBsCv8gS42RBcZNmUZrw7qHL3yQFkUMIOOsviBM3NpfhYLQHEhr8uxbMQLNZgCqpjC2ISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p58uwmBWqwTutDeQdxjhW3HoEXof2262loqjhbeHZSc=;
 b=RAn9BM6akuqKzVCas8e3toGMYNaDj3YYj2Diwia4zdLU0ZTW0hgRdEuD2Rln2tzAdzK6TqM03MX81XmsT/XNMaJN9giVsV0xcwL6gHF5DgMxGvhl7dnGaOjX16uFjdTj7JuSOnIyaP/wVPR286mKMDXe8BL44ZHuHTcc0dCXPNo=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:39:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Thu, 11 Jun 2026
 08:39:33 +0000
Message-ID: <96f9390b-a547-442f-b0a9-99a5ba52c0e1@amd.com>
Date: Thu, 11 Jun 2026 10:39:14 +0200
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
 <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
 <ail8iNvPrJnE7p58@ashevche-desk.local>
 <92683537-8404-47fe-a4ba-160e54870f0b@amd.com>
 <aipx1goKIsk40vrF@ashevche-desk.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aipx1goKIsk40vrF@ashevche-desk.local>
X-ClientProxiedBy: MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: f61aad89-bda3-424e-fa1a-08dec794f600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|7416014|376014|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: EdsaysT4Kc5L+PRmorX9IMzuc338sYsjA0AT/Em4Qcs4KwAMY3mFxqA/E+qMH8k9EeJAz5r/FxAj7mQtXoPez6gztdQEv7dCSRbAduVLjQS7PUYxQ5FWrPuR8pGoJyplKPxg4OUSebvdszbqKh9e3Sc8e2w+AtopU6sSlvBsx5e063g/tSZERR/tflIgBlzVHo0883zuzSyhLbAtLv5KRjhtDT7HRhEO3YrSfUItAha5KN1anW7UocbcOKO0lRahnj3X81awV33ECvzzPXZ81WoQMFt+vHpTUmxy0qMepJHgVlR7zoRXfbShigU11qdbveIICiF3wSBo3DTpWYyy8GNSC44oGUTnpdcOjzs1Dxhx8pe9ncaZm3G0vGy5e8aahXxBy44Y+Odmbhkn2eaapJQuXocSl/YjBmgSo2ZVCOZkwtGpsK8U+0I9kgtbNeNtmrPSCTuWrCpiPEzHSvN5wRRCFg4u8JekUbv47ZGsboXa8L7CygS7b9mbqfY5lmXmpkAQXTurnTgQlmnP2RZbd1comB65H0VZqvhYoLHrT0W8x5aCEEsaSeLIMNyJ8NQq2LOVQplfCIQyxpeRBkNnwzROoydWVduhma1uQzTjNylAeMs0YUSpYos3e1T7Gk7Bhl7Ttfp1RzQNrUUeb5YysAYVN8S+8odXVK/YgLjAceriTRL2zGV9eY/3f/RAA2VAQ9X3jotBGIHHGj7gP/nESA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJMOTZLcjkzbFFzYjh2QWhLZWQ0Q1MzdEZxUXloOVZYamFqQWw2b1dkS3J0?=
 =?utf-8?B?b1ljYkFPY3RiZXBOMXBUWDduaUxlS2JQblNjbTZ2bzQrSk5SZkhEK3o0Sjgz?=
 =?utf-8?B?akxjUkN3eE5aK1VMZUYvVkJ5bHMrZGN2VWJKQ2FEM2lPc0hLSTQ4SWh0RGNE?=
 =?utf-8?B?NFF1ME0rK2pPS1FQaFQvb29iNE94K2xTclFpOWx3UE93QkpoRXNYUGNtaUli?=
 =?utf-8?B?TmpZbCtQYVY1SnQyd0xLSkUvT2VvaTgyTkE3NU5wSnFrTitWRDdKWUw4eG1k?=
 =?utf-8?B?L3FXMU1TVXNWK1A5T21UMkJ0NG1CM2U5SWZCblhLRDVaWldSbFFDenF6UmtI?=
 =?utf-8?B?SGNSTFc5SnVuZ29Nb1JkNGZrQ243TWhoSHVjVVh0dVgwdXYzZzdVNzdMclVS?=
 =?utf-8?B?MC94MHZZWjg0dGNEZTI0ZExKb0FQNzNNM0NnSmcyRFNrTmNKc3MvMzdMYkQr?=
 =?utf-8?B?d3RmbkllbmMrWklzdmFGR2F0dXRXandyZ2lQUGFOQUNYN1llQmZiU3UwNytt?=
 =?utf-8?B?T2lIeENFYllHNHBwSE5nUmorempyUGJrZ3BYQVlsVS95VHlxM0h4TFErNUxM?=
 =?utf-8?B?Y3dHVThPNkJPU01YTkQ3dHNkVE1qbm1Lc0RUazBIRHo1akVzemZwdVc3VDFu?=
 =?utf-8?B?VjFSS1JaOW5WQW0vMW8zTXVTZEtrZFBBZW1MZHQrbThDOFV4NlE4eGNRZDVo?=
 =?utf-8?B?Y2UzRENYK2o0ZlB3K1E3cjFHK09HK3RnK1h1d3cxZkJ2UjZUdWxyRzVvZ09B?=
 =?utf-8?B?bzJHSHdrdEptcEFnSk9NWjM2Z0Vidkt4emdQNmRwUGlDd2dyZ2ZweXJyOFc1?=
 =?utf-8?B?QU14S05QamhrNkpDb1ZjVG5uM2xHN1VHMWxlV1I4WktBWDVrdGdUZFRNM015?=
 =?utf-8?B?alM4N1JpcWp6RkVBaWc4OG5saUJ5cTZuQmNVNUp4NjF5UHNjZVgxbE1UdzQ0?=
 =?utf-8?B?SXRIK3F1Y3RrdDg1UGZ3aDlDOGpRQmh1MGRQbjRjWVRQSE1iYTRFdCtZQkVw?=
 =?utf-8?B?SUNpbWJtRXhVU0dUSDdZRjNUSzEvMjE5am10K3I5eGxaUEtyb1laQ21oSGVD?=
 =?utf-8?B?bW5EN25pUEhsZ3pzcVdISXRGKzdOTm4wUXY1TUlaUzB5YkJBUXhoTVNjb1h6?=
 =?utf-8?B?cVQzZEpBZkIvd0RSSFF1Rnh3MzAvQzVTUHkxQnJkcDQ5VFRJcHVJZVB3NEtr?=
 =?utf-8?B?VWhJOGIxOGxsVHVVS2htSHlnT2RvRXRDSDRySHQzSUhCa05YYkFaVU5IVmJ0?=
 =?utf-8?B?MTIzeHF2L1ZvUzA4K2d0alUwLzZBTTU5bjFYc2U3QTRMb21iQTRMbXpyYUE3?=
 =?utf-8?B?SW8xcU0xczQ5UHhPZHZFbjJHSFM3dlZNQ0JIMXpKNDc3blFOeGtVT29SQmdT?=
 =?utf-8?B?d0o2WVB2dnBhZHM4aXI5cktjcXdvSnY0cTBndjJVcGF0bDJocTQ3TXNFelQw?=
 =?utf-8?B?RllMclJXN09NOGJ4cHNqTXFFaEhSRWRpZDI3V1lDU2NsTjdVQ0hzOWNYb3Nk?=
 =?utf-8?B?OXVWU3UwZ2xVWVFla0ZNZ1U4OHRxSWNsVXFDWTU5WURhaUh0SVB1QVVYNGF0?=
 =?utf-8?B?eTd0bzRkK3RKemxpbG5yOUYwNCsvbGQwY1VaYko2UEo0UW5oaEM0Y2JzZW1h?=
 =?utf-8?B?Vk9adkwzRDFGMEtKRzBWRWlWVUFxT2crdHhRZklKYlhSVTdPWHdYWEtWNDJW?=
 =?utf-8?B?ZEV5bnVycUhZbmVpQXVoeHJkR3hDbUNmZmxrZ1NDcDlMWlNSYm1lOUdKSExW?=
 =?utf-8?B?cUgwak42My92UUI4K2Y1OUJEMHN1K1l2N0V4QUY4SWpweDAvU1lZK0w0U0gv?=
 =?utf-8?B?T1I4enpXaUxTNDdaaXJTcDltWnVNQWlNaGNZYm52U1BwZmVZVXQxcjBTa0U1?=
 =?utf-8?B?K1RJWTZUYVB4UzQ5Zlp1bTh6OHVCd0RUbVFraHFOUkRpUTNZeDlPT20zUXFh?=
 =?utf-8?B?cnJYdEU5RDZkTU1EcWlyakVVaC9UT1lVZEZOMnRUb0oyRkRIUUhCSUhNSmRo?=
 =?utf-8?B?SXlpYWZ2WnFOR212empiNDQvc3JaTTIxUThvTk1NUmIzRHhzWUUrME1IL21Z?=
 =?utf-8?B?cDZqemlkVEdTS1hOM3ljZlhlVWVvb3IxczJ0SUhWbjdSWk1vOHJ3Y01ETHNJ?=
 =?utf-8?B?aHJzYW9HZWNjUURLZGwwanMyOC9nQnhYUlRvazU2RTlvdmlpb2QyVXhwTDVx?=
 =?utf-8?B?Z2dLaGRzS05PSVhJcGFPeDRNV3N0SnRETFpjblRhZWtjdDB2VmlGVC9qM1pZ?=
 =?utf-8?B?WS9ZTUdNRUliR3VOUTZWU2d4OWNXc3pLV1FCOGxXSnE0MDQ0VTFTb29HWCtJ?=
 =?utf-8?Q?Ga2py3ICtnjDm7hfn8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61aad89-bda3-424e-fa1a-08dec794f600
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:39:33.0985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VK4Vrg25u8GswaI7/GsPo8VSyT0xUCzzdqkM1rAR+DtrOx/dOOgNdb99UMjZ8CZX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kaito Cheng <chengkaitao@kylinos.cn>,
 Ingo Molnar <mingo@redhat.com>, Kaitao Cheng <kaitao.cheng@linux.dev>,
 Waiman Long <longman@redhat.com>, Philipp Reisner <philipp.reisner@linbit.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux1394-devel@lists.sourceforge.net,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Huang Rui <ray.huang@amd.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] list: Prepare entry iterators to
 cache cursor state
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:kaitao.cheng@linux.dev,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:ja
 ni.nikula@linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,amd.com:mid,amd.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 492ED66FF04

T24gNi8xMS8yNiAxMDoyOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFRodSwgSnVuIDEx
LCAyMDI2IGF0IDEwOjAxOjI1QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IE9u
IDYvMTAvMjYgMTc6MDIsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4+IE9uIFdlZCwgSnVuIDEw
LCAyMDI2IGF0IDExOjExOjM0QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4g
T24gNi8xMC8yNiAxMDoxOCwgS2FpdGFvIENoZW5nIHdyb3RlOgo+Pj4+PiDlnKggMjAyNi82LzEw
IDE2OjA3LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPiAKPiAuLi4KPiAKPj4+Pj4gU2hvdWxk
IHdlIHJldmVydCB0byB2MSwgb3Iga2VlcCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgYW5kCj4+Pj4+
IGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpIGFzIHRoZXkgYXJlLCBjbG9zZSB0aGlzIHRocmVh
ZCwgYW5kIG1ha2Ugbm8KPj4+Pj4gY2hhbmdlcz8KPj4+Pj4KPj4+Pj4gTGluayB0byB2MToKPj4+
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTI5MDgyMTQ5Ljc2NzY0LTEta2Fp
dGFvLmNoZW5nQGxpbnV4LmRldi8KPj4+Pj4KPj4+Pj4gT3IgZG8geW91IGhhdmUgYW55IGJldHRl
ciBzdWdnZXN0aW9ucz8KPj4+Pgo+Pj4+IHYxIGxvb2tzIHBlcmZlY3RseSByZWFzb25hYmxlIHRv
IG1lLgo+Pj4KPj4+IEJ1dCB3aHkgbm90IGp1c3QgaGlkaW5nIHRoYXQgb25jZSBmb3IgYWxsIChp
biBjYXNlIHRoZXkgZG9uJ3QgdXNlIHRoZSB0ZW1wb3JhcnkKPj4+IGl0ZXJhdG9yKT8gRWFzeSB0
byBhdXRvbWF0ZSwgcm9idXN0IOKAlCBldmVyeW9uZSBpcyBoYXBweT8KPj4KPj4gQXMgZmFyIGFz
IEkgY2FuIHNlZSB0aGF0IGlzIGFuIGV4dHJlbWVseSBiYWQgaWRlYS4KPj4KPj4gVGhlIGRpc3Rp
bmN0aW9uIGJldHdlZW4gdGhlIHVzZSBjYXNlcyBvZiAnaXRlcmF0aW5nIHRoZSBsaXN0JyBhbmQg
J2l0ZXJhdGluZwo+PiB0aGUgbGlzdCB3aGlsZSB5b3UgbW9kaWZ5IGl0JyBpcyBjb21wbGV0ZWx5
IGludGVudGlvbmFsLgo+IAo+IFdoYXQgSSBtZWFudCBpcyB0byBrZWVwIHRoZSBuYW1lLCBqdXN0
IGRyb3AgdGhlIHBhcmFtZXRlciAobWFrZSBpdCBoaWRkZW4gYW5kCj4gYmVpbmcgZGVmaW5lZCBp
bnNpZGUgbGlzdF9mb3JfZWFjaF8qX3NhZmUoKSBjYXNlcykuCgpBaCwgc29ycnkgSSB3YXMgc3Rp
bGwgdGhpbmtpbmcgdGhlIHN1Z2dlc3Rpb24gaXMgdG8gbWVyZ2UgbGlzdF9mb3JfZWFjaF9lbnRy
eSgpIGFuZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoKS4KCklmIHRoZSBtb2RpZmljYXRpb24g
aXMgZG9uZSBhbGwgYXQgb25jZSBvciBpbiBzdGVwcyBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgZm9y
IG1lIGFzIGxvbmcgYXMgdGhlIHBhdGNoIGNhbiBiZSByZS1jcmVhdGVkIHJlcHJvZHVjaWJsZS4K
CkJ1dCBJJ20gd29uZGVyaW5nIGlmIHdlIGNvdWxkbid0IGltcHJvdmUgdGhlIG5hbWUgYXQgdGhl
IHNhbWUgdGltZS4gVGhlIF9zYWZlKCkgcG9zdGZpeCBoYXMgY2F1c2VkIHRvbnMgb2YgY29uZnVz
aW9uIHdoZXJlIGVzcGVjaWFsbHkgYmVnaW5uZXJzIHRob3VnaHQgdGhhdCBpdCBpcyBhIHRocmVh
ZC1zYWZlIHZhcmlhbnQsIHdoaWNoIGl0IGNsZWFybHkgaXNuJ3QuCgpUaGUgX211dGFibGUoKSBw
b3N0Zml4IHNvdW5kcyBsaWtlIGEgbXVjaCBiZXR0ZXIgZGVzY3JpcHRpb24gdG8gd2hhdCBoYXBw
ZW5zIGhlcmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+IAo+PiBTZWUgdGhlIGJvb2wgdHlwZSBj
YW4gYmUgaW1wbGVtZW50ZWQgYnkgaW50IGFzIHdlbGwsIGJ1dCBpdCBpcyBqdXN0IGEKPj4gZGlm
ZmVyZW50IHVzZSBjYXNlLgo+IAo+Pj4+IFlvdSBzaG91bGQganVzdCBpbmNsdWRlIHNvbWUgcGF0
Y2hlcyBpbiB0aGUgc2FtZSBwYXRjaCBzZXQgdG8gYWN0dWFsbHkgdXNlCj4+Pj4gdGhlIG5ldyBt
YWNyb3MuCj4+Pj4KPj4+PiBJZiB5b3UgbW9kaWZ5IHRoZSBmaWxlcyB1bmRlciBkcml2ZXJzL2Rt
YS1idWYgb3IgZHJpdmVycy9ncHUvZHJtL2FtZCB0byB1c2UKPj4+PiB0aGUgbmV3IG1hY3JvIEkn
bSBoYXBweSB0byByZXZpZXcgdGhhdC4KPj4+Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
