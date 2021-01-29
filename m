Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93330838B
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Jan 2021 03:05:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A01EBC57183;
	Fri, 29 Jan 2021 02:05:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CDCFC57180
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 02:05:30 +0000 (UTC)
IronPort-SDR: SU25aMb9QhjcCM2OjEDye4uJCRNKIMq7M6g9af5GOta5sxszBq0p/TjH5meqZ2Db2SMKPE9oiQ
 emDCJuCH9Fbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180427314"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="180427314"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 18:05:28 -0800
IronPort-SDR: ml1GMd+51piw56cSSQ8PG43llJlP/zkM1ixRF12qlG1uCBAToNi67OrEDz6zcm2km9pU9crWnQ
 d/hkY/RQjFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="573867347"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Jan 2021 18:05:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 18:05:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 18:05:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 28 Jan 2021 18:05:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 28 Jan 2021 18:05:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgJNEyU6tu7DAU2o4cPHNrKLVQmRO/IWYUVvjwQ78s96GsjqUBoMKJcBArtCVZT7ilyLR1VKGloO8GbF0K7QXPqkp1JnWvK+duis1LD2q7B3YzEMXIbBGWxd6py+FiT03tlQrqKzSwG2TXbEckOo06HhAah4MGFJLdwfA3AKSY+xzuDc6t+7NkObOfurhOpeSCZgZHOZ4/XzaEXLuxQ/rMqQDmKgE9Ulzch6M+p9p8DpcDJjCxUf10GqqqNOl9Ud9b5V30UmRXdaqPLHKdWco4X2pFF8swXKHqbAvlZE6RZThLkVdZx013LKz3tXsjdqsmi/YCHE4bxMfxPx9kSW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKORvpjFMdJbfF02kVhPzBucXuNpuT3afAxYLXyhxk8=;
 b=Rhem8IujqBpuYloSu/12mIFOlZTgCcKvtcaj0nFRO3/Cte6wPJkUGd0HmahEROELi0wRhGsCA5KErk/oWPFlgKisB/MtmFxJyglizspCACyu6etVpFG7Ar8OQah+oha5XNtdxzvegbbWz5K8mYYmJt7JijiiUJWPnd2b/57TxWs96JVKYY5EEKtY8Vq8FIwnR00Yp5m8kjtb41YEkHVWWpkgHJbFOINR41uDToGrlhlM7/XSuqUSqLKwj/fV222bPYlcYD2LfETirfc6XR+FmwCSdXKuyizmuJ5baT3gRm0kkGRTANplBRqcLJfsgnRj0AKGqVsg18GqYMIy184o8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKORvpjFMdJbfF02kVhPzBucXuNpuT3afAxYLXyhxk8=;
 b=uy1pi94xX0n4Wy1IBqppr/XcbBhZdIJD6omuf30DxR55kPrktj0+MtaKRt+A7pfEzMGI0TXSTK6s2T99E+nwX/B8oCGx0KQDJEvRhTTMxShj+rwXAUxlerPARLnoq56ru/Zgyd1Uuw3cdl8n0RZ0EfeBuutnxMFTlBbLl+PLN40=
Received: from SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 by SN6PR11MB2976.namprd11.prod.outlook.com (2603:10b6:805:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 02:05:24 +0000
Received: from SA0PR11MB4558.namprd11.prod.outlook.com
 ([fe80::b940:a037:a4d8:1319]) by SA0PR11MB4558.namprd11.prod.outlook.com
 ([fe80::b940:a037:a4d8:1319%9]) with mapi id 15.20.3805.017; Fri, 29 Jan 2021
 02:05:24 +0000
From: "Ismail, Mohammad Athari" <mohammad.athari.ismail@intel.com>
To: "patchwork-bot+netdevbpf@kernel.org" <patchwork-bot+netdevbpf@kernel.org>, 
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org"
 <kuba@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Voon, Weifeng"
 <weifeng.voon@intel.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH net] stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE
 to 32 bits DMA addressing
Thread-Index: AQHW88tDQtUpuEdQyEWv+Jmd5eCfy6o9jyKAgABOvAA=
Date: Fri, 29 Jan 2021 02:05:24 +0000
Message-ID: <SA0PR11MB4558209CFC8BF8373D0B2532D5B99@SA0PR11MB4558.namprd11.prod.outlook.com>
References: <20210126100844.30326-1-mohammad.athari.ismail@intel.com>
 <161186881130.25673.3724673380406985947.git-patchwork-notify@kernel.org>
In-Reply-To: <161186881130.25673.3724673380406985947.git-patchwork-notify@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.202.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72823ebf-cdcf-4aef-4db6-08d8c3fa570e
x-ms-traffictypediagnostic: SN6PR11MB2976:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB297603E25EB6412058E0C527D5B99@SN6PR11MB2976.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P2qYG02kgmFEkKD6+S/qSErjS+U3Qld8dG3N9wbysVZrNKKzYcAnuyjK01vq95vwh8uTimg1ZWd5jFf8sqEdI8kJKBoc7OludHrrUPCXnotsMMyRkhNht7pjb5697ndy24JrX+PEb4KhE+70W9beXrcFJ11nmz4nUN3DRmokKOPoD9zE+IVRE2rsB2IH8FCxDtR6yeCPcgyu/J/Ujr2wlQC/2ONr9iQN5uJcqquRQNl+iZyOpgag03BwN/PLkmYlE5t20J1p2N1SJ17UZq1qH2qXgkeXIhMrTBy6CRfdU1B6DdH+GRU1SkfXDJR1l84qXzGKbmiLKIWe5DKBs75PVLuNYFgqsdKdZbztuZJYD6ko49+N7cTzqb/zmW4sszLGgUTsMZIjXIqaDFiTQHQoXkxS5FqKcRoN/k7KlhH5iexHs04Pg0ABYpw9JkLA0scZg+IVXbCFSLAF0X1BQqwS1sB7AcdXmCrZQM080m7/3nc4Z+2itZ5Yf50h6AKKO8rSDemJtNqf4Vtk0Lw4MCY2BNFF7qSPQghTWxK6mO9wmB2PDAVOoS+J+cRYmdSGUfFgn9DGWOYidsABZWOOU/ln6Ahne13cuoeWsh2lA+EJqg0sMIsGOTPKGhc7dMtvwCusVJoXTie7z+BJI7R+LH4zrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4558.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(2906002)(71200400001)(7696005)(7416002)(110136005)(83380400001)(921005)(9686003)(55016002)(45080400002)(8936002)(8676002)(478600001)(66556008)(66446008)(66946007)(64756008)(66476007)(966005)(5660300002)(53546011)(6506007)(52536014)(33656002)(86362001)(26005)(186003)(316002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?L0JsWkJXSnVBQ09Wd1BFU1BmMEFZNXhzRThCQ3QvMnBZS0g4MjRxaVJRUGtN?=
 =?utf-8?B?ZTdTSU1FaVloTnY3Slo4Rzc0bmt0MjlqZmFlUmtnV0wrbWd5cE1KMUcxV2N4?=
 =?utf-8?B?SVJBZHJ0b1lXSFI2L0tJMzZpbzhySXdNY2trYnpRYlVndWdDV0tkUG81dmc0?=
 =?utf-8?B?Zkg1LzdUWnN6Zk43WFVjZGpseGNpL3NXam96TVp5MDBrZVJ6MG5uSitqd3ZX?=
 =?utf-8?B?alVkbk1LanFwRDg1T2pncEMrdnpRbWZpQW5VZTNZK3dDUE1vV1hCdFQxYnhU?=
 =?utf-8?B?NWNUU05RV01CS2RNUEI1cThXNUV5Z250UHh4eHdWSUZ0dkFMbWNNOGgzS3E0?=
 =?utf-8?B?VDBrQzV5YkpZamNrT0lsWldsTUZWR0NQYTBUVlY5cDYwKzJ3QURpMEZNOFRX?=
 =?utf-8?B?NFNFSXo5ekQvUDlOZGhObThML2cvQ2N1ekpFdzVzR1kybDE5Q3VxMVFscDc1?=
 =?utf-8?B?S1BFUU42Tk1sVW5JZ0JleWVsNklDWFNLOXF0RGpRMXVpMG51VTZzczNwSWlh?=
 =?utf-8?B?SXNBT003aTNRakkrdlo0RWJYR3YwTW9iMlYyajJWMWlFSm96aVpGdHkvbDVL?=
 =?utf-8?B?ZVpueStWU0R4QStadVQ1Wk4vemZuM3BldjdXb2NiOHhuamljY1RqQTBBNFJo?=
 =?utf-8?B?aE8xdGlmZmNPc1BhUXg3WkJvSldFRGhXMHl0dWRnSktyUjZWc0F0aVpQVjJZ?=
 =?utf-8?B?aDVMaUZKUWNHTmVycW9DT2NHNW1xZGxZRHBrM1FCUGpuUENoNVdjNjE4b3Fv?=
 =?utf-8?B?RGhmQzI0bGhrVTZQRFdWL25leGYrdHl5WmRLcHkya25KRXpxaElBWXVrSnRt?=
 =?utf-8?B?RlZmZlhRQUhrYzIzeEREd2svYTRZNXdpY25UdWNQUjV0dHQwMFFrNmcvNnlr?=
 =?utf-8?B?NFdSZDBHTDdrNjZ1cGZ1VU9DVHh2aGY0ZXpIS1AxYXQ5TEdrcFE3ZDlWZU5v?=
 =?utf-8?B?SkNNQlFyWndFOEJ0aS9rUC9sRW5QV3BjcTFiOXliNmZvVEZBUU5TRU9yRDV1?=
 =?utf-8?B?a2ZJMUhiOFNmSkNqc2RxbFdwZ2E5anc1ZXp0Q1A2TnpTZjU2cUcxcFpEdUpz?=
 =?utf-8?B?YUFveUlVVktkQlRQMWdUdnR0YWh6dGN4V1ByQWtCUHE1SkZpN3lYTk9WWkZI?=
 =?utf-8?B?Q056Z3VTZk9XaXJkZ2FKNGlDRnQrNHZQN0F6MFBJL3I3REt0YnNQOTNwUWgw?=
 =?utf-8?B?eCthQTBMT1hFYnFob0QvSGxYeXN6alowMy9Bek9NSFZ0MVpucDVRSkxrRm9h?=
 =?utf-8?B?NTlReU94QUlHS1JDclRNakN4Vmk5MStjQ1VpQ3IwTWhtWnhZVVZXTTc1OFZL?=
 =?utf-8?B?SkRpbktGVXV4WHYvUUttY3gyakttSUJBTUU2eFNUdXR1OGtTeUYydFZnNmFD?=
 =?utf-8?B?VHpVaW54bmVzYi9NMWtHTk9VazcvZUhpbEtWekhmcUh2aUV4aTdINlB3WDZS?=
 =?utf-8?Q?SZ8HnhpJ?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4558.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72823ebf-cdcf-4aef-4db6-08d8c3fa570e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 02:05:24.1754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hrB3g4Keyt/luTxBsXbYik6jt19qMcq7qAo6O1dQSYinMFOvBHOb0FNNRRJLVHWo6xmLNNllc3AdjZY9ECzdY5SiDGg43mHZ2mxVUNGpAtv21WDaFQ/OJpNxzSIolly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2976
X-OriginatorOrg: intel.com
Subject: Re: [Linux-stm32] [PATCH net] stmmac: intel: Configure EHL PSE0 GbE
 and PSE1 GbE to 32 bits DMA addressing
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

Hi,

Thank you.

Regards,
Athari

-----Original Message-----
From: patchwork-bot+netdevbpf@kernel.org <patchwork-bot+netdevbpf@kernel.org> 
Sent: Friday, January 29, 2021 5:20 AM
To: Ismail, Mohammad Athari <mohammad.athari.ismail@intel.com>
Cc: peppe.cavallaro@st.com; alexandre.torgue@st.com; joabreu@synopsys.com; davem@davemloft.net; kuba@kernel.org; mcoquelin.stm32@gmail.com; Ong, Boon Leong <boon.leong.ong@intel.com>; Voon, Weifeng <weifeng.voon@intel.com>; netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 26 Jan 2021 18:08:44 +0800 you wrote:
> From: Voon Weifeng <weifeng.voon@intel.com>
> 
> Fix an issue where dump stack is printed and Reset Adapter occurs when
> PSE0 GbE or/and PSE1 GbE is/are enabled. EHL PSE0 GbE and PSE1 GbE use
> 32 bits DMA addressing whereas EHL PCH GbE uses 64 bits DMA addressing.
> 
> [   25.535095] ------------[ cut here ]------------
> [   25.540276] NETDEV WATCHDOG: enp0s29f2 (intel-eth-pci): transmit queue 2 timed out
> [   25.548749] WARNING: CPU: 2 PID: 0 at net/sched/sch_generic.c:443 dev_watchdog+0x259/0x260
> [   25.558004] Modules linked in: 8021q bnep bluetooth ecryptfs snd_hda_codec_hdmi intel_gpy marvell intel_ishtp_loader intel_ishtp_hid iTCO_wdt mei_hdcp iTCO_vendor_support x86_pkg_temp_thermal kvm_intel dwmac_intel stmmac kvm igb pcs_xpcs irqbypass phylink snd_hda_intel intel_rapl_msr pcspkr dca snd_hda_codec i915 i2c_i801 i2c_smbus libphy intel_ish_ipc snd_hda_core mei_me intel_ishtp mei spi_dw_pci 8250_lpss spi_dw thermal dw_dmac_core parport_pc tpm_crb tpm_tis parport tpm_tis_core tpm intel_pmc_core sch_fq_codel uhid fuse configfs snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc snd_sof_intel_hda_common snd_sof_xtensa_dsp snd_sof snd_soc_acpi_intel_match snd_soc_acpi snd_intel_dspcfg ledtrig_audio snd_soc_core snd_compress ac97_bus snd_pcm snd_timer snd soundcore
> [   25.633795] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G     U            5.11.0-rc4-intel-lts-MISMAIL5+ #5
> [   25.644306] Hardware name: Intel Corporation Elkhart Lake Embedded Platform/ElkhartLake LPDDR4x T4 RVP1, BIOS EHLSFWI1.R00.2434.A00.2010231402 10/23/2020
> [   25.659674] RIP: 0010:dev_watchdog+0x259/0x260
> [   25.664650] Code: e8 3b 6b 60 ff eb 98 4c 89 ef c6 05 ec e7 bf 00 01 e8 fb e5 fa ff 89 d9 4c 89 ee 48 c7 c7 78 31 d2 9e 48 89 c2 e8 79 1b 18 00 <0f> 0b e9 77 ff ff ff 0f 1f 44 00 00 48 c7 47 08 00 00 00 00 48 c7
> [   25.685647] RSP: 0018:ffffb7ca80160eb8 EFLAGS: 00010286
> [   25.691498] RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000103
> [   25.699483] RDX: 0000000080000103 RSI: 00000000000000f6 RDI: 00000000ffffffff
> [   25.707465] RBP: ffff985709ce0440 R08: 0000000000000000 R09: c0000000ffffefff
> [   25.715455] R10: ffffb7ca80160cf0 R11: ffffb7ca80160ce8 R12: ffff985709ce039c
> [   25.723438] R13: ffff985709ce0000 R14: 0000000000000008 R15: ffff9857068af940
> [   25.731425] FS:  0000000000000000(0000) GS:ffff985864300000(0000) knlGS:0000000000000000
> [   25.740481] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   25.746913] CR2: 00005567f8bb76b8 CR3: 00000001f8e0a000 CR4: 0000000000350ee0
> [   25.754900] Call Trace:
> [   25.757631]  <IRQ>
> [   25.759891]  ? qdisc_put_unlocked+0x30/0x30
> [   25.764565]  ? qdisc_put_unlocked+0x30/0x30
> [   25.769245]  call_timer_fn+0x2e/0x140
> [   25.773346]  run_timer_softirq+0x1f3/0x430
> [   25.777932]  ? __hrtimer_run_queues+0x12c/0x2c0
> [   25.783005]  ? ktime_get+0x3e/0xa0
> [   25.786812]  __do_softirq+0xa6/0x2ef
> [   25.790816]  asm_call_irq_on_stack+0xf/0x20
> [   25.795501]  </IRQ>
> [   25.797852]  do_softirq_own_stack+0x5d/0x80
> [   25.802538]  irq_exit_rcu+0x94/0xb0
> [   25.806475]  sysvec_apic_timer_interrupt+0x42/0xc0
> [   25.811836]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [   25.817586] RIP: 0010:cpuidle_enter_state+0xd9/0x370
> [   25.823142] Code: 85 c0 0f 8f 0a 02 00 00 31 ff e8 22 d5 7e ff 45 84 ff 74 12 9c 58 f6 c4 02 0f 85 47 02 00 00 31 ff e8 7b a0 84 ff fb 45 85 f6 <0f> 88 ab 00 00 00 49 63 ce 48 2b 2c 24 48 89 c8 48 6b d1 68 48 c1
> [   25.844140] RSP: 0018:ffffb7ca800f7e80 EFLAGS: 00000206
> [   25.849996] RAX: ffff985864300000 RBX: 0000000000000003 RCX: 000000000000001f
> [   25.857975] RDX: 00000005f2028ea8 RSI: ffffffff9ec5907f RDI: ffffffff9ec62a5d
> [   25.865961] RBP: 00000005f2028ea8 R08: 0000000000000000 R09: 0000000000029d00
> [   25.873947] R10: 000000137b0e0508 R11: ffff9858643294e4 R12: ffff9858643336d0
> [   25.881935] R13: ffffffff9ef74b00 R14: 0000000000000003 R15: 0000000000000000
> [   25.889918]  cpuidle_enter+0x29/0x40
> [   25.893922]  do_idle+0x24a/0x290
> [   25.897536]  cpu_startup_entry+0x19/0x20
> [   25.901930]  start_secondary+0x128/0x160
> [   25.906326]  secondary_startup_64_no_verify+0xb0/0xbb
> [   25.911983] ---[ end trace b4c0c8195d0ba61f ]---
> [   25.917193] intel-eth-pci 0000:00:1d.2 enp0s29f2: Reset adapter.
> 
> [...]

Here is the summary with links:
  - [net] stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing
    https://git.kernel.org/netdev/net/c/7cfc4486e7ea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
