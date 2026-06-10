Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GKLsFGkbKWoOQwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 10:08:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2D666F0D
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 10:08:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amd.com header.s=selector1 header.b=U0c85P2n;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amd.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84930C57A51;
	Wed, 10 Jun 2026 08:08:08 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E47FC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 08:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNkaqkOVFjhH21ZuywHUPXBUtjF8MTKcgGQkSuhllLLaApRDi3lHVndKNiVfs0FXM2M3qNGH+v2m0jV9beNhm1MXmKjNbxmiphDE5Wsn8puQenWoiUShigfkwILE8Ma/6law4RNI7356xTn7tAufJ2QZZY644CjIoUGlTnLVDS0Dr8CsjReulgC4G3P9gy/8uKWy4Ji65HrrQ3Oiozf3zB3WaLbuKAy7Pmervdcm6dbXpNFjD87xjcSIT79LH5fLwXiYSYLn0xdbvs++HP8fgihyW7HbbPWmBNPiiVDZHkX+Z8UGzNGOuii4tvMnJrJ/20wr+IhNpCGwHgUng+jHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbGKZZeqXl0I3jIvv4zrXT60WcWn3r0FjCw0D0clQE0=;
 b=sGXlPtLyvs4dX/m6eFTJZAvr/r4bPCXiE1M29MKB1vGdFYKDVr3g/jbyLqxLtnOzSB09XGrpQ6J8lAqaMbjwKOIbSGIdCsTD91X4BmegXpgDJK8/sIl10vfhZaPzO5xgivTE8weNYvw9gjrwt/Ck5TX5zQGwPNZY6hSFhA4I4lxvmokPeH37Y4lVCIp5/o3hYsu2IpNqXUY3z7mZlE+Fcuy/KDDQ/f2O+oe68+NxgDPtMTZiPe+H4i9I1Kv98O3pH8vRzAQvECyCucCf/QDVLkfMBqmJjaZKmusocBC6Fft0nFnF/hhfX+x1rybK1KNBnPodZdj8ZmuoqdpqJrPvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbGKZZeqXl0I3jIvv4zrXT60WcWn3r0FjCw0D0clQE0=;
 b=U0c85P2nyNZkhOVpCxmQJoVPTwz8wcKJn6VJZN9yOeHvYxEcBcUiJGpUHg0iDI6WXzYt82Uxnn/aWq2TaOPVPrdhlSUQDqkuKDYrrlMQELrQ3Bq/nq4M3xwDV12GiIR8h1DeuGz6rEQ9OdOMPL62tGfJiqvoWYNIAEEy4vjCLeY=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV9PR12MB9805.namprd12.prod.outlook.com (2603:10b6:408:2ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 08:08:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Wed, 10 Jun 2026
 08:08:03 +0000
Message-ID: <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
Date: Wed, 10 Jun 2026 10:07:48 +0200
User-Agent: Mozilla Thunderbird
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
X-ClientProxiedBy: BN0PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:408:e9::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV9PR12MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 85825337-3575-4d69-2f6c-08dec6c76501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|5023799004|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5wK+o6SmdROth+udKW36JmZvOpN+fjaHzQbrcYUJyNcEGhiRBssI2SJ0EaD1hNGYXzVREYz+h4BocGjaRx3o/UpjMzYNiBbfcdQw2sN0FzKSPmFdzJAZe2ErKl4F8mYNr+uckBTtzyhJUa+LhhuoJllvGeVpVdPlS6xYnkjIMMoOw88qhPRzsaTD0ALfQ2gb8pGt4gLcVDtf6KqBvEvEFxyhR5Pxn5lsQWq33cp3Jn97kcQJ2OVKyuaNrMhKB5UXwU4ujhhFLHaRbLwVDAJka9bUUgs49eI2seI0786oN26wnPYyKIFFpEkc1awUFIw/AYuV695XIhwo0UgqnmkFptj+GB8Zs4XUxxdZNbNXS9oGq4PtzZE+FSsnZNN/l4/5EUYIWmVVTHy+j+CTIWEjp2gw5s6hJfqh/q09YZdlMY8AYqVO6RDw2aqxC2ulR9rTHAUg3i31OYTvSelzs7GwhfMiTbGul2GmWFdWIHMsRqNlUlRQ9BcjbUL0dsTZH8cRAbORoStyxGuCRhbO06kkTo14ArelDqKVSSnzyVZosNB5awKMTJjYUkivv3e5KtE/L60J/2aI1wJ7LXosqJBT17uCUscx2YLqE2PCqeSqaAuKjmMsgHF6AlVJBByH5SOyvvcmps8zpc0wkf3h40PUMjsaUBq/l06WzyVOpt9A6KMZliU3ANc5HyxI2YmxSjzs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(5023799004)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpBd1o3RDg3bjVDOFprWEZEQmZqaVUweDBhbFArTkd4dGN1TWtkeEtaQXVO?=
 =?utf-8?B?NWpacm0xSW00em5DMVIzb2NxMUxKK3ZBQjRNUnY2WWNtcVlVNlkxd1IrcU1Y?=
 =?utf-8?B?bXdwa1duREZCdDNDQmhaTVkrZW5iMitTV2ljalZhK1k5OGZQZ3NtQ3I3Tktw?=
 =?utf-8?B?S3BxOERxaWdvMmFvVWxoMTZrOGVOQ3h4L2ZYVjUySWYxNVZOa0laMUxzbjhQ?=
 =?utf-8?B?ZnQ0T3VMeHRYYS9qdDQwcUJ5MTVrdUVLL2ZuVmFkZTVuYjlzd2ZGTmdtUzFm?=
 =?utf-8?B?Mm80SHBlUzhjbWg1Zm90eW9JM2F3TjRRajVkckdOaFhyaFNVdmpMM2YvU0RT?=
 =?utf-8?B?eFZGYk9Jc3hUaU9PcXAyUkV2dE43VDdYNGRmdFpnUG55VmZ0NDgwV2lPMlhM?=
 =?utf-8?B?aVQyYUo2Yk5MU1RZNGEzMk00WkJvYzBUbnRxTCt0YXo5Z3BXTHM3aGJsc2tH?=
 =?utf-8?B?T1AzZ3hyeTVBQ2VGOWxSOWs2WUd1MkZqdEF5eGtqZWUwYkQ5QUphZUU5VDBV?=
 =?utf-8?B?bjIvQU1QWU1TRlNnZm03OGRvYmJjZFE5d0RxRFpCRVczeXowZGwyaUNtbGpS?=
 =?utf-8?B?RU9xNG5Ga2pLWVNvcTVybEo2SjliRVhCdTEvOFRXcWV5TG9RVDdHWUplWnlJ?=
 =?utf-8?B?eFpqVnpmUTU5aVFyMnFwVUJKdW9BeWo1UjFKTzI5enF2TEo2MTNTNDhyY0Fx?=
 =?utf-8?B?QVFxbStDMW1NaE5EVGYybG91eDJKTU9wQ2h1Y3l4TVhqTER5N3VLcG8yOXgz?=
 =?utf-8?B?azBqRjlYMVJyLzdMNUovOGpLVGJLUkRJYTgyZmVoUEZtRnZnV3lSMDl5Q1RT?=
 =?utf-8?B?a014SEpDTG40cVdOY3Q0SW5kS3Eya2E4Vi9Oc1FLSHBSbFQ2TWRyMVNpdGFR?=
 =?utf-8?B?VUVsSVE1eFh4dFFicmVHelNWSDhFbUhGK3hFbDhSUFk1cW5SMDNsWW1LTDg0?=
 =?utf-8?B?MGR3MDc0TUE1RjM1aXRLODVGSjVKR1Y2V3QzdXVZd3lYUUhueWtBM0cxK0xM?=
 =?utf-8?B?OWFTc2kvN3B6VEtTN2VRTDI0SFV6TVcrM2loNEN3THdVMmpMTC96c2t1dnc0?=
 =?utf-8?B?WGF4WCtRMWNkS0xhUVFPMndvWHhDWVpnS1kwNDJWTTZlQ0Y4di94cUptV3ZE?=
 =?utf-8?B?YzNIcE5wL0ZrZjl5cEJiMjBVMXhkRjZSWUZMY0o1MnFUa0FtQjluQkQxTTVD?=
 =?utf-8?B?VVJSMng0UkMxc01hbDNxbEZvcVJrVmNKdUF4RitZNU1uVjR3KzJGZjNKYk5S?=
 =?utf-8?B?dVIrb3lFTkJyWFlmQmxqSFJmRzNlYnRKc2d6cUdKN1JDQTdLOW9Zc01GZEEw?=
 =?utf-8?B?WkJIcjFJbGM3UkV3SjFXM05XNS8yZEM5T3NsOE5KOFh3V3lWakJMbUlDajJn?=
 =?utf-8?B?dU9IWE05L2NQd213THRxV05SanR4L3pPQjUzbEgvN2Z0c09NV0JsOTNMbGt2?=
 =?utf-8?B?UEpsbTZNZmdURDcwR1ZRM2NPQTdSTW5mY0VDS2dBUTIrVG5WZFlqRTltTTlj?=
 =?utf-8?B?ZU11WmJZMjlvcWhPeXVEWklBQjZoaEVNUFVZbU5DcVlKcTJ1R05oVVNsRUht?=
 =?utf-8?B?RjBjL0oraHNyOUk4bmY0K1d5YThrRXB6M0trZ3JNTXFjNnF2eUd5RW9LZks3?=
 =?utf-8?B?V2lyRVkybEtJUXJ3ZVpyekYzT1B3dXBmMFFadFJOclhoN2dQNWxYWVJkb2Q5?=
 =?utf-8?B?Y2wxVS95U1BlL3RkLy9haE15NTlVUmdmckVOZmhxWW0xVEtrNkdjQktxVW1o?=
 =?utf-8?B?UWljT0xZUGtQYnJ3UkxKOUFaQ2ZlUjUydEJKcXJpeU45c1h5QmRZeWllZ0sx?=
 =?utf-8?B?N2EyS0lvOHEwVkpqRmYzcE1HVGppOHBrOWRCZjNnSkhHQUZJQ0MxRDJPN1hr?=
 =?utf-8?B?UngwVWhwWTlxS2pFeGpzclVQVlZMMmVMT0lycklYTGRhUTlteVc3MGNicUJ3?=
 =?utf-8?B?OUxqTU9IV2tySnVGQ2FKemx4cmUxa0U4M0EwODM3OHpSaG1HcnNKekRHTk1K?=
 =?utf-8?B?eVNCdUovS29vallVVHZLaTIrV0ZQc1FtZWZlMEtaZFhXODF4VnBuZGZZSGZL?=
 =?utf-8?B?ZEE2aHl4Yy8zVlBtTXhqMnRqcnM2YkhaQmxIVTRmNkRrMHF6K2pLV0Uxc3h0?=
 =?utf-8?B?ZENCR0JUVkRqeUVmOUx4VlYyaVdma0M4Y2lhOG5Qc3A5SVhrMVJJSEtSNFdz?=
 =?utf-8?B?cUhqTGdhalBNdjlubzkxK21IQWpnV3VpNTdtZzV4N1ZPTHNGN0tjWjlXZThW?=
 =?utf-8?B?MmtHVW0vbjdsSmx0MExDRUJaY2lBTC9Ob3g4aVhYdXExMi9iME1BUEJhR1NH?=
 =?utf-8?Q?gICrX7V/d0oA5xIALp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85825337-3575-4d69-2f6c-08dec6c76501
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:08:03.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1kD1DwgCZ8NV+dNiKiLTLuFtF7gCyir3WjITMUCRWSkOHA9QLpUHImJK7ekUjTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9805
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEE2D666F0D

T24gNi8xMC8yNiAwODoxNCwgS2FpdGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LzYvOSAxODoz
MywgQ2hyaXN0aWFuIEvDtm5pZyDlhpnpgZM6Cj4+IE9uIDYvOS8yNiAwODoxMywgS2FpdGFvIENo
ZW5nIHdyb3RlOgo+Pj4gRnJvbTogS2FpdG8gQ2hlbmcgPGNoZW5na2FpdGFvQGt5bGlub3MuY24+
Cj4+Pgo+Pj4gVGhpcyBzZXJpZXMgcHJlcGFyZXMgZm9yLCBhbmQgdGhlbiB1cGRhdGVzLCB0aGUg
bGlzdF9mb3JfZWFjaF9lbnRyeSgpCj4+PiBmYW1pbHkgc28gdGhlIGNvbW1vbiBlbnRyeSBpdGVy
YXRvcnMgY2FjaGUgdGhlaXIgbmV4dCBvciBwcmV2aW91cyBjdXJzb3IKPj4+IGJlZm9yZSB0aGUg
bG9vcCBib2R5IHJ1bnMuCj4+Cj4+IFdoeSBpbiB0aGUgd29ybGQgd291bGQgd2Ugd2FudCB0byBk
byB0aGF0Pwo+Pgo+PiBUaGUgc2FmZSBhbmQgbm9uLXNhZmUgdmFyaWFudHMgaGF2ZSB2ZXJ5IGRp
c3RpbmN0IHVzZSBjYXNlcyBhbmQgdGhhdCBpcyBjb21wbGV0ZWx5IGludGVudGlvbmFsLgo+Pgo+
PiBXaGF0IHdlIGNvdWxkIGltcHJvdmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRpb24sIGZyb20g
bXkgZXhwZXJpZW5jZSBhbiBhc3RvbmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVvcGxlIGhhdmUg
bWlzY29uY2VwdGlvbnMgYWJvdXQgdGhlIHNhZmUgdmFyaWFudHMuCj4+Cj4+PiBUaGUgZmlyc3Qg
MTMgcGF0Y2hlcyBvcGVuLWNvZGUgbG9vcHMgdGhhdCBpbnRlbnRpb25hbGx5IGRlcGVuZCBvbiB0
aGUKPj4+IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhlIGN1cnJlbnQgY3Vyc29y
IGF0IHRoZSBlbmQgb2YgdGhlCj4+PiBpdGVyYXRpb24iIGJlaGF2aW91ci4gIFRoZXNlIGxvb3Bz
IGFwcGVuZCB3b3JrIHRvIHRoZSBsaXN0IGJlaW5nIHdhbGtlZCwKPj4+IHJlc3RhcnQgdHJhdmVy
c2FsIGFmdGVyIGRyb3BwaW5nIGEgbG9jaywgc2tpcCBhbiBlbnRyeSBjb25zdW1lZCBieSB0aGUK
Pj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndpc2UgYWRqdXN0IHRoZSBjdXJzb3IgaW4g
dGhlIGxvb3AgYm9keS4KPj4KPj4gV2VsbCBJIGhhdmUgdG8gY2xlYXJseSByZWplY3QgdGhlIGNo
YW5nZXMgZm9yIHN1YnN5c3RlbXMvY29tcG9uZW50cyBJJ20gbWFpbnRhaW5pbmcsIHRoYXQganVz
dCBsb29rcyBob3JyaWJsZSB0byBtZSBhbmQgSSBjbGVhcmx5IGRvbid0IHNlZSBhIGdvb2QgcmVh
c29uIGZvciB0aGF0Lgo+IAo+IEhpIENocmlzdGlhbiBhbmQgQW5keSBTaGV2Y2hlbmtvLAo+IAo+
IFRoYW5rcyBmb3IgdGFraW5nIGEgbG9vay4gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhlIHBv
aW50IHlvdSByYWlzZWQuCj4gCj4gVGhlIHJlYXNvbiBJIHN0YXJ0ZWQgbG9va2luZyBhdCB0aGlz
IGlzIHRoZSBvcmlnaW5hbCBtb3RpdmF0aW9uIGJlaGluZAo+IHRoZSBfc2FmZSgpIHZhcmlhbnRz
LiAgVGhleSBleGlzdCBiZWNhdXNlIHNvbWUgdXNlcnMgbmVlZCB0byByZW1vdmUsIG1vdmUKPiBv
ciBvdGhlcndpc2UgY29uc3VtZSB0aGUgY3VycmVudCBlbnRyeSB3aGlsZSB3YWxraW5nIHRoZSBs
aXN0LiAgSW4gdGhhdAo+IGNhc2UgdGhlIG5leHQgY3Vyc29yIGhhcyB0byBiZSBwcmVzZXJ2ZWQg
YmVmb3JlIHRoZSBsb29wIGJvZHkgY2FuIG1vZGlmeQo+IHRoZSBjdXJyZW50IGVudHJ5Lgo+IAo+
IFRoZSB1bmZvcnR1bmF0ZSBwYXJ0IGlzIHRoYXQgdGhpcyBjb3VsZCBub3QgYmUgZXhwcmVzc2Vk
IHdpdGggdGhlCj4gZXhpc3RpbmcgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGludGVyZmFjZSB3aXRo
b3V0IGNoYW5naW5nIGl0cyBjYWxsaW5nCj4gY29udmVudGlvbi4gIFRoZSBfc2FmZSgpIHZhcmlh
bnRzIGhhZCB0byBncm93IGFuIGV4dHJhIGFyZ3VtZW50IGZvciB0aGUKPiB0ZW1wb3JhcnkgY3Vy
c29yLCBhbmQgdGhhdCBpcyB3aHkgd2UgZW5kZWQgdXAgd2l0aCBhIHNlcGFyYXRlIGZhbWlseSBv
Zgo+IG1hY3Jvcy4KPiAKPiBCdXQgY29uY2VwdHVhbGx5LCB0aGUgZGlzdGluY3Rpb24gZG9lcyBu
b3QgaGF2ZSB0byBiZSBleHBvc2VkIGFzIHR3bwo+IGRpZmZlcmVudCBpdGVyYXRvciBmYW1pbGll
cyBmb3JldmVyLiAgVGhlIGRpZmZlcmVuY2UgaXMgYW4gaW1wbGVtZW50YXRpb24KPiBkZXRhaWw6
IHdoZXRoZXIgdGhlIGl0ZXJhdG9yIGtlZXBzIHRoZSBuZXh0L3ByZXZpb3VzIGN1cnNvciBiZWZv
cmUgdGhlCj4gYm9keSBydW5zLiAgVGhpcyBzZXJpZXMgbWFrZXMgdGhlIGNvbW1vbiBsaXN0X2Zv
cl9lYWNoX2VudHJ5KCkgaXRlcmF0b3JzCj4gZG8gdGhhdCBpbnRlcm5hbGx5LCBzbyB0aGUgc2Fm
ZSBhbmQgbm9uLXNhZmUgZm9ybXMgY2FuIGVmZmVjdGl2ZWx5IGJlCj4gZm9sZGVkIHRvZ2V0aGVy
LCBvciBhdCBsZWFzdCB0aGUgbmVlZCBmb3IgYSBzZXBhcmF0ZSBwdWJsaWMgX3NhZmUoKQo+IGlu
dGVyZmFjZSBiZWNvbWVzIG11Y2ggd2Vha2VyLgo+IAo+IFRoZXJlIGlzIGFsc28gYSB1c2FiaWxp
dHkgaXNzdWUgd2l0aCB0aGUgY3VycmVudCBfc2FmZSgpIGludGVyZmFjZS4gIFRoZQo+IGNhbGxl
ciBpcyBmb3JjZWQgdG8gZGVmaW5lIGEgdGVtcG9yYXJ5IGN1cnNvciBvdXRzaWRlIHRoZSBtYWNy
byBhbmQgcGFzcwo+IGl0IGluLCBldmVuIHRob3VnaCBhbG1vc3QgYWxsIHVzZXJzIG5ldmVyIHVz
ZSB0aGF0IGN1cnNvciBkaXJlY3RseS4gIEl0IGlzCj4ganVzdCBib2lsZXJwbGF0ZSByZXF1aXJl
ZCBieSB0aGUgbWFjcm8gaW1wbGVtZW50YXRpb24uICBJIGZpbmQgdGhhdAo+IHJlZHVuZGFudCBh
bmQgYXdrd2FyZDogdGhlIHRlbXBvcmFyeSBjdXJzb3IgaXMgYW4gaW50ZXJuYWwgZGV0YWlsIG9m
IHRoZQo+IGl0ZXJhdGlvbiwgYnV0IGV2ZXJ5IGNhbGxlciBoYXMgdG8gc3BlbGwgaXQgb3V0Lgo+
IAo+IFdpdGggdGhlIHVwZGF0ZWQgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGltcGxlbWVudGF0aW9u
LCB0aGF0IGV4dHJhIGN1cnNvcgo+IGNhbiBiZSBrZXB0IGluc2lkZSB0aGUgaXRlcmF0b3IgaXRz
ZWxmLiAgQ2FsbGVycyB0aGF0IG9ubHkgd2FudCB0byB3YWxrCj4gdGhlIGxpc3QsIGluY2x1ZGlu
ZyBjYWxsZXJzIHRoYXQgZGVsZXRlIG9yIGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnksIG5vCj4g
bG9uZ2VyIG5lZWQgdG8gY2FycnkgYW4gb3RoZXJ3aXNlLXVudXNlZCB0ZW1wb3JhcnkgdmFyaWFi
bGUganVzdCB0byBtYWtlCj4gdGhlIG1hY3JvIHdvcmsuCgpXZWxsIHRoZSBkaXN0aW5jdGlvbiBi
ZXR3ZWVuIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBhbmQgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KCkgaXMgKm5vdCogdGhlcmUgYmVjYXVzZSB5b3UgbmVlZCBhbiBleHRyYSB2YXJpYWJsZSB0byBo
b2xkIHRoZSBuZXh0IHBvaW50ZXIsIGJ1dCBiZWNhdXNlIGp1c3QgJ2l0ZXJhdGluZyB0aGUgbGlz
dCcgYW5kICdpdGVyYXRpbmcgdGhlIGxpc3Qgd2hpbGUgeW91IG1vZGlmeSBpdCcgYXJlIHR3byBk
aXN0aW5jdCB1c2UgY2FzZXMuCgpBcGFydCBmcm9tIHRoZSB0ZWNobmljYWwgaW1wbGljYXRpb25z
IHRoaXMgYWxzbyBoYXMgc29tZSBkb2N1bWVudGF0aW9uIHZhbHVlIGZvciB0aGUgY29kZSB1c2lu
ZyBpdC4KCldoYXQgd2UgY291bGQgY29uc2lkZXIgd2l0aCBDOTkgYXQgaGFuZCBpcyB0byBoYXZl
IF9zYWZlKCkgdmFyaWFudHMgd2hvIHVzZXMgYSBsb2NhbCBoaWRkZW4gdmFyaWFibGUgdG8gaG9s
ZCB0aGUgbmV4dCBlbGVtZW50LgoKT3IgbWF5YmUgY29tZSB1cCB3aXRoIGEgYmV0dGVyIG5hbWUg
aW5zdGVhZCBvZiBfc2FmZSgpIGJlY2F1c2UgcGVvcGxlIHNlZW0gdG8gbWlzdW5kZXJzdGFuZCB0
aGF0IHF1aXRlIG9mdGVuLgoKQnV0IG1hbmdsaW5nIHRoZSB0d28gdXNlIGNhc2VzIHRvZ2V0aGVy
IGp1c3QgYmVjYXVzZSBpdCBpcyBub3cgdGVjaG5pY2FsIHBvc3NpYmxlIGlzIGFtb25nIHRoZSB3
b3JzdCBpZGVhcyBJJ3ZlIGV2ZXIgaGVhcmQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
