Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eKvbBYlrKmpYpAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:02:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D650866FA93
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:02:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=amd.com header.s=selector1 header.b=WGcCDjow;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=amd.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D50C424DD;
	Thu, 11 Jun 2026 08:02:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3CB1C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQLX8zabzpWc70aq8SJmqI3sePCP2cR5Qr1sS6LdgHtWyofcP7NGdX3sJtacptQ8rie7d7e2TraDAMNXLKK1FASa9BMdJY88m71DWL58vM8D1CQ3oN/JY9pN33EoRZB00huaPmZaLJIENjqd1U5BMtqkaI6RwFkGe+uDq0IsXdrJ6I1VtZ/8ybvdsVBH8FLTi66sK1/JgQHue+WlHsY7jZcvSbAJBZ3BwGpV5CAD6AjNtbdaQuncOqVZ1oQ4CIE3QjD6j5ecFF8akumVlxjLAgRZkIuUC7sZJ1uaM8kbJWcXBwch9GE1RGj7XJEbVBu6MZxHTCBYn1MFdOI0o7sEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1l4L2KZOkl3OQtjo8wiusThkx1Bv4k4J552WYRPRLo=;
 b=exXLzskEDD/BCKBF6KIqGWx1im6JtFEdWMNKr4j8fjo1s7CabcfzP62KxQB/Ve2sZU3dsMmSMqUWIfAmBNUv1q+KrEXciWonfJ+Mjvt7Dl1wRPYPlSesILu/BTS4EAqeUnK5khKBq11B04aMw2EU9ICSN0a4aVDLXDRSvr2Tt7t+/VCtv+qUSLRVdd1qWqAzK4ihAAdym5AA31DTqmC8rfE6m2HLj/kHTJqqNuKVq3RbijvyVhm8A21+hlP6pc3YyKBEVfwNhQEFchjV+uu6Vk5BvYjMPkKoI6v/s7I5fBCvfbJ/wvH3MqU1Kxzthn7D+bA29516WfTQeX7Eo1GDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1l4L2KZOkl3OQtjo8wiusThkx1Bv4k4J552WYRPRLo=;
 b=WGcCDjow4rqR2DPOb936zshpMU6RnT6hEz88DuoFTc5aX8agh59UpBO09eUJY4eiph3jElpmq+DGIsoIzo+PLA4o81/mDREPTeVW0MR1H5Y7edR6Ihy2snXl6LCrcMYGwvAxMfXxKnmJFBLMxDnGkbmZ6D8RmevMKm5mpOcoZpk=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:02:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Thu, 11 Jun 2026
 08:02:04 +0000
Message-ID: <92683537-8404-47fe-a4ba-160e54870f0b@amd.com>
Date: Thu, 11 Jun 2026 10:01:25 +0200
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
 <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
 <ail8iNvPrJnE7p58@ashevche-desk.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ail8iNvPrJnE7p58@ashevche-desk.local>
X-ClientProxiedBy: MN0PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:208:52d::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: d88b51d7-4a73-4e9d-b823-08dec78fb987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|7416014|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: i763Z/yN9QSE/0E3zH19KNbxVfG91nw+dD37LePGrpOYWeKztx4BbBBN0gVnHiIAOLiRAHP/2IjK1C+1JW/JEi4+7m1e7H4CSsGKBEUdF4v9PJFCijiBp+MixrFPlkfNeMBbhrbCDUhXVqPohAIX5nL1ydLJu/ztwl8rQ9FOfd7ZXqtfmXo1tv+65UUgmgq/WnF+fEnr2MoIIetdBx4tEyDBCVohIe/jotzSim1dyrmHLgqg54RbfOV3tv+SnYb3bPkklyyQpAASrI3STfW3mDmHxbwqrJAUw+yK2DV7L3N9UhWtxftmJFqUgw6TK/ZNOi3M0qXQ95nE5c3SHiw1Z0ViunlP7WO/jz+1S0sMDOvgxetDYFb06syvbYIncDdiTe1HWM2XrpKLB+ExmML5spDiYLP6viSIKpNKemr8XHUgWm7kE3qRmc9+QQLX188QEc0zzjB2OiCqJfe4+1e3CvNbY1PmR2taeWJ5j6TPhIvfksDCL/0/giB1yUduXCxgGO3sbSJv30Ddy9XHqaZHoLxvUgCfjFBYChKfszzNVjGlUk0450V2mHguwaW0EUkArlYrYf82R3ghyDtSuONG7tXnBak6ITrwtfuTZCQiRLVExSzUiWQLfVWeiHwUwqRZpzHa2QN02GwecCkPPKxRbWm2Kmbdk0sWopFlVclhJqm9sGIB5kWpsQSULBGX5qide9FZsFs746Kg/4HIWO3lAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(7416014)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z05Ncnc5L0JndER4cm1xV2o4MHlGOUJKTVdoS2RFQUYxYVF5VmQwZkVYS3Fm?=
 =?utf-8?B?T3ovYnpaYmw3WXB0MG9HOVY0WnRiM2ZnMVNnTExBSTVrZXV4Ylk0a3U2dzNQ?=
 =?utf-8?B?dGlXbmR3UnRRT0YvZmU0TmxpcCtCOTZualI5NHp3WTlhOUVRQ0MrSnVBbzRK?=
 =?utf-8?B?RExxVXh0a1hMUngrQWJEcTVuTm9uc0tJTGU2YW01cXdOUVRWQzkzTEhFRzFU?=
 =?utf-8?B?SGZsblBSOEFlYjlWTnM4eXpsaW1scG9IUEZOSVh4Zmg5V0dKNlVzZVI1WUlG?=
 =?utf-8?B?bFNFZy8vZXk1cmJRYnZWMWlPV2dVKzQzejdSUmdIZTlXQ2Q4S0pTOVRsNUZM?=
 =?utf-8?B?TVBpOTRpc2pFTCtrYi9iV3NpQmIwTDVObnpzOW5rSlpKWHBmYkdzUmZkMGZa?=
 =?utf-8?B?U3lvRHM0cjA0anpPODUraWFiYkZ4V2FuWUgwN0h4UThwRVArWmd4alBlNnMv?=
 =?utf-8?B?WDhXbStSSUl3UW05NEdydjFsdXRZQXJ6bDZIbXoxTGEwRHZKZzEvWFI3UjVV?=
 =?utf-8?B?U210UUlOdktsNkUyOVdHb3NlZEZBUGplNWV2dmpzUzIzZWVYbnBxSUl6ZWly?=
 =?utf-8?B?K043eGRXY1dLSENEb3dIanNWZExCakpyWGtxRE1XVXgzOEJzRWZOZE1TZy9o?=
 =?utf-8?B?NTdxbkoxaCsxVDhyYWplbzBQT3ZkR1BOak9SUHd1MUt3VG9FWkRhdjJJcG85?=
 =?utf-8?B?YS8vZXZYRVdhRWR3T0x2aVg3YjNxeTZZTURNczE5dmxDeWlPNWlTWkNSL1BY?=
 =?utf-8?B?bSszOVJqSXFIUTJZSlJrMlB5NEhocExWS0FXOXQvQ2lWRTVNSTVOY2JYSWpB?=
 =?utf-8?B?d01uYkE5cnZ5bmNHd25PR2hXTUZhMmpJMmQwN0FpQmFxL202U3lHQmdoMC9D?=
 =?utf-8?B?ckNKaVBQdzM3VkFpaE9taENkTkhuMEc4a3A0TnF3NEIrWkk3SWJvY3V6Uk55?=
 =?utf-8?B?YU1jcGhjNFdoNlNWbEVRUTJwK2FjN3FJUCtqejF6Ykw3RHVKdUhqeW9YNDJD?=
 =?utf-8?B?amlUSVYyRG9pSlNuS3dQbXpPWlZuUTZzWUlwSk4rREw3WUlQT292bTNMVGFk?=
 =?utf-8?B?SGFjMWt2eWxzenVCV0VtWU4rcmdEb1ZJYWhUSWtPSFVkajB4ajFBZ2w5Wlpy?=
 =?utf-8?B?bXcrSW9henRUZ2svRWtTdUVZSVZSZm0rUStZZE5uc3J4RkE0R0w0Z2pjaW5Z?=
 =?utf-8?B?YVQ3M0tyRno2V05YNVBpendvUCtISk1oWWU3clJseG8yV3ZOY25BMjJROG91?=
 =?utf-8?B?b2gzdm9MMHMrbmIrdlMvYi9ONmUvR2prb082QVJkWjJuKzFDMlpRVjZlbjFW?=
 =?utf-8?B?QngzRXZrdWIwYk1FQ2Fzd0xQM2kyWktCcWJ1WUtPcmVZR2FPbG5odDh3V3A3?=
 =?utf-8?B?WFdwYmxQbjZQaDVYWnRaQkdrTk1zbmthQjc1SXUzOEhocXpEZVZncEowTlZs?=
 =?utf-8?B?Qms2b05rLy9NYmhlQTRYNUxQWXJwYVg1a3ZFdzRqRWUzWWx5R251dVEybmhh?=
 =?utf-8?B?eFdOdkNVUlFQVGJkQ1FvTWhMejRPVWVnUGNON0RlbmZEK29PUm5hU3Z4U2lU?=
 =?utf-8?B?RkxwQnNFcS9LYTZuYVJhT0xWb0JtSHRwVDhSRTdmdnp0YzkwL2M0K29LVW9M?=
 =?utf-8?B?ejlXZlBHVWtaSExJYW4xUndBd2dtU1dMNnNpc3lNZFVDYytsUnFhUWs2VTNk?=
 =?utf-8?B?bzRGTzFPVjREZW85YTYxVFRXQ2w3MVN1UEdvY3hiZ2RBbUJCL1ZOQWw1dml5?=
 =?utf-8?B?ZS90VnhvaGZkN0lVY2pSTjVSdzdzUGdJMGI0MWhpcE9Ld09ESTNxMkZEelo0?=
 =?utf-8?B?eHc1cE10cW5VcWNZOXU5dXJzbWJXVytVZFE2NnlFa2dxZUhqSnM1dGNpSEhG?=
 =?utf-8?B?T2ZJeGY1YkNvQVZPRmV4MCsxbHo0NURMcFhRSmRYaHlHdTlLV0tPVk4rdjl0?=
 =?utf-8?B?QTJVc1AzM1ZOV1ltWmhMd3BuZDdGZXpleU5sVENERTZheEZZSjIrVVprSjlE?=
 =?utf-8?B?VEh6aEoxKy9FNDhtQXNUOXNCb1pJTFVjNVBNWXZYQ2VGM0hsRXBIQW5aT2R5?=
 =?utf-8?B?ZWNzMTJzWXlPbyt4ZktranRIeitjRzlpd2FiRmJJYXd1SzBKVSs1aDVFd2pZ?=
 =?utf-8?B?QVBXUWF5MjE5QkxadVVySXNkOWJvYkR2MFcyZ2VwZVhSbnBieENWcFRpUUsr?=
 =?utf-8?B?cjVMR01taHpERVNzamtHaktHTi9vRlBjWHk5am1NV3kyQUdLdElCWnR5YkpN?=
 =?utf-8?B?SnRyT2pKZzQ0UDJPTWZsb2xoQ2ZydE5mN1RheHNRamQyLzl0dldRRGo1LzJi?=
 =?utf-8?Q?OS33vQYzpuGM0t2bg0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88b51d7-4a73-4e9d-b823-08dec78fb987
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:02:04.1722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9Ieec8W5GNnHevvvWWrKeDSDvvpHyAMm34tm5sASpPik2PfNYwk289Hx6uDwMdK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:kaitao.cheng@linux.dev,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:ja
 ni.nikula@linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[stormreply.com:server fail];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	RCPT_COUNT_GT_50(0.00)[61];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[christian.koenig@amd.com:query timed out];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D650866FA93

T24gNi8xMC8yNiAxNzowMiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDEw
LCAyMDI2IGF0IDExOjExOjM0QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IE9u
IDYvMTAvMjYgMTA6MTgsIEthaXRhbyBDaGVuZyB3cm90ZToKPj4+IOWcqCAyMDI2LzYvMTAgMTY6
MDcsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOgo+IAo+IC4uLgo+IAo+Pj4gU2hvdWxkIHdlIHJl
dmVydCB0byB2MSwgb3Iga2VlcCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgYW5kCj4+PiBsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUoKSBhcyB0aGV5IGFyZSwgY2xvc2UgdGhpcyB0aHJlYWQsIGFuZCBt
YWtlIG5vCj4+PiBjaGFuZ2VzPwo+Pj4KPj4+IExpbmsgdG8gdjE6Cj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjA1MjkwODIxNDkuNzY3NjQtMS1rYWl0YW8uY2hlbmdAbGludXgu
ZGV2Lwo+Pj4KPj4+IE9yIGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbnM/Cj4+Cj4+
IHYxIGxvb2tzIHBlcmZlY3RseSByZWFzb25hYmxlIHRvIG1lLgo+IAo+IEJ1dCB3aHkgbm90IGp1
c3QgaGlkaW5nIHRoYXQgb25jZSBmb3IgYWxsIChpbiBjYXNlIHRoZXkgZG9uJ3QgdXNlIHRoZSB0
ZW1wb3JhcnkKPiBpdGVyYXRvcik/IEVhc3kgdG8gYXV0b21hdGUsIHJvYnVzdCDigJQgZXZlcnlv
bmUgaXMgaGFwcHk/CgpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoYXQgaXMgYW4gZXh0cmVtZWx5IGJh
ZCBpZGVhLgoKVGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gdGhlIHVzZSBjYXNlcyBvZiAnaXRlcmF0
aW5nIHRoZSBsaXN0JyBhbmQgJ2l0ZXJhdGluZyB0aGUgbGlzdCB3aGlsZSB5b3UgbW9kaWZ5IGl0
JyBpcyBjb21wbGV0ZWx5IGludGVudGlvbmFsLgoKU2VlIHRoZSBib29sIHR5cGUgY2FuIGJlIGlt
cGxlbWVudGVkIGJ5IGludCBhcyB3ZWxsLCBidXQgaXQgaXMganVzdCBhIGRpZmZlcmVudCB1c2Ug
Y2FzZS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gCj4+IFlvdSBzaG91bGQganVzdCBpbmNsdWRl
IHNvbWUgcGF0Y2hlcyBpbiB0aGUgc2FtZSBwYXRjaCBzZXQgdG8gYWN0dWFsbHkgdXNlCj4+IHRo
ZSBuZXcgbWFjcm9zLgo+Pgo+PiBJZiB5b3UgbW9kaWZ5IHRoZSBmaWxlcyB1bmRlciBkcml2ZXJz
L2RtYS1idWYgb3IgZHJpdmVycy9ncHUvZHJtL2FtZCB0byB1c2UKPj4gdGhlIG5ldyBtYWNybyBJ
J20gaGFwcHkgdG8gcmV2aWV3IHRoYXQuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
