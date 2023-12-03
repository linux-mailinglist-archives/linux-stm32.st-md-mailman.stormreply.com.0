Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D140802260
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Dec 2023 11:11:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E22EC6C841;
	Sun,  3 Dec 2023 10:11:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C49AC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Dec 2023 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701598267; x=1733134267;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OdMJyiw3DiY+G0Ay2wmzthMQTlDCu7QMZaNts/6fyjs=;
 b=hg6e4YIzDvjrOkJZHwujUFV+i/+rjyRmAqiYatv4egwEGUX5+WjSV1Uw
 Gci5xPvbUdh69NJdQwF6byL+S4SdKEVfld98L2A3zT4mWwtfhvpSxWWYW
 GTjylzy55wgedfXbPWuCgR+wIVrpRFtj8yIT7KOhHABCi24xQYF+3b5K2
 JN1tNbyDsmPw/cD0v8KyzxxYyzaT6IbQ3OgTHc01DU1e0pE7WOVcFQZHy
 MLOystB9UlVQAVv4QuPA3fZhu362kvSF7QZ/YQwNH+m2dRY8Jr0MOS1E3
 oV1RLVWJ4dDTz74ki4s1PFMinyUEXEEHzuBVksbHWYXLWimkXLebeCWVc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="492179"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="492179"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 02:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="773955638"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="773955638"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2023 02:11:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 02:11:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 02:11:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 02:11:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 02:11:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERUqQpQbBVKdp05E7Xxo/Ku1C/OHFEMQEw7Hur+YrN6WeyK6N9Ymw2ZR9thgH8nCuJ7JhoFT29vqgBhSXsOkcZfX5mmz2aH0rpk7ZAMHfjplyoVWKJxLIv46YMMAqVR0XO1RGaGH6Hh/77bRPxxdMwlYEzRZKJ07CDtZtKP/qc9tA+gjg5059UMEKqrxbTUjiH48l/gPxli2kUWn6rpaCV0lMQUww6Y5wiqWo/OgOX3j7IwvUORrxnLlgLTRDNcynpKyPbheEutz2yhmesnOvfC2TNVlOlkbAsWsVR0CxHz52gXOzbXkF+4K22ZH2Cn4qrHtSHZPM95OGl+79Ocx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdMJyiw3DiY+G0Ay2wmzthMQTlDCu7QMZaNts/6fyjs=;
 b=YQEaRbivzGKKBPZOinZOLZqE9CodZsp9g4Qm5Tu1EuoAQs2t0OzHsWUtUYqqMOjH/pPcAmjkLzEJPf3j4WCMT2x7dmbv3c6OAcFwTsEAZAYINsOxXhSffR5qCKm2XvdgVsgJx3VjjhnWoFYml+ZYRLe6IqsO3Lzahj+6JHaZmBAFFaNpTFPBU4PxkK8MJ8DPu8ZfGn9sZH7X/bO+9oIBS/kToH44gK/NA1TeptMeyGS9zkWFxXSCwH3kDIWRElCNkHD7rbpKxWfzp4i7YI2zlWemnlcDXdW+rtUpAiX2Wf5uefM615nO8YVvLHmDAqAxgXQWRUQfligRZKU6Vm2+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 10:11:02 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.028; Sun, 3 Dec 2023
 10:11:01 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>, "Karlsson, Magnus"
 <magnus.karlsson@intel.com>, "Fijalkowski, Maciej"
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan
 <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Mykola
 Lysenko" <mykolal@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP Singh
 <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>
Thread-Topic: [PATCH bpf-next v2 2/3] net: stmmac: Add txtime support to XDP ZC
Thread-Index: AQHaJB8y3IJpv0o6sk+7VcjRfinq5bCUhocAgALJsHA=
Date: Sun, 3 Dec 2023 10:11:01 +0000
Message-ID: <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
In-Reply-To: <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|CYYPR11MB8308:EE_
x-ms-office365-filtering-correlation-id: a3e02dbd-7670-4bda-925d-08dbf3e8271e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNAK58wAnxPujgwIL1u3i2eivOO4cwH3ypMMYQHKtqt+/3R7s+198H/u+6A5Ve8XjAA/gFdSMfmkDt1UjtGTamtGLK/HeYeI2MXN90lkPogO9eTRoPFNJiR5bnfzLCFT59HmvMKf4T4eQoRFMHfAiCsJBECqc/OwcoRO2zg7fOYRhkbxWBtYEdXQD0UWQObo2Ba8fFAaOksvbhq711p+ik3TjqubP2rQK90r9kS0XBkZw2cigYezDMS1XhwFxjmCdNlaAL66szZcT3sWZWAsfYPWUyRYue/yahIlZr/mPcLGG3js4RZc8DFXx4QQj3191yuV7mdxPcQMjZ4dY4ktkKh0aQ9RQNlgdyuj2+3nhTMkCTVZjQGtzXSTtXKzgU8X6gvEb5uuOyVmW3mcPFYDiemgzYG7Ywow/b2e+RqD4i6pWUMfnA1q8gQP20LVkBkI52mvs2ZMqPCIgPLB66Sq1IDxKeLZ0en7t0TJFc4GEWnLQyU45CeL4GGrotQcBbHCdaqYlh2hphsx189vnadAf5mri3KAYeruCEMUH++9yrlNBM5mzJ4aa68Zmqalo6DjHa6mmsmtw9Wul0NXOLZ6BHfCqQ3UwLu7YshO2QqmyELgh2QS/kLja8b+khpAHeSv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(366004)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(55016003)(38100700002)(122000001)(921008)(7416002)(7406005)(33656002)(2906002)(5660300002)(82960400001)(53546011)(83380400001)(9686003)(6506007)(7696005)(71200400001)(26005)(76116006)(110136005)(478600001)(41300700001)(54906003)(64756008)(66446008)(66556008)(316002)(66946007)(4326008)(8676002)(8936002)(66476007)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXFYMWtpZGZIWWx1V0JvdTZ3R2VNbU1lZzloU1BqU2NUYzF5R3EwVHhNcjh2?=
 =?utf-8?B?TmZCelBaVno3bzNDVXZUL041aFJoNTJhYTVsUmpLRHdxa3paWDQ0eUM1SG1H?=
 =?utf-8?B?UTBESlhKbkkzRzNidHF4V096TWNqbHhibkwwTS9jcnZ2V2N0TE9hMkdEQk96?=
 =?utf-8?B?LzZhQUZNZmFtY3hnWWY3Q1JDRDluVmRUWGRxQUt0YzR0c28xbHozWEpuTVdG?=
 =?utf-8?B?VjJpZE9kL213VWlNc3FDNTVXYjgvQjJYVkN0a1pwdWhMV3ZFOFB0UENHMm9l?=
 =?utf-8?B?OUpqN0RCcjFKRzVxb1VSL1RrYWJxQ3MxdjRYOThRTk15eHZrV0JLeWc5SjBD?=
 =?utf-8?B?SStuVXJLYlhuSlIzMWgyM2ozelVjQjNGN2xXVjgwWk5QNUdSdEtCY0hYZER5?=
 =?utf-8?B?R01ocDVFbmZuV1dER09FeVNpS2trbzBjVlhia3V6cUpmTi9YOGttZUg2S3Iv?=
 =?utf-8?B?aGZYRE1qWE9QMEdxZEMxL1ZqRURuMXJnNzd2Rzdtc3R1UzRwTEVFa3gzTWVz?=
 =?utf-8?B?Ly9qWklEcFdKMGhMbCthdE43WTdTQ1BhSjJydGc5T213WXAzSXVlUk40cURn?=
 =?utf-8?B?cFUwOG5oT1FFa1pQL1ZsaG1rYlBaaGxITUFMaWRsT2MwdVprVHlCdStuaEhZ?=
 =?utf-8?B?WnRwOThFTVBQVTdPamFhSEpUKzlacHlGTlE5d002UkllSFRHMmt5ZzRUajF3?=
 =?utf-8?B?REdqTzk1cFRUb0g1cExOZ0crSDZEdEZoUXVkMlJjOE83Tm9HWGZNM2RZZGth?=
 =?utf-8?B?dTMxQjFkQTJ4WDFMQTRZQlAwYks3UkIxdTRDamN2cFVqaXA1dndzdmkzdVk4?=
 =?utf-8?B?a1NGeHJFcnczalpkUEtOY3ZNSlUzZWhybFl3dU1jdXNQRXhDRTEwbnpaS0VC?=
 =?utf-8?B?N2kyV3pEK2UyQlFoaVEyQTdhVmN2eXczWTJxOFhUZVJEaE1UNDZ5c1dhR094?=
 =?utf-8?B?R1lPSXR6ZXlIenF3MWI0R0lXK0xBUFl6NVc4ZkNQRzRZcVZnNFZqOC9Edm5H?=
 =?utf-8?B?YzJBZnpQOWt1UW10bUlyaHM4UW1WdmJxcHI0ZWF1bXpBbWhaRWNLQXBWSjN1?=
 =?utf-8?B?T1A4ZW0zUC9WMlVmMFgyb3o4TkNPMWlGSHprdjdPbmRUN1Zoc212REYzUUtH?=
 =?utf-8?B?bnd6OWhPa1NZdXFUVjhxQVFrUnRic1FMNUh4SlhSSnh0dm1aeVhRQ3B3T3NW?=
 =?utf-8?B?bmQ1dDRjS1ZodWJNcEhBOTZqVnFzaEw0bmgxWWJtVEIyUm80SDhIeXZMaEJn?=
 =?utf-8?B?Y2dDeEZyTnZNQVNxckNYd1I0QmZWdmNETFFUcjI1b0hHcGd0Lzl6MktKWCtn?=
 =?utf-8?B?Tld6ZGk4akdCNWg1L2NPNEd5TUxUN1NVVTJyZjNlaHNLa3RiMnpVdlpCMXFY?=
 =?utf-8?B?WkE3M2Q2Q3JnMnlsRlZSMlFPU2l3cjlYemdjaXpqVmdkTFNJTHBnWTd0ZVRu?=
 =?utf-8?B?NXJPNmpTY0dRZjllOVk2MXViWGZPWUZFQ2FaT2V0aHovNkJ4eC9Gb2prQ0Jt?=
 =?utf-8?B?cEVFYlN3bXFlRURseXpWMVhXQmlUTVhUai9PMVlnVndkdlZXeE81TTJaMlJT?=
 =?utf-8?B?OEZmamF4NWI5Uk5heE1TTUQyWSt2Mmd2ZXFiSzM5bGcza1hBTGMwYUl1L05U?=
 =?utf-8?B?V01vMUhINjFXOVZ6eXpVeGFhM202djF0RXZ0b1dTNGFKVEtoSkVEeGdkb1Jl?=
 =?utf-8?B?ZENGZVQrSzJVMXlxR0I3SmlBRnlsbmJpZlRzem1BaTg0cGZSMEhrcjhrU0h6?=
 =?utf-8?B?ZFVjWndwVy96WFU5Zkp3Vnc2UnhUMnNzeVhCMFVSTEpBVTM5U3FLK0ZpUERQ?=
 =?utf-8?B?VVp0dS9UUzVJV1lQNGlzZHBUcThKT0tObDdYNWhxMDlwd2Y4V3F2ZjJIbjJY?=
 =?utf-8?B?SVBGRHA5Y0dndTZ6a2JkbWQ2YWlZbzlrdlBoOXhRUVh1Z0R5TDNBTFc5UVRx?=
 =?utf-8?B?RnpYcTdRWGhUKzBndWZjb2c1aW9kdFE1R0doa1pGUGVaV0o0eW50anZVd3Mz?=
 =?utf-8?B?cjRTQThqVE05NlgzWHo5TTFiM3ZnbWJpVWF3QTBaZTNHcGE0Skg0c09Ocldr?=
 =?utf-8?B?Y3hPY1U2TVRmRG9ON2pwSitzbTRObVQwa2tkNU5ObUpXL2JGdko2QXc3NFhE?=
 =?utf-8?B?QVRTWTJKeWhWd0FWbnREMEROUzZyVU9GWitFZlpuZWpFeDYyY2FOWUgyeEZi?=
 =?utf-8?B?RUE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e02dbd-7670-4bda-925d-08dbf3e8271e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 10:11:01.6976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NwPcGYcozQGrsV6ULlCeGbZPX/BJl/c8wUo74EWl/R+Qz1tUy612azWfUVELa7debrN8OJ85VtW15CXGbLfVBO5z94BMbibhWvEk2Yq5e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/3] net: stmmac: Add txtime
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

On Friday, December 1, 2023 11:02 PM, Jesper Dangaard Brouer wrote:
>On 12/1/23 07:24, Song Yoong Siang wrote:
>> This patch enables txtime support to XDP zero copy via XDP Tx
>> metadata framework.
>>
>> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>>   2 files changed, 15 insertions(+)
>
>I think we need to see other drivers using this new feature to evaluate
>if API is sane.
>
>I suggest implementing this for igc driver (chip i225) and also for igb
>(i210 chip) that both support this kind of LaunchTime feature in HW.
>
>The API and stmmac driver takes a u64 as time.
>I'm wondering how this applies to i210 that[1] have 25-bit for
>LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
>second into the future.
>And i225 that [1] have 30-bit max 1 second into the future.
>
>
>[1]
>https://github.com/xdp-project/xdp-
>project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org

I am using u64 for launch time because existing EDT framework is using it.
Refer to struct sk_buff below. Both u64 and ktime_t can be used as launch time.
I choose u64 because ktime_t often requires additional type conversion and
we didn't expect negative value of time.

include/linux/skbuff.h-744- *   @tstamp: Time we arrived/left
include/linux/skbuff.h:745- *   @skb_mstamp_ns: (aka @tstamp) earliest departure time; start point
include/linux/skbuff.h-746- *           for retransmit timer
--
include/linux/skbuff.h-880-     union {
include/linux/skbuff.h-881-             ktime_t         tstamp;
include/linux/skbuff.h:882-             u64             skb_mstamp_ns; /* earliest departure time */
include/linux/skbuff.h-883-     };

tstamp/skb_mstamp_ns are used by various drivers for launch time support
on normal packet, so I think u64 should be "friendly" to all the drivers. For an
example, igc driver will take launch time from tstamp and recalculate it 
accordingly (i225 expect user to program "delta time" instead of "time" into
HW register).

drivers/net/ethernet/intel/igc/igc_main.c-1602- txtime = skb->tstamp;
drivers/net/ethernet/intel/igc/igc_main.c-1603- skb->tstamp = ktime_set(0, 0);
drivers/net/ethernet/intel/igc/igc_main.c:1604- launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);

Do you think this is enough to say the API is sane?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
