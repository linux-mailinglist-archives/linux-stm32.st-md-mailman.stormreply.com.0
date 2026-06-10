Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xUrmKF8qKWpoRwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 11:11:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 304EA667AF2
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 11:11:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amd.com header.s=selector1 header.b=LS1aaYZP;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amd.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC7E2C5A4C5;
	Wed, 10 Jun 2026 09:11:58 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB65CC58D7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 09:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLsTWKvOrqNoL5y9vG4BglC5zhVKYY5h48A7r8DKwqouom2PAPCsR8dVUwPuWWjTIXQ+rR+Y39eZy0vH/eH4Qv/lcJVIdbg2Ys++yYssZyfzXKbfYsgSgqKuBwoDqLNldlBFeHSitP5j+5z2bFj6iAOgHdz/UhxDR3fAl0Q5o7l8o/kaHG/qu9RoGjMxQPvo3xB6UwQqHeHwS9GIZcehwHclZIpPwCBs8LxYBKCDZYKr5lehF0FXrU/0aRSenZN6Y1zQQoCCS9YcptXBfEisoZm3l4C/bP5p5B0a8kHvFh9fyk8D+Qant1URttIvpwEjVVLNeJAEjaWJ7KTHFqK04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQ+OE8QIAEvordwq9Eu9KduXF7SvGCeNdQFbFKcTS00=;
 b=wcRibGEguqE2bE7UWKzySrTCEBso+kwKN1+W1GZq2EQaQHT/j4u1xOExJhikVdZXlvo6HNeGpbuO+VE9XQ56EyTZBwKck5aNKYNFnaiWCsUqmwbFup4rrWMT33fHKmaT97Oi6nPEYWysY27QUJYeXxUyPPvR3bogoJG9jII/Re6DHAYDCbXsQrst5n8rScy3ntXy7cqe+lyuLjvd4H6mOn40l7kvQUPC/FazuymAe6yoT8b2xO78aULg5Iv533njULkobE67TE9dAlYKjCOU1l2EbwEfaG+2F6ZIvOv3gvo7+qBwE7nuR3Pw2XyfoZKfih2R9bWbSO+7yiUiFalCew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQ+OE8QIAEvordwq9Eu9KduXF7SvGCeNdQFbFKcTS00=;
 b=LS1aaYZPLyJN1jVGavcWqfLUftprSIQw/07AGkLkBUG0UWQBe9QqfwZxWOEYj4VFh64DyrnQJYH0xIALiwgW/puLyrDEoorDHljrSDr0ymc3cYWk4FSAVMCX/9qWXrDdk8iCY/00P49M5AUe2MTWAOyBUY1Iq2GGPEktW5kxtFU=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 09:11:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Wed, 10 Jun 2026
 09:11:51 +0000
Message-ID: <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
Date: Wed, 10 Jun 2026 11:11:34 +0200
User-Agent: Mozilla Thunderbird
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7464e8d5-7c24-4f24-2866-08dec6d04ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|11063799006|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1htKofcJEs3WQFHVpqi/ZmKoxqDUWoziML8B50OQPmpkEjon74KxOB4u+OnvZqitJp3H3n59XEPQXs2ZM4rK2Cs9/Ou7Ts7zj8RPb+qk9qPCE/NwXunHVvwUQiyqyePQ65c9iaUNAAQo7eHgiLuOTtQw2H5ZJXeZXOxx6nr0fe3xuSuA5WIbHeU2MNT8I/ulSp23QMEgjoaSmAlKN2Ng1IXF04RdL/vJgQll0jWEgJUi/o9Me5pxFZxh32wZpQGuzskmyLR5HkeNbjki0A+VlpiqpS+SWNaQnrPd9nOy0zlCn1sNrbtVKSRps52Z8qwUjW3kX841RiI5iCa4+z2na3c9fsjOo0pEcazTH1A/2NtmDXYn+CCqV+mmlL4hUWfUfchpGcHERGgTqKWjLR0vSUWQhqxTuRKGlNNaL/r3Z/eU/6w7ctm28LMvqNedaFsls0VSmuNBDoBZZfPFXGxvihQkIMzL9LR9HZz+omUTgGaG3RH2QyuBsNEeHgs8ex5VN/lyz6QaxSmhBdgD7FvpJ/Kyygo0tUrSneiSOsh1wNaCMMOgsRrhlngP0fIeEF0fA6Xv3GIX3QMVLRUNFhBk83t8fHi22FaSFf8EQfRiIRdZhYZKDzGYqi8pfhxH19Z6LhOQ5adR6YyVHzYys3HMORl3YOwwW9+M45e9KZqFZkv7twfLSeTk6iq2XaSLgMOMEbslKgBFRuPYKVznmbYbtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVwSGRWQ2NlUmhwb3dVN2M3RjV3SVlsSXRoa3Y2VVVyQWwxaWU0MmhsVTFI?=
 =?utf-8?B?czI5UTFiM29IOEhIOTUxVVpoQjRqbGVMSGV4dWRHNFJZOW9EVG5YczdsbkEw?=
 =?utf-8?B?cVExRk9CZG92emlEM0dLaGRLeDNvazZQclVoSVQ1S25XUWJYVExiVnJabHM5?=
 =?utf-8?B?OFFEdkZmaVFTUnE3enh1aWM0czVlRitQZ0U1c3dDQzdkWXdwUmswRGNzV2th?=
 =?utf-8?B?c0h3RXF5VzlISVk0dW84WGY1Q3ZWTUpKaXhRN0JqMDZzSWFNQ0F5cXpjd0Fm?=
 =?utf-8?B?cDJTb0d2cklGUXJ5UjcxMkVHUWlyRGxZTGlvNjJCZ0xxcVpST0h5bGdFRDY3?=
 =?utf-8?B?Q25mQnpZMDZlVi9LZktkWlkxZmNKNHpuK1F5NzExYjIzUEErNFFFYTBDekpS?=
 =?utf-8?B?aVltbGJyemoyTS8wOVB3dElwUVIwamhJWDR5VUtQeFdoMUtNYXFvVU4ra0Nt?=
 =?utf-8?B?cHJieDJUT3F3NUduSnlyb0dpdFFLTHRaYktmTmlZZ0xEZC9jc21ZU2VEaFNM?=
 =?utf-8?B?ZXBPbHd4TVB0TjA4NVVxVU1hN3Bpem1XUWREQXBoL0tQc1hUVmpOTW9oVTgx?=
 =?utf-8?B?RnIycUtLMTVuRExEYTRFYVZsbVRmRXBzYTRDUFJGMTNnblJYNU9xSDJ0TlhL?=
 =?utf-8?B?YndaVStabGwyRGVzeEZsWG4vUTBDekJ3VjMwdkd2ejV3aUladjlFK0srWXNS?=
 =?utf-8?B?YmVNZmxPd01lVGFLNDhpbFdCZ245bVgyUXJVYnIyR1I5a01lN3dPSmhYbjgr?=
 =?utf-8?B?RUFwNW5XQWNuWnJrYUtKMFEzMFdkZWswdXlIanAwZG5YUzRZWUFiVnMwZDJC?=
 =?utf-8?B?K0dJeGtVdjc0TkhGc0NEU0t3OTVqbWI1azB2eUZZT2prMXM1ZzhqUHR5S0tE?=
 =?utf-8?B?QW5IMWcrUG9weGE4SUJwR0UzMWJocHZreEpwaGJjdThLUExWT0pEYmtpRitl?=
 =?utf-8?B?VXNtQUROUWx2YTVlNFVnRStjVEdsbEtlQTB4Z2FyT2NHcUlWUVE0b2hBTU5O?=
 =?utf-8?B?QWFBZ2EwNDMzRzRGZjF6NEltSU5NcTFyRmFieUF5ZW0rZWRmaHF1U3htNGFT?=
 =?utf-8?B?Qm44cDY0cWFLTVhpK3d2MXlQNzNTNW5EK2liUU02cE93YlpzTVFocDJUei85?=
 =?utf-8?B?Qk1YVnpEVkxyalpoNU1mQnZ5aCtrZFFaUHlQZDRQRVNwMXZpRXVYOUhNMzJK?=
 =?utf-8?B?Qno3MnhwWjFWYXRYNTQ0dUwyMmJCQk10dU5yenQrRXJxRHprcWRaMzZtc3Fs?=
 =?utf-8?B?NStjVlRUNndrS1lrZnNzOEUyckxGUEJTcG9jR2FYVy82UThsYW9MU3V1MXIx?=
 =?utf-8?B?RTdlNHRSMUlyZTBzZXVFSlp0SGF3TmFDWDM4L3J3Ukk4OURQZ1pPOWphNngx?=
 =?utf-8?B?LzVjN0FvWXByTU82WlhYN3B1Ynl6S2NmTUovNGhQMlBEbEo3RVJacFVIUXhE?=
 =?utf-8?B?MGYyV0lCQTBZd2J1VHYwYmJ4V2hiVlpkWGZXVlQrUVZlZEtRa1J6U0h0d00y?=
 =?utf-8?B?V0tLbXhOcTRpNVFXdnZ0QlZ0ZFlRdzVodmNERlJ4Sm5mdkdOclNJTXdRVWR6?=
 =?utf-8?B?eStsdStTQTI2dS9nSCthUVNLYXpacjJXdHQ0UnRuZU1ZZzJXeG9hT3NXeDBM?=
 =?utf-8?B?RjI5dTRXUnN5QkdYQTJ1Q1RQNHNvSUFLWWpSaWppOTBrQjQ3WGgxMnBWSC9G?=
 =?utf-8?B?L0NwOURhSDNGbXVzUHhBb0F4dkZ2SjI1VzdLWXM0Rnd0U3lVdFBmWGpIVHYw?=
 =?utf-8?B?YTZNUjJEUE4xUGdhU2hZYTY0NWtrajNmOEdYL2Zya0dmQWVOL0pRanJyVHpO?=
 =?utf-8?B?N1pUWjFaNWRsU3RxOUh5Tis5K0pTa3NUY2g0TEJndmQyNUttTUt1R3ZzTmFK?=
 =?utf-8?B?NlJjaWM4bTNnTGlUc3pLRk41VkJMcEY1UjdtMHdYZmpuQTZlZURxYU82akVQ?=
 =?utf-8?B?ZXFSQ1ozZmd1MGJFQVJxOEJaeXJLSHVNUGV0T2xuaFJZOG4wWXB2bVkzdC94?=
 =?utf-8?B?dFZvbHlTYjhIdXBPc3UxWFVua1BSSzZWTGg0WnIrQUo5U3NCN3hoYkdJSWU1?=
 =?utf-8?B?MUtOVzNraUR4M0dXTTlUeGl5ZXZuRjhLV0IySi9PUldIc29GR1NvMU51N3lW?=
 =?utf-8?B?bkJWUDliK1JQLzZxOUNGb3NOaFdPeGJxL0kzMmFacEpFMkV3SUZ4OHM2cml1?=
 =?utf-8?B?SkpsNXVBSm04NStnNDRCNmdOZ3V0WmVBTlBxTnZ0RnRRRy9RMW96MThiaERL?=
 =?utf-8?B?cytjMnY5ZUZ4QncxMmJiZ2lXaFRUUEd2R2NDaEQvK29tUm00MVIwWTAyTlp6?=
 =?utf-8?Q?r++g69Ih9P6IalPmUj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464e8d5-7c24-4f24-2866-08dec6d04ee4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:11:51.3845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2pS5uzv20sPGWEIj7DuFxfVi8xT8GgRzfTSwjQsp7tXU+0BXMaezMEMi/BXG3es
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
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
 Ingo Molnar <mingo@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
 Waiman Long <longman@redhat.com>, Philipp Reisner <philipp.reisner@linbit.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Brost <matthew.brost@intel.com>,
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
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:ja
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:from_mime,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 304EA667AF2

CgpPbiA2LzEwLzI2IDEwOjE4LCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjYv
Ni8xMCAxNjowNywgQ2hyaXN0aWFuIEvDtm5pZyDlhpnpgZM6Cj4+IE9uIDYvMTAvMjYgMDg6MTQs
IEthaXRhbyBDaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI2LzYvOSAxODozMywgQ2hyaXN0aWFuIEvD
tm5pZyDlhpnpgZM6Cj4+Pj4gT24gNi85LzI2IDA4OjEzLCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4+
Pj4+IEZyb206IEthaXRvIENoZW5nIDxjaGVuZ2thaXRhb0BreWxpbm9zLmNuPgo+Pj4+Pgo+Pj4+
PiBUaGlzIHNlcmllcyBwcmVwYXJlcyBmb3IsIGFuZCB0aGVuIHVwZGF0ZXMsIHRoZSBsaXN0X2Zv
cl9lYWNoX2VudHJ5KCkKPj4+Pj4gZmFtaWx5IHNvIHRoZSBjb21tb24gZW50cnkgaXRlcmF0b3Jz
IGNhY2hlIHRoZWlyIG5leHQgb3IgcHJldmlvdXMgY3Vyc29yCj4+Pj4+IGJlZm9yZSB0aGUgbG9v
cCBib2R5IHJ1bnMuCj4+Pj4KPj4+PiBXaHkgaW4gdGhlIHdvcmxkIHdvdWxkIHdlIHdhbnQgdG8g
ZG8gdGhhdD8KPj4+Pgo+Pj4+IFRoZSBzYWZlIGFuZCBub24tc2FmZSB2YXJpYW50cyBoYXZlIHZl
cnkgZGlzdGluY3QgdXNlIGNhc2VzIGFuZCB0aGF0IGlzIGNvbXBsZXRlbHkgaW50ZW50aW9uYWwu
Cj4+Pj4KPj4+PiBXaGF0IHdlIGNvdWxkIGltcHJvdmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRp
b24sIGZyb20gbXkgZXhwZXJpZW5jZSBhbiBhc3RvbmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVv
cGxlIGhhdmUgbWlzY29uY2VwdGlvbnMgYWJvdXQgdGhlIHNhZmUgdmFyaWFudHMuCj4+Pj4KPj4+
Pj4gVGhlIGZpcnN0IDEzIHBhdGNoZXMgb3Blbi1jb2RlIGxvb3BzIHRoYXQgaW50ZW50aW9uYWxs
eSBkZXBlbmQgb24gdGhlCj4+Pj4+IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhl
IGN1cnJlbnQgY3Vyc29yIGF0IHRoZSBlbmQgb2YgdGhlCj4+Pj4+IGl0ZXJhdGlvbiIgYmVoYXZp
b3VyLiAgVGhlc2UgbG9vcHMgYXBwZW5kIHdvcmsgdG8gdGhlIGxpc3QgYmVpbmcgd2Fsa2VkLAo+
Pj4+PiByZXN0YXJ0IHRyYXZlcnNhbCBhZnRlciBkcm9wcGluZyBhIGxvY2ssIHNraXAgYW4gZW50
cnkgY29uc3VtZWQgYnkgdGhlCj4+Pj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndpc2Ug
YWRqdXN0IHRoZSBjdXJzb3IgaW4gdGhlIGxvb3AgYm9keS4KPj4+Pgo+Pj4+IFdlbGwgSSBoYXZl
IHRvIGNsZWFybHkgcmVqZWN0IHRoZSBjaGFuZ2VzIGZvciBzdWJzeXN0ZW1zL2NvbXBvbmVudHMg
SSdtIG1haW50YWluaW5nLCB0aGF0IGp1c3QgbG9va3MgaG9ycmlibGUgdG8gbWUgYW5kIEkgY2xl
YXJseSBkb24ndCBzZWUgYSBnb29kIHJlYXNvbiBmb3IgdGhhdC4KPj4+Cj4+PiBIaSBDaHJpc3Rp
YW4gYW5kIEFuZHkgU2hldmNoZW5rbywKPj4+Cj4+PiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2su
IEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSBwb2ludCB5b3UgcmFpc2VkLgo+Pj4KPj4+IFRo
ZSByZWFzb24gSSBzdGFydGVkIGxvb2tpbmcgYXQgdGhpcyBpcyB0aGUgb3JpZ2luYWwgbW90aXZh
dGlvbiBiZWhpbmQKPj4+IHRoZSBfc2FmZSgpIHZhcmlhbnRzLiAgVGhleSBleGlzdCBiZWNhdXNl
IHNvbWUgdXNlcnMgbmVlZCB0byByZW1vdmUsIG1vdmUKPj4+IG9yIG90aGVyd2lzZSBjb25zdW1l
IHRoZSBjdXJyZW50IGVudHJ5IHdoaWxlIHdhbGtpbmcgdGhlIGxpc3QuICBJbiB0aGF0Cj4+PiBj
YXNlIHRoZSBuZXh0IGN1cnNvciBoYXMgdG8gYmUgcHJlc2VydmVkIGJlZm9yZSB0aGUgbG9vcCBi
b2R5IGNhbiBtb2RpZnkKPj4+IHRoZSBjdXJyZW50IGVudHJ5Lgo+Pj4KPj4+IFRoZSB1bmZvcnR1
bmF0ZSBwYXJ0IGlzIHRoYXQgdGhpcyBjb3VsZCBub3QgYmUgZXhwcmVzc2VkIHdpdGggdGhlCj4+
PiBleGlzdGluZyBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgaW50ZXJmYWNlIHdpdGhvdXQgY2hhbmdp
bmcgaXRzIGNhbGxpbmcKPj4+IGNvbnZlbnRpb24uICBUaGUgX3NhZmUoKSB2YXJpYW50cyBoYWQg
dG8gZ3JvdyBhbiBleHRyYSBhcmd1bWVudCBmb3IgdGhlCj4+PiB0ZW1wb3JhcnkgY3Vyc29yLCBh
bmQgdGhhdCBpcyB3aHkgd2UgZW5kZWQgdXAgd2l0aCBhIHNlcGFyYXRlIGZhbWlseSBvZgo+Pj4g
bWFjcm9zLgo+Pj4KPj4+IEJ1dCBjb25jZXB0dWFsbHksIHRoZSBkaXN0aW5jdGlvbiBkb2VzIG5v
dCBoYXZlIHRvIGJlIGV4cG9zZWQgYXMgdHdvCj4+PiBkaWZmZXJlbnQgaXRlcmF0b3IgZmFtaWxp
ZXMgZm9yZXZlci4gIFRoZSBkaWZmZXJlbmNlIGlzIGFuIGltcGxlbWVudGF0aW9uCj4+PiBkZXRh
aWw6IHdoZXRoZXIgdGhlIGl0ZXJhdG9yIGtlZXBzIHRoZSBuZXh0L3ByZXZpb3VzIGN1cnNvciBi
ZWZvcmUgdGhlCj4+PiBib2R5IHJ1bnMuICBUaGlzIHNlcmllcyBtYWtlcyB0aGUgY29tbW9uIGxp
c3RfZm9yX2VhY2hfZW50cnkoKSBpdGVyYXRvcnMKPj4+IGRvIHRoYXQgaW50ZXJuYWxseSwgc28g
dGhlIHNhZmUgYW5kIG5vbi1zYWZlIGZvcm1zIGNhbiBlZmZlY3RpdmVseSBiZQo+Pj4gZm9sZGVk
IHRvZ2V0aGVyLCBvciBhdCBsZWFzdCB0aGUgbmVlZCBmb3IgYSBzZXBhcmF0ZSBwdWJsaWMgX3Nh
ZmUoKQo+Pj4gaW50ZXJmYWNlIGJlY29tZXMgbXVjaCB3ZWFrZXIuCj4+Pgo+Pj4gVGhlcmUgaXMg
YWxzbyBhIHVzYWJpbGl0eSBpc3N1ZSB3aXRoIHRoZSBjdXJyZW50IF9zYWZlKCkgaW50ZXJmYWNl
LiAgVGhlCj4+PiBjYWxsZXIgaXMgZm9yY2VkIHRvIGRlZmluZSBhIHRlbXBvcmFyeSBjdXJzb3Ig
b3V0c2lkZSB0aGUgbWFjcm8gYW5kIHBhc3MKPj4+IGl0IGluLCBldmVuIHRob3VnaCBhbG1vc3Qg
YWxsIHVzZXJzIG5ldmVyIHVzZSB0aGF0IGN1cnNvciBkaXJlY3RseS4gIEl0IGlzCj4+PiBqdXN0
IGJvaWxlcnBsYXRlIHJlcXVpcmVkIGJ5IHRoZSBtYWNybyBpbXBsZW1lbnRhdGlvbi4gIEkgZmlu
ZCB0aGF0Cj4+PiByZWR1bmRhbnQgYW5kIGF3a3dhcmQ6IHRoZSB0ZW1wb3JhcnkgY3Vyc29yIGlz
IGFuIGludGVybmFsIGRldGFpbCBvZiB0aGUKPj4+IGl0ZXJhdGlvbiwgYnV0IGV2ZXJ5IGNhbGxl
ciBoYXMgdG8gc3BlbGwgaXQgb3V0Lgo+Pj4KPj4+IFdpdGggdGhlIHVwZGF0ZWQgbGlzdF9mb3Jf
ZWFjaF9lbnRyeSgpIGltcGxlbWVudGF0aW9uLCB0aGF0IGV4dHJhIGN1cnNvcgo+Pj4gY2FuIGJl
IGtlcHQgaW5zaWRlIHRoZSBpdGVyYXRvciBpdHNlbGYuICBDYWxsZXJzIHRoYXQgb25seSB3YW50
IHRvIHdhbGsKPj4+IHRoZSBsaXN0LCBpbmNsdWRpbmcgY2FsbGVycyB0aGF0IGRlbGV0ZSBvciBj
b25zdW1lIHRoZSBjdXJyZW50IGVudHJ5LCBubwo+Pj4gbG9uZ2VyIG5lZWQgdG8gY2FycnkgYW4g
b3RoZXJ3aXNlLXVudXNlZCB0ZW1wb3JhcnkgdmFyaWFibGUganVzdCB0byBtYWtlCj4+PiB0aGUg
bWFjcm8gd29yay4KPj4KPj4gV2VsbCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBsaXN0X2Zvcl9l
YWNoX2VudHJ5KCkgYW5kIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpIGlzICpub3QqIHRoZXJl
IGJlY2F1c2UgeW91IG5lZWQgYW4gZXh0cmEgdmFyaWFibGUgdG8gaG9sZCB0aGUgbmV4dCBwb2lu
dGVyLCBidXQgYmVjYXVzZSBqdXN0ICdpdGVyYXRpbmcgdGhlIGxpc3QnIGFuZCAnaXRlcmF0aW5n
IHRoZSBsaXN0IHdoaWxlIHlvdSBtb2RpZnkgaXQnIGFyZSB0d28gZGlzdGluY3QgdXNlIGNhc2Vz
Lgo+Pgo+PiBBcGFydCBmcm9tIHRoZSB0ZWNobmljYWwgaW1wbGljYXRpb25zIHRoaXMgYWxzbyBo
YXMgc29tZSBkb2N1bWVudGF0aW9uIHZhbHVlIGZvciB0aGUgY29kZSB1c2luZyBpdC4KPj4KPj4g
V2hhdCB3ZSBjb3VsZCBjb25zaWRlciB3aXRoIEM5OSBhdCBoYW5kIGlzIHRvIGhhdmUgX3NhZmUo
KSB2YXJpYW50cyB3aG8gdXNlcyBhIGxvY2FsIGhpZGRlbiB2YXJpYWJsZSB0byBob2xkIHRoZSBu
ZXh0IGVsZW1lbnQuCj4+Cj4+IE9yIG1heWJlIGNvbWUgdXAgd2l0aCBhIGJldHRlciBuYW1lIGlu
c3RlYWQgb2YgX3NhZmUoKSBiZWNhdXNlIHBlb3BsZSBzZWVtIHRvIG1pc3VuZGVyc3RhbmQgdGhh
dCBxdWl0ZSBvZnRlbi4KPj4KPj4gQnV0IG1hbmdsaW5nIHRoZSB0d28gdXNlIGNhc2VzIHRvZ2V0
aGVyIGp1c3QgYmVjYXVzZSBpdCBpcyBub3cgdGVjaG5pY2FsIHBvc3NpYmxlIGlzIGFtb25nIHRo
ZSB3b3JzdCBpZGVhcyBJJ3ZlIGV2ZXIgaGVhcmQuCj4+Cj4gCj4gU2hvdWxkIHdlIHJldmVydCB0
byB2MSwgb3Iga2VlcCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgYW5kCj4gbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKCkgYXMgdGhleSBhcmUsIGNsb3NlIHRoaXMgdGhyZWFkLCBhbmQgbWFrZSBubwo+
IGNoYW5nZXM/Cj4gCj4gTGluayB0byB2MToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNjA1MjkwODIxNDkuNzY3NjQtMS1rYWl0YW8uY2hlbmdAbGludXguZGV2Lwo+IAo+IE9yIGRv
IHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbnM/Cgp2MSBsb29rcyBwZXJmZWN0bHkgcmVh
c29uYWJsZSB0byBtZS4KCllvdSBzaG91bGQganVzdCBpbmNsdWRlIHNvbWUgcGF0Y2hlcyBpbiB0
aGUgc2FtZSBwYXRjaCBzZXQgdG8gYWN0dWFsbHkgdXNlIHRoZSBuZXcgbWFjcm9zLgoKSWYgeW91
IG1vZGlmeSB0aGUgZmlsZXMgdW5kZXIgZHJpdmVycy9kbWEtYnVmIG9yIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQgdG8gdXNlIHRoZSBuZXcgbWFjcm8gSSdtIGhhcHB5IHRvIHJldmlldyB0aGF0LgoKUmVn
YXJkcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
