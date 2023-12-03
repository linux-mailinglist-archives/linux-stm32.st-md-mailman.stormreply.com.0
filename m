Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6480222F
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Dec 2023 10:17:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7EFAC6C855;
	Sun,  3 Dec 2023 09:17:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17BC2C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Dec 2023 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701595021; x=1733131021;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RYUxdbYAZYv8PLnuyIA4cPv2ALCED1RS35pZU900Ic8=;
 b=TLXGOkDU9UawRbtp0csUTFiRwE1TDMaUcCD2UJDEDXXtap2+LgY0QBxc
 GbXNJkt3IDMwKHu2rkFYXnPHmaq95ZH1uCi1poZziUe0+qcviiDji89EZ
 tQhchMWBQHErJvQ4nD9dspZWGpVnem+gNLNLUSoSmArNZsVwcMztpWwn5
 wsFwCCtrSU5K2MshmcWm3Jq2GgzY0iccXSxF/A703tAfh4lVgc5Uwem/Q
 +rrNzXY9iPsyBdU1ihnUet7/TA4xOe7xSUUoKxkmSjFtLf0NROap8u3Cs
 i/fMzVFdrARixknSpKOEM3QJSWg2xI6c327c71ZZ9JDyaflcvGtKac2xo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="384039363"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="384039363"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 01:16:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="804580241"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; d="scan'208";a="804580241"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2023 01:16:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 01:16:58 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 01:16:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 01:16:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUhbQRWLcxsar8FPltmj8NUfJIKLuhjHAag6yRDsUbhyfsZw11LMEakBfRapHmuRKbLQxJAFGOspIHb4P/uAdzgdEFDiHgUbvuO3unPwPOJk380mTaGMf4SvKC9jcA+eSU3J9ovIP0ReCpPInRhqjcjzEd3is13YX9O+8XhMaaf7gNwaiJ4jyJhhrAqYz28ikpy/+swypT/6WalcLfYG/mO0f3xIoeFZ9PFU5MkwxEslwJfyGBja9NkV7yF+rBF6iVzfMH4yRmLyuDm101LEa2AgAnSEZq7zoZfWOKjEWAQWf0BG8mbrAh+El7W2RcLSFwb3slBdjHGWGulA3Fe5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYUxdbYAZYv8PLnuyIA4cPv2ALCED1RS35pZU900Ic8=;
 b=DJ4bzeVZtnkkpJfWa8Vc0ou2iVzOxERFPFQWn1O3Cb1r26SpfaMblcU56aoMkpXrzckFFZtLNO82US3p03uFLWPd+7lzeIkCiWAbXM9hsXYbKen4DnS2e9h6N/NRJT2zqFndQiF2fL4iKKEKUX6xHxj613y9pyF23BPwcDtfB/QPxO+/jlrIP6mvSsL0NyS7aHEwy6O5M8NmZTon1dxePs6+pGegmQSyAYX9rE/MFB7vYT+YYqirpo0WaNgQI3p4ko+G7L5C4cwyNotLbkx4i+s/SWEXL2TDOS/Orx+6f8wyED8UQ8EysF6MIMxixyf1KXD7HTn2XCaqjdkf0jkt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by CH0PR11MB8235.namprd11.prod.outlook.com (2603:10b6:610:187::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32; Sun, 3 Dec
 2023 09:16:56 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.028; Sun, 3 Dec 2023
 09:16:55 +0000
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
 Abreu" <joabreu@synopsys.com>, Andre Fredette <afredette@redhat.com>
Thread-Topic: [PATCH bpf-next v2 0/3] xsk: TX metadata txtime support
Thread-Index: AQHaJB8W7iUch8mtVUCDEJ1OnRle9bCUPv4AgAAvtGCAABnBgIAACHYAgAF66QCAAT2Q8A==
Date: Sun, 3 Dec 2023 09:16:55 +0000
Message-ID: <PH0PR11MB5830F6B01E7F06A5337E214AD887A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
 <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <6569f71bad00d_138af5294d@willemb.c.googlers.com.notmuch>
 <179a4581-f7df-4eb1-ab67-8d65f856a2fe@kernel.org>
 <656b3c0ebb103_1a6a2c2947d@willemb.c.googlers.com.notmuch>
In-Reply-To: <656b3c0ebb103_1a6a2c2947d@willemb.c.googlers.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|CH0PR11MB8235:EE_
x-ms-office365-filtering-correlation-id: 92d15ead-8a27-44f4-48d0-08dbf3e0986f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tsAISheooq+lPeNddO3JLcyISUtvLhDlsLHP9XdOVNnSZMLVlwf32bmIN4kVthHwNltpPuow6NwcXHdLZPNat+ohYBwq6h/hxwghdb8oIzVaCpOEXjlNB00dfXJIKwC7U49VxNOR0VPf5vG+J2Ox9eWkT3acpXOHL4EFWXKr0Z+3n1UFn90Xd+H+R+3lRjMzLpNyb2wqP5kvbI84ie27/Na1vp4LVRKt/1oI5KBxHFZG6ux8f2UHxQ+NMWag28c5rW9Yb/e3bMqaKPmtTW4waNsYAbl+uOaRMfGMRAy7vTyoROPUZkMEOUPxJTy8kP22p+n+bYHYyMU+R3FtOn4MAJXquYBKkOgYofwbSuwblUqz9li5FxJ36euggJeSose1kAXwNoG4Dkz2Z5u17EWFcSKoUn3bqvgmJAVD5x8RYVlqSV9woP+a6GOaeY3HsBD9Ucf3r9uHwVrhQpzAF3DfzpgmbnoaW6w4gCgdDnDCxwyNEonEIMrR02G2i7XaMyzE/y2iWzW9BR5RNazA3bnwHGuJkTOUvmerK8DCpKjJHyNC6NwhMxTvInNt1Ht/pCc/zXY9hX3+uSud52KlDKfCMcfRHvRJRYrgrf9fq5URDRXnFf+6BGNOym8iG+Z4kTnI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66446008)(66476007)(64756008)(66556008)(110136005)(76116006)(54906003)(55016003)(316002)(66946007)(5660300002)(4326008)(52536014)(8936002)(8676002)(7406005)(7416002)(71200400001)(38100700002)(83380400001)(122000001)(86362001)(966005)(478600001)(2906002)(26005)(33656002)(6506007)(9686003)(921008)(53546011)(82960400001)(41300700001)(38070700009)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUNqUGkrUnVUUGx5T2ljeHpaRnpyVzF6R1dkNWZhSVptRUg1V05uQnpsdmFz?=
 =?utf-8?B?M0U5VjZiY1JxVmpOSFBwdG8vazU1YnNFTStMZGhZeXloU0lYSExVU0EwbTIy?=
 =?utf-8?B?VVhkNm82RjFRaUJDV29mN2R4N3JqOG9ZMjVQaEVQSmZYczdQRy9KcGRZRFVi?=
 =?utf-8?B?VGZVM2lnWVV2dG10bHpIZTdVajNuOE1UdWl0N21ySWFHenc1ZnVic2luTllX?=
 =?utf-8?B?Nklnb0FnS2FsQ1ZKQ3VheDkwRDFWWlkxeHBaK0t2Qm8rNkxhM2lXRHF5S1Vr?=
 =?utf-8?B?eXcxdkpxMjdRZVQxakVnTG9KU2E5U1AyRlp2MEhjWFluanpYNTFkYWxDUDFL?=
 =?utf-8?B?ZlBMei80L0tnbDQ3U21maGxiLzd0K3dpOEdzZzB5N0hFWWllYVlkcXczM3hF?=
 =?utf-8?B?bDArVWhMR1NnYnhFL2xqak1VYlVzU2lyUWRaRWk3WjYrN0dwTnAxczgrTkdK?=
 =?utf-8?B?blNjOFV4SnVUMlAzcS8wcWFMNm5FeGZrYmd3YmFxZUxSbStkeVorcFhxTURs?=
 =?utf-8?B?SWhmSDFXcUpRMXpUS3ZQaTdlZkUva2NsRFNqWjJ2dXA4NGpVaVNsMnArdDVX?=
 =?utf-8?B?UkpaRHVuMHUyN0l4RGF2bXdsbkNvVGtPbkgvVFFQWEhlMVg5ZXF4ckV0UkpV?=
 =?utf-8?B?TkdtVm9TSG9iYzJFbGI2bnNHaWtRNEVNU21uMk5iR2xXazVLeVBnUzVGR0J2?=
 =?utf-8?B?RWRpcG1iQ2JNa1N1Z21HQnNTV0c2eUs1UHRCZWI0ZWRzTWVSTDFGOGppODFk?=
 =?utf-8?B?c3Y2UTNmSGJFbWlHeWxxSDVtT2gxcWNpcU8rQXFhQ3Y4SzFSSXEyZG9abEw0?=
 =?utf-8?B?VTZvZS80ckxmcGJZZ29nRTlRbjJqSWF0V0RRYVhkREQ5R1pMYkVqUXdNUzB0?=
 =?utf-8?B?eEFKNGpOM2U2QzhHTTg5dzB6OWV3a1BPRitSRnpkMENtWFFONEdBd0ZRMkpz?=
 =?utf-8?B?L01IbjBON0FOOFVZYVpXbVhjaVc3bmdxajRKZDJEeFNlbXowTGlqeENaVGo2?=
 =?utf-8?B?cVd5R05oRnZTUDB5aHFlSjZac0ZTVysxNmVDcjlJazBBc0ZuZHdQK01EWnIw?=
 =?utf-8?B?OEEyZk9FVGZmaENYWkM5OU91ZHNEMzBoa1ZGalFsNXhRVCt2enV3N0VhQTRi?=
 =?utf-8?B?WUpDRUdWKzBhbzEwdnNLdGg3UXZTTnVFNS82TGNoR3RKdzVUV3AvNmZua2xk?=
 =?utf-8?B?VWFTRWVycFo0cHgyc0JqQWRhbDFjMWg1RG9tQVFQeVhWNjh5dWg4c1o0enBt?=
 =?utf-8?B?ZnJyWXBWdm9DbHIrUWkzY1c5SmlBUjVJdHkzbFU0S0RxbFdvRG0wMWtaa1dR?=
 =?utf-8?B?Z2J2UlA0dzJ2RmFTYUNsZW4vU2FrN2ZFeEdQbVlSb25RMjNYZWM5TjBBRjBR?=
 =?utf-8?B?c2FiV2gxeUNzWlZFMi9KQm1CQUorUXlUYURYNUhjTUxWOEtPVnNPQWhJMXFj?=
 =?utf-8?B?aWVSWTRURzQxU2xLbmJJSWsyeVpBQnVuOElMYWN1U2F3a2c1MHE5WDVLUnJ4?=
 =?utf-8?B?cFhKbzdBR3ZHdVVUNERJemtsTXJvSnBZZVZ1OU5PaXVRcm5BcStVUDNVZGxZ?=
 =?utf-8?B?bXZjejE5dHBGbjhFMlJteERaYm96RG5xSmdNdDVseWtzYnVCVDFyUnZmazFl?=
 =?utf-8?B?V3BIWUlZWU5NeWFkSE00UWhpUEdlNFVxQWR1ZHFMenhJQ2lEZHFnZTE2dU8v?=
 =?utf-8?B?N3VPekQ2MHU4RG8wdTJKT2RDQ0cydk5ZTmpnV2E5YTQzNG5xNjZxaTYzcm1J?=
 =?utf-8?B?SEpMb2FYcFhrNXovaGtpa2E0aTRJUlc3d1UyZWkzb1JzWXV1NjRKOTd3ZVZK?=
 =?utf-8?B?VlVIVTRFUmZ2UHcrVnBpMGc4RkJEVkpsaHY1ZXZUeXBGMnJTUTJBdmhkSXhm?=
 =?utf-8?B?OXFTRlNkbDRmMU05NlRsUmcyeUFMLzllb2FjdWZmTmdtcTZibnl2TlZvNU9j?=
 =?utf-8?B?Zm5SL1RhSldIbHpzVldBeDdyZzYrUjZZZW4wSzhBbEM3cjdObnFRSG16Sk9Z?=
 =?utf-8?B?RlRPbU5HZHdUNmNZSEhBQXVLV3k3SW5ETVNrOFVpeitab1ZQL2hCZ1NrNHlt?=
 =?utf-8?B?dGt6TkVhRnBSNXA4THM5ditUcXhaSmRnLzh2WUZ3d3ZJY2xJcDFBcGZLNU05?=
 =?utf-8?B?MTlUd3JCVEtzN0NOUi9aZE9IMFhnSFFtZ3dRelpTeCsyMllDWnFJZGxFck5T?=
 =?utf-8?B?TXc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d15ead-8a27-44f4-48d0-08dbf3e0986f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2023 09:16:55.8340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FGEwmoJZZddXbNCeF7T/PiFilikxQRps56y5MMn9XdTJyyzEL/WuIji7kGNhIUVnZ4b7QUJ6G5fual/vUuKI1Jxynpfa/Uy5Z6jyv3TK6hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8235
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] xsk: TX metadata txtime
	support
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

On Saturday, December 2, 2023 10:16 PM, Willem de Bruijn wrote:
>Jesper Dangaard Brouer wrote:
>>
>>
>> On 12/1/23 16:09, Willem de Bruijn wrote:
>> > Song, Yoong Siang wrote:
>> >> On Friday, December 1, 2023 6:46 PM, Jesper Dangaard Brouer
><hawk@kernel.org> wrote:
>> >>> On 12/1/23 07:24, Song Yoong Siang wrote:
>> >>>> This series expands XDP TX metadata framework to include ETF HW offload.
>> >>>>
>> >>>> Changes since v1:
>> >>>> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
>> >>>> - rename launch-time to txtime
>> >>>>
>> >>>
>> >>> I strongly disagree with this renaming (sorry to disagree with Willem).
>> >>>
>> >>> The i210 and i225 chips call this LaunchTime in their programmers
>> >>> datasheets, and even in the driver code[1].
>> >>>
>> >>> Using this "txtime" name in the code is also confusing, because how can
>> >>> people reading the code know the difference between:
>> >>>   - tmo_request_timestamp and tmo_request_txtime
>> >>>
>> >>
>> >> Hi Jesper and Willem,
>> >>
>> >> How about using "launch_time" for the flag/variable and
>> >> "Earliest TxTime First" for the description/comments?
>> >
>>
>> I don't follow why you are calling the feature:
>>   - "Earliest TxTime First" (ETF).
>>   - AFAIK this just reference an qdisc name (that most don't know exists)
>>
>>
>> > I don't particularly care which term we use, as long as we're
>> > consistent. Especially, don't keep introducing new synonyms.
>> >
>> > The fact that one happens to be one vendor's marketing term does not
>> > make it preferable, IMHO. On the contrary.
>> >
>>
>> These kind of hardware features are defined as part of Time Sensitive
>> Networking (TSN).
>> I believe these TSN features are defined as part of IEEE 802.1Qbv (2015)
>> and according to Wikipedia[2] incorporated into IEEE 802.1Q.
>>
>> [2] https://en.wikipedia.org/wiki/Time-Sensitive_Networking
>>
>>
>> > SO_TXTIME is in the ABI, and EDT has been used publicly in kernel
>> > patches and conference talks, e.g., Van Jacobson's Netdev 0x12
>> > keynote. Those are vendor agnostic commonly used terms.
>> >
>>
>> I agree that EDT (Earliest Departure Time) have become a thing and term
>> in our community.
>> We could associate this feature with this.
>> I do fear what hardware behavior will be it if I e.g. ask it to send a
>> packet 2 sec in the future on i225 which max support 1 sec.
>> Will hardware send it at 1 sec?
>> Because then I'm violating the *Earliest* Departure Time.
>
>That should definitely not happen. At least not on a device that
>implements EDT semantics.
>
>This relates to Jakub's question in the previous thread on whether
>this mechanism allows out-of-order transmission or maintains FIFO
>behavior. That really is device specific.
>
>Older devices only support this for low rate (PTP) and with a small
>fixed number of outstanding requests. For pacing offload, devices need
>to support up to linerate and out-of-order.
>
>I don't think we want to enforce either in software, as the hardware
>is already out there. But it would be good if drivers can somehow
>label these capabilities. Including programmable horizon.
>
>It is up to the qdisc to ensure that it does not pass packets to the
>device beyond its horizon.
>
>ETF and FQ already have a concept of horizon. And a way to queue
>errors for packets out of bound (SO_EE_CODE_TXTIME_..).
>
>>
>> > But as long as Launch Time is not an Intel only trademark, fine to
>> > select that.
>>
>> The IEEE 802.1Qbv is sometimes called Time-Aware Shaper (TAS), but I
>> don't like to for us to name this after this.  This features is simply
>> taking advantage of exposing one of the hardware building blocks
>> (controlling/setting packet "launch time") that can be used for
>> implementing a TAS.
>>
>> I like the name "launch time" because it doesn't get easily confused
>> with other timestamps, and intuitively describes packet will be send at
>> a specific time (likely in future).
>>
>> --Jesper
>
>Understood on your point that txtime and tx_timestamp are too similar.
>As said, I don't care strongly. Launch time sounds fine to me. Others
>can speak up if they disagree.
>
>I take launch time as a less strict than EDT: it is a request to send
>at a certain time, with no strict definition on uncertainty. While EDT
>more strictly ensures that a packet is not sent before the timestamp.

Thanks for the deep discussion and information. I agree with launch time too.
I will submit v3 with launch time so that others can review on the
new naming and provide their feedback. 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
