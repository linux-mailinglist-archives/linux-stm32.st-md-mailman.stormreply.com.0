Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAE861852
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 17:46:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34714C6B47A;
	Fri, 23 Feb 2024 16:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2043C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708706777; x=1740242777;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eU97VxkxLYKkkzoUPOrCvH0Kt9l+QttGWXkFfCt90G8=;
 b=TVVNZf40ThcVZYaLAsvwewLdW4K+U5o7pKbW3GPoyNU15MMMZrZTUzwi
 e4CRqRqUDPAxSu60G8AkiNnv4SPhDvAOS6/E6YgKTbju1i0SBMeKvW8tc
 aAjLWMHcYrNvRXu5FMlk/CvIOqJDErrIiQw+AvoyrK5a8CmverOiUYVYD
 N+5Deghd0Ph93zd0zs1tWLmfSdAwA/XqiBMAZ4F55gqMeMHxhvZtzdVn7
 aH3O6m8nNXHQ01FaXREk6S1lu34XyQ63n9YfX6rkgHjhyLdAU6Wgx9N7C
 HJT/61jVOwwf1nj8aJgQRofxLc/3RY1BEj8fQZzomkfoHJKpUPT5EBiDL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="5977075"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5977075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 08:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6328928"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 08:46:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 08:46:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 08:46:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 08:46:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6tiaOtILtMj9HCqdXT58R2ilealGRFI5fXPAaeNrCvwB5zwaEAQfIIMO8IU7sfYEkOQ/JI1pHl9TapKLYz3EqrQT/z+bPdGW8eV/1j/wNkurwtFeb24waHSISLz9MQ/z2fFwKVywb3jYgeeTzwNZOlxozQ+LoBPFATNZfidarXd9SogW1aK3+EMX8NJ85p/Xu3VLW7OPbRoMsYdHAyNFDGsNO8wF5oB0B+OxPkAV6N+oNvQBmXw0YT4bMY/Hfa7hCF83dxTlSoAWmq6pGaBmHOLBPydHsZrqqmtddLRVdCee6vRdfOCABvb4yCuYfye0bIuWO2D2YfWq3dGqRLrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bUrvrnNe4e1oECkY24IvGiu4fwxtC3RjeBWNrn0sNQ=;
 b=VrF2KX8Y/ReAKnWWd49R+aQKsH4EYBGpHYYpcsUzV9dAy84IMtnfOjMKIMTh9I7ppDsF2RuURZS5XLgjsEdredVBvU38ib2qiDP//pPysOvztdIGRMvsnD5HTprKplSf30bdY2otyQA7mh4H0qf4gp+rnAbDL7lRkogLHrc0b2KalLZxCRAbAGyz/ewzbZqwjcRxE4k+g8NYml2A+s9Ijih2ZIqVtfyMh5ZWzvAv0DwmTlEbvhmkoS0O1XvzMyF5Gp/WjOzGA70kisYUCn2eSC9CsOBTXuiD5+XRrV1R0VUm2QbeAcTXQVJZlxSjGHmNoe92hwjwpHWFfUuaVvMXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 SN7PR11MB6825.namprd11.prod.outlook.com (2603:10b6:806:2a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 16:46:02 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::ccab:b5f4:e200:ee47]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::ccab:b5f4:e200:ee47%6]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 16:46:02 +0000
Date: Fri, 23 Feb 2024 17:45:50 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Message-ID: <ZdjLvrBhW+NIcp85@boxer>
References: <20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de>
 <CAKH8qBsCrYuT+18CsydQ5TeauRzu0Hdz7mZQ2c0W7er0KrJnkg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKH8qBsCrYuT+18CsydQ5TeauRzu0Hdz7mZQ2c0W7er0KrJnkg@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0264.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::20) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|SN7PR11MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 056328ec-9db4-4a8b-2287-08dc348eebcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mt9tAAE8hdKsDCLaJO20IRsVFHJhyEczFz7GWsB3+37PNPDHtu6dBB5mq0Mk6/5OYpe9GI5epuQ7I1Lqkc3GS8egKW04Kiw8rFkcxL3lENjx1hcrXaELDeFaunmGSHNIS0VCqZni/HMk4SvjCul7t16bp4kCtDzHDiqDOs3Ib6lmfuFfvytf3vm0J9rgXIOP9vLzcGAV2l6lE3L1bnUhiUcjM3d1rfKLZOJvFnDKGuQLLZzup0XBkNOQ70lQqd+Wms1TkpHO4NSKfolBAYyaB5YaoZtpahPIzcJn3Rr7z/ooXhRxYQI68v40rAMMrqtd73Ffus+nl//YNnXDX5h44V3b1MhixD+wZoNHpuXW82V1ntcFFYv2icTlhXp+AXp3xuv+qrhbvdhrlcG5Z5ksAXDhJMVvQ/yNsij8KsBOt9y9szDL5FhOwdMGKw2Kul39NQsg4VNKqcbGl51jsgidu3xxdG22ZxjaQoejg0lU63cSc90e1v0eF3fqjDtnLB1smz0HVbn6VkFsWp3p3N1oRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6117.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxUcWRQeDdqV2YzaGtpTllPSERyUitFY2h3cWdwYjlodS9kNHNQajRWY1cv?=
 =?utf-8?B?YUFjTm1aUS9rL1NIY24wOFN1aTQ1cnA4TE1lV3FhcGxQc0lYSnFSUDVyM0I1?=
 =?utf-8?B?OEtJRytYdU16aGFzaVo4OVhCZDI0V1o5Vk8zUmZ0QlRXTFIzTkt6R045Q1VS?=
 =?utf-8?B?VDBIZFZISGNNMjZWS1BFT0VLZi92SXJxZlJTdkhRaGtxc2NJQTFVRURsbU15?=
 =?utf-8?B?SExSaDFXMnBHR1JoMXJoVk8xcHg0d3d2V012VU1wRlZxU3BhM2FOaU1MaStE?=
 =?utf-8?B?UHZyeHhOaUdvd1dkLzdtbUF3RlhlVnU5NnlqZ3hleFM5ekU5bUh3TlJURGw3?=
 =?utf-8?B?N3ppWk1TVGxIWFlaVG04TndmK3Q3ditCaTF4ZzgvUHF1ZTVscWUzekVBTzA5?=
 =?utf-8?B?WXAxcEg3ZXpWYUFWOW1tRGUvOXcwSWNmTjBUM2NhYVpXcmI5M0dRckhQSC9V?=
 =?utf-8?B?SGFpM1FFekpnSExWaHFFUlpnWWF2andaR2hSdmRmT0RsTEh0VndrVXB2dDM3?=
 =?utf-8?B?ZmNPd21hUE8zanVOZU1rOXo4VE9pK2U0aW5GUkxKemJvWGdVK2xtaW1kM0gy?=
 =?utf-8?B?V3VjWktnMjJVMHkxeDNiOVRXUnNBdThJMng3ZncyalREM0dCYU41WTJHK3VG?=
 =?utf-8?B?cW00VTBCUEVtWWpGY1NwYTJCK3BlNHpQcmJScFdtQjdJYURwOHJON0JIa3Y4?=
 =?utf-8?B?ekhtdGhlR2lud2N6b3NSU1VQa3pObktFQlhMdXg0bFdDMmVWSGhRZndHZWk2?=
 =?utf-8?B?ZGIzdGpPa3BlSkVVcnNBT0grcGh5SXlmWTBxcDV4djZKQjNSRG5ZN0xHZ1ha?=
 =?utf-8?B?S0JlUGVqZ3hoa01hZEMxUUZmR0VxV2ZyKzZnb01uaHFiQzcxdnYyWGFoZHNX?=
 =?utf-8?B?TGlUVHhPVmpNQklCSytlejY5VGpuOUZ2d0Z2Sjc1SlV2M0xEQjRuWVQ1TjNX?=
 =?utf-8?B?Z1JGUVZYUjZKb3hvenlXb3hLNldBYThCZzRHbVkxdUdORXhLUWhZVkorc3J6?=
 =?utf-8?B?eVcxTVQ2OVJ0dmhoVlNFbGpsMk14YjdiTThBT1U1QWE4ZCtzTW9WZjNFMWlQ?=
 =?utf-8?B?OHJWN0VtcU5hVGxUWFlFWDdzL0JxdzNYb2ZTMjd1QUIwdHpwSVZJSE9TN2M2?=
 =?utf-8?B?ckI2L1B2WndBekN2YnhKUDEzUmxXOFVJLzdEQytWdVJjNW9yUTh5SEFaQXJn?=
 =?utf-8?B?OWdLRllLMlpLZ3haNGd5UnNuZHNrdGhaWDJuWFJpMnQyTGhETkFFSGZkSHlH?=
 =?utf-8?B?NVF6aG1xOHMyRUE3THdDZGMzak5OL0ozWWowNHlEV0FzaEtnVlY1WnhKT3Rj?=
 =?utf-8?B?THA5ckczY1VUU01BU05qa0V4dGJkSTBoUXhtUy9MMmVJbGo1ZzNwRkFmQWVy?=
 =?utf-8?B?UkhLV0RxVlVJVnRlSXNZdTdNdThmYXdBdzc2Smd1cDFxYWpyYTBhWWxJSHdm?=
 =?utf-8?B?KzNJL0c4b0hlRjIrSUxRcEdsc2dPL3VPSmNVTTRwTWE0QXIrRklkcWZVZE8r?=
 =?utf-8?B?MXA1Z2YwK29VVTNFbHJGY05WSVJvaC9sSmxBR3NFMlpyVHNjR21lOFRXR0RQ?=
 =?utf-8?B?dk51VEZnVk1OT2V4OFBoU3YvZG1Wa2tqWEl1WWVOQWRQdWxjKzRmcmFmNUpp?=
 =?utf-8?B?dWhpZjNNSkJCOHdINXE0cCtxL0NVSlZISGxQNDdHeXNFdnpjK2g3K2ZuUTZF?=
 =?utf-8?B?YVRZd2ZOZFFkVUlFSURXaFBpcGd6S3J2aE40NXBsd040YWgrbW8xV3ovTHhZ?=
 =?utf-8?B?cllUY01jOUZoOHpPV1czYXRNMTc0OW9qeTd6c2Y2VVBhN3dWMDZaZnRvMTFj?=
 =?utf-8?B?Z0RlZGhFV204TS91VmxjUWhVWEZYaDhzU0NWQmhYMUFOWkJjdjNkeWNYWW1G?=
 =?utf-8?B?UzhWRnZZTnhrRmNJV0lFVW9uM014UXZlVkU5dHBnMWRLNzd1UU5QSkpHSjZW?=
 =?utf-8?B?dTNEOFpoaWNyak1MU3ZtUGZESmFOcUN3aUNWRkNyT2xjbWh0R3FIcnE0Qkhj?=
 =?utf-8?B?LzVqcUkrWWM4UzRRZmNZQ0xtcm1GeXJtNlFndUl1NDZ2T3lKV3p1Q1k3RjAy?=
 =?utf-8?B?RnpoTGNKYnMwQng0SlNSR25ONTc5alc4dUNuQnIzci9VZDNITC9iaFlmMlcr?=
 =?utf-8?B?REErWDh3U3IwZmg5RmR0em94VXExWnhoK29kWlF3d25EdTNiaW1wV09KenQw?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 056328ec-9db4-4a8b-2287-08dc348eebcf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 16:46:02.7301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlrsM2OqU0Df6o5BWelVQUmxgJofDnTmDr4GVq1sq+k4pz9V5AWVbHGTCI/r+siKKGP3ck58M1TLxlyQcjiPPzr0KMyWqwVebIQHIywFEMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6825
X-OriginatorOrg: intel.com
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Complete meta data only
	when enabled
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

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTE6NTM6MTRBTSAtMDgwMCwgU3RhbmlzbGF2IEZvbWlj
aGV2IHdyb3RlOgo+IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDE6NDXigK9BTSBLdXJ0IEthbnpl
bmJhY2ggPGt1cnRAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPgo+ID4gQ3VycmVudGx5IHVzaW5n
IFhEUC9aQyBzb2NrZXRzIG9uIHN0bW1hYyByZXN1bHRzIGluIGEga2VybmVsIGNyYXNoOgo+ID4K
PiA+IHxbICAyNTUuODIyNTg0XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIg
ZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMDAKCndvdWxkIGJl
IGdvb2QgdG8gZXhwbGFpbiB3aGVyZSBpdCBjb21lcyBmcm9tLCBubz8KCnhza190eF9tZXRhZGF0
YV90b19jb21wbCgpIHdvcmtzIG9uIG1ldGEgPT0gTlVMTCwgaXQgZG9lcyBub3Qgc2V0CmNvbXBs
LT50eF90aW1lc3RhbXAgYW5kIGxhdGVyIG9uIHhza190eF9tZXRhZGF0YV9jb21wbGV0ZSgpIHRy
aWVzIHRvCmRlcmVmZXJlbmNlIHRoYXQuCgo+ID4gfFsuLi5dCj4gPiB8WyAgMjU1LjgyMjc2NF0g
Q2FsbCB0cmFjZToKPiA+IHxbICAyNTUuODIyNzY2XSAgc3RtbWFjX3R4X2NsZWFuLmNvbnN0cHJv
cC4wKzB4ODQ4LzB4YzM4Cj4gPgo+ID4gVGhlIHByb2dyYW0gY291bnRlciBpbmRpY2F0ZXMgeHNr
X3R4X21ldGFkYXRhX2NvbXBsZXRlKCkuIEhvd2V2ZXIsIHRoaXMKPiA+IGZ1bmN0aW9uIHNob3Vs
ZG4ndCBiZSBjYWxsZWQgdW5sZXNzIG1ldGFkYXRhIGlzIGFjdHVhbGx5IGVuYWJsZWQuCj4gPgo+
ID4gVGVzdGVkIG9uIGlteDkzIHdpdGhvdXQgWERQLCB3aXRoIFhEUCBhbmQgd2l0aCBYRFAvWkMu
Cj4gPgo+ID4gRml4ZXM6IDEzNDdiNDE5MzE4ZCAoIm5ldDogc3RtbWFjOiBBZGQgVHggSFdUUyBz
dXBwb3J0IHRvIFhEUCBaQyIpCj4gPiBTdWdnZXN0ZWQtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIu
bGFuY2VyQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEt1cnQgS2FuemVuYmFjaCA8a3Vy
dEBsaW51dHJvbml4LmRlPgo+ID4gVGVzdGVkLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNl
ckBnbWFpbC5jb20+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvODdy
MGg3d2c4dS5mc2ZAa3VydC5rdXJ0LmhvbWUvCj4gCj4gQWNrZWQtYnk6IFN0YW5pc2xhdiBGb21p
Y2hldiA8c2RmQGdvb2dsZS5jb20+Cj4gCj4gTEdUTSwgdGhhbmtzIQo+IAo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDMgKyst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+ID4gaW5kZXggZTgwZDc3YmQ5ZjFmLi44Yjc3YzA5NTIwNzEgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gPiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4g
PiBAQCAtMjY3Miw3ICsyNjcyLDggQEAgc3RhdGljIGludCBzdG1tYWNfdHhfY2xlYW4oc3RydWN0
IHN0bW1hY19wcml2ICpwcml2LCBpbnQgYnVkZ2V0LCB1MzIgcXVldWUsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2tiKSB7Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0bW1hY19nZXRfdHhfaHd0c3RhbXAo
cHJpdiwgcCwgc2tiKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHR4X3EtPnhza19wb29sICYmCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhwX3R4X21ldGFkYXRhX2VuYWJsZWQo
dHhfcS0+eHNrX3Bvb2wpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBzdG1tYWNfeHNrX3R4X2NvbXBsZXRlIHR4X2NvbXBsID0gewo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5wcml2ID0gcHJpdiwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuZGVzYyA9IHAsCj4gPgo+ID4gLS0tCj4gPiBi
YXNlLWNvbW1pdDogNjAzZWFkOTY1ODJkODU5MDNiYWVjMmQ1NWYwMjFiOGRhYzVjMjVkMgo+ID4g
Y2hhbmdlLWlkOiAyMDI0MDIyMi1zdG1tYWNfeGRwLTU4NWViZjE2ODBiMwo+ID4KPiA+IEJlc3Qg
cmVnYXJkcywKPiA+IC0tCj4gPiBLdXJ0IEthbnplbmJhY2ggPGt1cnRAbGludXRyb25peC5kZT4K
PiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
