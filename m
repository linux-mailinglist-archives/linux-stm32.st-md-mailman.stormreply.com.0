Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E538CA16A56
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2025 11:06:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 969D5C78002;
	Mon, 20 Jan 2025 10:06:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C024C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737367615; x=1768903615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z1pJoTZp3iVG2ZEUmyVpgWOgTJniz+HeeI9Z7Ve+QFw=;
 b=WI75lIPgDkId88Gjw7ydHvtdN9ywbXp4gBG+uQEDwcr3W3ztJG2NIrtm
 WjL4Bo+lPg1w1vGL1Bp/8fP98uiE3Grt0MmR++DnWkAEcrc/smH0H+trN
 KoWd3jocOW4HR/oun34sVImz+KxSkdxTRn6grpgAUk8O9Xi4UYvPb2MQ9
 UsFJOR76vLc6q9+gRdZf+fchSIaqKUEoEzTB9l5Za1X9NXQL4o9S8JEnJ
 uL1Y1JVFx3b16VRPlNRnFiksKJUCcX0PLyt060FcKNqzsYPKdbuBGevD6
 dTYdLsGvx6+rMH/Ou9+sN7CWMNrwEWKsyGjNbC6xSrm57CCLv8ry9Tx2+ w==;
X-CSE-ConnectionGUID: 1jeIaVIZT8ew5ptnHIephg==
X-CSE-MsgGUID: XOoCY57TQg62P29LldeRmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="25346649"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="25346649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 02:06:44 -0800
X-CSE-ConnectionGUID: wzz/i/yKQO+9MTEy71NuWQ==
X-CSE-MsgGUID: qLjz9ApMQGq6YVuoRDlD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111082926"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 02:06:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 02:06:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 02:06:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 02:06:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFuhOSTG9f4EIegeCRXXF1MCIamzb/iMIyHa1lH7IR0ofRUqIM+xHDovQNq1OF8ZZOJlIAjv3TqQEaBHo0WtigZZgpf9bredMqbiY/nBiSx4d1AAhwcB8iaqTrVdn/rPGb9Iz6GrUy+cUmgKYzWMJXpA9bX1DI1WX4vlG+AD8Fm4TQ4PKIdOU/EVyqh4KGnkcg7IjVg+TNX2PEyLAcSCViOZfDMJQiY+QSgaJ49AFA6x5EsV253vLdkJqB4+Zw+V+DlYTjBqgOnUnoH17Rn5hvgGjNrwxKoiPt7L6UdzRJKtfMN1rNlM1eZeHJBKGPFLYqb5UyHzmpcPlYrOJpBknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1pJoTZp3iVG2ZEUmyVpgWOgTJniz+HeeI9Z7Ve+QFw=;
 b=oC7cjR0Egn7RxEvnYv53lnKZeNKQGTVtIVcJpSqmPrIF1wYw4rWoEwh5XSwYZ0EsvhCpFofUE30URtiahQCfc9sVbToBweihe2hVvln+bY9qgZOIgplDmUMUym9c32ZaDH1IfdyqLa7/NJAeF4X7XMp27ulk7gyvW91GICQ1fqnIWyxYRm9DVyViHc7sRi/xO3kYPyZ5FjGFaEIL0CANdmIdaf/fejSJWUp9DZNCITTwFFQTF9eMPKaNqgyXbH4mPbwRS+InT1J18WDutmLMAbUbcHq2+ZR7E5z7Vsio/nHJhP6kB+LTIg5hV8/k0N9Sca6zumvOYVzdKQW9c4+wLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Mon, 20 Jan
 2025 10:06:25 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::c80d:3b17:3f40:10d6%7]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 10:06:25 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, "Bezdeka, Florian"
 <florian.bezdeka@siemens.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>, "Karlsson,
 Magnus" <magnus.karlsson@intel.com>, "Fijalkowski, Maciej"
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, "Damato, Joe"
 <jdamato@fastly.com>, Stanislav Fomichev <sdf@fomichev.me>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Mina Almasry <almasrymina@google.com>, "Daniel
 Jurgens" <danielj@nvidia.com>, Andrii Nakryiko <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
 <przemyslaw.kitszel@intel.com>
Thread-Topic: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
Thread-Index: AQHbaC8B2aD+Y8oJSU6tHVAr+g1K37MfN+iAgAA5yMA=
Date: Mon, 20 Jan 2025 10:06:25 +0000
Message-ID: <PH0PR11MB5830CB1F9EC76D45FA3E0C56D8E72@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
In-Reply-To: <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|SA2PR11MB4987:EE_
x-ms-office365-filtering-correlation-id: e696855d-f435-42ea-2b23-08dd393a1954
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TUlDNnpYRWdhSER0Sm9OblVqMVNEcmo4eThnMzJiQ2p6VTZuSU83Q0I3MHpI?=
 =?utf-8?B?TjlYVU9EcndKTS9LdWJJK2pRMVpnL3NNVjlBNmxzQmJUeFIrakZ3WmVuS2k3?=
 =?utf-8?B?eHAvK20wTmRoRWMvVDRjYUh5V29LRTNXSnh4Z3hIYTB4cnNsbXQ5Zy94c0JO?=
 =?utf-8?B?czBmaTBYSzhUU3hVN2NuV0lsV1FySFpRRWN0dkJoZktuL1pEeFIrcVlIaUI1?=
 =?utf-8?B?cDBBM2pleGlUbm5kaXhLYTcvQldiNjhRZEphMkZNOVNuRi9RWkNBdlNYSG9t?=
 =?utf-8?B?WWplajhYc3E5blc0S04yeW5KMGxwcUt6Ky8zNHpUUlAyTUh3SHdtTU9Md0JL?=
 =?utf-8?B?K0xjVEVSYkM2dDZ1MXI4QWpDTmUyM0tVSTFjS0pON1ppZHVJbzB1YVZVOHAv?=
 =?utf-8?B?Wml6VTBBQlYxbWhhVCtFUC81U0ppNE1yQXZGZU5kOFpLMWtaUE9hVVV3TE1I?=
 =?utf-8?B?U2R4bWZJWTRPaEgvbmk1eVZjRzlvN3RkVEdkci9vN0dEWllQMFllYnV6VUND?=
 =?utf-8?B?aXBhRUhNM3QweWVJeFM3UkpXQVQ4TzVQb1ptZVhuUU1nOWMrcEZBOUl6d1NP?=
 =?utf-8?B?WXJKTi8wY25ManczSmlrTXpnYXVaK3F0amlpS29icVJRTWNYVUt2YXNzUW1W?=
 =?utf-8?B?VUlHL3pHMnpYakl3b2l1RnJDdnEvZWZNcDN2RHRjQUdlZmI0YlcyQzNiTFJJ?=
 =?utf-8?B?d0RzeDU4MmpmbTAxS0JnaEtYZVRDVW10K0RNdGtYUXhzSHFpR1Awb2hWdXZL?=
 =?utf-8?B?OTR6K0V4aUtOWDVGM1ZwcmtoOVJWN1ovbVg1b3BaQkJQTmVMSllueGRkcUln?=
 =?utf-8?B?bkpxRGVXRithSVJrMFlCcS9CNnNPVExxWDMwanovbk5xZ0NyUWlrOUMrZUZP?=
 =?utf-8?B?M1FaM0M5TTBXWW8rZzFyRmNEdDVPcFNDa3l1SHVOQTRmQ29OREtRZU9QTnlC?=
 =?utf-8?B?d1VZUUR6T01hK2IxY3Vua3UyYWpTSkhCa01mL29CdldTRG9ySzF3cnd6ZDJv?=
 =?utf-8?B?aDRFYTJHeTloL0VVRlh4bGhPNlV6dmtWMklSSGpLMmRtS2g0MW5KMWdVWDU4?=
 =?utf-8?B?YTVpUkRLckZYUmd0eHZMcGVPOHBrZFk2ZTc3Z1d4UkE3U1R2eE8zUkd5RFRt?=
 =?utf-8?B?bTFySTZUVm05Sm9yYlVaSm9nZHkrTEg4dTVOMFNDN2NmZzVJQnR6a0l3Z09r?=
 =?utf-8?B?VXJUUFhMdzhDUzczaXg2MmVVT1A2UitUMEtsSWxreVhWN1hMTE03eWk4blg4?=
 =?utf-8?B?NVpFa0cvb1hmOW84OW9EUVF0Y0NlNGFsRFRYWmtRZTcrakRQTDZSU2NwVTQ2?=
 =?utf-8?B?MWdDMjNDQTJlRXlKS2U4Z1Y4a0tLeThJa2dLbnhWMmF6L3A3dHZvbHM3WFZj?=
 =?utf-8?B?UDlCK3lBbW04Z21xN01SbDdTVFNIRzh0S0M0SEFwZHluYkRSaUxUVUY2U1or?=
 =?utf-8?B?MkNXSU4zVnFGWWlvSGpTUmhCZWlZZ29TWWRtWkNLcGduYUdpTTMrZ3hQNW1l?=
 =?utf-8?B?K2ZEUlk3SUZsN1V1Y0ZSSWZZcnJuWG56Y2lZbXEzZkNtTWQ3dWluMEk0K0hr?=
 =?utf-8?B?VW5DM2g3L3pkYytWMnlKdU1WTjRwRVBtWHVVWGVTQmJLd1JORUNheXJQM0ti?=
 =?utf-8?B?UVlXWXJUcDhITVVLemZpN2tUV2hKSmFXR2ZPZThhYytkcDJqQmFVTDJMUTlJ?=
 =?utf-8?B?ZUZQVDRwcTB3RW9KTGlnc0lVVm52MXViVEZzNFJIR3RFT2F6b0J1UlV1d255?=
 =?utf-8?B?UEgyekNqaHQ5dDg0Q2NoNWRncHdRZ0pMU2swUTVvYmtkMCtkQkxKTU9SQ1Vr?=
 =?utf-8?B?Y2p0b0hLOEpFbjNUWmZ5OTJSRHhoNVhwWEZZTzZSSExROGlrVHk2S3VGVFBl?=
 =?utf-8?B?Z0ExanZSclFoNHlEUHhDdXluL29EY3pmTGdsMDUzc0JISWV6TUFOcnlWNmND?=
 =?utf-8?B?NHN5STI3bzVhYzA2bDFIamxxamNka3VBaGhCdFZhUlBmVlQ3UVBrUU9CZTk3?=
 =?utf-8?B?c09ZRW16Qk53PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGcvZWdrMk1aTzR2WS80OU1wV25RaTZNZEZpQ3B6WllJVk1Cbm5wYnBSdlpR?=
 =?utf-8?B?akZzUGlEZVArQWZ1MDJIbHR4alU1eXZmNG1xZFZwSlRIMHE1YzlVaGZpaER0?=
 =?utf-8?B?bWpFMnZrcWs2Nkt1RzlmV0w4TndyNGdaeHJTRDU2RmJEV2xrYXFrT1h2Zy9M?=
 =?utf-8?B?WXZnclRXK016a2xScWdTNXErc1BnNFdTZG9rRDBNMmtxd04rOTZqU0pXVjZp?=
 =?utf-8?B?MkkwWUIzNHFvNnptVFBSL1RIRU9oS1pHdjVXcC9kSXVKUHlJUWF3eTZQdUN5?=
 =?utf-8?B?Nk5LalFvTkhCZU1FV245T2tlbzNacXNCUHFWdW1pMXF1UHRTWU5sd3M5S05h?=
 =?utf-8?B?a3VlWkJ0Vm9QQVV4azJZNThZdXFFZCtoNDJvT3U0TG1kU1pDMkROV1B2eG93?=
 =?utf-8?B?ZE1sUFhUMTJWSEVkSVlDdnM1VGFQdnJLNFYxZndjbUNpYjJIZkZSWjByTGR0?=
 =?utf-8?B?Lys2NDEvSU1LdTJwS1RneWdrMkxFQW1PN08wVDkwb0R5QlZJaXhiVzBMQ1BP?=
 =?utf-8?B?QUQ2TmVtZUp4TEtpcWhEMnhNV1FwRE1uYkl0WUJETXdYR0t4aldtdk51RDZC?=
 =?utf-8?B?NE5zVnJ2R0ZCenlCTlVJQTIrcEs2QUhpcHQvb1Qwd1BXelJlNzFiWEJrT08y?=
 =?utf-8?B?eGx0cmY4NkdFU2RXMEY3QVRPOGRQUEV3MzUwcVNsN3Z5dUhRSjhTa25nUmsx?=
 =?utf-8?B?RTBObE0zOGMvSHJJT0hQU0xjRmNwZGdtVlhlOGRaTk1qSHRrc3hhUlNLQmJR?=
 =?utf-8?B?M3ZhNzd2K3d3WG9EYTR5dCtkV1EyZW80OVlqTmNKTk5jbU10a2ZHMmg1ZmlL?=
 =?utf-8?B?cnZFWXgydlQ4cjRQQjdFNUo1YzJIMnA5OXdZNW5wMUd0OGN0TTZSZzcrcU5y?=
 =?utf-8?B?NzhIR1FEVkJQT09IakpFZlZ3ZmhzbE1udFBCWFlaZmJhU2ZPMkVDZjQ0c0px?=
 =?utf-8?B?YUtiU2dzZW1XOGVMOFVITGRMRmM0TnRRQnV2cjhqRjlvZnMvdTJwMU1wd1Ro?=
 =?utf-8?B?THpvNThGTWxjQjdhVUtibGY5QVVNbGNlcVJSTGwyR3hlSUFRWFRPZG9leFly?=
 =?utf-8?B?d3BURHhHZWpSK3pWdXRrMExJb1h6dXhyRTN0S3ZZNUdXRE5XTXdjeGZTK1dp?=
 =?utf-8?B?RkRSd2hFWkpPa2xUQmJFK25TaXVkQ0pTRnd0dXRwMkpZeUtuUmlwbG9WL2hI?=
 =?utf-8?B?ZnpRblhyQm5CVUNvRkUwQkhyV0loWDVSMEwvVHdNZGZXWFYrQ3k3eWdDTWJF?=
 =?utf-8?B?bWV0RE8vbzh2a1BvaDAwSnBwM1QvN0dkQXlneW9pQ1JTT1d6cEN5K1FUWHN3?=
 =?utf-8?B?ajBYem9WUjJnNS82cHlKQ0hlNTVRbnJwazIzQ3l1Z3lUR1k2OU1TMVBaWEhJ?=
 =?utf-8?B?MlM3SlZUOVJLQzVXcmwvQUY3NlZFTkpDNkRyYk1wNUJad3dmdXBVKzRkb2NZ?=
 =?utf-8?B?MHdwQ1pndndlS1VidEdoaTB1NlJISGhXeGtKMjJvTDFDR2M5SHBIdzc3U25G?=
 =?utf-8?B?WmJYSzFWS2dqZFRrdkRlM1pZY0xudCtxMFFHUk1BaFdSb3hQUE9zTzBRbnhX?=
 =?utf-8?B?OWZ3NmszRlBRbVkvSXRmaWlYb2x5YmNPWElpM3ZyZ0hkWHArUFgydlVqeVV5?=
 =?utf-8?B?T0JXTEpPbjluZE9GL3BoV2FibGRidm9KVkVUc1RWZVFyWmp1NHN6VkthblZv?=
 =?utf-8?B?QTNKK20zc2RsTU1oR0VJcXI0bXRLWUVKMzZ4SmxpWWZpYUdpdlgyNXVKQTJW?=
 =?utf-8?B?bzNhUFJRbzFIL0ZoNitaejh6SDkyNk51bFRrOXBEU1VzY3ZOVWtoV2REV0Ja?=
 =?utf-8?B?SHcvQ25hOXhEQTA2ZXFMck9MVThQaVVTaUlNVzdEemUyTGJqalFIaE92emx4?=
 =?utf-8?B?bjkzcFB5bjVnU1RjUXFTMHJlOGJPbG1kWGR5dnUwSDI0WFBBSy8rTHJPZFNO?=
 =?utf-8?B?blhWdWo1cTRKeHZ4RU96VFlNWC9tVGZoSDMvalBBRzY3dlk3WGdWblJqRTRE?=
 =?utf-8?B?RW43aFJqWFRKUUFoQUN6TmJ5OExVclVJc2lqancycnovSXRnTzRUTW9LaUZU?=
 =?utf-8?B?a2xtbDVIdDlXNjc5Z05rNjdZZ1djcnJ2S0JGeW1lSXEwMGhEL2RxY1JoaGU0?=
 =?utf-8?B?L1JveFR5dUYrYzNWaXBpVGxicEF2bU1zYzFKdVkwNjBvOVpaUVhrRjVsTUI5?=
 =?utf-8?B?NWc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e696855d-f435-42ea-2b23-08dd393a1954
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 10:06:25.1727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0oBEAu41yWn7ucu6ZqC5MmG1lSu4UWXZLTqZt3FyD0WTWqXf+Dr+1U8ojr43KtKMyhl4ebxNKI/c7dFlBFvdJmRipPUuuPjcx3qii3qKvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v6 4/4] igc: Add launch time
	support to XDP ZC
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

On Monday, January 20, 2025 2:26 PM, Abdul Rahim, Faizal <faizal.abdul.rahim@linux.intel.com> wrote:
>Hi Siang.
>
>On 16/1/2025 11:53 pm, Song Yoong Siang wrote:
>> Enable Launch Time Control (LTC) support to XDP zero copy via XDP Tx
>> metadata framework.
>>
>> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
>> Intel I225-LM Ethernet controller. Below are the test steps and result.
>>
>> Test Steps:
>> 1. At DUT, start xdp_hw_metadata selftest application:
>>     $ sudo ./xdp_hw_metadata enp2s0 -l 1000000000 -L 1
>>
>> 2. At Link Partner, send an UDP packet with VLAN priority 1 to port 9091 of
>>     DUT.
>>
>> When launch time is set to 1s in the future, the delta between launch time
>> and transmit hardware timestamp is equal to 0.016us, as shown in result
>> below:
>>    0x562ff5dc8880: rx_desc[4]->addr=84110 addr=84110 comp_addr=84110 EoP
>>    rx_hash: 0xE343384 with RSS type:0x1
>>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to User RX-
>time sec:0.0002 (183.103 usec)
>>    XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User RX-
>time sec:0.0001 (80.309 usec)
>>    No rx_vlan_tci or rx_vlan_proto, err=-95
>>    0x562ff5dc8880: ping-pong with csum=561c (want c7dd) csum_start=34
>csum_offset=6
>>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW
>Launch-time sec:1.0000 (1000000.000 usec)
>>    0x562ff5dc8880: complete tx idx=4 addr=4018
>>    HW Launch-time:   1734578016467548904 (sec:1734578016.4675) delta to HW
>TX-complete-time sec:0.0000 (0.016 usec)
>>    HW TX-complete-time:   1734578016467548920 (sec:1734578016.4675) delta
>to User TX-complete-time sec:0.0000 (32.546 usec)
>>    XDP RX-time:   1734578015467651698 (sec:1734578015.4677) delta to User TX-
>complete-time sec:0.9999 (999929.768 usec)
>>    HW RX-time:   1734578015467548904 (sec:1734578015.4675) delta to HW TX-
>complete-time sec:1.0000 (1000000.016 usec)
>>    0x562ff5dc8880: complete rx idx=132 addr=84110
>
>To be cautious, could we perform a stress test by sending a higher number
>of packets with launch time? For example, we could send 200 packets, each
>configured with a launch time, and verify that the driver continues to
>function correctly afterward.
>

Hi Faizal,

Thanks for your review comments.
Sure, I can send continuous packets with short interval and share
the result in commit msg.

>> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
>> ---
>>   drivers/net/ethernet/intel/igc/igc_main.c | 78 ++++++++++++++++-------
>>   1 file changed, 56 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/intel/igc/igc_main.c
>b/drivers/net/ethernet/intel/igc/igc_main.c
>> index 27872bdea9bd..6857f5f5b4b2 100644
>> --- a/drivers/net/ethernet/intel/igc/igc_main.c
>> +++ b/drivers/net/ethernet/intel/igc/igc_main.c
>> @@ -1566,6 +1566,26 @@ static bool igc_request_tx_tstamp(struct igc_adapter
>*adapter, struct sk_buff *s
>>   	return false;
>>   }
>>
>> +static void igc_insert_empty_packet(struct igc_ring *tx_ring)
>> +{
>> +	struct igc_tx_buffer *empty_info;
>> +	struct sk_buff *empty;
>> +	void *data;
>> +
>> +	empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
>> +	empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
>> +	if (!empty)
>> +		return;
>> +
>> +	data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
>> +	memset(data, 0, IGC_EMPTY_FRAME_SIZE);
>> +
>> +	igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
>> +
>> +	if (igc_init_tx_empty_descriptor(tx_ring, empty, empty_info) < 0)
>> +		dev_kfree_skb_any(empty);
>> +}
>> +
>
>The function igc_insert_empty_packet() appears to wrap existing code to
>enhance reusability, with no new changes related to enabling launch-time
>XDP ZC functionality. If so, could we split this into a separate commit?
>This would make it clearer for the reader to distinguish between the
>refactoring changes and the new changes related to enabling launch-time XDP
>ZC support.
>

I am ok to split the patch into two. Will do it on next version submission.

>>   static netdev_tx_t igc_xmit_frame_ring(struct sk_buff *skb,
>>   				       struct igc_ring *tx_ring)
>>   {
>> @@ -1603,26 +1623,8 @@ static netdev_tx_t igc_xmit_frame_ring(struct
>sk_buff *skb,
>>   	skb->tstamp = ktime_set(0, 0);
>>   	launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag,
>&insert_empty);
>>
>> -	if (insert_empty) {
>> -		struct igc_tx_buffer *empty_info;
>> -		struct sk_buff *empty;
>> -		void *data;
>> -
>> -		empty_info = &tx_ring->tx_buffer_info[tx_ring->next_to_use];
>> -		empty = alloc_skb(IGC_EMPTY_FRAME_SIZE, GFP_ATOMIC);
>> -		if (!empty)
>> -			goto done;
>> -
>> -		data = skb_put(empty, IGC_EMPTY_FRAME_SIZE);
>> -		memset(data, 0, IGC_EMPTY_FRAME_SIZE);
>> -
>> -		igc_tx_ctxtdesc(tx_ring, 0, false, 0, 0, 0);
>> -
>> -		if (igc_init_tx_empty_descriptor(tx_ring,
>> -						 empty,
>> -						 empty_info) < 0)
>> -			dev_kfree_skb_any(empty);
>> -	}
>> +	if (insert_empty)
>> +		igc_insert_empty_packet(tx_ring);
>>
>>   done:
>>   	/* record the location of the first descriptor for this packet */
>> @@ -2955,9 +2957,33 @@ static u64 igc_xsk_fill_timestamp(void *_priv)
>>   	return *(u64 *)_priv;
>>   }
>>
>> +static void igc_xsk_request_launch_time(u64 launch_time, void *_priv)
>> +{
>> +	struct igc_metadata_request *meta_req = _priv;
>> +	struct igc_ring *tx_ring = meta_req->tx_ring;
>> +	__le32 launch_time_offset;
>> +	bool insert_empty = false;
>> +	bool first_flag = false;
>> +
>> +	if (!tx_ring->launchtime_enable)
>> +		return;
>> +
>> +	launch_time_offset = igc_tx_launchtime(tx_ring,
>> +					       ns_to_ktime(launch_time),
>> +					       &first_flag, &insert_empty);
>> +	if (insert_empty) {
>> +		igc_insert_empty_packet(tx_ring);
>> +		meta_req->tx_buffer =
>> +			&tx_ring->tx_buffer_info[tx_ring->next_to_use];
>> +	}
>> +
>> +	igc_tx_ctxtdesc(tx_ring, launch_time_offset, first_flag, 0, 0, 0);
>> +}
>> +
>>   const struct xsk_tx_metadata_ops igc_xsk_tx_metadata_ops = {
>>   	.tmo_request_timestamp		= igc_xsk_request_timestamp,
>>   	.tmo_fill_timestamp		= igc_xsk_fill_timestamp,
>> +	.tmo_request_launch_time	= igc_xsk_request_launch_time,
>>   };
>>
>>   static void igc_xdp_xmit_zc(struct igc_ring *ring)
>> @@ -2980,7 +3006,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
>>   	ntu = ring->next_to_use;
>>   	budget = igc_desc_unused(ring);
>>
>> -	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget--) {
>> +	while (xsk_tx_peek_desc(pool, &xdp_desc) && budget >= 4) {
>
>Could we add some explanation on what & why the value "4" is used ?

It is because packet with launch time needs 2 descriptors and same goes
for the empty packets. Thus, total need 4 descriptors. I will add detail
explanation. 

Thanks & Regards
Siang

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
