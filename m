Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO1lHPcJsGlIewIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 13:09:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEEF24C8AA
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 13:09:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C5EBC8F299;
	Tue, 10 Mar 2026 12:09:26 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013030.outbound.protection.outlook.com
 [40.93.201.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 829CCC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 12:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJsVMBb/tfGS87N6mIm9gRpXLCG42LAurayKGilMpxH/PDAr6bPNORfmCWZdjFU5R7D5YcYVguQFtqfLsyUmX6kxPFEiSnzSsT0X3i0FZTMjFiZB5JSgx61rS8Jiq20+4FG0+Db95lS++3Ok568q+HrUTsjrgmzRIPtYvLHTFAfoIVjW6PkzcMkPY/QZEoyboF3mMAY3EBMYeDlzkyUfQNgv2is2HOBv6kxvpCtksmMrmf2C17YqcNm63uz9PJF3rzu/pXmn+Y/40v82v0CJVF0IRzwjgpXNkpPu70bEE9PhaBjBzo/VB/yBbp3ICmJYmfpH5tnLllbLzWc8qcbqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF867SZzGYLT8GRpHbaChcflB30COqiDq6XJ+UvHW18=;
 b=A2Ru6EbP1EMp/PDkCT0cnRgB1/f8s00+cW4TFkcG/EjOacy1+TJQGOWYk0aHUmOpC/iMXYysAj27QcdMd/BifeatINVRALr3MGmWitIvYGtDPpaaAFSeBoN5DEyM2/QJ8S+tpub4ZOorKtpKdyn7FcqVVhHnus1onV+uLNBWMVPmeU0wQqfsudk9uYlLGgmXCwK/gGPYwXxxZiOtCx+KpkS4vkdrkM7hoso3ret+vtforbnCV+dubm12lKmnClHIQ4COIEeapD+O3McKAo0po2MlRrlzp3AwgsZZHp7CBIZXA6ITZnNhl8vT1O4jjw2v7/ovSA3Eojwqo3dIub9S/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gF867SZzGYLT8GRpHbaChcflB30COqiDq6XJ+UvHW18=;
 b=ZXl7dHcJkP06v2ir7fTUMJWqlo7worOJJa3N+67vK7KARsFWhcBYNtHJTOaUCi6oZtkQm51cDcHyyhtpA/QL8Xy29+4WVECz45gMFpNlOj/wUMB1wZvJFPAfkPFOghKdC2iGF8zP3A/t1JfyK/gDFnhPQayRDQYXxDcsnL/Ngpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:09:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:09:15 +0000
Message-ID: <e8a328f9-568c-428c-9111-8742e5dc9a4e@amd.com>
Date: Tue, 10 Mar 2026 13:08:57 +0100
User-Agent: Mozilla Thunderbird
To: Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org,
 cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-37-bd63b656022d@avm.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260310-b4-is_err_or_null-v1-37-bd63b656022d@avm.de>
X-ClientProxiedBy: BN0PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:408:ee::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f3db0b-99c2-4a41-234d-08de7e9dd8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|22082099002|7053199007; 
X-Microsoft-Antispam-Message-Info: rOsxnTx2kr7OFzy5oepnHTPa0Bl5bJUKTo+63luhlotIfFC3KzHLS+E3VMqAH1iHBTKaMYJ2UmsdfGDNZaGu1pbEMDo//hCzcDM4M0QcZ45ZOizgGMHWaZ1ya6xgl3xwPkUvHxqqi0dZr9N6cRTFQsw2jWmjewkDeVuOnYane588HX2iWR3CYWIfa7Br5OJ8iwoNCOeglYq2hmCD+XVye2SYHUtE3Hy4SP9KBI+8BmSMAMQ/VOPLHLKz4RZ9XB2O5YjMjmZNxo77a9Wn4CGVWydbDau3GMYxKNosqPKCKb4Q1CUax6ft49mrg9SC//kqRW1zqMolNibmO7EJ8UrT+8LEQLFweVShgEKu5cPWaq3q4EG/+BJAf1IDt5+JDbViN17XVz70lGDOGZ4jwQRjV4vf9JdhxuB4SEEixCLVEvpCz1BN1wjaMZJjUQJ1rBtYeCl7QcnPw9U0IKylRYTF5xRaKrh7F+9YZM5fq1EYA8ZCM91wDsdBKj5lLGxj8vM0EN2SWbDWewgwDW8HgSigsEvdgly9gfuYdn31TzS0vOH/OX63TN1XP4v6vomPJEuUHP++WLg3pWBA3+DbKgempasoOCVE7DLrw/dyeIIxqkWziHoLnwrgnCzwadYNNG+thV2OSa9TYKcYx215HoD7gpmsNcq0zcO0TS0q9MaYHbyjHNj6G+3J45FlJseURnlO+nW1rf/TKjD52NDMyHLSNSRr9yuLpthUPmg9JNvsnPoFd1Ih5I4yneCQepirDpxfGM+ONzOAPJ8ruHE9n09qdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(22082099002)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1AwRVFocW41VXIyT21kL25qc09PRmMrUmFOdmVac0U0V1hTYjN6aUpIdDZ5?=
 =?utf-8?B?dkRQb21XQWNhaVdmelNIamQ4SXdCUDFSekF2NklUMC9ycDZyUWFFNXRGM1Q0?=
 =?utf-8?B?d1FUQ2d0b3Zpb3dqK2NNQ1lrUzJGeGlLRU9rekxOcFFhOTlqWWI3bit0TVJ5?=
 =?utf-8?B?V2liamcxbjM5SmRzcFJvTmNkYnpjWm1KSVI0SmZDNWIyV3hwQlNkT0phTUlJ?=
 =?utf-8?B?UUVSRDBpMVZvZ05xVGlNdWN5aC9lNGN4cXplUmVoREZUYzhEOWRUWjlOdlZ3?=
 =?utf-8?B?VlFvMEwzT1Z5TGwraTFMZmJRczdQV0R0emVocTlKUFpuOXA3TWJmRTJVVDJm?=
 =?utf-8?B?M0U2NnROelpvbEJKcWZLK3E3MzZaNXZFUzBxdzZ1NmJzSTZuZ1BrNXc3MitE?=
 =?utf-8?B?Q1FXUmRpR20rOStjVDRzeUxpTUp3VVRhbWVsSFdrV2lmZ0M0SFFDTjBQNERs?=
 =?utf-8?B?Q0dDcXdaVWoySXZNdWh4YVBGUkNPWWcrYTl5ZnRmamhKMks5NEQ4MUtoelBt?=
 =?utf-8?B?SmVITXBjVEwwTkgyTlhSUlVNVUZJOTlJM0ordkZBRUYyZmpNUjNQR0hCdTZ1?=
 =?utf-8?B?Sm9vNmZpMkg2VFc4OFh4VUVOZ1JJL2F0RGhxS3VWZitGVVRKWVQ3MktHOHVs?=
 =?utf-8?B?YnoyT1d2Q3Q0Z1o3MGRTcnpUVFZ3UVVYUTBFcjVSbE01azdaNytsUzQ2WFIr?=
 =?utf-8?B?WUZBZHB0bGIvOXFhV3VjK0xUZ3U4Yjc4OHdKSm5tOUxucFpOMkJjcXZXTVVC?=
 =?utf-8?B?RGJzOU1yU2N1c2tIR09qQW0zQ3AwaWc3OEdqUlQ0S3hubVVORXB4NmdndHFp?=
 =?utf-8?B?RXFwRjJ5cmUvMWRGZVduQk9IUFhXQVc0SjBKUEkzeXFQRU96dHc4VTJxdi92?=
 =?utf-8?B?c0VUNjJuZU85SUN6YXZ5M2cxeStJWkVNMXZrRnFpOGJoSW9XSER4aHkwZFVt?=
 =?utf-8?B?UGRnSkdSREJwNGJuNTh5bmtiS2VXMU1JUzc3OCtHY3VzcVZpUWl2MDByUEJL?=
 =?utf-8?B?TUN1M3pBVXZEcm5KaUdpNTVHZWZwNEZhZHlVbTRwQ1NjWThTa3ZHZ2pKdDF2?=
 =?utf-8?B?bkhmTjBPMEFONkFPeFhzZlVvZ1VRQm5KT1hLYWZEanVvaUlWWGtYUmJ0TCtx?=
 =?utf-8?B?MjRDei95ckRET05hVFFEdjVxcURHYlJleWhCV3Mwd2dZdE01K0t1V2lPeXlM?=
 =?utf-8?B?MXIwZHExd2hyZkNZUVZHYUNHbUxCU2wyVDh5WCtqWmNDRkF1RHJ5alQzVFha?=
 =?utf-8?B?cVpYbDZtMGxJQmpIZ1FkbW9UN2JFNDNCZEV6T09IaUoyUU5YOEN5WXlNN2V3?=
 =?utf-8?B?MkhUaVQ0ZnZFOHFTVFY1NHFJRFNZaStiUlVxamZtajJxTHFaczgzbXR6YmVC?=
 =?utf-8?B?bVNxdlZxUXhLVXBhM3AyRHVZczhxREJYdFdpOWRCajdRZUpDTzR0TTJoS0w2?=
 =?utf-8?B?VTczMUIwN1hnc1IrRldzY1dMdzZuU0NnTjc0cFljbDF2MzZtR1luWWltQmlD?=
 =?utf-8?B?cEw2Y1FEZXFwVjZKdG5xVDRUeGRTaEdpczgvUDEyWlU0b3h6cEFsa3d4bUdp?=
 =?utf-8?B?N2NiOStpMzY4cU1ZZStzWEJuOEplNnFHeFZCYlF5OGo1T0tvRVRKT0JiUERn?=
 =?utf-8?B?WG5PdHFvbWIwSUt2REFYMHh2MVNtUVZSMGJENjZNSXJoeGo4K1FpQVZMTkdw?=
 =?utf-8?B?Vm50bzFicFNuVVFvMUhMRS9tczM1Wk9rejRKanFkcC9SN000cUUxUlZSVzZt?=
 =?utf-8?B?SG01L1NJbWNnc09HSGk4YkNPeEdjaE1kN2FQQUY3VHFtMEpDdDFuclZnUDRR?=
 =?utf-8?B?dzVoWXZrS3hQcEdKMTlwTXQ1VlFjMlFuVnptNmVkRGFyQk9lL29jY0NwcStC?=
 =?utf-8?B?bS9BVGNQak1ka3Vsb0FON0pKbWltdVphN3ZtVm1WNUZ5UEVGM0pqQmRaT3dJ?=
 =?utf-8?B?TjBsaDVzSzhBekl0T3I1RXZGdVhIamNkSy8rdDQzSVFiV1J2U3NDQWx1OVBN?=
 =?utf-8?B?eXk4V3k5R3NpSlRNaktTWkJiNTZiVU1LeGdDZkw4NVBSWDZXRXhSMlErQ0NK?=
 =?utf-8?B?d24xSnZ2U2xOVm9JTjYzdW5qMGZEWWJEamZMMmkwQVhyeXdZUmV4Y0graDFN?=
 =?utf-8?B?V1VxRjBpVmxTaW0xZEswTG12a0pJTjRTU0hlUjZGZnc3SFZmNXZsR0t6QVpQ?=
 =?utf-8?B?TWF6eDBoWDFhcFJJaW9MYnRDUC9hZVRWTi9URVN2ckh1bVQvV0R6R3BXcVBC?=
 =?utf-8?B?QUtWME8vZzk5V3UxZDZUTnU5eHl6Y2ZoZ1hjdXI0MmwyODNZNU5vaEZnS3h2?=
 =?utf-8?Q?DfmazJR2VH3VghHRhw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f3db0b-99c2-4a41-234d-08de7e9dd8e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:09:15.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqRTO+mz3lE4w162bISlJt1G5cnWIiVsGPkfJ+DfwnudZuohoYCt/6AWclzBsAkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sandy Huang <hjc@rock-chips.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 37/61] drm: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
X-Rspamd-Queue-Id: 0AEEF24C8AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kerne
 l.org,m:linux-phy@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:joonas.lahtinen@linux.intel.com,m:rfoss@kernel.org,m:tzimmermann@suse.de,m:jonas@kwiboo.se,m:zhenyuw.linux@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:hjc@rock-chips.com,m:jernej.skrabec@gmail.com,m:tursulin@ursulin.net,m:jani.nikula@linux.intel.com,m:heiko@sntech.de,m:Laurent.pinchart@ideas
 onboard.com,m:andrzej.hajda@intel.com,m:rodrigo.vivi@intel.com,m:alexander.deucher@amd.com,m:andy.yan@rock-chips.com,m:airlied@gmail.com,m:zhi.wang.linux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linux.intel.com,suse.de,kwiboo.se,gmail.com,ffwll.ch,rock-chips.com,ursulin.net,sntech.de,ideasonboard.com,intel.com,amd.com];
	NEURAL_HAM(-0.00)[-0.964];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gMy8xMC8yNiAxMjo0OSwgUGhpbGlwcCBIYWhuIHdyb3RlOgo+IFByZWZlciB1c2luZyBJU19F
UlJfT1JfTlVMTCgpIG92ZXIgdXNpbmcgSVNfRVJSKCkgYW5kIGEgbWFudWFsIE5VTEwKPiBjaGVj
ay4KCkxvb2tzIGxpa2UgYSByZWFzb25hYmxlIGNsZWFudXAgYnV0IGNvdWxkIGJlIHRoYXQgZHJp
dmVyIG1haW50YWluZXJzIHdhbnQgdG8gdGFrZSB0aGF0IHRocm91Z2ggdGhlaXIgaW5kaXZpZHVh
bCBicmFuY2hlcyB0byBhdm9pZCBjb25mbGljdHMuCgpBbHRlcm5hdGl2ZWx5IHdoZW4gdGhlIGk5
MTUgYW5kIHJvY2tzaGlwIG1haW50YWluZXJzIHNheSB0aGF0IHRoZXkgYXJlIGZpbmUgd2l0aCB0
aGUgY2hhbmdlIEknbSBoYXBweSB0byBwdXNoIHRoaXMgdG8gZHJtLW1pc2MtbmV4dC4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4gCj4gQ2hhbmdlIGdlbmVyYXRlZCB3aXRoIGNvY2NpbmVsbGUuCj4g
Cj4gVG86IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPgo+IFRvOiBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiBUbzogUm9iZXJ0IEZvc3Mg
PHJmb3NzQGtlcm5lbC5vcmc+Cj4gVG86IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBUbzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNl
Pgo+IFRvOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+IFRvOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IFRv
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gVG86IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IFRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPgo+IFRvOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+Cj4gVG86IFpoZW55
dSBXYW5nIDx6aGVueXV3LmxpbnV4QGdtYWlsLmNvbT4KPiBUbzogWmhpIFdhbmcgPHpoaS53YW5n
LmxpbnV4QGdtYWlsLmNvbT4KPiBUbzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBUbzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50
ZWwuY29tPgo+IFRvOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Cj4gVG86
IFR2cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD4KPiBUbzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IFRvOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBUbzogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBz
LmNvbT4KPiBUbzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+IFRvOiBBbmR5
IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBs
aW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cCBIYWhuIDxwaGFobi1vc3NAYXZtLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYyAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuYyAgICAgICAgICAgIHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3Rlc3QuYyAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyB8IDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRleCBlZTg4YzBlNzkzYjA0MTZkMjAxMDVhNDM0
NDhjYjQwMzc0MDJlNjRiLi42NGZhMmJjOGQyODE5NzE0N2VlMjJiNGY3NDEzNGNjMjdkZDliMzJk
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBAQCAt
MzYwOCw3ICszNjA4LDcgQEAgdm9pZCBkd19oZG1pX3JlbW92ZShzdHJ1Y3QgZHdfaGRtaSAqaGRt
aSkKPiAgewo+ICAgICAgICAgZHJtX2JyaWRnZV9yZW1vdmUoJmhkbWktPmJyaWRnZSk7Cj4gCj4g
LSAgICAgICBpZiAoaGRtaS0+YXVkaW8gJiYgIUlTX0VSUihoZG1pLT5hdWRpbykpCj4gKyAgICAg
ICBpZiAoIUlTX0VSUl9PUl9OVUxMKGhkbWktPmF1ZGlvKSkKPiAgICAgICAgICAgICAgICAgcGxh
dGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIoaGRtaS0+YXVkaW8pOwo+ICAgICAgICAgaWYgKCFJU19F
UlIoaGRtaS0+Y2VjKSkKPiAgICAgICAgICAgICAgICAgcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0
ZXIoaGRtaS0+Y2VjKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCj4gaW5kZXggZWY0ZTkyM2E4NzI4NDMzMzk3
NDNkMjFlNDg3NzIyNTg1NWRhOTIxZS4uNjc0OGFjYjQxNjNlOGY1NjU4YzkyMDFhMDQxMmIzODg2
MmM3YmFhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPiBAQCAtNjAwLDcgKzYwMCw3IEBAIHN0cnVj
dCBkZXZpY2UgKmRybV9zeXNmc19taW5vcl9hbGxvYyhzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikK
PiAgICovCj4gIGludCBkcm1fY2xhc3NfZGV2aWNlX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiAgewo+IC0gICAgICAgaWYgKCFkcm1fY2xhc3MgfHwgSVNfRVJSKGRybV9jbGFzcykpCj4g
KyAgICAgICBpZiAoSVNfRVJSX09SX05VTEwoZHJtX2NsYXNzKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTk9FTlQ7Cj4gCj4gICAgICAgICBkZXYtPmNsYXNzID0gZHJtX2NsYXNzOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKPiBpbmRleCAxNWZkZDUxNGNhODM2ZTg0ZjRk
ZTk1ZTMyMDdhYjQ1YmI5MjQzNDI2Li45MzNlYzVmZmExZjFlYmFmZDY4Nzk5NmYxNjdiOTgyNDkw
NzAyMjExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+IEBAIC02NzUs
MTAgKzY3NSwxMCBAQCBzdGF0aWMgdm9pZCByZWxlYXNlX3NoYWRvd19iYXRjaF9idWZmZXIoc3Ry
dWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+ICAgICAgICAgbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKGJiLCBwb3MsICZ3b3JrbG9hZC0+c2hhZG93X2JiLCBsaXN0KSB7Cj4gICAg
ICAgICAgICAgICAgIGlmIChiYi0+b2JqKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaTkx
NV9nZW1fb2JqZWN0X2xvY2soYmItPm9iaiwgTlVMTCk7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKGJiLT52YSAmJiAhSVNfRVJSKGJiLT52YSkpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKCFJU19FUlJfT1JfTlVMTChiYi0+dmEpKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaTkxNV9nZW1fb2JqZWN0X3VucGluX21hcChiYi0+b2JqKTsKPiAKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoYmItPnZtYSAmJiAhSVNfRVJSKGJiLT52bWEpKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmICghSVNfRVJSX09SX05VTEwoYmItPnZtYSkpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpOTE1X3ZtYV91bnBpbihiYi0+dm1hKTsKPiAKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpOTE1X2dlbV9vYmplY3RfdW5sb2NrKGJiLT5vYmopOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90ZXN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90ZXN0LmMKPiBpbmRleCAwYjQ1OWY3ZGYyM2JhZTNl
ZWY3ZTM2ZjRiNWYzNTYzOGZiNmY0OTg1Li41NzMyODRjNGFmNjBmMTJkN2VkZWM4ODkyNjBmYzhh
MmUyYjcwNDIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Rl
c3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Rlc3QuYwo+IEBAIC0y
MzQsNyArMjM0LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX2RvX3Rlc3RfbW92ZXMoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYsIGludCBmbGFnKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJh
ZGVvbl9ib191bnJlc2VydmUoZ3R0X29ialtpXSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmFkZW9uX2JvX3VucmVmKCZndHRfb2JqW2ldKTsKPiAgICAgICAgICAgICAgICAgfQo+IC0gICAg
ICAgICAgICAgICBpZiAoZmVuY2UgJiYgIUlTX0VSUihmZW5jZSkpCj4gKyAgICAgICAgICAgICAg
IGlmICghSVNfRVJSX09SX05VTEwoZmVuY2UpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJh
ZGVvbl9mZW5jZV91bnJlZigmZmVuY2UpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNp
LXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2No
aXAuYwo+IGluZGV4IDM1NDdkOTFiMjVkMzE3YzZjYWQ2OTBkYTdkOTdhN2U1NDM2YzAyMzYuLjhh
MjY3ZGU4NWRhOWM3NmMyZTI5YjJhYmFiZjEyMThlNDAwMjgyYzIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlwLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYwo+IEBAIC0xMDk1LDcg
KzEwOTUsNyBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3JvY2tjaGlwX2hvc3RfZGV0YWNoKHZv
aWQgKnByaXZfZGF0YSwKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKnNlY29uZDsKPiAKPiAgICAg
ICAgIHNlY29uZCA9IGR3X21pcGlfZHNpX3JvY2tjaGlwX2ZpbmRfc2Vjb25kKGRzaSk7Cj4gLSAg
ICAgICBpZiAoc2Vjb25kICYmICFJU19FUlIoc2Vjb25kKSkKPiArICAgICAgIGlmICghSVNfRVJS
X09SX05VTEwoc2Vjb25kKSkKPiAgICAgICAgICAgICAgICAgY29tcG9uZW50X2RlbChzZWNvbmQs
ICZkd19taXBpX2RzaV9yb2NrY2hpcF9vcHMpOwo+IAo+ICAgICAgICAgY29tcG9uZW50X2RlbChk
c2ktPmRldiwgJmR3X21pcGlfZHNpX3JvY2tjaGlwX29wcyk7Cj4gCj4gLS0KPiAyLjQzLjAKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
