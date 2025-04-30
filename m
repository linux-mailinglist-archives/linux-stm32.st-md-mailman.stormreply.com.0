Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CECAA4B6F
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Apr 2025 14:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EC07C78F9B;
	Wed, 30 Apr 2025 12:43:12 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 869A6C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Apr 2025 09:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q663gqzJocP4dkyLB3sr+H++eT/s+DxAfyJUVMVMJkfvulH02CiMnGvUWJjnuGhevaaFonx3XJZvqtM/WfAI6pP4mNj8/UTV4FnVB/ySo0RwcdzgLgs31xKQ18k4vyoFGmMS5ENkrvHCh7DAnWfXEFHuPniXDU7lIilBfl1oD5cibA4ChYJSrKjdWFF3HTZap2AwbBRHKigQdJiOUFAfwrMcSg2jYv/jBp6wC0DHmVpCG/kHSLxEEu/rs5zLltsgxos1eHa9Br1AoWAOp9ki6GG973WE6p83MXM/hOClc9++88Z3EbwMjOpFT1tQ63WHgthiOHbRbuogncXK8oWLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEOxoYLSon1zFiOWIpme6G9Gvg/ptZ4lhg4/ZeW3X68=;
 b=hnewF3rm10IzefAiku7lIPFtf48uWJsvEPdnqlE2FvUQoT0eMOJRS2II7NfsWqIIyvbW76gsXhVTUGhE2nBjHjKwprfczdw1YdzGnZn/0I4/Ohc+1RLhII0XJJuuHmIQz8pNJ3Wi7MutJOpuaSCxH1/seVYI6LTaQRZbZiYtij7FGlvsO7DHYk2CW8w72T4n7DJtcMFeGln6a9UynRKMUjA7LohRAXMPAle/ZxSu3AvMBt7etETnrmeo8vZRsWU/Swu2z/J444jblc6VW/VlI5rG/IH62Ln7BQhsCzC4uDxscu5e4MEHiUeF1NHV6T8s24V+QZyoi0KADf+q/hXEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEOxoYLSon1zFiOWIpme6G9Gvg/ptZ4lhg4/ZeW3X68=;
 b=IWh9pI0c0X944tG1Kn7NdX5Ujh+izwRt7Ki+CJQF0ybSeVaniQEFshIDtYwgSw/N7s/86yZDn2tYfJrczd1+luDuHhLZCsuxhbsrX01XLtA0dGpLbqtVfDXMsLZhBt5FR92Ueapqt0Yospx+omhsXE9JIWUEWYYuNibrOus1ZOdaMuDpo/Xu3qDcUD8Chv5l8pSygKZBTlxFa/p+Gg9GZKVJUJ71whcdU4QpCfiq2Tn6JbnkkiNODQCwQbYLajUSlRuQJiLF3vKy6f2e/O5XHRAv3dvJaXUbOW01jT+fAbcgs2v2VvbdzmN3ptOu3mdz/G6YonVt5u92zclKHyTQxQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:42:16 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:42:16 +0000
From: <Manikandan.M@microchip.com>
To: <luca.ceresoli@bootlin.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <jagan@amarulasolutions.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <dianders@chromium.org>, <chunkuang.hu@kernel.org>,
 <krzk@kernel.org>
Thread-Topic: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Thread-Index: AQHbtUsLjdQGawUhkE+yGegcji7RNrO7/beA
Date: Wed, 30 Apr 2025 09:42:16 +0000
Message-ID: <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|MN2PR11MB4552:EE_
x-ms-office365-filtering-correlation-id: ff71b061-11d5-4bd3-aacb-08dd87cb4b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Ym14SE9FZ21ocXVYemJYYlh0UW43R2gxWkdMMXNCZGJwWTUzZktVR28yaUJr?=
 =?utf-8?B?SEY3MzN3WDBMeURtN0dFWHNzQ2tlOUpOUGsxNjdFVDNwT1k4OUNZcG1keFpU?=
 =?utf-8?B?azBYQUNBM0t6czY5NXVpZmp5MjErZHBOcTA1MU0xUlZab0RFbGFrTTJWQWdC?=
 =?utf-8?B?bUtkZmlZOVJnYjB1UHJjVDdGR2hIeFgyZ0kwMTk3VnIxendxZUZjbE0zQ2lH?=
 =?utf-8?B?cy9Pa20zOXllZXdaMXlNTjJLQVozNmZWUUFQTG9XL1U5WlV3Q0ppTWpPa3RW?=
 =?utf-8?B?bWNxQjQ5R2RVUGYzekNURlhIZ2xLT05FRVJYRzh0alBzdENQK2tIS1Y1dUVL?=
 =?utf-8?B?M0JIWk84bllkeWJtWkpHcWVvTEcwb3oySmdGRlVaQVhhTDhHRHlscVRDYlZC?=
 =?utf-8?B?dThmV09PT0l2NmdSc1VKanBlcHBEQXg4NGNNNmlNRHdoZ010R2psNm5veFhl?=
 =?utf-8?B?aGpHUXd2cHBqK3NLK0FGMmlWaG5PR1ZvSlNmMXltbXgvWUlQMUNKMnBDUklV?=
 =?utf-8?B?MkNJSmY2cHhEcWhaVVFscXpBWW5STjQ3K1RmbWdXVXh3MnJpWFZpb2hhekI4?=
 =?utf-8?B?a2JTdW5SRmE2U3ZuSEhBZHgxYkZKZ25lbmY4K25xbytSMmFvOE9KRWJKWSt0?=
 =?utf-8?B?QkhndFlwb2s4VDV3WVBVNUNoZ2FRWHZNbm9RZy9VWmVXaUdWY3JyK0Y3SzZD?=
 =?utf-8?B?TnJEUzZWNUlyTVpOYWJ0RnE4NmhGU0xqbzc2YmQrak5UNGJ2NmZMTU9DK1R0?=
 =?utf-8?B?UmlrWTdreHg5OVA3Rkk5alltYWRDVDk3enVieW56TzVGeWJKa29hZ0FsalNT?=
 =?utf-8?B?VHQ4VEtwZmZVaWJuaGtUWDZ1NEJpNm5NVzBsQThSRksxR3JSeXpZbG0rckJE?=
 =?utf-8?B?NzNOaHQzQVZKZlU1V3J2aUhoY2M4dk5QTVdjWStXWnpUa1RjSFFsRk56U29p?=
 =?utf-8?B?SmY0UjFhZjIvY2xrR3NhMkVpUHUvYS9rTVJCd2pXUEdCZVpuc2tXT1orYXBX?=
 =?utf-8?B?dTlrdTc1eGtiNzhGcVBSYUxVNElyZENqekxPVnhDS0FXbjNzc1dUYSt1SWJl?=
 =?utf-8?B?L29pNEtEWGNsQjI2eFIwR0h3Q0M1blBvLzNMTmdSOTFManpwQ3VveExKMHVE?=
 =?utf-8?B?MjBKL0lrdHZKY1VEWERNSlpCcWJXNlpRUThpUFl6YTk0ZzNOZ2ZXOEZybUFK?=
 =?utf-8?B?d3AyWTlZYmhKOGU4VGxlejFOc1RBMHBlZThqd2oyQ09KNC96TldqTHZnVXVO?=
 =?utf-8?B?NjB0V0RjR0FTRkp6bFdydjhQamcydHVhZkJHbnoxRHc4aVY0L0lyeXFkZVJp?=
 =?utf-8?B?VmNGRElncGNKdWQ3NW1QbHlMaFdnSlp0Q0ZRU1BUOExOS0tKSTdPSTltR1Vm?=
 =?utf-8?B?RTROblJCdjBTTmRFWEJrV2Z1My9jQjNZSUhqRDIxU1kvVDJKa2g0V0ExMDhn?=
 =?utf-8?B?MzdVZzBvR0p0N2gwcTRZM21yYTdXa250QjZacVVpeXp5SEc5UW8weEFYS0o5?=
 =?utf-8?B?SFIxeVhNLzE2b05pMzhGTTdNNWJsYzdlOGJxVGFQbktpL0JSTll2Z3A0dDd2?=
 =?utf-8?B?T1F3MTJjbndBZDZNbktYeVIxaU5CQ0QzaDV3Y3NrVHFsbE5yaXRJZkpJcTdN?=
 =?utf-8?B?cWVUUXFTb1ZEM3QydTNwdng5WnFEZU9yYjhQQWNwNmloSUJsazVxdXJFVG04?=
 =?utf-8?B?b3k2QVI1SEVEZkZvU1J2aHdFUlVtRmFYQ0hsb2hjTjlDd2FwNXJ6cFJHbzFE?=
 =?utf-8?B?bUc5b3VSeVluTmhlTExXMDNNNEUxbFplWGRpYmg2SUY3dUU5Z3cwUUVMd2N1?=
 =?utf-8?B?QiswOTk0SE5HUm1JRnVBY01LenFWR1M2ZzR3T0tIWTU0QnNnWjVPODBGYllN?=
 =?utf-8?B?Wk1LMGRDRXBSYlgzU0RvUHBjRk1uTjFwdVZLaTg3dVpsdkNSYitIalJWa3dH?=
 =?utf-8?B?MUF2elhzdzd0cnhvemZPeWszUXRXdk0xcGdEWVhCN28wdDhVTFVKRVljZ1Rs?=
 =?utf-8?Q?WjDNcPAau1/4Wl5MPmzEYfwRHmq5HE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FZZFo5YlZKQm96MHZkWTM2S3dsU3p6aEpoaTF3bHBSZDJoN1ErWis2SXBD?=
 =?utf-8?B?ZkVjVE5MSlowREhJNUpRQm9aNEdxSGdNSkJ0RVgvY2RzT2thUUZmY3l6SUFs?=
 =?utf-8?B?elR3OWZFU2VjT09IZzcxa3VmeVZuaXhDR2hySTJpeUJtL0JUWTd4MGhod1pY?=
 =?utf-8?B?MUYyZ3JUNVVzQ05WWkFYM0Q1ZVZUOWRjZUQxbmphVzQwRGtrK1dGV29ILysy?=
 =?utf-8?B?Tk5XckFhcktnT0htT3h6Z05CRVFsVXFBOTZieExkT3FzL2RJY1JyM09hb2RH?=
 =?utf-8?B?V3Zrc0RqbzhSNDdXUU9DUGxXNUo1aytCN3dSOENFZlpVNjhuaUVUWjFsU01m?=
 =?utf-8?B?alNsTHBwb2Q4bFYrVXRVYVM1TnRzaUx2bit6aWwvelZrcEs0K2dtcWZ2K3VH?=
 =?utf-8?B?Rmt3dmtBdGxCcGJLUW4yTUNiWmxTSmpCTXlVbHRsWjNhN3NvV2lTdm1OZUV4?=
 =?utf-8?B?SFlhcTdNMFhhVUZ0aGJmYVNzM1RzT05ncU9CVWtCemR5aGJMN2hTZXRKYlFW?=
 =?utf-8?B?amcwdlFPaHpmWVdsVXhyR2ZzRGJRdDRtS0RrQ2dSVTBzMyt1TUtlcmVyQTF3?=
 =?utf-8?B?cmJXemkvTVpVTkVDRGFvdHdjNDhJanBxVSs5c0JMMDRyNFZYQzd1YytYeHJB?=
 =?utf-8?B?REJ6SG4yM1R0ejZtT3JNZEh6Q0JPdksvMnk0UHFSc3duS0J5WnNXb3Byb09U?=
 =?utf-8?B?MDlLMTJxK1ZpeElhRmdiMEU2MHVOcnlaUWFLdEJON041dmZFR0VDRnArQ0Ur?=
 =?utf-8?B?YmlDd1Z2VDdWSXlGUUlleFdYVW1EdTl4cjNOejFVSzIvUkc4YnBIOUdXdEp4?=
 =?utf-8?B?bHNCRXBSOEtlcnBTZzB3QWR3MWZsT29HSFI0VXdIdVljKys1QjlBRkgxNWZk?=
 =?utf-8?B?R1NIVGtpRklnZFhneWo0TzJuV3diNkhRRkpRVnhzWlBTcWdlb2taVmdLZWtF?=
 =?utf-8?B?Sy95VHBVT3QzYTRZY0hKajh2OVd4Qm1zRTV0dGpEYnVEaVp4M2plN1B0aGZD?=
 =?utf-8?B?bVZaRVpna2tFd1dZTWpaUnFUY2VjN3RCY1VpY3dxRHJ4amhPaVlhZ051bC8w?=
 =?utf-8?B?V2pQODFEY1JnYzZwOUdpVnZ2ODNwU0JtNmg3Zm9HRUFXSzhkSXpVUXNkQ3cv?=
 =?utf-8?B?cHlrVkNvZU1pQnNqdXhWaW55SWVyVlE2eE90L3NxOTZVeGNSNlA2YUw2S2I2?=
 =?utf-8?B?UWFEUkpCU3VudjI0amhOMXpZcXNoR2VYNHFWL3VYVzdDdVVBaXRmbDd0VDB0?=
 =?utf-8?B?bTZldHFnazRiKysvaDdaZWZEek9YeHFmOGNBVmxha1R3YklwZmYwelQ4ZWRq?=
 =?utf-8?B?c094bEw4SUNCZHhPQ010VlBaUHJsb0s4TUliOTJmVFdyeG1LSmNveFNJb2tR?=
 =?utf-8?B?c1B4ZWZ5d0NHSDF5SXRZYXZ1SnowUVdmRVQ1QzlWaVNobElZek92eTVUa2s0?=
 =?utf-8?B?eG1SYVpUeVpyZS96OWUvaEJYZ1dqMjVpT1N3VUYrQ2RNUGdyRXRMakVUQzQv?=
 =?utf-8?B?MjFSb3Y5QjNKMnhJNkZCdVBtdUFrUVhtRnoyZTV4T2xPTGZBc2FzS2VPVHRq?=
 =?utf-8?B?Mk9tNTh5a0FCRjJpbVlMczJIcS92aFkvWVdUSTZyamtnTGUzdStuaS9QbUo0?=
 =?utf-8?B?ZVlhZVB5eU5qZjBqWnhDZFgxR3pOTEpza2VjRkFnejk4cmxRS1VUMk12WnZ6?=
 =?utf-8?B?UFpHZ2ZJam1TejVrUmIxL1Ivak9jd0kyVXA2QmRCV2VIOUVKdEQyeEZra2RQ?=
 =?utf-8?B?eENEZ3FkVWZtQjY3Zm9PeGhWZUJsYUJvbS9POFdSbi9SMTRmT0IvVW1IMmk4?=
 =?utf-8?B?SytZNDB3dUhzWURaNmlYTlhlK0VLWHhvSW9EOTQrYTFXbFlxTU14bWg5LzZB?=
 =?utf-8?B?N0dGd1FMSVNtam1ZVlRuM0U4YkVQODdzMFhtbTQrWm5abEZWbWhDZWJhQ3NF?=
 =?utf-8?B?UHpTMDl3ZnBPM1h4dnpBRVdoSW9wOUg3Y2FFazRJZnd4Q1JrSjR6NElPK2R2?=
 =?utf-8?B?emV4U1dPUWZ1WVYvTEJmbTI3L0JvRmdBL2toNGpDNzhOdko1Zkp0Um1oYWRw?=
 =?utf-8?B?K09Yd05hSkZFUUw3Y1R3d21SdzRQTjN6Sy9jREJOSlhQd0t4aHlFTzNFcjdl?=
 =?utf-8?Q?l8+S1T6zAATaEcXpjzgXokDzT?=
Content-ID: <504278A449B43C44BFCC580BE40E39DD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff71b061-11d5-4bd3-aacb-08dd87cb4b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:42:16.4161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IndaBHi/Wa7muY11t4Fp9IKTBmSqxa9wjYTsL0ZWa9hMuEEfCq+ONtwYQVmq980PvvJOxxFRngVrkpwzPWhBvEH7xVrX64CEoPAiu9vkI/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
X-Mailman-Approved-At: Wed, 30 Apr 2025 12:43:10 +0000
Cc: imx@lists.linux.dev, sui.jingfeng@linux.dev, fnkl.kernel@gmail.com,
 heiko@sntech.de, mordan@ispras.ru, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, biju.das.jz@bp.renesas.com,
 amishin@t-argos.ru, thomas.petazzoni@bootlin.com, groeck@chromium.org,
 j@jannau.net, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 bleung@chromium.org, asrivats@redhat.com, detlev.casanova@collabora.com,
 sugar.zhang@rock-chips.com, victor.liu@nxp.com, Dharma.B@microchip.com,
 matthias.bgg@gmail.com, adrien.grassein@gmail.com, ple@baylibre.com,
 jesseevg@gmail.com, martin.blumenstingl@googlemail.com, paulk@sys-base.io,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, tomi.valkeinen+renesas@ideasonboard.com,
 Hui.Pu@gehealthcare.com, linux-amlogic@lists.infradead.org, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 lumag@kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chf.fritz@googlemail.com,
 kieran.bingham+renesas@ideasonboard.com, asahi@lists.linux.dev,
 p.zabel@pengutronix.de, khilman@baylibre.com, cristian.ciocaltea@collabora.com,
 andy.yan@rock-chips.com, freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH v2 01/34] drm: convert many bridge drivers
 from devm_kzalloc() to devm_drm_bridge_alloc() API
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

On 25/04/25 12:29 am, Luca Ceresoli wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
> 
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
> 
>    @@
>    type T;
>    identifier C;
>    identifier BR;
>    expression DEV;
>    expression FUNCS;
>    @@
>    -T *C;
>    +T *C;
>     ...
>    (
>    -C = devm_kzalloc(DEV, ...);
>    -if (!C)
>    -    return -ENOMEM;
>    +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>    +if (IS_ERR(C))
>    +     return PTR_ERR(C);
>    |
>    -C = devm_kzalloc(DEV, ...);
>    -if (!C)
>    -    return ERR_PTR(-ENOMEM);
>    +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>    +if (IS_ERR(C))
>    +     return PTR_ERR(C);
>    )
>     ...
>    -C->BR.funcs = FUNCS;
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
> 
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>   drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
>   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>   drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>   drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
>   drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>   drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
>   drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>   drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
>   drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>   drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>   drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
>   drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
>   drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
>   drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
>   drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
>   drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
>   drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>   drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>   drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>   drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
>   drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
>   drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
>   drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
>   drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>   drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
>   drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
>   drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
>   drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
>   drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>   drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
>   drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>   drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
>   drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
>   drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
>   drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
>   drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
>   drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
>   drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
>   drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
>   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
>   49 files changed, 201 insertions(+), 237 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b367f5a744a28edc 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *pdev)
>          if (!dev->of_node)
>                  return -ENODEV;
> 
> -       lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> -       if (!lvds)
> -               return -ENOMEM;
> +       lvds = devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, bridge,
> +                                    &mchp_lvds_bridge_funcs);
> +       if (IS_ERR(lvds))
> +               return PTR_ERR(lvds);
> 
>          lvds->dev = dev;
> 
> @@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> 
>          lvds->bridge.of_node = dev->of_node;
>          lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> -       lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> 
>          dev_set_drvdata(dev, lvds);
>          ret = devm_pm_runtime_enable(dev);

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>

-- 
Thanks and Regards,
Manikandan M.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
