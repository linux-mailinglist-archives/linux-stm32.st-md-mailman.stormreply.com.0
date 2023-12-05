Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA98058A7
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 16:28:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7C3AC6A61D;
	Tue,  5 Dec 2023 15:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23F37C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701790115; x=1733326115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PN0ZliOTVA6XSn5K8PWFra8kcRkgHxVuDL7nqBV8yW0=;
 b=Dd8xdHmNDK8hwxhfEHdAMlJc4OKrzXGQAc5bX4f1WlgGmRV/df2GMS1e
 snx6EinPYjGsd4SGJ3h4b8Vi+a0UkzCPdeGWwF1IZ01GrsP8wUn2aXuUC
 J94OvgksBHOcGQ6lpV9bacVz6euL/hu/QeV00Tz57IdO0Vpr3mkyQbsIg
 mXnvGvstHQ0yvXdg9QQHNeX/L9m3SlMddmEWOLIaK4hOrErs2YJVem+qL
 S4lpNDSn3kPfSBfQ3q+i9ZyqFSzxHA9x1fZ9dn21QBdf3DZ7nYZXMlZYQ
 0jZMM3rupPUzivfSHHVdhsKjsVqSt7n32+yukUYiqWma8YxR6SeJCgmdn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384312589"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="384312589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944294166"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="944294166"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 07:28:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 07:28:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 07:28:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 07:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNOb6z6SLNGbcDj1MiNFTl+EF58ecwAoj5hj/p4SfHAJDMDFQT9StXw25wnJMvxy8eFI4O7pc73F42HAnnEVPNTP92+dqvYgQK8J7yACwczSkfcoklavdhb5F6Ncvmw3pxjrN76wN5/Oxfjz0cjPjI+Y8VwtW8SYEXukB+vR0Dhyj4uGlVjlyQTQu3blGk2u14EyIsiwg3kcgWJX7i9LSq5gXViVx+4S0Waqsj/K7lv0BeFKTNBof7q0qm9oCm4y4rABiEN9mjDAdvMxZhiRZVZ+jLH8X5xXeRYaT1kWSqMIHuWQnVG6R5c07F/CuKtM6vRh5yeHFSDfW3Rf6kDWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN0ZliOTVA6XSn5K8PWFra8kcRkgHxVuDL7nqBV8yW0=;
 b=ZSuUS2P0YJcbjT9tJg5m1Ul/Si1oWZqphNJvry8muAfRmWV6SNTpVzO0umLkvfW3M1T0kVZJ1bzIqLsFJUmKZfIuY/QAo9tqMRqfySG71nP6x+mLGFwIpKbHA/yWBB3iWYiBwhAUZUngcVf6G+qyVAz/AsYYxvmARC1cUCGApo5fyht1dWAff9s32+0anURCSD6ASnAcepT5lpglWiM5IIW6R7vrahpBSKudq3R0TLXyRmHSpTmFJro0abNKuJEgpE3XL5lIK372Gr4RjJP+Ouqxu7Jt9wzNlG0RUaaIfq5/lK4Z+8vnsi3qzRONOaKrwQ+ooMrLRAwWlXLGHpHZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 15:28:15 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 15:28:14 +0000
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
Thread-Index: AQHaJB8y3IJpv0o6sk+7VcjRfinq5bCUhocAgALJsHCAAewHgIABi3dQgAAGLACAAAhW8A==
Date: Tue, 5 Dec 2023 15:28:14 +0000
Message-ID: <PH0PR11MB5830AF989CBE622085C2175ED885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
 <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <656de8eb14c24_2e983e29435@willemb.c.googlers.com.notmuch>
 <PH0PR11MB58305C7D394FD264F1634819D885A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <656f39d668439_3dd6422949e@willemb.c.googlers.com.notmuch>
In-Reply-To: <656f39d668439_3dd6422949e@willemb.c.googlers.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|MN6PR11MB8145:EE_
x-ms-office365-filtering-correlation-id: 518a0103-2e22-41a8-2b08-08dbf5a6cc55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zH9SupDpJ+6WLHstF69PMKZLzohPKjOYZNlgc/MISG+5bt2T3279hCz/31ktCk7FA8Wp/V0lH5WhUROkuZafq+A3TROCw+UTRAsd3kehS0YyAk2Rzb0F7hdzvtTvjVr/B1S8VBsKNxo1t0SsldLIiW/VvxSvYSFeQPssYjlQqGKAAGetoCtm4wHhO1xJGIP6U2vYIDcsyEon3hP4SZjNcyCVH6LOpFGHgdK7+h6859esolfINgzOJR9vZ+Vq0tYCDLo/vvFYnQChwLxDzh82jRfPJUzjm/HpNGzkArZ8AWLaO9lNWren0rmNp2OGWAXbcy+GTUGv/xDA/21LWBOwBcucOsl5GfcqYVpDyE/4XwtGGcavfFtjn++uW2v6uiADt4n4LzuKHqrAvfroMcvFha2UMuFaNTZef8mdZSh2hLCCiY13QKpdwqczFQCCZYzIR9BpP/ogBOMv/lSZaX0QyvA1Ejm8p0fDtJBI3+p94J1N/NnqMMfFQoBmXiFi499mD8/RQEIbyDip0xskkilxClTCePvolzQxJ653iKPmCcIzje73wRlaujPTGCpbvKHOVdALmAtKu8ko7YBHoUjJQxoN4fe0yjfVxT1TX6aecuduN/r6jYxuGVLdsghLqs1e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(478600001)(5660300002)(71200400001)(53546011)(52536014)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(66946007)(8936002)(4326008)(8676002)(6506007)(7696005)(76116006)(110136005)(86362001)(921008)(55016003)(38070700009)(82960400001)(83380400001)(122000001)(38100700002)(41300700001)(33656002)(7416002)(7406005)(2906002)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTVXbnh2dkZLWnRHaXdicVpaSVdiZzZ4SEFZSXpKTEFVNjgwZ1hQdis2R1NI?=
 =?utf-8?B?dWIvWGJ0YnZpWE9MbzZDR1YzaGVKZFhvMXkzSDZrOHc3L25UZFFBUHNzQXVO?=
 =?utf-8?B?VGNSQ0V3WGM4UmtkUmhpdlJLM3Z5MXN2a0k0M25ybk5WL3hhWk5ySGtXZEdp?=
 =?utf-8?B?dkNvUzcvaTEvdU0wcWl1aHRyU056cWZpUEhOUVR5amFYSnpMbmVKWG5TRnp0?=
 =?utf-8?B?YjdZTHZpUXN6S2ZFbExBbTltNDFhRm9qcjFCaGNQS3JpQlRIWHJ3WjFkV08v?=
 =?utf-8?B?dWYxNTdNMFo3UW5RMXIrVTRTWTV5Lzl4YzIzMG5BS2REY2RNTVZFL0lQYXh3?=
 =?utf-8?B?UVkvaEo2WlNNTDRaczkxL1RVMXJFUHRzTmpYakVmMXd2UEhlQTNtOFZrRi84?=
 =?utf-8?B?ZDV2NmQrSmJ6V2JhYmo3ZHpqQVJlM1Joc0M5cEdWb2lqT01XUFNIMFlKNzFJ?=
 =?utf-8?B?cktSWmZXZWcxY3BCQnpxNFJPVm5udkhiS1hYNkoyeGpncDVFVVVGcTUrTWxh?=
 =?utf-8?B?Nm9YOHlHV3ZnbTd5ZVZKdVpnOWJMR2JpaUVGMFgyRXZMSjBZdGE2TVlid1gr?=
 =?utf-8?B?Y1VRSmt2VENwbDhUK1hkOWxMYVNSTldqZ2RRWjhSTU40azhjTmNrbkphN0Na?=
 =?utf-8?B?akdxVVBPUGtRc2NqV3JNUHJGTGtWR1d4RVcwdDlvcU9nV001OVFkc2Jud1pp?=
 =?utf-8?B?b2hESkttZGVNMVJQd2tqSFJjSjRFbjh0NFR1MW1Xakx4TDdRaEJjcS9GMmF6?=
 =?utf-8?B?cGpuK0RJUENZUU5zbFE2bmd2eFVhTGJLbWlPd0RiNTdQTnlpakFKeUtqdmpo?=
 =?utf-8?B?WG5jZE8vN3gyMUpFMDV3dEtVY3dVUStaYURjZmNDMG1SN0x4dHk4NElmSTda?=
 =?utf-8?B?Rkd2OGZRUUhaaHhXYTZZdlcyOGNiVTRwUVV5MVFDS2R3ajBBcXJKNnJueTl6?=
 =?utf-8?B?bVFCeHdUR1RhdXhuV1B4VmxJeHNBczJ6eVYxV01kc0E4Y0VnQUpFUlVoK3ph?=
 =?utf-8?B?bWRaR2Rqbk1ZNk01emhoL2JYUlduUHZxOHYyWnBJeUpMUGIxVVdsajFJejBW?=
 =?utf-8?B?N0c3M2JKRXFwc1pnZWJ4enFtQld1NDhXSGM2UHhuNHFZckpmbWtlMmIyZWNR?=
 =?utf-8?B?NXZOZmlNWHpUNEQ3ajFBYTNtM2lBVFREZEZEaXk4aUFBUmQrYkVROHl5R1JD?=
 =?utf-8?B?cDZtbEtnNms3TFlmRFRHWm53bVRLV1dDcW1UaUNqZkY3OVBaOHNmUE1vZnlt?=
 =?utf-8?B?UjJ1a1pzZUgzV09IQzg4QUdjeTlVS3Nxb0xMQ2xib1dQOTlkTytvMnRaN3Vi?=
 =?utf-8?B?d3VVMU5FbjBnVTczNzFMWnVJTk5Xa1VDOHk5dTJOalFmekRSekdET24yajdU?=
 =?utf-8?B?ZmhTWHRkQXZoWktDMllOUjV0RVBIeWpDRDQwY1krWnplN1RPWlliMWppanJG?=
 =?utf-8?B?SGNMNGtxSE02bXZKaEZ6YUZMbmVCelp2REl5WVg3WGRZU1h5SGdoQUVwdDFh?=
 =?utf-8?B?cmVoNHBmanhpQUlFL2RIdVFLN25reE1uSTQra25mcldvWjdENW1HanZQdjBh?=
 =?utf-8?B?eG11YitCL3JqdzNSV1gzdTJ3Q09VSlkveHI0NHZ3UWxraEQwVmJtS2xNNHA2?=
 =?utf-8?B?aGt1MDRoalNwdnI2azFGTHFvVXRhQk1QdHZBdWxFYThDQkhGQ25ja256Z0d5?=
 =?utf-8?B?RTM1emVleFp0ckF5V1JpUWVvVGxVcGJBMTNuMW1OUlVGK1Bqa0MrbmtoLzFz?=
 =?utf-8?B?UmMxbG1BQUFORFFYdWJiQmVJWEljSFhuKy9pcEF6MDRpanplTUNacFFFeEtG?=
 =?utf-8?B?c1dJbzNKUzRCQytZN3pRMHRLZm4vanpMcEFvd2ZqUFJYWHl3RXFLeG1YMkxS?=
 =?utf-8?B?Z2dzeXdvUmUySU5PSW9DanBmbzc0bVB0VWh6Wk9zTU5TaDlyb0w5UVR4TVhL?=
 =?utf-8?B?WHhWNzdQUnpoa1JmWkdibXhyZ0taaEFTaDBiSUlIMUI3Nlc4SThkVHJzY3l3?=
 =?utf-8?B?NW9rQVVmeDhWRXFEb0pybStyVWlhUjU5RUxuK1dGQ2d6TXJaVTlKVU9ua3N0?=
 =?utf-8?B?VWVXQWlzQ3k2QWJDN1pUNlFmaHpWTndvUzBRdU9wNTFnTUpRMXlEWnlIRVpu?=
 =?utf-8?B?bjhIblh6dDhGT0pZZTNFVWJMbHZ6bXN1L3BtQWVSU1UweTdXb3hCcFVDTDU5?=
 =?utf-8?B?V2c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518a0103-2e22-41a8-2b08-08dbf5a6cc55
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 15:28:14.4033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pfq3B3uXGUXdIvOrsGBozksAg3Z8MNgjRBut77Rb150qVrhA+SFURRSw/RrJSefCWvYdPH/cxMmJktnIox4hXHQrtAp4dBRV8d0rgJJv7CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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

On Tuesday, December 5, 2023 10:55 PM, Willem de Bruijn wrote:
>Song, Yoong Siang wrote:
>> On Monday, December 4, 2023 10:58 PM, Willem de Bruijn wrote:
>> >Song, Yoong Siang wrote:
>> >> On Friday, December 1, 2023 11:02 PM, Jesper Dangaard Brouer wrote:
>> >> >On 12/1/23 07:24, Song Yoong Siang wrote:
>> >> >> This patch enables txtime support to XDP zero copy via XDP Tx
>> >> >> metadata framework.
>> >> >>
>> >> >> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
>> >> >> ---
>> >> >>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
>> >> >>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>> >> >>   2 files changed, 15 insertions(+)
>> >> >
>> >> >I think we need to see other drivers using this new feature to evaluate
>> >> >if API is sane.
>> >> >
>> >> >I suggest implementing this for igc driver (chip i225) and also for igb
>> >> >(i210 chip) that both support this kind of LaunchTime feature in HW.
>> >> >
>> >> >The API and stmmac driver takes a u64 as time.
>> >> >I'm wondering how this applies to i210 that[1] have 25-bit for
>> >> >LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
>> >> >second into the future.
>> >> >And i225 that [1] have 30-bit max 1 second into the future.
>> >> >
>> >> >
>> >> >[1]
>> >> >https://github.com/xdp-project/xdp-
>> >> >project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org
>> >>
>> >> I am using u64 for launch time because existing EDT framework is using it.
>> >> Refer to struct sk_buff below. Both u64 and ktime_t can be used as launch time.
>> >> I choose u64 because ktime_t often requires additional type conversion and
>> >> we didn't expect negative value of time.
>> >>
>> >> include/linux/skbuff.h-744- *   @tstamp: Time we arrived/left
>> >> include/linux/skbuff.h:745- *   @skb_mstamp_ns: (aka @tstamp) earliest
>departure
>> >time; start point
>> >> include/linux/skbuff.h-746- *           for retransmit timer
>> >> --
>> >> include/linux/skbuff.h-880-     union {
>> >> include/linux/skbuff.h-881-             ktime_t         tstamp;
>> >> include/linux/skbuff.h:882-             u64             skb_mstamp_ns; /* earliest
>departure
>> >time */
>> >> include/linux/skbuff.h-883-     };
>> >>
>> >> tstamp/skb_mstamp_ns are used by various drivers for launch time support
>> >> on normal packet, so I think u64 should be "friendly" to all the drivers. For an
>> >> example, igc driver will take launch time from tstamp and recalculate it
>> >> accordingly (i225 expect user to program "delta time" instead of "time" into
>> >> HW register).
>> >>
>> >> drivers/net/ethernet/intel/igc/igc_main.c-1602- txtime = skb->tstamp;
>> >> drivers/net/ethernet/intel/igc/igc_main.c-1603- skb->tstamp = ktime_set(0, 0);
>> >> drivers/net/ethernet/intel/igc/igc_main.c:1604- launch_time =
>> >igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
>> >>
>> >> Do you think this is enough to say the API is sane?
>> >
>> >u64 nsec sounds sane to be. It must be made explicit with clock source
>> >it is against.
>> >
>>
>> The u64 launch time should base on NIC PTP hardware clock (PHC).
>> I will add documentation saying which clock source it is against
>
>It's not that obvious to me that that is the right and only choice.
>See below.
>
>> >Some applications could want to do the conversion from a clock source
>> >to raw NIC cycle counter in userspace or BPF and program the raw
>> >value. So it may be worthwhile to add an clock source argument -- even
>> >if initially only CLOCK_MONOTONIC is supported.
>>
>> Sorry, not so understand your suggestion on adding clock source argument.
>> Are you suggesting to add clock source for the selftest xdp_hw_metadata apps?
>> IMHO, no need to add clock source as the clock source for launch time
>> should always base on NIC PHC.
>
>This is not how FQ and ETF qdiscs pass timestamps to drivers today.
>
>Those are in CLOCK_MONOTONIC or CLOCK_TAI. The driver is expected to
>convert from that to its descriptor format, both to the reduced bit
>width and the NIC PHC.
>
>See also for instance how sch_etf has an explicit q->clock_id match,
>and SO_TXTIME added an sk_clock_id for the same purpose: to agree on
>which clock source is being used.

I see. Thank for the explanation. I will try to add clock source arguments
In next version.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
