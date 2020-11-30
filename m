Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D242C7E12
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Nov 2020 07:17:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A5AC424BF;
	Mon, 30 Nov 2020 06:17:44 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10D73C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 06:17:41 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56651C0119;
 Mon, 30 Nov 2020 06:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1606717060; bh=KTcHRH+eRv1sEbWAekRR9rmgdO/ooLtzFlAuGLX512I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Y8wc9Lu/DAjK6X1MZfPoolfFHhY5othVlSpBRAWnJJb1aznPvkvAd4NpIwmhMjlij
 zlzBs7UNfSvWUCtfUhG0QJBkHu27417UzOA0ZwShVW7nszNZkS0BDJV4E3sSwZdg4m
 /mAcEvOb29/wk/3cQDsX/YFDtzyDluIlillVd2QNez0/D3ceoETpCVy/TDenhGSDMW
 c9yIm/KE4om/Aa7n5QntpRNKdo3Q6A/FQRKFtEqFygZLk5NY8AQl4TAAdc4hT4QYTB
 Dpc9ro3ZyIMvxw4zz0pHRdfeoUYDKv+FVIpG0MjPK8K3FjN3ZGAl0LWDlQ4wA+ZIWZ
 SKC2l5at5k2pw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A4E7BA0063;
 Mon, 30 Nov 2020 06:17:39 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id E5A0C80214;
 Mon, 30 Nov 2020 06:17:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vk1+1MPi";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX7elcPHmgmENxWzb39BD9EMGgIlTUJp7BRRm8vw8DLqeXkCQDRqI/Z89f9OG61y0vlyKnTYZIH4FEU+qQqi/bHcz9vUj83NQHAhBp08Vt++s7uHLGwoBGsYsK4Uws/zbEkMPmw8XUkmXfShAZTjC/eKuuNihlVFbpuArJc1IbwEBIhhIVR3PdjHiComVEsaIX79h1xZVR2ZDLQiNLfrpd/X/4kTwxY0hChbWzd7VokZBtitlMy8F3CLUd88T2uNl59xFRnaIbw030UyBdNXYAXv3RIT4ds06+msBPCpcoKLGP/IV+Yk5BFmx+F4DJ6eStnEf56QdMDSZWnYARqAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTcHRH+eRv1sEbWAekRR9rmgdO/ooLtzFlAuGLX512I=;
 b=CQXVP84MVge4Xq7M7DWK+jQeHRAU5+WYQmazMKnh310YxqXVfJfMlw7rnxjHVc3nxJRZaHkmVORroA4NZLIDZb4BgdZlQNWippEYMPWjCygpuPh5ryt2iR287zcQLxkFr04lsT3+jC2saFEwYV0TSTjphbky6Ny5FA8T+PltjMvvh+1F3H8HICWtZHHG4HFvkXLuTe0rJCe86SKirjtw5n+9Ek8lRq0xZLjK87ZZlE+swXQceYbCEG5NT+R231cR0Wk0SJd80tkD0vVCzQ/EmS3WExLzyh9Axx6ZEUIvmlgGvpLCNytbMtmqsDoZQF9HF0Hj9Pqh6IfIsPOnNBiUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTcHRH+eRv1sEbWAekRR9rmgdO/ooLtzFlAuGLX512I=;
 b=vk1+1MPiZ14p0HyBPkMLqWHNc1udZrIDb1xMbEAD14q5UcRj1aFolgpgWXCJE6C2lqG4veMS9p/07qo2fhpmbcThFV8K9kzShHY7nU6wXXMJ0nBs+TdGbeVd5RImhO3dXiYmfEEfUGZzdF7xK/VbBfVT0JVKFZJayUJYP6lMhIU=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 30 Nov
 2020 06:17:37 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::f90b:950d:63c:37c2]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::f90b:950d:63c:37c2%7]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 06:17:37 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@st.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 3/3] usb: dwc2: disable Link Power Management on
 STM32MP15 HS OTG
Thread-Index: AQHWwXdaBcTjyhHZYUiQ55rlPlvUzqngPg8A
Date: Mon, 30 Nov 2020 06:17:37 +0000
Message-ID: <f068f069-232c-7bef-3f1c-7fce95a2a401@synopsys.com>
References: <20201123090114.12641-1-amelie.delaunay@st.com>
 <20201123090114.12641-4-amelie.delaunay@st.com>
In-Reply-To: <20201123090114.12641-4-amelie.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.92.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 992d3a10-543a-4377-55b4-08d894f7a277
x-ms-traffictypediagnostic: BY5PR12MB4997:
x-microsoft-antispam-prvs: <BY5PR12MB4997ECFA649F5B3470646E60A7F50@BY5PR12MB4997.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vEhx2L1jvewrozv5iFLCR3EKxSVAMJS3eBd2uoIjlz+DvbbwMbp38DCJ7TXuVTn4cku3GPjVOuneFTVuUtWBi3DTbR+VzfFeLqAHddaIC2Ix+/uCfPSUsOmHjYHbEKMVxJipzSNcj2gk91OqUDqFa46fn1vV4sXyK9La2gfIR47lzAAZN9+PWORjklXQ5uS0wXqZqKx0SVDEUPeKDC9aW5cVUkADMve0YyKOL3KqNB3vZsksKLNM/irSZQFtJoAF7QqI9tSqnN4omH9VXtP/NEyONJHAV1hufVuhgfpEb2h9c8wVv8dqdhVnId0Sb+KKvao5IHJ0FoW9Tw3NyVhdOvYsVXoN2PsdmicR965qaila4eV2RIALbp3O9M43ILT/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3777.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(54906003)(76116006)(91956017)(86362001)(5660300002)(4326008)(66476007)(83380400001)(110136005)(316002)(66946007)(66556008)(478600001)(64756008)(66446008)(8676002)(71200400001)(8936002)(31686004)(26005)(53546011)(6512007)(2616005)(36756003)(186003)(2906002)(6506007)(31696002)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MUN0S05FWjJDOHdEeWpiRVdNSWpZZ1dUMmJjQUlVUGZLLzJKNVc3SWRmTS96?=
 =?utf-8?B?SGRTTDAwZ0hacXByUDd6c2pWbEpGaWY0TVp3SkpEcjVheWJGWjVaMjRSakhk?=
 =?utf-8?B?NkhrQW1UWGM2N2YycXRubmt1WXBLMllxbGtwWVdkcVkzV1VGQ3BBb29MbXor?=
 =?utf-8?B?Y21TdSs4a3FxSW9hUVNXM1lhcjVYd0l0YVBoSnN1YWZNNmVVc05iWmRUYWFY?=
 =?utf-8?B?SkdBbUZ3YnBRQ25rMWdhd3pLTkJDUWRWZ0duUUk1VVRVVmkySTY1dHAwVTho?=
 =?utf-8?B?eGlKNDRMM0hCS3RmR2VoZWFUK09YbXNMbENxaHcyMzJ6QSt6eU1rQmRwcXAz?=
 =?utf-8?B?OVVXa0U1SjN2N2tsaXFVQnpLYWV2YmsrbzlDYXAvN2I1bDNJeXp2WUUyOHZX?=
 =?utf-8?B?eDFndVlCdUVwL1RRTjVsYnZPbXBCQ01MY29sLy9GYXZYU1d1ekRvK045eUxE?=
 =?utf-8?B?SHEybnNSdDhhRVNRRDFER0xQeHJFZlcyL0d5T3Y5VWVibnZlY2hsdkkvMi9L?=
 =?utf-8?B?TERxTzZNeHVRY3dFREJOemZ2QmdRUERYRjRGSXQ2WTd2V1hBMTZwS1ZWeVVY?=
 =?utf-8?B?Z3V2dlhEak5OcXBNVHFtU1NGOXlBTEs1UFE3WGU0QnR5MEZJZ3lrTXJZYUtx?=
 =?utf-8?B?dk9wcDlBZ2Q4em9TcEhzVzEvWGNKQm1raTllc2VLNXdNZ3l2T25XVys4Sm02?=
 =?utf-8?B?bUFKV3M1ZVkzS0pDWTZ5ZFZLN1FSY2ZVYXJTbk5CVDhFV2V3WmhxYlUrTWNm?=
 =?utf-8?B?REFOcjYwcSs0Wlh2MVFTRi9yb055TmU3aWYwOEI0L0x3emxNcUl2RFdyV2hl?=
 =?utf-8?B?WC82MUdXRHd1U2dXQS82K1k4MW92RUZqYktzMnNzbWtVNlZmRkx2bXJzL0U2?=
 =?utf-8?B?SEVWSWljbk83YW1EdFI4ckdKMEQ5Z3Awb1N5SjJrVHB5ajdwUFA4R0Z1bUZM?=
 =?utf-8?B?TXptTk1wYVN3anAwaU1FWURUcVRJcm9pY0t2Y21LUkRyaXNMeGhnTFVJdmdO?=
 =?utf-8?B?MUd2djZoeEw1bVlUVGxKRWRiU1J0dXozZW1LRUJkV2VFTnZFNjA4TSt6TGtY?=
 =?utf-8?B?YWpLblB1Smc4cWRuWEloOElnWXkrMisxSFNFSWxLSFozMGFTTDh4S3Bxb3Vz?=
 =?utf-8?B?SlR0QlNDb3pwWmdwSnBmQ3lRU2VWYTdib0xlMDVQMjZJc3VNMnlxdTVnckpC?=
 =?utf-8?B?QWFSKzdUYTMybFQyWkJLSzFOMk0vZDRDZDVzcjFMRkdYUkRtL29KVmlHcHQy?=
 =?utf-8?B?Z2FNTmhKRzhzTjJTMHV5NENBZGtNL2lPdnkwZzRBbTE3US83TU1GUjQrQXNO?=
 =?utf-8?Q?zUbs4Ynb+j1k0=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <5C4A53BAD06FB049BB0AE0E09AB19C2D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992d3a10-543a-4377-55b4-08d894f7a277
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 06:17:37.5558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: do983mwPCmnpUVTQ/uJ1LSg/SXLeKXmOgJg2dzPWKvKHRKIa+m9Zbn4//Y5ruYcIMcTmeiXhdiNp4Wxxfr2SLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] usb: dwc2: disable Link Power
 Management on STM32MP15 HS OTG
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

On 11/23/2020 1:01 PM, Amelie Delaunay wrote:
> Link Power Management (LPM) on STM32MP15 OTG HS encounters instabilities
> with some Host controllers. OTG core fails to exit L1 state in 200us:
> "dwc2 49000000.usb-otg: Failed to exit L1 sleep state in 200us."
> Then the device is still not enumerated.
> 
> To avoid this issue, disable Link Power Management on STM32MP15 HS OTG.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/params.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 9e5dd7f3f2f6..92df3d620f7d 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -194,6 +194,10 @@ static void dwc2_set_stm32mp15_hsotg_params(struct dwc2_hsotg *hsotg)
>   	p->host_perio_tx_fifo_size = 256;
>   	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
>   	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
> +	p->lpm = false;
> +	p->lpm_clock_gating = false;
> +	p->besl = false;
> +	p->hird_threshold_en = false;
>   }
>   
>   const struct of_device_id dwc2_of_match_table[] = {
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
