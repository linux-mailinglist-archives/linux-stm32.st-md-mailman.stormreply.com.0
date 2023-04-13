Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B96E12AB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 18:47:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C34C6C69063;
	Thu, 13 Apr 2023 16:47:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC08C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404443; x=1712940443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=58sBDBle1B6AEw3V6//5BrXaYrxLe6W1w5WyrxYfdzM=;
 b=ZVtYdY4CWO7t5pMOZdr1lOb1ENYRZ2fzTp+yqKDR1Ct+1ADhK42oi5S7
 Jw9Apxcecrbv1HqjIsL8W6LUeROnJ5q7/Mpbm7047MH4Ql3kdRx8L8wpd
 n2uwx5zaB+sQntVjJ6mFZu60qIC+E+xIOCQLWrDNRZsgye0l0AO0d1YIl
 uTS+LQbhNrNhoufKsGE+zjlj4jw1yayAkTLluPOxQdatkiC8ZHgc2u0bT
 ePl1GsygrQvlwavCl4AY91R1o6q0jK/dAHj2eH3ERQ2Lf1TjR1gpNVcjX
 FKItf9/q1xPs7joUiYUQzB019ma3s9VImEEJVHP2npVsv8FJJ059ERuC2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341734681"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="341734681"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="666843063"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="666843063"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 09:47:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 09:47:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 09:47:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 09:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZvw8ZsDzev80bSWzVFOphATXR8MmqvjQA5/eljCFgKV/+eNW9FQ4wqVk4TzyBgyKGOQS1BLjp16evFz4AH7i6Z9DL2XNzJW8jR5tIP6QyMGwMLKAbCDbQybiy9bTYDr2PLEcVsexLQO26wWWZZsowyCsC578dGGs+LjQxUpW0+jmgaOro61RIqkMqQhlruzuX+I8Oh1zKN9IZksUrFQBd1Z7fKeBFFGG0LOkqR8Hq0qAMEmdZ8+iiaqEltnM+j9ch0tceKLvBlo2CEKrYu/z+Fby8S2oaCj8zP6+Qd6rAHWTtI8EtiAIcWByRzJv4PZJMNhTyJ85rmy79Llzr9xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKLsc2WvGNz3ChjTWj6YXRryLvB0YdjjztDnRbNukL0=;
 b=k0dzNe+mVwuy0YT5CKt8u75fPE/jRA4Lwsek1ok8FHjq35zeBjdwyTDjPe2eWC2WPDHs5bv2I6AfhKCFzX0Xsb89MSmhXxSl3KuWBWVW63dr2Cq+CGJ3z/wH3914+GOS2NXq3f7qOFZtnqszHQdF8XqMImwKdXywZtckN2ukZcGSVyMSydzp22Aekw2nImPRg6ECzkSsVjldrYRHA6T3uC9b8qQyfb+D/zScD5g0Qcd8viEN9z0F9UvcunLaKquGBKGUPHQrMnvLH36vIAsV4ebtVENOCu6Kxat7+4a25LnzbDbaquVKOGeIkTt9LJv2ZhlinV2ghkf2K6jGn5vr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:47:06 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::6222:859a:41a7:e55b]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::6222:859a:41a7:e55b%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:47:05 +0000
Message-ID: <8d653ecc-4ba4-11fc-1f6f-1792bb18fabd@intel.com>
Date: Thu, 13 Apr 2023 09:47:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>, Stanislav Fomichev
 <sdf@google.com>
References: <20230412094235.589089-1-yoong.siang.song@intel.com>
 <20230412094235.589089-4-yoong.siang.song@intel.com>
 <ZDbjkwGS5L9wdS5h@google.com>
 <677ed6c5-51fc-4b8b-d9a4-42e4cfe9006c@intel.com>
 <CAKH8qBtXTAZr5r1VC9ynSvGv5jWMD54d=-2qmBc9Zr3ui9HnEg@mail.gmail.com>
 <PH0PR11MB5830A823C4FC0483BA702293D8989@PH0PR11MB5830.namprd11.prod.outlook.com>
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <PH0PR11MB5830A823C4FC0483BA702293D8989@PH0PR11MB5830.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c1d2fa-162d-48d3-e0ac-08db3c3eb6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgFVPX8USx3SS/2Kx7eD9Bu4x9R9OKUXVw4rJjvzTY/9kfWjRLJlaBVgj3wtw74JDpnHLy8k9FbGnxq6U3AMMPx0Ke88z+1EirKyNGhvqcHVMlhe6prV89tDSL3nhYKhbWjdCM4S+Xi7RE71FW2ahkiDk+qIx0yFQW8OMLZ786EXE3Xkz13oNlZPYCn3MwoJfD1+g+3sEbOze57xZLmQZQOmfCo6VIGr9ESlhkNk4ggMATZKlhQDmQ63sPrSGh+wSn5Wk+hLSP4y3aa5Qr7LBiRI+lEcEaeh5r1Td/8Yl6381CoH4puLQDJM4jufHXt7QciV9YthpGKMuTtQHoSOWd7+ckhxXNMyWzvZWTMKZcMrGX/+7N4CuWT3dPkkd6RqHQCaHb8PrbkT7YRqBA55tGfF41LnWX8Ixo+jIkrXPTp8xJPzLw41MpF1GromjY9KSNWXLgXdUIE1pG8THBPxA/BO00tKHgaM+LHqHTtt7KpFM3f4nDknLcY5okMr9JOlpqJnr9aQyNqluQ1wyTfbz843sOAEUG7gxTIbosc+pLYsOhWF/WIxdRlsXD/g5n6+JpLu4tFGyilDnzsK7f6M/8xywEhynq1Y+9YRkpP4hlwBWl+2GboQI6ioVvPaPB1goGfpQIGSQbhR2CArMCKDJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5089.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(82960400001)(66556008)(66476007)(66946007)(8936002)(5660300002)(38100700002)(7416002)(4326008)(8676002)(31686004)(41300700001)(2616005)(83380400001)(110136005)(316002)(54906003)(36756003)(478600001)(2906002)(53546011)(6512007)(31696002)(186003)(86362001)(6506007)(26005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjkra3dONVdlZ3Y1S04yVlNrWFpvZzRUNkVEODNaSmJVK1BOTWlVZ294TXhX?=
 =?utf-8?B?TjFJRTFSaUpsZ3pURUlMak9FcjRQWlVCV1BOS0NyV0hHQWJJckd5RURHTVp4?=
 =?utf-8?B?YlMrWkhzTi9tK1hiZzJSQk1iUDFBRi9Za05sR3g1TzliSXNnenVFUkNnWVBv?=
 =?utf-8?B?bStaakI4MzZub1pPUEUwRndXOE9wVlhGNjFHWU9qbXRRMFJQT20ralJXQUFZ?=
 =?utf-8?B?aU9iYndzUkVGRzYwU2RRZGFGWWM4OU9DdFl3TE5CcW8wTXpxUUJzNEJnLyto?=
 =?utf-8?B?UmE4MS9mTGphcjRUWGZiREJOWDl1S3BzU2RLU2E3bWFIUWpZaG02eTNmZ0pt?=
 =?utf-8?B?TCs2NTdpdkJXbWpSUCtTVkYrWXNLN2QwWnE1VUJSVDIwQjFrNVcyZnpFcDd5?=
 =?utf-8?B?OFlrUUY5OUVYdkx6ampNd3dlM3VzSzJFVzhSZHE4bGg0RExhY2RaanFjMndD?=
 =?utf-8?B?SGRCcFVkY3NGeXdBUm9rSFVkZU1tL01lRlFKcU4xL1FPV0g4OEtDLzNSeGIz?=
 =?utf-8?B?QTdkLzlnZk1hQ1NpNWFpOERraTAvK2lzS05pY2dGcytSNHpjaDVlSHliamFh?=
 =?utf-8?B?bkgwRjdmeTZGMlNXblBGWENQUXhQN2hmTGxObDY0YlJMby9wcmJac0tKYS8v?=
 =?utf-8?B?aHk5YWtlSmVKTXJLbGFtVkNhSXI4TWU1Y2V1N0QzUUxDbzk4VldTZ084Y2po?=
 =?utf-8?B?N1BpNmVwT0lGRC9icDBGSXJuQW9UOWdSaDIwN1pCdmpwdHQvb3l6Umo0ajNh?=
 =?utf-8?B?RFZEL2ZkVG1xSTVObG1jZXZkOGNZWnMrd2xMS1N0cWFWalVLa3ZQY09PWkh6?=
 =?utf-8?B?dUFQbmJpSVIyNWQvNW5oQm83TWFObkJuMmpQVnNiNDJjbnJkSHpVNStrNnla?=
 =?utf-8?B?MXp4TVNSaHFMVWRDK296TVg2Z0JaTS9wQVhOaTRDK3BUT2l6azI5ZS82K3kz?=
 =?utf-8?B?dnZjZXd6NWRUc1pTams1K3htOGxwbkxXOW56dmhDY0JwbzlNUE1yb3lhUGVz?=
 =?utf-8?B?cU1NdnZzOHR5V2ZXMVQvU2pRTkRCRGZzc1NDSTRldzZoUWtOaUtUdjZyd01W?=
 =?utf-8?B?QWVjdHVHWnRVcWdiZ0RVVUtLOEM5MWY2VVBwalZQOVA0aSsyQzRocm1yak5S?=
 =?utf-8?B?Tk1BSXowd2tZWVFLSHk3QlhVbW43Y2cxZ0w5eFJ6M2dLWlVsak1TdGMvNXZF?=
 =?utf-8?B?MEJrZVo2ZzNXQllOVVE0cjJydDVFWGhMOHBsaGFLbHQzWksvcmFHRDJMRkgv?=
 =?utf-8?B?L0s5WTJVMWdJeUVUSXplMjA5dC8wd2tRUFdEOHB1M0VUeWV4Q1NOd0VFZkpV?=
 =?utf-8?B?M1d2UzhOcFdtV1FXSHkrblErYml1MlMvTHNpb2VlazFqSlR1cUpKRnpnVFJu?=
 =?utf-8?B?TkN0RWhESG1mZDlFMTk1OCszZjA4RG5paWwvR2tBUmFHQ1B0dzlhbnBtNlln?=
 =?utf-8?B?TXVnZ0hZc1VNdEx1SkU4K1pSVks4RXdLMnlIZXJVdW5tWEJlTm5YTGFiSW10?=
 =?utf-8?B?YjAyVjh1ZmlnZ1VUdHI5bVQzMVVydlpaWktuMGIySVN5OGMvQmRZNE5zZUg3?=
 =?utf-8?B?K3JCRGFJazBLb0dEaTI3Q0t3Z290WlRVdlpXY0lVUEN0ZCtpUFZkNngwc0hL?=
 =?utf-8?B?Y1VSaytrNG9tNVlDSDFUWksydGhoTXV3TnhJaTM5VVgrQlBHS095WHNsdk92?=
 =?utf-8?B?bjVmS1poMjZ3MWlwYUFlY3BNV0JqZjVZbEZicTI0N2haaE1DZ0hHYUNvUWhF?=
 =?utf-8?B?SmJaUml4MXhCK2pxaWNTMXRIRzlRSGVETXBWayszMzZzalcwTmlQQllNOHBB?=
 =?utf-8?B?S3lGR21tTmcyTWVHQW84Rk1SampUKyswTXNMUXRSaEVkRnc1d2c3R0xWNDFa?=
 =?utf-8?B?OElubWFkTXV4eE5VSXlQY1YyZTVUZS9id25LY20wWVNERGlPMWJHbEh2K0RH?=
 =?utf-8?B?aVFZZ0pIYm5rWmdLU3IvVno5WkNveHYyOFNVblpGYXpiR3ZkcFU0OWViVHU0?=
 =?utf-8?B?NTRpRUprZFVuQzZ4d2xEUTd0VU5RWkxWYk1VTnJnV3l4Nm5kb25PMW51UU5v?=
 =?utf-8?B?Tk5jcm1kM1JsdVJ3QnIxTkVmUm9TaXFqVmtuaDhmVGVHd0NXa0hJRUsxdlFk?=
 =?utf-8?B?ZGZzTFZSdllZaVJncUhFVlZ2L2k0VDREbm9PeDdPQ1RicWZDbVlZbExBSGlO?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c1d2fa-162d-48d3-e0ac-08db3c3eb6b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:47:05.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q43XQ+zFHq3zTfFKIXxIW2LlCLOOuewgyXKr2LudUIZYQk1xyvnkpttcbFZtA9GjZ0sB4mM8MaSdFZgn9GJAbkQqIQQDgYXLMJMtDuXrWts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub
 Kicinski <kuba@kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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

CgpPbiA0LzEyLzIwMjMgNjozOSBQTSwgU29uZywgWW9vbmcgU2lhbmcgd3JvdGU6Cj4gT24gVGh1
cnNkYXksIEFwcmlsIDEzLCAyMDIzIDU6NDYgQU0sIFN0YW5pc2xhdiBGb21pY2hldiA8c2RmQGdv
b2dsZS5jb20+IHdyb3RlOgo+PiBPbiBXZWQsIEFwciAxMiwgMjAyMyBhdCAxOjU24oCvUE0gSmFj
b2IgS2VsbGVyIDxqYWNvYi5lLmtlbGxlckBpbnRlbC5jb20+IHdyb3RlOgo+Pj4KPj4+Cj4+Pgo+
Pj4gT24gNC8xMi8yMDIzIDEwOjAwIEFNLCBTdGFuaXNsYXYgRm9taWNoZXYgd3JvdGU6Cj4+Pj4g
T24gMDQvMTIsIFNvbmcgWW9vbmcgU2lhbmcgd3JvdGU6Cj4+Pj4+IEFkZCByZWNlaXZlIGhhcmR3
YXJlIHRpbWVzdGFtcCBtZXRhZGF0YSBzdXBwb3J0IHZpYSBrZnVuYyB0byBYRFAKPj4+Pj4gcmVj
ZWl2ZSBwYWNrZXRzLgo+Pj4+Pgo+Pj4+PiBTdWdnZXN0ZWQtYnk6IFN0YW5pc2xhdiBGb21pY2hl
diA8c2RmQGdvb2dsZS5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNvbmcgWW9vbmcgU2lhbmcg
PHlvb25nLnNpYW5nLnNvbmdAaW50ZWwuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oICB8ICAzICsrKwo+Pj4+PiAuLi4vbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAyNgo+Pj4+PiArKysrKysr
KysrKysrKysrKystCj4+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oCj4+Pj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjLmgKPj4+Pj4gaW5kZXggYWM4Y2NmODUxNzA4Li44MjZhYzBlYzg4
YzYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hYy5oCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hYy5oCj4+Pj4+IEBAIC05NCw2ICs5NCw5IEBAIHN0cnVjdCBzdG1tYWNfcnhfYnVmZmVy
IHsKPj4+Pj4KPj4+Pj4gIHN0cnVjdCBzdG1tYWNfeGRwX2J1ZmYgewo+Pj4+PiAgICAgIHN0cnVj
dCB4ZHBfYnVmZiB4ZHA7Cj4+Pj4+ICsgICAgc3RydWN0IHN0bW1hY19wcml2ICpwcml2Owo+Pj4+
PiArICAgIHN0cnVjdCBkbWFfZGVzYyAqcDsKPj4+Pj4gKyAgICBzdHJ1Y3QgZG1hX2Rlc2MgKm5w
Owo+Pj4+PiAgfTsKPj4+Pj4KPj4+Pj4gIHN0cnVjdCBzdG1tYWNfcnhfcXVldWUgewo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+Pj4+PiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMKPj4+Pj4gaW5kZXggZjdiYmRmMDRkMjBjLi5lZDY2MDkyN2I2MjggMTAwNjQ0Cj4+Pj4+
IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
Pj4+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+Pj4+PiBAQCAtNTMxNSwxMCArNTMxNSwxNSBAQCBzdGF0aWMgaW50IHN0bW1hY19yeChz
dHJ1Y3Qgc3RtbWFjX3ByaXYKPj4+Pj4gKnByaXYsIGludCBsaW1pdCwgdTMyIHF1ZXVlKQo+Pj4+
Pgo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICB4ZHBfaW5pdF9idWZmKCZjdHgueGRwLCBidWZf
c3osICZyeF9xLT54ZHBfcnhxKTsKPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgeGRwX3ByZXBh
cmVfYnVmZigmY3R4LnhkcCwgcGFnZV9hZGRyZXNzKGJ1Zi0+cGFnZSksCj4+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVmLT5wYWdlX29mZnNldCwgYnVmMV9sZW4s
IGZhbHNlKTsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidWYt
PnBhZ2Vfb2Zmc2V0LCBidWYxX2xlbiwKPj4+Pj4gKyB0cnVlKTsKPj4+Pj4KPj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgcHJlX2xlbiA9IGN0eC54ZHAuZGF0YV9lbmQgLSBjdHgueGRwLmRhdGFf
aGFyZF9zdGFydCAtCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidWYtPnBh
Z2Vfb2Zmc2V0Owo+Pj4+PiArCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGN0eC5wcml2ID0g
cHJpdjsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgY3R4LnAgPSBwOwo+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICBjdHgubnAgPSBucDsKPj4+Pj4gKwo+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICBza2IgPSBzdG1tYWNfeGRwX3J1bl9wcm9nKHByaXYsICZjdHgueGRwKTsKPj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgLyogRHVlIHhkcF9hZGp1c3RfdGFpbDogRE1BIHN5bmMgZm9yX2Rl
dmljZQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgKiBjb3ZlciBtYXggbGVuIENQVSB0b3Vj
aCBAQCAtNzA3MSw2ICs3MDc2LDIzCj4+Pj4+IEBAIHZvaWQgc3RtbWFjX2ZwZV9oYW5kc2hha2Uo
c3RydWN0IHN0bW1hY19wcml2ICpwcml2LCBib29sIGVuYWJsZSkKPj4+Pj4gICAgICB9Cj4+Pj4+
ICB9Cj4+Pj4+Cj4+Pj4+ICtzdGF0aWMgaW50IHN0bW1hY194ZHBfcnhfdGltZXN0YW1wKGNvbnN0
IHN0cnVjdCB4ZHBfbWQgKl9jdHgsIHU2NAo+Pj4+PiArKnRpbWVzdGFtcCkgewo+Pj4+PiArICAg
IGNvbnN0IHN0cnVjdCBzdG1tYWNfeGRwX2J1ZmYgKmN0eCA9ICh2b2lkICopX2N0eDsKPj4+Pj4g
Kwo+Pj4+PiArICAgICp0aW1lc3RhbXAgPSAwOwo+Pj4+PiArICAgIHN0bW1hY19nZXRfcnhfaHd0
c3RhbXAoY3R4LT5wcml2LCBjdHgtPnAsIGN0eC0+bnAsIHRpbWVzdGFtcCk7Cj4+Pj4+ICsKPj4+
Pgo+Pj4+IFsuLl0KPj4+Pgo+Pj4+PiArICAgIGlmICgqdGltZXN0YW1wKQo+Pj4+Cj4+Pj4gTml0
OiBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gY2hhbmdlIHN0bW1hY19nZXRfcnhfaHd0c3RhbXAgdG8g
cmV0dXJuCj4+Pj4gYm9vbCB0byBpbmRpY2F0ZSBzdWNjZXNzL2ZhaWx1cmU/IFRoZW4geW91IGNh
biBkbzoKPj4+Pgo+Pj4+IGlmICghc3RtbWFjX2dldF9yeF9od3RzdGFtcCgpKQo+Pj4+ICAgICAg
IHJldXRybiAtRU5PREFUQTsKPj4+Cj4+PiBJIHdvdWxkIG1ha2UgaXQgcmV0dXJuIHRoZSAtRU5P
REFUQSBkaXJlY3RseSBzaW5jZSB0eXBpY2FsbHkgYm9vbAo+Pj4gdHJ1ZS9mYWxzZSBmdW5jdGlv
bnMgaGF2ZSBuYW1lcyBsaWtlICJzdG1tYWNfaGFzX3J4X2h3dHN0YW1wIiBvcgo+Pj4gc2ltaWxh
ciBuYW1lIHRoYXQgaW5mZXJzIHlvdSdyZSBhbnN3ZXJpbmcgYSB0cnVlL2ZhbHNlIHF1ZXN0aW9u
Lgo+Pj4KPj4+IFRoYXQgbWlnaHQgYWxzbyBsZXQgeW91IGF2b2lkIHplcm9pbmcgdGhlIHRpbWVz
dGFtcCB2YWx1ZSBmaXJzdD8KPj4KPj4gU0dUTSEKPiAKPiBzdG1tYWNfZ2V0X3J4X2h3dHN0YW1w
KCkgaXMgdXNlZCBpbiBvdGhlciBwbGFjZXMgd2hlcmUgcmV0dXJuCj4gdmFsdWUgaXMgbm90IG5l
ZWRlZC4gQWRkaXRpb25hbCBpZiBzdGF0ZW1lbnQgY2hlY2tpbmcgb24gcmV0dXJuIHZhbHVlCj4g
d2lsbCBhZGQgY29zdCwgYnV0IGlnbm9yaW5nIHJldHVybiB2YWx1ZSB3aWxsIGhpdCAidW51c2Vk
IHJlc3VsdCIgd2FybmluZy4KPiAKCklzbid0IHVudXNlZCByZXR1cm4gdmFsdWVzIG9ubHkgY2hl
Y2tlZCBpZiB0aGUgZnVuY3Rpb24gaXMgYW5ub3RhdGVkIGFzCiJfX211c3RfY2hlY2siPwoKPiBJ
IHRoaW5rIGl0IHdpbGwgYmUgbW9yZSBtYWtlIHNlbnNlIGlmIEkgZGlyZWN0bHkgcmV0cmlldmUg
dGhlIHRpbWVzdGFtcCB2YWx1ZQo+IGluIHN0bW1hY194ZHBfcnhfdGltZXN0YW1wKCksIGluc3Rl
YWQgb2YgcmV1c2Ugc3RtbWFjX2dldF9yeF9od3RzdGFtcCgpLgo+IAoKVGhhdCBtYWtlcyBzZW5z
ZSB0b28sIHRoZSBYRFAgZmxvdyBpcyBhIGJpdCBzcGVjaWFsIGNhc2VkIHJlbGF0aXZlIHRvCnRo
ZSBvdGhlciBvbmVzLgoKPiBMZXQgbWUgc2VuZCBvdXQgdjQgZm9yIHJldmlldy4KPiAKPiBUaGFu
a3MgJiBSZWdhcmRzCj4gU2lhbmcKPiAKPj4KPj4+IFRoYW5rcywKPj4+IEpha2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
