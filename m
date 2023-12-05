Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB68057A5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 15:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3809C6A61D;
	Tue,  5 Dec 2023 14:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D6E4C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701787419; x=1733323419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2UGO64/TKU1y+jVPuWZMbdNxXeq7w/QiSBLabURT1UQ=;
 b=D/uN+dseiaJ0ApZUGAMb+Or3njsT21zgAwZpGrgV2sRO8gwSoUP2szTI
 Ul7Lrma2SB9Ek3B4OEww2araAa0NgWCSUaAxIxbP0F3Ch+p97T5Y/aP16
 HotK5hA1kBOoRrDUT6fuoh7U1eC3jfz/XRKAvDN/Nvp5VWGR4kFN839Ze
 FOpLf+vRt8bimaJxTEXr4wW3UHOrswliPDKxJT2r6z1xGcya5GV6tWPCj
 cgJBp+Hjiwym5Uhf15xhCnZimHtpKjl1koaBAfL6T9bY2DvcmBHGHqNMn
 FTk5M9iCM2iHqRUel698fbAvDtQD/PFXEZfVD01qrtBcKbDcfMpQEj6RR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7247823"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7247823"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:43:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888957767"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="888957767"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 06:43:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:43:35 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:43:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:43:34 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 06:43:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Apx8ehq9i9fUM3SK6jhfO/O4CICeAYffak/JhFKbTE1C7mM3GWQwzCpvWbLsXq2FauV3FmTrtLW2KYV+VHZz3q4srC3FnIqbPtLAOLFVMbSwyVIgZfd1JAvg/bzdnB+TosFRKFVL6Kt/xSiCC1ek330YiYY0bf2AlLiZQ5IvuqJ9gM3CUXa1tKjiB1p+4w6lPQvypeB+X0eikHadNLusvXY5UaYEkpDy8ngM40DCpAo6CGKcQRhufKFyTuf+yfGibTpD7Ef7SK0tURIw1johs8isr3tOpOYzNRyzxzA/1JCC+OTaGsrGfBAARf+HCYj2BMk38u/jcAIWgnYuGagjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UGO64/TKU1y+jVPuWZMbdNxXeq7w/QiSBLabURT1UQ=;
 b=MQp/+AyELo1aOeyXeO3S+3p0ADlVRTw4hmspXKFN3/smdHi7bCFIWM2dkA3ikGLABUxdt1R5nEf6d0yEyVLyVNNHpJMF8lxG0CUIcGph2sL+QplkbzjHpbxGko+QGt4V/fGAW7rm1kfOcifpO1sNydqD1ns54C0J53MswCI7as8oGjW4kn8Fc2ZQ1YlFpeQ0rDbrISD2K1FXvUszfqWWJwwq7gdPjssH6XqmHqbk07vdS63S1JFAxb4XtljfLt0YqYplOGxLpJF8b0D6zCCPoatmhorqRqN0dlRAEAwENl4Vyz9Ow4T374/GUfliXrCjHNjiqwCO5SNfvib2TTo8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:43:31 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 14:43:31 +0000
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
Thread-Topic: [PATCH bpf-next v2 2/3] net: stmmac: Add txtime support to XDP ZC
Thread-Index: AQHaJB8y3IJpv0o6sk+7VcjRfinq5bCUhocAgALJsHCAAewHgIABi3dQ
Date: Tue, 5 Dec 2023 14:43:31 +0000
Message-ID: <PH0PR11MB58305C7D394FD264F1634819D885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
 <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <656de8eb14c24_2e983e29435@willemb.c.googlers.com.notmuch>
In-Reply-To: <656de8eb14c24_2e983e29435@willemb.c.googlers.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|DS7PR11MB7783:EE_
x-ms-office365-filtering-correlation-id: f275083c-0dab-430f-53a8-08dbf5a08d59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eB146ooX5W9ZpE1g9+IzjfP3eANOdxx/1VP0P3XPKExLsyl3OaqXh9HjZEJbTxlVVxos4gyotx9Y4JqaoNXPiWOdfkUNPwDWe9UraJeqEIIzGdcikwMZ6LbEF/SNFg0BtPOg3hO45BiMzQ5h6BU9/If9Xq6AkEqZqnMQ3/6w4OufPNBxeWJU2AGLCVOudiSqis9hftNY/y4SwNZQjoJLxeyZqVDE84CoKcpuj3bywZrdvxse1O0zeN3MXK4udUQrQcrVf6O6aaLkywQ2ikadK0eQm42rr6PNm85bVM4Pliic4NtXkpu0njnZPlMzPB7IFzl1pLGhW1bWOg7vODcR9EcDTUravz/xbkegVpCPv4Ec7LcVgJYpMLDbv5qYxlqYNeJ05VcuegLfTFzdQ0LWwyw5Cpf+zyf1fu2HW7MYMlyj0QK8vr+MxQhv87FcthcupLnKoDHJevWIlWX12Zp8ns5/20j2KGwB5cCTmKrvxqtBrWinGcpXMH6ybYbRqrgFOUIKCkvuzkb5fsGHmYnFfLpNa+LGhnomXtmXMQI0c8G0grvaTQGegSONoSyNQKXgEWaVuBTVLraJHZvpt238JPIxm1g8yj5EztyMaIJB/GJYHanyCoJdRtjMkGg0JZXT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(54906003)(33656002)(316002)(76116006)(66446008)(64756008)(66476007)(66556008)(110136005)(66946007)(478600001)(71200400001)(5660300002)(7406005)(7416002)(38070700009)(2906002)(8676002)(52536014)(4326008)(8936002)(921008)(86362001)(82960400001)(83380400001)(55016003)(38100700002)(26005)(41300700001)(122000001)(6506007)(53546011)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2JaMUwybGtORVhWbmJRZFN0WTFrcVBVRGVxd1NORERjNCtxdWpVdXJPcEtm?=
 =?utf-8?B?WW8vZ3lIREQ0ZElsY01SN2I2dzczWjI1UVBsZ3hacER2cU81Z1F1NkJYK25n?=
 =?utf-8?B?K1VBMzBXVnhwd3Zwd2tKYVliejZwQVd0MStnU29HRklMd2dNSVpSS0ZmRnRO?=
 =?utf-8?B?SHVoWkhJMjk1azFvcDA4S3ZCMHExanlFTHhYNjczbU8wTWVES01aazR1ek1Q?=
 =?utf-8?B?Y2Y0Tnd3cG5tVWdWL0d4NnIxb3lTdW5HQ0E1T2ZpRTN5UlBDaVFvYTJJd1JF?=
 =?utf-8?B?VWZNaXZuOGtZWC9tdXRjd3hPbElqalpnQXFKNnhXOS9JT3JWTGoxZE1aQ3Bq?=
 =?utf-8?B?Wkdla0RjT1pZNlhJZWlGZWNXN1lGaDhyUk1PcnNQNWZEektSMVQ2YnNSMnk4?=
 =?utf-8?B?bHZHVFVLaFcyZ3Y3cWRVWDhqWnNhb2FIMDJXVnM2NFNkN3NqQzNIS3VQbng2?=
 =?utf-8?B?dE40ckU2aFNzSUVXNXRiQTFMRW51ZkFtK0h0cTFVRXF1My9VTFZDaUdhTXQ2?=
 =?utf-8?B?VVpVWWtnSWl5UUZxZVY1UVlmajlHUVdYYzIyR3JQaUZoRDJwQlhvVVM2Um9y?=
 =?utf-8?B?dWRBSTZJREpEMlZyQkhsWnd2OUMzM0pjcXJsYjBvU291N3NEK0JCdmVQT3JT?=
 =?utf-8?B?dWZtRE9XK28wU2NzRk81bUtVL2U2cThDaEFtVzdIbytvZlNXVW1DU3hCNER3?=
 =?utf-8?B?RGtjZm1NRlQ5d0xVWXR0K3VBbFRKQjBaYWRlUjdNRVdpRks5VlhhQkxwRXNy?=
 =?utf-8?B?eWw1LzJlUHRTcHlheW5CT1BPQXg0NC9GNjhQVU9ZK3p6MmtERWFUazc0eTNy?=
 =?utf-8?B?SEgyRlphTkxweFl2UVdPaVhZUkZVZ1ZlVHdnT01xeW8wYzBmbmZqRWtsamhi?=
 =?utf-8?B?TXRTSXdrcjB0MFFRWUp0cjMwZ1pTMlpXckVTVU1FSGdaREtlM0xqMm9OVmVh?=
 =?utf-8?B?bTJjYzdodThvdmZqM2kyS1hKMi9rWkp4VFZPZk16VzY2bGR2dmdZZWRtb2xB?=
 =?utf-8?B?UlpMK0M0Q1V5dkt2aG9WZEdwWFgvUjNiWDQvbUNQajh5NGxSQzJzTll2TGFO?=
 =?utf-8?B?U2Z5VG1HZmgySlVCYU5WSE9hQjNwdjBvOC9Pcm9qTE9RNmEvUmo2WC9ZRktz?=
 =?utf-8?B?c1Z6L1QzVlc4cXQyNFJEVHFBenB4UEJ5bnJkMldyRWwyQjlQVGR6REtUV1Bn?=
 =?utf-8?B?UzM3cXpabEczakFiTWhKdnZBdVFoOFhKU3hkcXRWay9QQTFNaE96dXlKZ0Vy?=
 =?utf-8?B?aGdXYlRqV0ZqMUt0VmVYUnZEbG9pNE1EU1FUWE9qTGI3dE5xbnYwZENhUDlI?=
 =?utf-8?B?TCtVMTV4RWxDWlJaNkQvTDVoTDY0UzVwZXRDeGRqcDhHMFZaWmVFQ3l0YVR5?=
 =?utf-8?B?bE5ZWkYrdDI2bm1uODloMGZEUGhNVDRic05BNkV4YnNnQlJzTEhqTXZ1WTFj?=
 =?utf-8?B?YUFMVkNucGkzeHJSNlI5Vk9UNVQ3YTZtYmszU3p5MnlDL1FRbzdGYjVPSlYz?=
 =?utf-8?B?b3BBUlcwUFVkcVQwcWVMeTRRQ0JtdTBIaEk3OVUrQjlwcW81ZUliSmVRV1VX?=
 =?utf-8?B?UFZCR2xYSVBnaXJ0VVZqODNJc2gva0poN0ZkQzZlS0psdllxYTFEMHFZV0c2?=
 =?utf-8?B?dU85NWNzR0IxT3g4aDJyU3BOVE1jbms2Y25SY24vYkI1TDZwNlZCZDZWc1VM?=
 =?utf-8?B?ZlBPaS9IUlZYb2dFMGljd21xN3JXUDRiMUMwRmlaeVQ0ckNoWGNnUjRhRHBr?=
 =?utf-8?B?WDZyaW9ySlRweXYyNkVUWEVWNjNVdzUyTVBtSUdMalozVFVFSzdXWWVTaFgy?=
 =?utf-8?B?NW45L2Zmb1Jvald5TE40ZXRQUm9YM3NVYlMxRjVWQ1VwMFBuN25xV3RoWGx1?=
 =?utf-8?B?ai9kaUFrYXg5eWlZVjgrMTB0cDFvUkZ2RVAydWtFdS9PZko0T2NQL0RMVVFs?=
 =?utf-8?B?bWhidlllMlIrT1NWVnUrWXE2YVFTVEQramNJQWpuWmt0TFJNYWc2djJYN0Z5?=
 =?utf-8?B?TUZNTUFuQUFuU01lSHVJZ1ZnWmliNnJvVlVjTFE5c3Y5V2RwMklwOWk3VDVJ?=
 =?utf-8?B?TENmdlcramhIRVFxc0dreDNSelF5K0hUcGQ4d1lVcnZ3NElKRCtiN2d0RlRz?=
 =?utf-8?B?Zi8vSE5Tbk1OYU4xV24walJsYkRKc3hsaytuWTNVckNwNGVYRGhiS2JzM2da?=
 =?utf-8?B?a0E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f275083c-0dab-430f-53a8-08dbf5a08d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 14:43:31.7785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUP9lNVWNHec81oKlKUWkWX+Y8gV3NCgoK65bDA+IhbiIwx7P6IXlcqMcc/ef6/oU53hnSmPd/g0IUWkfrtPzmlsCiIz2F1yuuk05gxTz/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7783
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

On Monday, December 4, 2023 10:58 PM, Willem de Bruijn wrote:
>Song, Yoong Siang wrote:
>> On Friday, December 1, 2023 11:02 PM, Jesper Dangaard Brouer wrote:
>> >On 12/1/23 07:24, Song Yoong Siang wrote:
>> >> This patch enables txtime support to XDP zero copy via XDP Tx
>> >> metadata framework.
>> >>
>> >> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
>> >> ---
>> >>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>> >>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>> >>   2 files changed, 15 insertions(+)
>> >
>> >I think we need to see other drivers using this new feature to evaluate
>> >if API is sane.
>> >
>> >I suggest implementing this for igc driver (chip i225) and also for igb
>> >(i210 chip) that both support this kind of LaunchTime feature in HW.
>> >
>> >The API and stmmac driver takes a u64 as time.
>> >I'm wondering how this applies to i210 that[1] have 25-bit for
>> >LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
>> >second into the future.
>> >And i225 that [1] have 30-bit max 1 second into the future.
>> >
>> >
>> >[1]
>> >https://github.com/xdp-project/xdp-
>> >project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org
>>
>> I am using u64 for launch time because existing EDT framework is using it.
>> Refer to struct sk_buff below. Both u64 and ktime_t can be used as launch time.
>> I choose u64 because ktime_t often requires additional type conversion and
>> we didn't expect negative value of time.
>>
>> include/linux/skbuff.h-744- *   @tstamp: Time we arrived/left
>> include/linux/skbuff.h:745- *   @skb_mstamp_ns: (aka @tstamp) earliest departure
>time; start point
>> include/linux/skbuff.h-746- *           for retransmit timer
>> --
>> include/linux/skbuff.h-880-     union {
>> include/linux/skbuff.h-881-             ktime_t         tstamp;
>> include/linux/skbuff.h:882-             u64             skb_mstamp_ns; /* earliest departure
>time */
>> include/linux/skbuff.h-883-     };
>>
>> tstamp/skb_mstamp_ns are used by various drivers for launch time support
>> on normal packet, so I think u64 should be "friendly" to all the drivers. For an
>> example, igc driver will take launch time from tstamp and recalculate it
>> accordingly (i225 expect user to program "delta time" instead of "time" into
>> HW register).
>>
>> drivers/net/ethernet/intel/igc/igc_main.c-1602- txtime = skb->tstamp;
>> drivers/net/ethernet/intel/igc/igc_main.c-1603- skb->tstamp = ktime_set(0, 0);
>> drivers/net/ethernet/intel/igc/igc_main.c:1604- launch_time =
>igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
>>
>> Do you think this is enough to say the API is sane?
>
>u64 nsec sounds sane to be. It must be made explicit with clock source
>it is against.
>

The u64 launch time should base on NIC PTP hardware clock (PHC).
I will add documentation saying which clock source it is against

>Some applications could want to do the conversion from a clock source
>to raw NIC cycle counter in userspace or BPF and program the raw
>value. So it may be worthwhile to add an clock source argument -- even
>if initially only CLOCK_MONOTONIC is supported.

Sorry, not so understand your suggestion on adding clock source argument.
Are you suggesting to add clock source for the selftest xdp_hw_metadata apps?
IMHO, no need to add clock source as the clock source for launch time
should always base on NIC PHC.

>
>See tools/testing/selftests/net/so_txtime.sh for how the FQ and ETF
>qdiscs already disagree on the clock source that they use.
>


 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
