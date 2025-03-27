Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72733A744F2
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Mar 2025 09:05:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3236AC78F8E;
	Fri, 28 Mar 2025 08:05:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC663C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743080546; x=1774616546;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MFwtDRTg41/x2Mb+rRNlSN7ED+n9AlKcpsnGFSy7YNU=;
 b=OPun7sxM8oL3Vy+ZXjLjtlMwvErBA4XEFWy559KaRJs4xiJvo0gpnwIv
 OjlF0WiDmxYm9F8Pnqrl+hjxv9pKjaaeJEqBeurc54D2TOOGdvKSDrRI8
 60s8vH6aLVawo+m8M1FPqxbwFJxUTi5jFS3ew4cLrdF+mEyoQ/+sa4ge9
 4WKcugzyeA+rkOQctAaadQl6PmgnaAgZUdQYzvQBPENBygwn9ZqkqcHk5
 +iZTABMqTGQm2z1uNY5qNWV8xjZqgL4YALDBX5QVVlfhLkpccXuv2vGxp
 n4O4/OrcPPN6kKf3JP109gtCuFNKJLa5lzI0FjCiZufKk2FOPQVdA8qVw A==;
X-CSE-ConnectionGUID: UxyGswnHQWC10R7mb2SNkw==
X-CSE-MsgGUID: mb66AfbCRySGPFVbMtYGAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44426023"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44426023"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:02:23 -0700
X-CSE-ConnectionGUID: mXV9d3enRrmrWW0JS6iW5g==
X-CSE-MsgGUID: wtyYtTndQCKUyQ1w6SQjYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="125350223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 06:02:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 06:02:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 06:02:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 06:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVUMkG7LAO87cS8s/+8D8BAXT3z3kCuvHO4BxxOcuoRFbRS+yM0JiOXgJUUfKWHVLe1rThxkamNvF+E1epHvDxIntC0fHxbV5g4lMzgxBgfabHo8qrgfziOy9AcRWcvin0pKt+wI0y29L4us+nDlsdxzVSV0h4S04IjXpOj37t64cB9Xek69g2TTBRpbKNDVr6B5/UVQpjqtEbn0hDLRHI8ZZPLYHs/+7sWgXFxv/7ltOXd71UThfYqFEKyhmGJc2iWzcWSTztHtCKsOC/yOr1wZ5Ff1IFfqKKXKrJVdbnE8hnJEnxaa32vM8vDR1YhMaJT2swOeeaP9qCGDA1qWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVpZNMFVRmfQmo/zfBKYgLcIw2dKRFknwxdfhN4Za8Q=;
 b=v43pNsX57/on2lQxNLaZ5Qv5mHe6kTt1FL3IPU84QriC21+R+Xkeo6Qd16xU8VjG1ixhxtfaYXQrnaoUsSI0rODrXZtjACAzkkzyZYUhkuiy8kRmKT0VnoAb5Bk44PjBI3cp7jz2ZdVKLoCvVezOMz2uYI4fTFtSCECwtWJgRP8tRNE6wkFX3veSmx7rC5OAYaEUQSaWpstBvbYC3n5FzCZ/yix+/ouBaZi+yKVQKmRbfwWgZplx2byRl0OanW25dwvFmDJsrYiaA/0tkzx4BKhc4J9puPkpHPZDNRuL/ESBJGTA1/80T0yiEQZ9y4hNGQW5eTvYkfIhBK4HNVlTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) by
 CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Thu, 27 Mar 2025 13:02:17 +0000
Received: from DM4PR11MB6310.namprd11.prod.outlook.com
 ([fe80::c07c:bc6f:3a1c:b018]) by DM4PR11MB6310.namprd11.prod.outlook.com
 ([fe80::c07c:bc6f:3a1c:b018%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 13:02:17 +0000
Message-ID: <f2a8ede9-52fa-4f69-8ab2-3290171bc886@intel.com>
Date: Thu, 27 Mar 2025 15:02:07 +0200
User-Agent: Mozilla Thunderbird
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Furong Xu
 <0x1207@gmail.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Hariprasad Kelam
 <hkelam@marvell.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, "Suraj
 Jaiswal" <quic_jsuraj@quicinc.com>, Kory Maincent
 <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>, Jesper Nilsson
 <jesper.nilsson@axis.com>, <linux-arm-kernel@lists.infradead.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <intel-wired-lan@lists.osuosl.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, Chwee-Lin Choong
 <chwee.lin.choong@intel.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Serge Semin <fancer.lancer@gmail.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
 <20250318030742.2567080-11-faizal.abdul.rahim@linux.intel.com>
Content-Language: en-US
From: Mor Bar-Gabay <morx.bar.gabay@intel.com>
In-Reply-To: <20250318030742.2567080-11-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: TL2P290CA0007.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::9)
 To CY5PR11MB6307.namprd11.prod.outlook.com
 (2603:10b6:930:21::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6310:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 094be9cd-445d-4c8e-7798-08dd6d2f9a1e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEc4THgzNzFUT0xSYVNXMHhjbkt0R3JwOWJmcmxIZ0FISWNmYTNFMDQ4MXFD?=
 =?utf-8?B?SmhFRDhHS2E2eENQK0pJbWkxNU0vbU9hSk4vTHRtSnZCV0MyR1NLdU1SNzd0?=
 =?utf-8?B?OGdaU2NRMWdBZU41MU1DMnBDaHZuNkZSbnNDamc3dkR2MElxREoxSmVKNnZL?=
 =?utf-8?B?cndrQ1cxVkpsMDRjM0t1WjdxZnFlTGw1MkZPUTNzOUkycDgvSUE0UHVhL2pt?=
 =?utf-8?B?M2xzdHp6My9sMnNULzdBMHU4R3N5d251Z29TZWNxOHU2Ly9pVFBwcWxBUXB3?=
 =?utf-8?B?ZHk4VXcyL0JZeXNGWXhKS3MxeThlVHlsLzY0SngyVFVDNXVTaklHRDR5NC8r?=
 =?utf-8?B?QzJUZyttek5NandiSnFVT1BkUEdsVVlzNzdZTFg5c3hUOGtwZWplbWgzMHE0?=
 =?utf-8?B?dS9oSktsaGFVTThkbVhJdDZOL1I2KzFlNmNyblNoVjdtSm5TVnZUc0pNTkll?=
 =?utf-8?B?dzRSaUE4QUJEUEpCV3AyZG9NSXZxZ1orcVhzcjZmNGZ0bjBpOTNpYzFWRk1V?=
 =?utf-8?B?d2VjcVhwdTVNNys2SUxKMHJmZlFQeHFmNTVuQlBiUXlRbHdDaDRYc3NUdU0x?=
 =?utf-8?B?TkRoMUhwYkxDcEVYejhvYUlLbmNJS0dhMW1VaWhpdVI5TjdIZkRWMXphTE4x?=
 =?utf-8?B?WnlIYkNncDNpZnpxc1N5VVlvcHFTQWhadEtkRllqZGVHcW5KNjNaZnZXZU8y?=
 =?utf-8?B?MmRncUkzei9YU2w1U3kzaWl0Mjg0MnJ6K1llZ3BaU2Y1NFQ5SS9OM3NpRG5u?=
 =?utf-8?B?VDM1RjU4UFMvRTFwNnVpdlhJbjhqR1JuR2UycTYvL1VBaWlPRndkMjVuazgx?=
 =?utf-8?B?VWJ4U0xMNjdJcGNMWVRWOGxWbUxpdllXcisvWjE4M25YamprT0M3RkYrOGRL?=
 =?utf-8?B?RmdPZzJUZFlZV0NxTlZlQjd4U09mS2graEZwZ1NhUUxzTVpOZXJzSzl6WGpU?=
 =?utf-8?B?ckNjRE9OMEhvQTc5cENEMWl3dmFTRlJueU9VWmFWVjNvb09KL0tXTVZVbXVP?=
 =?utf-8?B?aHI3cEhTcEYraERBazJ5Q0p6VGpWV1A1anovUVNvL3FUcm9wYXRSN3FsdEdY?=
 =?utf-8?B?aVE1RzV4YXl0TWhqNVRMYldYTi9GanFkZGgrQTMxU1dKK3lHQlpPTU1zc2Iv?=
 =?utf-8?B?TnJXSTN4MEZwWTN6L3FwdnpoK3hPeU9RRnBCRzMzTTYxME5OZzk5WFg1MFNH?=
 =?utf-8?B?YkRMZmJxc3NaRGhuT1NsaWhCeTYrNWw3UUgzNEx1UkZZdFdEdGlPRUR1QS9o?=
 =?utf-8?B?bm9NMkFIQzRTSTNsb3NiYXZHV0FsUlkwcmo2RUg4VEUzMGxEN3pORmVWOGdU?=
 =?utf-8?B?UGxYb3hGMEJOQWNobkZSU3NwdmJTcEpDMTFjVDROOTlENFNRUlRQMlRYNjd4?=
 =?utf-8?B?QmlvRFE4QTRNRmJOa3ZpNEVRbmpLZ25qOERqc3JMSVBRMEhiWnJJYzZzL05Q?=
 =?utf-8?B?S1VaTVk4U01tdjc0YjhDNCtTTkdtTUVzYXhyeTd5VTljZVEyeHlxTEdhZC9J?=
 =?utf-8?B?Yy9PeGlRc1VwVnliVEhnMHJ5Y1BOY2JmWHc1K0htLyt3QkgwME11V1Z5cDRo?=
 =?utf-8?B?WndiaUdXdm52WmNMektNOVI5OWhyVlR6RTBVZkFkL3M2bTM4TUoydEgrUHEz?=
 =?utf-8?B?M2F4YnpYY243RFlmcnliWXZvMjBHUlVzZjlNL2tPTm9Ld2k0aG1hTzhBZzgz?=
 =?utf-8?B?S0RJUWhXUWFwSjJFQS9GWHRiQ0EzV1BFUnRhMFlXWi96ZGlzV3hlL2ZtN2U3?=
 =?utf-8?B?M1FIWE9TM1VRc0ZzRjIvbFNsaVFSSHZuRms0OUlyUThwTzVQUUlRU0xXUUps?=
 =?utf-8?B?bVlkRFZQOHVwZkU5RGF0ZzVzU2Y3S1FMQjIzd2FjWlNybzJvRUs2M2EwWGhl?=
 =?utf-8?B?SnVkY1FuSW1xaXRJLzIrSlI0WFV5YXhiU1VrdXpMUkZBV29hSktiZzBKa1Jv?=
 =?utf-8?Q?GLzGcTyXoFs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6310.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czkrd2RGcU03VU5uNFdoUThhelNrUXJTOXNrTC9TQ0U3eUpKcGlYM0Rkd3pr?=
 =?utf-8?B?NVFUMWhJenl0QllwZVpWaEFiVlFLeDdOdGtaelluWEpDYlUrQmhSb1F3OUFj?=
 =?utf-8?B?Y2NNcWdrNHZBbTl5T2k3Zmh0VWdmRzZoNkZpZUo4akc4MkM2bzlSOTNIVkN0?=
 =?utf-8?B?azRaQmFpZ1lGaUk3Y2crbExuRmQ3TFE5TThyVzcvVVAzL1RQYmdMbmdEWGhB?=
 =?utf-8?B?RG5FaEh4anA4Q005Q2NKMURzYmV1NC9WcHljT3IxeHR5UzVQZVhIM0F3VEJU?=
 =?utf-8?B?MmtXaUtLWld1L09GdGJHc3hub0Q0SWpRb0VaU05pdlliRVN5SFJRUGkrcVBN?=
 =?utf-8?B?dG5KbGZjcFJOV1NhVXRwZGdkNFpiVE4yTFBuUFZoV0VYaGxCcjUyeFB4QTZF?=
 =?utf-8?B?Q0t3V0RaUEVNSjdOeVY0eGl3QkpGUzFOTStKSk94T0JZUlpNRFJtNVFQWGk0?=
 =?utf-8?B?WS9LYkM2bk4vcmg4b2wwdWdyTUJxbng5T1l0VEx3dWVqK0tML0tZTWpFMExi?=
 =?utf-8?B?ZU14dVdiNkJhRnRUSWxQMjZqcXBVOVVNb2RodzdtTXRrdXQwbHA2VGhpeTM1?=
 =?utf-8?B?Y1BmR0VJL2NrUENqMG1WWWJORFBWSm42L1AxcjUxc2RSN0R1Z3VuaS9mMmMx?=
 =?utf-8?B?L1lpaGtBYlFldENhY1RMNUs0NjA2VVdOZUR5YXp5eE5ydncvL01TUVNxZ29L?=
 =?utf-8?B?MWprM0dJYXFnSTErQWlseldMNWt2YklJNVJHaytPU2FtVFVQOEVWU3Y0cVdX?=
 =?utf-8?B?UDBTVjlPMS9jWmJiMCtqSlJNM0tYcEdJRGYrMVpyWVp5VW9CY0FTdXFwWVB3?=
 =?utf-8?B?RUxWSENqa1ROdE51NE93ckZzQTB0TkNka0dwRUtmKy9ERUI4ZHRXMWkxRW9X?=
 =?utf-8?B?SDNMc242NTRWU1dpR0x3czNEcWl3V1IrSWRydGFzdlZuaitkUWlEbHViVWhF?=
 =?utf-8?B?NmNxQ1FKWkRFU3pLNFE3SUN0OG50bU1RRUFuM3AyTVIwYTNWTHJnTTAvZnBG?=
 =?utf-8?B?TEtrV1lMUXUxWTZnMmo5RUhKUC92VkkwSGZwbjlFaHBrUjJIRklsVmZQWk5M?=
 =?utf-8?B?S1ovdm16MXdJK1RqazU4b2Uxc2FXa2pyQjBhZzVTMFkxY2dPb21pRGsycHNj?=
 =?utf-8?B?Qzlrd3N4UFBXR2J1dTh6Mi9ZbnVScG0vYWdpNHV3L2JvaDRZYmZsK0NPd1hB?=
 =?utf-8?B?c2R4MnE3RXRnUFFZL0VEbDFVb2loKzlOQ0cwTlJFd0ZXa1FSK3ZDMlVqa0Ra?=
 =?utf-8?B?L3ZKbzI4M1FybDMxUTJVbWVjU05kVVJyUVExRDdjMjJXaGtmcjF4bUM1VU5O?=
 =?utf-8?B?d0ZoT2ljd2VuWHkyS3pQWHYrVGZFN2NqNTZCQk9naG1mOHVGOGNJeXVWaXBO?=
 =?utf-8?B?ZkFqYVAxTnQzb3lhc2hrZUNxdkhZcnRuaVN4QmpwOFpKTXM0LzNTWnhDaXdt?=
 =?utf-8?B?a2NzRnlmdGY5OEhRYVpiUTk3Vm9MMDVFWUZ2dWJuNE4yQjRCWHF6OHlqUVpj?=
 =?utf-8?B?WDBySG5ORXJ3cG1SVURZRDVtaGp4K2VqT1haOFFWQjREUkRxMVlRWVJrYVkv?=
 =?utf-8?B?S2VhSFYwcDR4Wjg0WWxqbnlZa1A4cWN3bkpjOUpOVjNiWnBlMlBYbUhUa2JX?=
 =?utf-8?B?TDFtVys3S3RHZ1BVcm9OZ1VFUDR2SzljUHpMaG9wdmRxSDdvY2pqOVhlSzRm?=
 =?utf-8?B?OVRuTW1iWW0rN2Y2bTZjTUJwcW5nbVNlSlRYcmFET3lISkpyQlpxbkJuRXdi?=
 =?utf-8?B?bEp3VG5lQXNGNTRzazZ6eWxweS8yUnQzeUtUYllWQXRZbUpJYytpcThHRG9w?=
 =?utf-8?B?WGt3S0N2NTVaa2JsYThkMnNRTzZuRzVpVVZicVJSYXc2cW1kc2RkNlpRcWVu?=
 =?utf-8?B?SVZDcnYrUERGakh1S2lpUCtzZDh3ei9JbjdLdkR3aTA1dUREa282Rlh3ZHZY?=
 =?utf-8?B?b3RnVWlEUCtFOXhPcFlYcmFWa2FVM2pYRHFqRzhxTzJOekxpZU5xZVBieVQz?=
 =?utf-8?B?ZEtnUHdmOW9hTFpGaWg0dlpqQWdWQmE2bGVabW4wQWFEY3c0a3pVTW5ZY0sx?=
 =?utf-8?B?UmVNRytWNkZzeXJuQWdLRFBpT2RxNW5iOE9xbW9aNDBsVU5wcVF2N2kzaHZr?=
 =?utf-8?B?b2M1WE5kZ1F2djZ1cGhDYW8rR0kvNVY3QlAvWTFqOUp3MkEvUndMTXJwdnRE?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 094be9cd-445d-4c8e-7798-08dd6d2f9a1e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:02:17.8522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +go+wOeUFG5xEQhHUIb27djCc3UsuCjgIt+COdlZR7akyanC0BSuG7tEQRqHnP4Vqu8sUAZxgkP/wvo5mLMQgFa2/PFZqO+tvL2kLcw5CNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 28 Mar 2025 08:05:20 +0000
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH iwl-next v10 10/14] igc:
 add support for frame preemption verification
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTgvMDMvMjAyNSA1OjA3LCBGYWl6YWwgUmFoaW0gd3JvdGU6Cj4gVGhpcyBwYXRjaCBpbXBs
ZW1lbnRzIHRoZSAiZXRodG9vbCAtLXNldC1tbSIgY2FsbGJhY2sgdG8gdHJpZ2dlciB0aGUKPiBm
cmFtZSBwcmVlbXB0aW9uIHZlcmlmaWNhdGlvbiBoYW5kc2hha2UuCj4gCj4gVXNlcyB0aGUgTUFD
IE1lcmdlIFNvZnR3YXJlIFZlcmlmaWNhdGlvbiAobW1zdikgbWVjaGFuaXNtIGluIGV0aHRvb2wK
PiB0byBwZXJmb3JtIHRoZSB2ZXJpZmljYXRpb24gaGFuZHNoYWtlIGZvciBpZ2MuCj4gVGhlIHN0
cnVjdHVyZSBmcGUubW1zdiBpcyBzZXQgYnkgbW1zdiBpbiBldGh0b29sIGFuZCBzaG91bGQgcmVt
YWluCj4gcmVhZC1vbmx5IGZvciB0aGUgZHJpdmVyLgo+IAo+IE90aGVyIG1tc3YgY2FsbGJhY2tz
Ogo+IGEpIGNvbmZpZ3VyZV90eCgpIC0+IG5vdCB1c2VkIHlldCBhdCB0aGlzIHBvaW50Cj4gICAg
IC0gaWdjIGxhY2tzIHJlZ2lzdGVycyB0byBjb25maWd1cmUgRlBFIGluIHRoZSB0cmFuc21pdCBk
aXJlY3Rpb24sIHNvCj4gICAgICAgdGhpcyBBUEkgaXMgbm90IHV0aWxpemVkIGZvciBub3cuIFdo
ZW4gaWdjIHN1cHBvcnRzIHByZWVtcHRpYmxlIHF1ZXVlLAo+ICAgICAgIGRyaXZlciB3aWxsIHVz
ZSB0aGlzIEFQSSB0byBtYW5hZ2UgaXRzIGNvbmZpZ3VyYXRpb24uCj4gCj4gYikgY29uZmlndXJl
X3BtYWMoKSAtPiBub3QgdXNlZAo+ICAgICAtIHRoaXMgY2FsbGJhY2sgZHluYW1pY2FsbHkgY29u
dHJvbHMgcG1hY19lbmFibGVkIGF0IHJ1bnRpbWUuIEZvcgo+ICAgICAgIGV4YW1wbGUsIG1tc3Yg
Y2FsbHMgY29uZmlndXJlX3BtYWMoKSBhbmQgZGlzYWJsZXMgcG1hY19lbmFibGVkIHdoZW4KPiAg
ICAgICB0aGUgbGluayBwYXJ0bmVyIGdvZXMgZG93biwgZXZlbiBpZiB0aGUgdXNlciBwcmV2aW91
c2x5IGVuYWJsZWQgaXQuCj4gICAgICAgVGhlIGludGVudGlvbiBpcyB0byBzYXZlIHBvd2VyIGJ1
dCBpdCBpcyBub3QgZmVhc2libGUgaW4gaWdjCj4gICAgICAgYmVjYXVzZSBpdCBjYXVzZXMgYW4g
ZW5kbGVzcyBhZGFwdGVyIHJlc2V0IGxvb3A6Cj4gCj4gICAgIDEpIEJvYXJkIEEgYW5kIEJvYXJk
IEIgY29tcGxldGUgdGhlIHZlcmlmaWNhdGlvbiBoYW5kc2hha2UuIFR4IG1vZGUKPiAgICAgICAg
cmVnaXN0ZXIgZm9yIGJvdGggYm9hcmRzIGFyZSBpbiBUU04gbW9kZS4KPiAgICAgMikgQm9hcmQg
QiBsaW5rIGdvZXMgZG93bi4KPiAKPiAgICAgT24gQm9hcmQgQToKPiAgICAgMykgbW1zdiBjYWxs
cyBjb25maWd1cmVfcG1hYygpIHdpdGggcG1hY19lbmFibGVkID0gZmFsc2UuCj4gICAgIDQpIGNv
bmZpZ3VyZV9wbWFjKCkgaW4gaWdjIHVwZGF0ZXMgYSBuZXcgZmllbGQgYmFzZWQgb24gcG1hY19l
bmFibGVkLgo+ICAgICAgICBEcml2ZXIgdXNlcyB0aGlzIGZpZWxkIGluIGlnY190c25fbmV3X2Zs
YWdzKCkgdG8gaW5kaWNhdGUgdGhhdCB0aGUKPiAgICAgICAgdXNlciBlbmFibGVkL2Rpc2FibGVk
IEZQRS4KPiAgICAgNSkgY29uZmlndXJlX3BtYWMoKSBpbiBpZ2MgY2FsbHMgaWdjX3Rzbl9vZmZs
b2FkX2FwcGx5KCkgdG8gY2hlY2sKPiAgICAgICAgd2hldGhlciBhbiBhZGFwdGVyIHJlc2V0IGlz
IG5lZWRlZC4gQ2FsbHMgZXhpc3RpbmcgbG9naWMgaW4KPiAgICAgICAgaWdjX3Rzbl93aWxsX3R4
X21vZGVfY2hhbmdlKCkgYW5kIGlnY190c25fbmV3X2ZsYWdzKCkuCj4gICAgIDYpIFNpbmNlIHBt
YWNfZW5hYmxlZCBpcyBub3cgZGlzYWJsZWQgYW5kIG5vIG90aGVyIFRTTiBmZWF0dXJlIGlzCj4g
ICAgICAgIGFjdGl2ZSwgaWdjX3Rzbl93aWxsX3R4X21vZGVfY2hhbmdlKCkgZXZhbHVhdGVzIHRv
IHRydWUgYmVjYXVzZSBUeAo+ICAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gVFNOIHRvIExl
Z2FjeS4KPiAgICAgNykgRHJpdmVyIHJlc2V0cyB0aGUgYWRhcHRlci4KPiAgICAgOCkgUmVnaXN0
ZXJzIGFyZSBzZXQsIGFuZCBUeCBtb2RlIHN3aXRjaGVzIHRvIExlZ2FjeS4KPiAgICAgOSkgV2hl
biBsaW5rIHBhcnRuZXIgaXMgdXAsIHN0ZXBzIDPigJM4IHJlcGVhdCwgYnV0IHRoaXMgdGltZSB3
aXRoCj4gICAgICAgIHBtYWNfZW5hYmxlZCA9IHRydWUsIHJlYWN0aXZhdGluZyBUU04uCj4gICAg
ICAgIGlnY190c25fd2lsbF90eF9tb2RlX2NoYW5nZSgpIGV2YWx1YXRlcyB0byB0cnVlIGFnYWlu
LCBzaW5jZSBUeAo+ICAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gTGVnYWN5IHRvIFRTTi4K
PiAgICAxMCkgRHJpdmVyIHJlc2V0cyB0aGUgYWRhcHRlci4KPiAgICAxMSkgQWRhcHRlciByZXNl
dCBjb21wbGV0ZXMsIHJlZ2lzdGVycyBhcmUgc2V0LCBhbmQgVHggbW9kZSBzd2l0Y2hlcyB0bwo+
ICAgICAgICBUU04uCj4gCj4gICAgT24gQm9hcmQgQjoKPiAgICAxMikgQWRhcHRlciByZXNldCBv
biBCb2FyZCBBIGF0IHN0ZXAgMTAgY2F1c2VzIGl0IHRvIGRldGVjdCBpdHMgbGluawo+ICAgICAg
ICBwYXJ0bmVyIGFzIGRvd24uCj4gICAgMTMpIFJlcGVhdHMgc3RlcHMgM+KAkzguCj4gICAgMTQp
IE9uY2UgcmVzZXQgYWRhcHRlciBvbiBCb2FyZCBBIGlzIGNvbXBsZXRlZCBhdCBzdGVwIDExLCBp
dCBkZXRlY3RzCj4gICAgICAgIGl0cyBsaW5rIHBhcnRuZXIgYXMgdXAuCj4gICAgMTUpIFJlcGVh
dHMgc3RlcHMgOeKAkzExLgo+IAo+ICAgICAtIHRoaXMgY3ljbGUgcmVwZWF0cyBpbmRlZmluaXRl
bHkuIFRvIGF2b2lkIHRoaXMgaXNzdWUsIGlnYyBvbmx5IHVzZXMKPiAgICAgICBtbXN2LnBtYWNf
ZW5hYmxlZCB0byB0cmFjayB3aGV0aGVyIEZQRSBpcyBlbmFibGVkIG9yIGRpc2FibGVkLgo+IAo+
IENvLWRldmVsb3BlZC1ieTogVmluaWNpdXMgQ29zdGEgR29tZXMgPHZpbmljaXVzLmdvbWVzQGlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5pY2l1cyBDb3N0YSBHb21lcyA8dmluaWNpdXMu
Z29tZXNAaW50ZWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTogQ2hvb25nIFlvbmcgTGlhbmcgPHlv
bmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaG9vbmcg
WW9uZyBMaWFuZyA8eW9uZy5saWFuZy5jaG9vbmdAbGludXguaW50ZWwuY29tPgo+IENvLWRldmVs
b3BlZC1ieTogQ2h3ZWUtTGluIENob29uZyA8Y2h3ZWUubGluLmNob29uZ0BpbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQ2h3ZWUtTGluIENob29uZyA8Y2h3ZWUubGluLmNob29uZ0BpbnRlbC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogRmFpemFsIFJhaGltIDxmYWl6YWwuYWJkdWwucmFoaW1AbGlu
dXguaW50ZWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvS2NvbmZp
ZyAgICAgICAgICAgfCAgIDEgKwo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaWdjL2ln
Yy5oICAgICAgICAgfCAgMTIgKy0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYy9p
Z2NfYmFzZS5oICAgIHwgICAxICsKPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYy9p
Z2NfZGVmaW5lcy5oIHwgICA4ICstCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9pZ2Mv
aWdjX2V0aHRvb2wuYyB8ICAyMSArKysKPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2ln
Yy9pZ2NfbWFpbi5jICAgIHwgIDUyICsrKysrKy0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2lu
dGVsL2lnYy9pZ2NfdHNuLmMgICAgIHwgMTQ2ICsrKysrKysrKysrKysrKysrKy0KPiAgIGRyaXZl
cnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYy9pZ2NfdHNuLmggICAgIHwgIDUwICsrKysrKysKPiAg
IDggZmlsZXMgY2hhbmdlZCwgMjg2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gClRl
c3RlZC1ieTogTW9yIEJhci1HYWJheSA8bW9yeC5iYXIuZ2FiYXlAaW50ZWwuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
