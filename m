Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AAA3516A1
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 18:06:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEC62C57B78;
	Thu,  1 Apr 2021 16:06:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D0ECC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 16:06:49 +0000 (UTC)
IronPort-SDR: il037KEPJh5grujHP1UN7+v3BhuiOxeXtKj9AuJsTgIZ1jlSI6q5peRv+SML46brjxPdmM/n3K
 1YLbdhduHNGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="189018172"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="189018172"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 09:06:46 -0700
IronPort-SDR: ZoGp2eBgtzBrQijToNXNgn3L/lJYmgHPmHbKqN76ahzXWI0P+BrR93Sx+Vl0OaXk5G+N+u8LuX
 aFJmo65Fw9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="379376141"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2021 09:06:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 1 Apr 2021 09:06:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 1 Apr 2021 09:06:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 1 Apr 2021 09:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El4h2VGDry47q//hLyVeHUWXnyOiwrO17EZ5YU2HN3TEDWD2HpSl3690+ofX8UWKGzXe52DckogoCqUscgVYNdsscInr+pk/B7+/WlYaYj6ov8xcaeZvT/+jpdSJKpjC+3ghLRVP/XQlYa1SI9hvZNpsa6htNfi/vK8PiVD20Am0WNex9/pLSneGG82Bg0OMUCzTnNe2wzNcMLyrdINWOezZA+ww/eaBRW+gnlNqGz2Nt93VbGLf4i4Y3fwlXGw7qyQG4rLFc/1KOdVgAb4HkmJm0b+4fyn6OCnPLkUmme8SAOgThf7WSj1YIK9OS5gVfqJeC4qnTH3oFOaFC4+8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1lQ7EzCqPNtI0UapYwATHp/o6rS+dXG/CwblyV1FX8=;
 b=X/kxu++P8zY02alJnL9AqPzJvVOPF/ZQULd8ctxlAyncaWLpK9p1neUwrt3GRO5Zd6JuDtfPfnXqQWA4V2z1BIb5yv8TkkHr26hrVgjxCDRB0+vUtBvluCeXXhc3jHmAymHYa0Cytf227KNb+OIsk0ABQnidsxxij/YkrpdtC6gMKODBMHDxYh2oF7b/Ddqlxlboi1DJNC01tV4RjpP4hrr46VEygobU6ps8QA+Tm8RgoUKxdNz1IzZjtQmu6rxpR8CAfJY/1eP/30xZv/6v8lotvJEgPZgvLxg7/WXQ95lPx+JiMgmBrxzxidHbK4T3kJnVv1CZjCl905jTqbka8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1lQ7EzCqPNtI0UapYwATHp/o6rS+dXG/CwblyV1FX8=;
 b=hUQzpSWfO+VRwZiPo9gviPUsd5Bx/aHtmTm9vVOP99UeGoy2TnwroXwpY0OSZs01E3adxyOYakYRbXnINOq/k+6HyKByMQ4qykZkOGWojjEBZVEQtE9JHPqG6C3d3Qd+LW5mhGU6029TsWAneC05mtt6xTxwC8Fw2siBAb0Zr9s=
Received: from CY4PR1101MB2342.namprd11.prod.outlook.com (2603:10b6:903:b7::9)
 by CY4PR1101MB2293.namprd11.prod.outlook.com (2603:10b6:910:22::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 16:06:25 +0000
Received: from CY4PR1101MB2342.namprd11.prod.outlook.com
 ([fe80::354e:5024:d39:5a5e]) by CY4PR1101MB2342.namprd11.prod.outlook.com
 ([fe80::354e:5024:d39:5a5e%6]) with mapi id 15.20.3999.029; Thu, 1 Apr 2021
 16:06:25 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, "Jose
 Abreu" <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Thread-Topic: [PATCH net-next v4 0/6] stmmac: Add XDP support
Thread-Index: AQHXJpvyaAyDlTNwe0iTNIhSe8nr96qf0LUg
Date: Thu, 1 Apr 2021 16:06:25 +0000
Message-ID: <CY4PR1101MB2342702E5C52DEF4E905CCFBD87B9@CY4PR1101MB2342.namprd11.prod.outlook.com>
References: <20210401021117.13360-1-boon.leong.ong@intel.com>
In-Reply-To: <20210401021117.13360-1-boon.leong.ong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 722fbeea-8a8a-4058-8d22-08d8f52819db
x-ms-traffictypediagnostic: CY4PR1101MB2293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1101MB2293B83494C7CAA82233B325D87B9@CY4PR1101MB2293.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b3O01u8CrdZVMLP7166BrSMQaZjW51JR5Oe7dJ8FVfda4a3zsJLKA88T+Xa1qnT/Z3/M0ztelV4ja+rfPdiCbfHe+JcQi3waoOfOyAgRGuEB4VzpEELa3x2i9LCHnb0gBA6ko9GWKrfxkyf+U0gE5uJ9jMsZslMtltqyD7vAdoEZtctax8wjvJG3pq9e1tKXHPisAKulj2ptRs9VAMYONhI5cfGap6of/7KRChkSR3jceGNC2Sr0h2YOTGXF1ve7rgHdmbtZKHnXzNJwOv9/8A9mltGl2ou7G+b6vE6lSnA7RCKB88PF1hApH0xAO9R9Lhji1TOaA/nN7IymaddBB7E53rYcJFd72XUz0LEEKrx21ys3twIrFUlyDCWrMxkkoVEAv9r+5Fqw+ogLBmslHYRpwNUnUcJjd+k6sZkmKzPKlG3Y64sdDKJqyow9nxaTB2xkissFWVLbHrd8zlhYlmEHLNl8Vpc7WxtvRvrjMkp+Mc7XzJ8K1nOu+tksHU0Hr46Y4YIWcakKVYVci2mMQURPpGgvpMx5G2gEOOReKhfYTSWx+/yEAVAnlxCjXihyPnEFwrrklhAd4mA3kZSjA0gdvD410xrHpWrNWWveJPHMDEJmIr2PqUxVm0PRlaGTEW4nXV4l58gQzxXPyYSAebyxSpGWKljs7VDT7peCU9QioTXFn96DGX9RbV4qQsemp7cd14NJ8lCmJOXeUSmPk1LmpkQGjFWqv1MVp05ZSfRV/Pkop78pUiqhTPkre7+5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2342.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(136003)(376002)(366004)(9686003)(921005)(52536014)(8676002)(5660300002)(2906002)(6506007)(186003)(54906003)(107886003)(478600001)(66476007)(38100700001)(76116006)(64756008)(55016002)(26005)(83380400001)(66556008)(66446008)(33656002)(8936002)(71200400001)(316002)(7696005)(110136005)(7416002)(66946007)(966005)(86362001)(30864003)(4326008)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHB6TDVBOHRCZm01UzVCZG1ibmc1Sm9icXErNUtxL1BQcHlDOVgwSlcyRmJk?=
 =?utf-8?B?LzJXdTdsN1RkS1BLQ2FkU0FOWVN2VHR0TWo0ZTExMkQ2Z1l4QmduNXV3WGZY?=
 =?utf-8?B?UGQ4Vk94WEFkM0NuTVBXdzZscXp3SXAyT3IzdU9WeER2R3ROYWdaUC8xSWFG?=
 =?utf-8?B?dDNFT0t3L0Y5M0FwZVhCZ1V3ZDIyWEIrRlMrR2w0bDA5RUVOTi84TFNQa0FV?=
 =?utf-8?B?SkQrTXh1MlZMNHNWMFZHb2lBS1ZiVU9aU1N0Qm0yQ2EwMTVYdDhiaEprQmJh?=
 =?utf-8?B?MTUzUVIxVVNXT3ZjRVNjQVdpS3Z1dVhweHNxMXZhTFArekF2MTVUNDRvZ2c2?=
 =?utf-8?B?REprdzV0NmdpdGlvNFRkN3RVNlhLSnEzTVVDbGwrVlQ4Q2NrMTJ6bUlkajB2?=
 =?utf-8?B?ZjkyS0ZnelNpdDFUTWJDVEdpNW9adzFSUGY1SEpMNVUzdWNBRUlYWExTdUFZ?=
 =?utf-8?B?RTNrSGZzLzcyaFJYTldyb0JyenlUTWFURGhHbjI2OERhVkE3WVI1MVEyNkVo?=
 =?utf-8?B?QldaaDJuWElyZ0d6YkJiOEQyMS9TYzAzSjFjZHpiNDJmd1VKZFFlVFpIQ3A2?=
 =?utf-8?B?QWNDOHN3OEg0bHB4ZkhDUE9wNnhnZkxjczdmN1BEUldEeGpEWWFYY212M1BX?=
 =?utf-8?B?ZWp5MjdidGdESWR1VUtBM1pYUHl5alhxbVFlb1ZzWGlyM2RhTjNGY1dEcDRu?=
 =?utf-8?B?c0k2RHZKZ2MxR2ZuVmVIbHhNQ0dKT2haY3R4OVFMOVFhTm1OSEJkM1FIUmF5?=
 =?utf-8?B?VTBpcTRtL2VsZUNGNnFrbXdXaG5ocU1UeHNsMitJWFJrV3I3bHlhNDJYaERV?=
 =?utf-8?B?UzBMSUVtNzI3TEVaQVdBTXJNRDRGaXNrVVE5RFRRQXZzVzNpWjk1TlhORkhT?=
 =?utf-8?B?ZDJCbE9reUdONTVRQXJUTUJVa1BDRFo2aVlxRFdoOVhoT0lGaEdVMHFUSnJl?=
 =?utf-8?B?eXRRMkRnSEl2YzVYVS9PUHgxcHh0NjBuRCtzMUptRU1MYVZYQ09PcUIwbGhI?=
 =?utf-8?B?bGo0K2JnV2xudHB6SGtPcWhGV0hZQXltcXBUcnU3aXhxbzlhMVlTeVBhdmhM?=
 =?utf-8?B?dTNsZUJlUm5oSXY4U2t2bnJ0b1lhMHkwMEtxa0U2djU3NTAzRC9VUDM2R0J4?=
 =?utf-8?B?aU9UNmdBUE5xS0lXUVprTUtVRWNQOGhrN0hHSXBuaEVYa3hCSlN2OUFkS055?=
 =?utf-8?B?YmIzMzBPUHA5aW9tdHZaTTQrSlNGaE9qcDhTZUFFR2w1aXdZWGhIMW9scm0z?=
 =?utf-8?B?d2V6TEp3bDAybXVhU0VtL0NHdmJuQytzcHJJMDM4aFR6WXBGNXlnN0JnWUhv?=
 =?utf-8?B?M0RsR2dVM0cwZHQ4aHVWLzcrZWllT3AzSXZHQ1lpSDgzN2VDaFJQa2xCbTg5?=
 =?utf-8?B?ZExsWW1mcnM0cmUrZWJ3a0d4TDBPb0IzZHM0dnJYb1A5aFdEMEF6ZE5BQkhU?=
 =?utf-8?B?SWI1Q2piQUtOTUxmNTA0Ymd3bXdTUk9QWUZINStXK2FhdzFNVmNZMzE0WEwv?=
 =?utf-8?B?YUxCRy9MWGtZa3A2UjFNTnNqeVdqbS9USWZSOEx6aFJiNm4zOGRRbkh4ZGxy?=
 =?utf-8?B?ck1RN056VmRhTkFtbHZFV1EwZ0dpVGM5UjhYSm5rVGwzVG5uM2VNQk5CSkNH?=
 =?utf-8?B?MG5hS1R6QUEvMUhtSjRIWWdLaTlDSERKRGc3em5oaW42RGw0MDNwUzlUNDBP?=
 =?utf-8?B?anAzMURjek5SMmdkV0JMOURUMVdNdkdndlNTdTdxZWhpOGIxMENNaGc0cDRC?=
 =?utf-8?Q?RGlBBiVtlWcuuc+lk/ZSq9ACAAs5pPXKYhqzIIW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722fbeea-8a8a-4058-8d22-08d8f52819db
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 16:06:25.2381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6U4kJhaQTOmkCFPyyOyzQ82aF5FVNAMp2Odd3Kj3SoSzy3hTCltAaYTcl9Num1NB0Z4Fv2DtNM4z/16J56mUrVDAdXcZ8bxtYUXGHzUPTTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2293
X-OriginatorOrg: intel.com
Cc: Song Liu <songliubraving@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, KP Singh <kpsingh@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/6] stmmac: Add XDP support
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

> Hi,
> 
> This is the v4 patch series for adding XDP native support to stmmac.
> 
> Changes in v4:
> 5/6: Move TX clean timer setup to the end of NAPI RX process and
>      group it under stmmac_finalize_xdp_rx().
>      Also, fixed stmmac_xdp_xmit_back() returns STMMAC_XDP_CONSUMED
>      if XDP buffer conversion to XDP frame fails.
> 
> 6/6: Move xdp_do_flush(0 into stmmac_finalize_xdp_rx() and combine
>      the XDP verdict of XDP TX and XDP REDIRECT together.
> 
> I retested the patch series on the 'xdp2' and 'xdp_redirect' related to changes
> above and found the result to be satisfactory.
> 
> History of previous patch series:
> v3:
> https://patchwork.kernel.org/project/netdevbpf/cover/20210331154135.850
> 7-1-boon.leong.ong@intel.com/
> v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=457757
> v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=457139
> 
> It will be great if community can help to test or review the v4 series and
> provide me any input if any.
> 
> Thank you very much,
> Boon Leong
> 
> Ong Boon Leong (6):
>   net: stmmac: set IRQ affinity hint for multi MSI vectors
>   net: stmmac: make SPH enable/disable to be configurable
>   net: stmmac: arrange Tx tail pointer update to
>     stmmac_flush_tx_descriptors
>   net: stmmac: Add initial XDP support
>   net: stmmac: Add support for XDP_TX action
>   net: stmmac: Add support for XDP_REDIRECT action
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 +-
> .../net/ethernet/stmicro/stmmac/stmmac_main.c | 539 +++++++++++++++---
> .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  40 ++
> .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  12 +
>  5 files changed, 547 insertions(+), 80 deletions(-)  create mode 100644
> drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
> 
> --
> 2.25.1

I tested these patches on my Intel ADL platform using xdp1, xdp2,
xdp-redirect, xdp-redirect-cpu and xdp-adjust-tail apps in
samples/bpf. Samples/pktgen/pktgen_sample03_burst_single_flow.sh script
is used to send burst traffics from link partner (LP) to ADL platform.
Thev result looked good and satisfying. Following shows the test steps
and results that are obtained using Intel mGbE controller under
preempt-rt environment.

Board Setup
###########
 ___________________               ___________________
|                   |             |                   |
|         enp0s30f4 | <---------> | enp0s30f4         |
|  ADL              |                           LP    |
|         enp0s30f5 | <---------> | enp0s30f5         |
|___________________|             |___________________|

XDP_DROP Native mode
####################
ADL:~# taskset -c 1 ./xdp1 enp0s30f4
libbpf: elf: skipping unrecognized data section(16) .eh_frame
libbpf: elf: skipping relo section(17) .rel.eh_frame for section(16) .eh_frame
proto 17:          0 pkt/s
proto 17:          6 pkt/s
proto 17:     658310 pkt/s
proto 17:     679719 pkt/s
proto 17:     681285 pkt/s
proto 17:     681035 pkt/s
proto 17:     680345 pkt/s
proto 17:     678550 pkt/s
proto 17:     680796 pkt/s
proto 17:     681186 pkt/s

XDP_DROP skb mode
#################
ADL:~# taskset -c 1 ./xdp -S enp0s30f4
libbpf: elf: skipping unrecognized data section(16) .eh_frame
libbpf: elf: skipping relo section(17) .rel.eh_frame for section(16) .eh_frame
proto 17:          0 pkt/s
proto 17:          0 pkt/s
proto 17:     113288 pkt/s
proto 17:     244100 pkt/s
proto 17:     222234 pkt/s
proto 17:     246207 pkt/s
proto 17:     245042 pkt/s
proto 17:     228392 pkt/s
proto 17:     243027 pkt/s
proto 17:     195756 pkt/s

XDP_REDIRECT (CPU 0 -> CPU 0)
#############################
ADL:~# ./xdp_redirect_cpu-dev enp0s30f4 --cpu 0
libbpf: elf: skipping unrecognized data section(39) .eh_frame
libbpf: elf: skipping relo section(40) .rel.eh_frame for section(39) .eh_frame
libbpf: elf: skipping unrecognized data section(20) .eh_frame
libbpf: elf: skipping relo section(21) .rel.eh_frame for section(20) .eh_frame
Add-new CPU:0 as idx:0 qsize:192 prog_fd: 33 (cpus_count:1)
Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          total   0              0
cpumap_kthread  total   0              0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  total   0              0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       345,419        0           0
XDP-RX          total   345,419        0
cpumap-enqueue    0:0   345,437        221,150     7.82       bulk-average
cpumap-enqueue  sum:0   345,437        221,150     7.82       bulk-average
cpumap_kthread  0       124,204        0           0
cpumap_kthread  total   124,204        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  0       124,204        0           0
xdp-in-kthread  total   124,204        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       670,172        0           0
XDP-RX          total   670,172        0
cpumap-enqueue    0:0   670,156        387,270     7.81       bulk-average
cpumap-enqueue  sum:0   670,156        387,270     7.81       bulk-average
cpumap_kthread  0       282,904        0           0
cpumap_kthread  total   282,904        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  0       282,904        0           0
xdp-in-kthread  total   282,904        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       660,924        0           0
XDP-RX          total   660,924        0
cpumap-enqueue    0:0   660,931        393,566     7.81       bulk-average
cpumap-enqueue  sum:0   660,931        393,566     7.81       bulk-average
cpumap_kthread  0       267,350        0           0
cpumap_kthread  total   267,350        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  0       267,351        0           0
xdp-in-kthread  total   267,351        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       671,898        0           0
XDP-RX          total   671,898        0
cpumap-enqueue    0:0   671,890        398,465     7.81       bulk-average
cpumap-enqueue  sum:0   671,890        398,465     7.81       bulk-average
cpumap_kthread  0       273,429        0           0
cpumap_kthread  total   273,429        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  0       273,429        0           0
xdp-in-kthread  total   273,429        0           0

XDP_REDIRECT (CPU 0 -> CPU 1)
#############################
ADL:~# ./xdp_redirect_cpu --dev enp0s30f4 --cpu 1
libbpf: elf: skipping unrecognized data section(39) .eh_frame
libbpf: elf: skipping relo section(40) .rel.eh_frame for section(39) .eh_frame
libbpf: elf: skipping unrecognized data section(20) .eh_frame
libbpf: elf: skipping relo section(21) .rel.eh_frame for section(20) .eh_frame
Add-new CPU:1 as idx:0 qsize:192 prog_fd: 33 (cpus_count:1)
Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          total   0              0
cpumap_kthread  total   0              0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  total   0              0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       427,639        0           0
XDP-RX          total   427,639        0
cpumap-enqueue    0:1   427,642        202,047     7.81       bulk-average
cpumap-enqueue  sum:1   427,642        202,047     7.81       bulk-average
cpumap_kthread  1       225,528        0           0
cpumap_kthread  total   225,528        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  1       225,528        0           0
xdp-in-kthread  total   225,528        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       666,549        0           0
XDP-RX          total   666,549        0
cpumap-enqueue    0:1   666,569        315,294     7.81       bulk-average
cpumap-enqueue  sum:1   666,569        315,294     7.81       bulk-average
cpumap_kthread  1       351,251        0           0
cpumap_kthread  total   351,251        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  1       351,252        0           0
xdp-in-kthread  total   351,252        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       671,218        0           0
XDP-RX          total   671,218        0
cpumap-enqueue    0:1   671,198        322,057     7.81       bulk-average
cpumap-enqueue  sum:1   671,198        322,057     7.81       bulk-average
cpumap_kthread  1       349,168        0           0
cpumap_kthread  total   349,168        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  1       349,169        0           0
xdp-in-kthread  total   349,169        0           0

Running XDP/eBPF prog_name:xdp_cpu_map5_lb_hash_ip_pairs
XDP-cpumap      CPU:to  pps            drop-pps    extra-info
XDP-RX          0       663,667        0           0
XDP-RX          total   663,667        0
cpumap-enqueue    0:1   663,682        317,167     7.81       bulk-average
cpumap-enqueue  sum:1   663,682        317,167     7.81       bulk-average
cpumap_kthread  1       346,498        0           0
cpumap_kthread  total   346,498        0           0
redirect_err    total   0              0
xdp_exception   total   0              0

2nd remote XDP/eBPF prog_name: xdp_redirect_dummy
XDP-cpumap      CPU:to  xdp-pass       xdp-drop    xdp-redir
xdp-in-kthread  1       346,498        0           0
xdp-in-kthread  total   346,498        0           0

XDP_TX Native mode
##################
ADL:~# taskset -c 1 ./xdp2 enp0s30f4
libbpf: elf: skipping unrecognized data section(16) .eh_frame
libbpf: elf: skipping relo section(17) .rel.eh_frame for section(16) .eh_frame
proto 17:          0 pkt/s
proto 17:      53032 pkt/s
proto 17:     710618 pkt/s
proto 17:     711055 pkt/s
proto 17:     711740 pkt/s
proto 17:     711797 pkt/s
proto 17:     707434 pkt/s
proto 17:     684045 pkt/s
proto 17:     707764 pkt/s
proto 17:     712372 pkt/s

LP:~# tcpdump -nei enp0s30f4 udp port 5100 -Q in						
20:49:18.963638 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:49:18.963638 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:49:18.963638 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:49:18.963638 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:49:18.963638 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18

XDP_TX skb mode
###############
ADL:~# taskset -c 1 ./xdp2 -S enp0s30f4
libbpf: elf: skipping unrecognized data section(16) .eh_frame
libbpf: elf: skipping relo section(17) .rel.eh_frame for section(16) .eh_frame
proto 17:          0 pkt/s
proto 17:          0 pkt/s
proto 17:     128325 pkt/s
proto 17:     179723 pkt/s
proto 17:     185476 pkt/s
proto 17:     182408 pkt/s
proto 17:     185688 pkt/s
proto 17:     172516 pkt/s
proto 17:     185351 pkt/s
proto 17:     184617 pkt/s

LP:~# tcpdump -nei enp0s30f4 udp port 5100 -Q in
20:51:39.613069 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:51:39.613373 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:51:39.613486 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:51:39.613581 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:51:39.613684 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18

XDP_REDIRECT Native mode (enp0s30f4 Rx -> enp0s30f5 Tx)
#######################################################
ADL:~# ./xdp_redirect enp0s30f4 enp0s30f5
input: 5 output: 6
libbpf: elf: skipping unrecognized data section(20) .eh_frame
libbpf: elf: skipping relo section(21) .rel.eh_frame for section(20) .eh_frame
ifindex 6:          0 pkt/s
ifindex 6:     136241 pkt/s
ifindex 6:     702588 pkt/s
ifindex 6:     703771 pkt/s
ifindex 6:     702328 pkt/s
ifindex 6:     703372 pkt/s
ifindex 6:     700253 pkt/s
ifindex 6:     702647 pkt/s

LP:~# tcpdump -nei enp0s30f5 udp port 5100 -Q in
20:59:49.846614 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:59:49.846614 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:59:49.846614 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:59:49.846634 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
20:59:49.846634 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18

XDP_REDIRECT skb mode (enp0s30f4 Rx -> enp0s30f5 Tx)
####################################################
ADL:~/# ./xdp_redirect -S enp0s30f4 enp0s30f5
input: 5 output: 6
libbpf: elf: skipping unrecognized data section(20) .eh_frame
libbpf: elf: skipping relo section(21) .rel.eh_frame for section(20) .eh_frame
ifindex 6:          0 pkt/s
ifindex 6:     166041 pkt/s
ifindex 6:     186639 pkt/s
ifindex 6:     176872 pkt/s
ifindex 6:     184643 pkt/s
ifindex 6:     188171 pkt/s
ifindex 6:     183235 pkt/s

LP:~# tcpdump -nei enp0s30f5 udp port 5100 -Q in
21:10:09.650126 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
21:10:09.650144 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
21:10:09.650145 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
21:10:09.650145 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18
21:10:09.650146 88:ab:cd:00:ef:5c > 88:ab:cd:11:01:23, ethertype IPv4
(0x0800), length 60: 169.254.1.22.9 > 169.254.1.11.5100: UDP, length 18

XDP_ADJUST_TAIL skb mode
########################
ADL:~# ./xdp_adjust_tail -i enp0s30f4 -P 400 -S
libbpf: elf: skipping unrecognized data section(18) .eh_frame
libbpf: elf: skipping relo section(19) .rel.eh_frame for section(18) .eh_frame
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts
icmp "packet too big" sent:         10 pkts

LP:~# ping 169.254.1.11 -s 300 -i 0.1 -c 10
PING 169.254.1.11 (169.254.1.11) 300(328) bytes of data.
308 bytes from 169.254.1.11: icmp_seq=1 ttl=64 time=0.943 ms
308 bytes from 169.254.1.11: icmp_seq=2 ttl=64 time=1.04 ms
308 bytes from 169.254.1.11: icmp_seq=3 ttl=64 time=1.13 ms
308 bytes from 169.254.1.11: icmp_seq=4 ttl=64 time=0.974 ms
308 bytes from 169.254.1.11: icmp_seq=5 ttl=64 time=1.08 ms
308 bytes from 169.254.1.11: icmp_seq=6 ttl=64 time=0.951 ms
308 bytes from 169.254.1.11: icmp_seq=7 ttl=64 time=1.10 ms
308 bytes from 169.254.1.11: icmp_seq=8 ttl=64 time=0.878 ms
308 bytes from 169.254.1.11: icmp_seq=9 ttl=64 time=1.34 ms
308 bytes from 169.254.1.11: icmp_seq=10 ttl=64 time=1.20 ms

--- 169.254.1.11 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 907ms
rtt min/avg/max/mdev = 0.878/1.063/1.340/0.131 ms

LP:~# ping 169.254.1.11 -s 500 -i 0.1 -c 10
PING 169.254.1.11 (169.254.1.11) 500(528) bytes of data.

--- 169.254.1.11 ping statistics ---
10 packets transmitted, 0 received, 100% packet loss, time 933ms

XDP_ADJUST_TAIL Native mode
###########################
ADL:~# ./xdp_adjust_tail -i enp0s30f4 -P 400 -N
libbpf: elf: skipping unrecognized data section(18) .eh_frame
libbpf: elf: skipping relo section(19) .rel.eh_frame for section(18) .eh_frame
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          1 pkts
icmp "packet too big" sent:          1 pkts
icmp "packet too big" sent:          2 pkts
icmp "packet too big" sent:          2 pkts
icmp "packet too big" sent:          2 pkts
icmp "packet too big" sent:         12 pkts
icmp "packet too big" sent:         13 pkts
icmp "packet too big" sent:         14 pkts

LP:~# ping 169.254.1.11 -s 300 -i 0.1 -c 10
PING 169.254.1.11 (169.254.1.11) 300(328) bytes of data.
308 bytes from 169.254.1.11: icmp_seq=1 ttl=64 time=1.00 ms
308 bytes from 169.254.1.11: icmp_seq=2 ttl=64 time=0.829 ms
308 bytes from 169.254.1.11: icmp_seq=3 ttl=64 time=1.12 ms
308 bytes from 169.254.1.11: icmp_seq=4 ttl=64 time=1.06 ms
308 bytes from 169.254.1.11: icmp_seq=5 ttl=64 time=0.946 ms
308 bytes from 169.254.1.11: icmp_seq=6 ttl=64 time=1.14 ms
308 bytes from 169.254.1.11: icmp_seq=7 ttl=64 time=1.10 ms
308 bytes from 169.254.1.11: icmp_seq=8 ttl=64 time=1.10 ms
308 bytes from 169.254.1.11: icmp_seq=9 ttl=64 time=1.04 ms
308 bytes from 169.254.1.11: icmp_seq=10 ttl=64 time=0.870 ms

--- 169.254.1.11 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 909ms
rtt min/avg/max/mdev = 0.829/1.020/1.136/0.101 ms

LP:~# ping 169.254.1.11 -s 500 -i 0.1 -c 10
PING 169.254.1.11 (169.254.1.11) 500(528) bytes of data.
From 169.254.1.11 icmp_seq=7 Frag needed and DF set (mtu = 386)
From 169.254.1.11 icmp_seq=9 Frag needed and DF set (mtu = 386)

--- 169.254.1.11 ping statistics ---
10 packets transmitted, 0 received, +2 errors, 100% packet loss, time 930ms

Regards
Song, Yoong Siang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
