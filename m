Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE080588D
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 16:25:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94FB0C6A61D;
	Tue,  5 Dec 2023 15:25:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00D9DC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789911; x=1733325911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DhRtKpPiz+QZ1ZlkCbU59C6V5uUHVGpOk+nwuwgwKOc=;
 b=oKu2o8gZQXYA4Agg5zth6PY6HVAOn0h0YJCAJGg93OYZEgq2maDQq6LG
 C3KbzMy02YybEI+OLQkNzmYu3gSvvrYDd49EuwK1bpkAPg0qLxF6pFBFq
 zK8tByMQjD+vS93bv/1AcJN/m8vZqolhTjXJWizMGJd0QJtNPx8h/jcOT
 dND9UvSo70X3qQp7pumPP/s4D4qk9qL/qlqXCjGpo4enhH8NHdDCZKuYT
 FkOXjq3BKzTCj0ug+hGPVrJLaK6IjWd+rWLuv1m03jzymEN402G9raFDh
 mXknyAknLjnVnFJHSSMlM/IlgXHzrQvDtfFeP5XktlsulmmzHhlShg98u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460394667"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="460394667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774662715"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="774662715"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 07:25:07 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:25:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:25:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 07:25:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 07:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFlg1c6B0jCXPxcS0ynU8M6BXO0gJTdNrBngqCr2jDPy1Sa3bgA3vTH1oXuk+yn4Ey1mtKzHiWAtz+KmzFogExO5Ep1shp5iphxPjY0yuBCzenxs3Zx1uh0cBf8T6DcnSNw5rokHoOy1Ue6dTXMhl+in0R+5ZIq8ZUmCWiU6dKoZ3y+PL8Ij1c6PruKpAFBjcyX3kOm86lIA+k3VqpWvI17RGuUt/8oH/qzfKMdPRfXb4V4eAF9ZtR2hel/2btLKqlo3fw2AvU0L3aaLPWx5zJo9furP2vNt+B29jvugrh4JqGSAe0PnwPEtDlbVhlAXPiMwHe4bcBYTi3FkG8hF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhRtKpPiz+QZ1ZlkCbU59C6V5uUHVGpOk+nwuwgwKOc=;
 b=g/3LulbvcWlZxnakpXr5RBSY2ZrOekHM/qm45YQQ8wv2CBYq93PJ6yCL6Yss7v1DU7E4y+ojVsJ95bON5SL2P38A4T5nKZ9zZxAGCj4knk9FZyPXMMNuKETTVqkKuhzAZ9ey4jTiLlCL67UvW76vCLKMpHIjGZiUQuZ8t6fz1uJYag9GHTxDhViqgZXrx0S0KqT/ZAa2GVvOWwq6m2MOINRkmhE8hTKBvj/gXwBo10G3aCvbfgY6wh2fvkLq+fDVMaoG19u6aQwVycJZLh+Hdbf6Exb2bPDj+WfBgYxOR8bNtwFWnqyN5xeK+KKUlA0stGhar/4HkpSzOf0TunM4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 15:25:02 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 15:25:02 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Bjorn Topel
 <bjorn@kernel.org>, "Karlsson, Magnus" <magnus.karlsson@intel.com>,
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, "Jose
 Abreu" <joabreu@synopsys.com>
Thread-Topic: [PATCH bpf-next v3 2/3] net: stmmac: add Launch Time support to
 XDP ZC
Thread-Index: AQHaJgkYSPZeueih5k2aEmsHgya5rrCY72kAgABIIgCAAZaQsA==
Date: Tue, 5 Dec 2023 15:25:02 +0000
Message-ID: <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
In-Reply-To: <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|DM8PR11MB5608:EE_
x-ms-office365-filtering-correlation-id: 6fa6148a-bbaf-476b-e725-08dbf5a65a15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x7/GOPvnqE9KM4qR4xJVcVy2arIPs5gU1tKF9goT0AzjzvbfutcDAy7vBM6G/RYeEOe5LJtDesnq8qUrczdwFT+B9tTJDSemYdphoFtWotnCGjsIApdgxEycbzIx0MRRLOyw8cVz/Ty30sz7a2tu0HCU4hZAuq6aBfZTdrG+oM7ElcelfF8N6GYVtF+Qstp+7S/EdIR9p0Eq9NBGUnhKmUknp+ZYNWFPJU757YIg6bnL13k2OHpAEbxlshLQ26mWqpwAf5n7jtUA9mfvM1BdrzWaJMuTbbUvwwTRF1fMp9nhc/niLu0qIKlRfzttBm6qfHscBpYMhkI51lXpLieJbNyZ0yXWPraFr61u7oUcA/BslHKWShBqW+lwUHp7Drz+Ap5r+HuKBHXBxdH36WbdnJVyeQ5XeNCYrTSQmU2cNpYEkWonbk4ObpVLD2z38Dgqt4lD6H9t0kh/qYBWL3RMXoYiYJ0okD0WK70ZZBrWoCsYHWywnfn0Ala39o2YJkS3YEthXZfDiDG4Z98Twuw4Lb3hEntEDwa+Bnf2JQx/vkW1gYnDUBWBhBHRgOaZeQ3f1IRQ8iMmOlEMkr8WqSymFtIDyR8wofDG6O5amga6UWQV7C/SinZJ4p+6wTSwb1wz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(55016003)(71200400001)(7696005)(478600001)(38100700002)(122000001)(82960400001)(83380400001)(53546011)(9686003)(6506007)(33656002)(7406005)(8676002)(4326008)(2906002)(921008)(5660300002)(7416002)(8936002)(41300700001)(52536014)(86362001)(38070700009)(64756008)(54906003)(66446008)(66476007)(66556008)(76116006)(66946007)(110136005)(316002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnk5RmtYQTdNMEJxcU9pSUxhclZuRXpFMzdXRVVtQ3REOVVFWStNZWM5M3Zn?=
 =?utf-8?B?czUzQkxkOVpVdjduazFWek4vNjZxU29IWUxsLzBaUm9pdUFwSFR5YWp3NDlq?=
 =?utf-8?B?MlZXbVlRd0Z1VUliRkpacVFGeU50bHYvM2ZTajhaZVYyQm1xZDNkejRJNHFZ?=
 =?utf-8?B?ZGkyblZRY1duRzhHcUJoMWdMb0YzVlpwVHZvNTd5MUlhSUw0Mms2VEpQK1hq?=
 =?utf-8?B?Snh4QlMwZnpmaE53VExMZVpXQWpJTnJ3WXRFM2N2TjM5cU56eTAwT08yQXBm?=
 =?utf-8?B?aWI0YStIZnViL0xZb281cUhvZit4aU1GbFl5TEVid08yM2xDNmVtaWNPQVRZ?=
 =?utf-8?B?UnpuckE3V1JVNU8xN1JVUG9ydGRyK3BEQlFyRzRsMzZBam1QMFhMZHg5RklN?=
 =?utf-8?B?elkwdktmL2E0WXlDdGdwYTJ6WkVKNGVodWU2YytmdXp2Y0NlZmlmQlhJQjVK?=
 =?utf-8?B?cFBWOWd4K0Vxd1lueVJyU2kwV2NOOFNSdjZ1azVlV2xVMzJkSlJiU1RldFhS?=
 =?utf-8?B?M01VVnpsVThLYlZrVXBCOTBTTHloZy9BQ21NNVY4ZDV6NFRUWWN5M1JZbU1O?=
 =?utf-8?B?d3pEYXJSNGJLbDdRdTJob1dLUVBpckhFUnVRZ1ltQXFSdHZueEdaU21aTVpk?=
 =?utf-8?B?Y25PQU9qOWR2RzNzVGZ3UllsNG5Cd2NDSmxnZ3RlSG0vR3BYcThLc3FmL3RP?=
 =?utf-8?B?dzBmQnVHdzNEdTZhUHdBdHVIL291TmdmaW1DcUgvVW5HVmZobklEdkVtTVJ4?=
 =?utf-8?B?WkUrUUZKN21TR0x0NXpKZmpuaFFaeE4zZjlCSEJWTWkzcEZDdFBvQ3doekJW?=
 =?utf-8?B?bkw2WkZ5UzRpNXVud1Ztc0ZzZGJqVURaNGJoQUpualREU0J6cHVTRXFPdDZl?=
 =?utf-8?B?a3pldG1yS0x0b2V1OG5qTm9pcUNqaktmWFd2V01TY3NBVksxcHlxblZtaERz?=
 =?utf-8?B?dEJ3NXd3dVVLOFJadzR4RTFhMkIzTm4vZlFFU3M3NDc1bEhLTDRnWjBLbVJz?=
 =?utf-8?B?N0dxQXdBa24rVDdBSHpqbWRJaCtUV2YxMWJRbVR5NW5TKzJzTlZ2cE8wcTJl?=
 =?utf-8?B?OXdyWVlDSk5UWG01UnhCSU1RNW5ieWo1b3lYMEdYRDNZUEdKdW5uakhaY3Ev?=
 =?utf-8?B?S0x5QjJXd1dQd3FrRnZqQ0pYUTc0Y0R2RkhjSnpOZHBRL05lZzd6YTJ0aGpp?=
 =?utf-8?B?dHlWWitFemdBR2k5VWZNMUFxYWpUQU0rWm5BTU44bkRCeG81TThZdFRBU0Zk?=
 =?utf-8?B?NVlRei9GWmVnWGFSeUlITG8wOVdXdjQ0a1JmcTlwTHY2cnJheDVudno1RGg4?=
 =?utf-8?B?R0puYmRJMS9hVSt5SzdRK2F3dFBibWNFUzUzK3NtUTVEeVp6WGRteUwwelpU?=
 =?utf-8?B?WWFpSUJMQk0zZ1UzWmVPMmN2K3pWeUJobktUSHdJcmE1RnJZOTVPL2J6WFJa?=
 =?utf-8?B?ZlRUbWhQN3p1ZFBDMmtZeUdrVG9TMXoyM2c1NTFEV1BBekhxTGxlZnNIaFFw?=
 =?utf-8?B?Rk5USzlYNDg1OFk5c0xJTXdEWkhSYWlzNnFFSzMrdWxYVlFPaXJUZFBJbW9P?=
 =?utf-8?B?dDJOUStMZC83OGU3c2h3K1htOTdtZFB2L2w3Ym1lc0Q0SG10eXo2cUc2bXZE?=
 =?utf-8?B?SmFhZUI0bUFHRk1oVkFxbmFUZVMwbnlXL0RCN3VvdVlmVHVvUjRJSVJoaVhO?=
 =?utf-8?B?aTNCME9uWkVza29Bdk5jbFMxUm5uNmRrUC9EWHNmSU9oalF5WkpzTWdKSXBp?=
 =?utf-8?B?TVhZdC9PdFhLNHJ4N3VVNU5VVmlHU0tjSEE2aUo2am9uRWNIaHB4amtHT0sr?=
 =?utf-8?B?ZXdad1ZvRlMrSEdPczI4cVRpZHBmdTkwWTdpNy9vRWQyamhrYytydmVhOFda?=
 =?utf-8?B?ZGllOXArbXNVZ25wZHpTU29XMkZ5K2g0bmZTaWNFZjAvS25MSTZ2NmpYZzds?=
 =?utf-8?B?OFlBdWQrMnhUZStBaUNYUFViOGtVMUhZVm1jSnNqeDlzbE0yM3JidjFKcWMv?=
 =?utf-8?B?RHkvMmNmbDJQZlVPN0wrL0dyem9Ma3FkZ0FnaS9mSGo3TFV4NnNnbUhrUmhn?=
 =?utf-8?B?VmdBZTIrWHZwalgyY3ZkN0Q0RHVEaElDRHNqVEdka0pubU82OUNQZHFzcmhJ?=
 =?utf-8?B?cTBCTmJycHdvNXlLNldTTGwrcitaRm1QRmZvNHppZGlXcU9OWThzMkhzS21s?=
 =?utf-8?B?a0E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa6148a-bbaf-476b-e725-08dbf5a65a15
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 15:25:02.7385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu2b6BJWBKIcaru4ChO6wWAgB6L9G+2DWMOkME+YpKesjcISmL7nmBWNkk2lqe5E3iGli8I9QA/pIVTR2RdZnwgtYX4DtaDKYcoCG+ih9gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5608
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 2/3] net: stmmac: add Launch
 Time support to XDP ZC
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

On Monday, December 4, 2023 10:55 PM, Willem de Bruijn wrote:
>Jesper Dangaard Brouer wrote:
>>
>>
>> On 12/3/23 17:51, Song Yoong Siang wrote:
>> > This patch enables Launch Time (Time-Based Scheduling) support to XDP zero
>> > copy via XDP Tx metadata framework.
>> >
>> > Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
>> > ---
>> >   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>>
>> As requested before, I think we need to see another driver implementing
>> this.
>>
>> I propose driver igc and chip i225.

Sure. I will include igc patches in next version.

>>
>> The interesting thing for me is to see how the LaunchTime max 1 second
>> into the future[1] is handled code wise. One suggestion is to add a
>> section to Documentation/networking/xsk-tx-metadata.rst per driver that
>> mentions/documents these different hardware limitations.  It is natural
>> that different types of hardware have limitations.  This is a close-to
>> hardware-level abstraction/API, and IMHO as long as we document the
>> limitations we can expose this API without too many limitations for more
>> capable hardware.

Sure. I will try to add hardware limitations in documentation. 

>
>I would assume that the kfunc will fail when a value is passed that
>cannot be programmed.
>

In current design, the xsk_tx_metadata_request() dint got return value. 
So user won't know if their request is fail. 
It is complex to inform user which request is failing. 
Therefore, IMHO, it is good that we let driver handle the error silently. 

>What is being implemented here already exists for qdiscs. The FQ
>qdisc takes a horizon attribute and
>
>    "
>    when a packet is beyond the horizon
>        at enqueue() time:
>        - either drop the packet (default policy)
>        - or cap its delivery time to the horizon.
>    "
>    commit 39d010504e6b ("net_sched: sch_fq: add horizon attribute")
>
>Having the admin manually configure this on the qdisc based on
>off-line knowledge of the device is more fragile than if the device
>would somehow signal its limit to the stack.
>
>But I don't think we should add enforcement of that as a requirement
>for this xdp extension of pacing.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
