Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD29742EF2E
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 12:54:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6296C5C842;
	Fri, 15 Oct 2021 10:54:46 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08A70C5C840
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 10:54:45 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2E74DC4405;
 Fri, 15 Oct 2021 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1634295283; bh=RQAIWrbOI9obbfAQrCLJpnv5ZntnC6a33nwO/CjRaCs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IQD61Qw//+4t7ddZT8JJHdYDOLK99qKcltvOtzvcKkdYN8BgmpVwaFvK+bhDoq6Vz
 6vdhzcp6hc0l+uI8j6qS+A2NzAjP8FOVZZoE+O1pgO2wSfUhhrnumydfcJMIfyORgs
 8+ravgCXR0A8peTGyGooD+llDh/DRfLufZa9v9RAtfkdVXK2pNUvUeturXBxlovzhI
 nRm024EhmBp5OOxBt64MoyZqWFpLNQSiMRXMvcdJu4RdzSAFssD5GpgDEJ+5+DCrak
 WRaGQ3unfqYRcCIzwVd9foEcXujd900GbfD4/yjseAlsS5yTZTwlTJhrIff3aJjg1/
 VZqewGGD8+ldA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D5FB5A0096;
 Fri, 15 Oct 2021 10:54:41 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id ACCDE800E9;
 Fri, 15 Oct 2021 10:54:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="SaCbIPkE";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCQE44jaAQVC2w6jxdnUFluHNKwbw0UqqAc8f6ARdUkQ+43Vw7JABNkvIGot0Rx3Lx3bP4uMzCa0VX6J0jBXJ4cq0oNv8NhtroL0wKdQx3qIAvkWX/O24XCbUiY0lst1bGVuot0YwkHklqFc8nB7hyTNHRmgvUSx+POfCgwCA6mMBZnZlS3sXruoA9K4rsAaF9q9QyVTwAccVM44GDK7lSKAsNqZm2EIoAGfcfQcg79zHQPuqrUe+Trn7lQGyghRtfEv80TxWR6GTB+CSEj3ean+BrlsxNB/4Bl9cnLmllqcRxd4TK19tVbmFHEQLXf7NLShYsQ8IbTO42vRQOvoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQAIWrbOI9obbfAQrCLJpnv5ZntnC6a33nwO/CjRaCs=;
 b=baMZ18Nb2p2J/EyB1aW7iSzfsYqzuWxsEJ1oI31gGLSwwrG/6YsxBjJQR97eYzpeSFzbHTDv5bYN2W7wRP6Z3De2CdbDqkbOMaIYLT5INNntNPj/vO3WNPiHKmAwwxMbqFJq9uriG6NlrNFElgEll6oLRh7atXyy2HvXQWuxr9121lTUfr7p4ggxe5WMpgA0EC72QONx+9whR1yb8KrSKT2LabCxQcE+nvzRbql+pxq3/nkJ95bYb3xsMPDgC+WYtWVtTQFHrgxwQRfPoWn1Hthz/kk9LaFyQJUGrHdIo/AFe7aK57ESEFxOMmvAmO93h3HS+eqzNZqDObNjOo5SGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQAIWrbOI9obbfAQrCLJpnv5ZntnC6a33nwO/CjRaCs=;
 b=SaCbIPkEuRAcKiSczs1VqHaMRO51z0TB7sTCJUOtK5m7fEj0dwEQytRBRl6jHBS57nL0CZGP70SokIOuvFO5H9CZnXrJE7981h+WZ+6PrShw/IJqqoeKQNhke/7cL5NLThzyhVLswN9wMTrskMJnwXpJhJvonAJj54IB8b1Jq+Y=
Received: from BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7)
 by BN9PR12MB5210.namprd12.prod.outlook.com (2603:10b6:408:11b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 10:54:38 +0000
Received: from BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363]) by BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363%3]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:54:38 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 3/3] usb: dwc2: drd: reset current session before setting
 the new one
Thread-Index: AQHXuc7dYAGavKyIbkic0k99kJNEYavT8noA
Date: Fri, 15 Oct 2021 10:54:38 +0000
Message-ID: <36940be4-a594-a4db-1b28-e7272ad2a103@synopsys.com>
References: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
 <20211005095305.66397-4-amelie.delaunay@foss.st.com>
In-Reply-To: <20211005095305.66397-4-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: foss.st.com; dkim=none (message not signed)
 header.d=none;foss.st.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fa59750-3233-415c-534d-08d98fca2f17
x-ms-traffictypediagnostic: BN9PR12MB5210:
x-microsoft-antispam-prvs: <BN9PR12MB521056160BE22AD0F3D89BBDA7B99@BN9PR12MB5210.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: spWkmqwd9LiMmmHK4+KU5k2FosTyF8eOE9LNAS8VfAAcM9NhOCaIqgVeMdDCXzxge6uTCoHKfqgJRWHEz5X+6Vb5Q0EvqpxIqBfZsWBQr1uzCygpT9ovAkFhcp7yJg1dChjRKBnuU75O8+F73y7hMW9Efl3QE6Ozc7s5iL1NtUx3cRHQhvN5aHpXfkCSlo9jo2n+ShCuf/HSFa6fjf2UfvxIhlh+xo2wA8iMn5fVNKJwv2JjtmuelISCIqtb9gIhrKwyIfRSkRu/X0+K1lxqAIQggwjonVFCMFGqTshZC2ONzSA9Ux1kqNNDUyV7o0sWXaOcDKC0Fc7xofEz/POc0bjQwZYhzhyMLPlCAcit7zyjB5dWblmArOAUQzF8ZHKMqjT6WoTS4FSG1hidllr2wJUFCrt7jZ7iI9r0kvZrBFONXbdY/FKroFNgPpXNnv8OzfTf+58iPWX1hlhzABrMP5ZYgx+CAehNGCImqIDRnJDqyyJFC0UWkz1zdyfmblYwHRwXTJGzOibEI8cLVE5pbc0Qsjomb3H7Jlu4/Cz/4wrJ9fUbLsbXF+xpuabhcj+mG7xPqykKEd5ecOCvnuHWf7Uues/5lYu8QfvRjWd3RpUe/6+w/ARtUbFzWCpqMQmdugO6AfySoBEyZ6UtpnbGnUt43yqLTjrsyFNr3fgDpALkRO9ZiJAgFz82YsIoHnJqirtUJFf3jlqjpOmY0EUUmrEmjQ9RXMEEEiXpjPB1Pu/LhWP36Wv+WR7SWccdN90PYFA/8uRW1BSy8ZskbjwKkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5383.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6512007)(66476007)(36756003)(31686004)(38070700005)(64756008)(5660300002)(110136005)(66446008)(54906003)(186003)(316002)(122000001)(66946007)(38100700002)(8676002)(91956017)(71200400001)(2906002)(76116006)(86362001)(4326008)(508600001)(8936002)(6506007)(26005)(2616005)(6486002)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkNvYjBzRkg1T0ovTWRoWXdaRzBCd1VyMFJuOVBNcnVCR1drdGFyQVpKTGpW?=
 =?utf-8?B?R2FUa3dlVDM3MXdac1RRZVZuazMraitzeFlCMGY5RUlKOWRKY1EvWWhUV3hI?=
 =?utf-8?B?bC9pUmt2S0ZQRlFjMzBjaVdDRzU3T3Y2OTVCTWFLa0k3UWt1RWV2Qzdaamcr?=
 =?utf-8?B?anpod2NCWFlNUEV1WjNzd1lodnJuMkdUSUNoamdEd2prWXh3eDBTRTFhaTc0?=
 =?utf-8?B?VVc4WGZ1L1o5RDh5a2xUbmlSbnNLVlBuT1dJLzA3WUxvN3ZFUVFqSloxM0Jy?=
 =?utf-8?B?QzBpUVVwaXRPSWtSNDFFT1pab2tpalRTLzlGTkU2ZzFLRE1XSWpBNHJXNnB4?=
 =?utf-8?B?VHRwQW0xcUx0bjJyZDhHR1pSdFdOVy85WUxNR1FTclo0N2NRRzRoNms5RzJn?=
 =?utf-8?B?K0NRaUxwNnNiUUE4SWpBVC9POGs1ZDM1WlhZRVh4blVaRVQwSVFpNmprbzRn?=
 =?utf-8?B?OCt2Y2dlY2toSisrbnZGRTc1bmc1TmdXTkk0YmVnUldyYmovQWlyZFRzaE9n?=
 =?utf-8?B?V1luR2NKM1o4WWVCQW5sSzBjUW11UUVHK1BlV1dIbEsvUk5RSklWVUZDcExY?=
 =?utf-8?B?RlVzVDczMFh0SHNuRTQ5VHcvK3ovZU1WVGJoeXdSMXRKMFBhQ2FxOUQrWmJm?=
 =?utf-8?B?RkJiaEV5TFBsS1RLbFY5VVJqYTR1blBtdnBnVFBpc0tEVGxvcFh6M0NkY1BW?=
 =?utf-8?B?V05ROVVWakFkZ2hIbStZQ095ZFh0OFJnTUx6NjN3eUpxUi8vWi96N3pDQ1g2?=
 =?utf-8?B?Z0FTeFluaDVPaVZMenhWWnp1YzFuMktqemloQjNvbVpMOFRSWmpZYnhKdnM5?=
 =?utf-8?B?aUswQXRnVWVhOFdTLzJsbXFCSDFlVk8yVWtCNVR4NXNpVVcvdVZ0Q0JHRTlR?=
 =?utf-8?B?WWJBUit3eHpnbFIyNXZkdUFmSVBIcUZaSCtZMGNNYkx0ZGk3OVpDcmtaNUhG?=
 =?utf-8?B?ZjViSnZXM0JVdnlyMVpORTVMb1FldkREM0lwamdWbU5jbW51RnZQNW1abHRS?=
 =?utf-8?B?aU5MRUtNOE9zcHlwLzd1VzdaVmYvWVB0UGh4YlJIeXo2Z1RUSWErR3Nyam54?=
 =?utf-8?B?eUR3K1hJRzJERWhGMU1tMmZmWW91YmNvNnBTWjNJejcvNm54QmJHdk9acWhu?=
 =?utf-8?B?dUZSeFN3SG5nbjZKbCs0eU5hZHZLc3VRMW1vZXVyMXRZdHJodTd3NUZ6M3U1?=
 =?utf-8?B?OHhHaXVaUFJhQm1INXBpV1JDeDZQUmltbi81dTFQdE5aN0xrSytGQ2xYTHE1?=
 =?utf-8?B?NWpnTWxBQzJxQnJnM2s5aEttUTVBRkpIL0hFQWt2bGtrM3NkNnVlT3Vtd0lL?=
 =?utf-8?B?WDNqdGd4S0N3UEg0OE9MZkxQc1FJSit5cnVYK005clY0bmpDWXNnczhFWXpo?=
 =?utf-8?B?WHRraEZuOHZHZU4zWXZ3RU13Wk9zWjdFZlA3UHVoWUVNS0ttSkV2bUs4aDQw?=
 =?utf-8?B?NW5DNEgyQmNlK3RMVjB0YzAvNmd2b3ZlcC9jRjhuaGdNc3BEQzBiaHRyVWZM?=
 =?utf-8?B?UHpkTVFlRms4SlpvcFhESm1obWdGa3kxbXVxRW1lUHR3TlF5dHpScTBlc0VV?=
 =?utf-8?B?Ym90TTdJTUJFR1h1b0tVanhpa0pVMlZibTA0WlV2YXlKVkkwZjBIV2xVWWMz?=
 =?utf-8?B?T0FpM3hHV203d3N6bXBhaUQwUGFGaFdETHkwU2lqL240emU3YjhhSWpkNU9O?=
 =?utf-8?B?ZFVKVG96L04wWDhVKzY0TTJRT3E3RkxlMkc2SitrUUx0ZkFIOGpzcXp2azFu?=
 =?utf-8?Q?szo7vA3SvkinhEFVa4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <8958010C91EEED4BBFF73BADB1575343@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5383.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa59750-3233-415c-534d-08d98fca2f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 10:54:38.4953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EJSyhIokPgTyFMRt9FZC0/W/QHxZt5BKi+r9xJCwWaPS4fEP7eC753qtmQvc07he2k6Sm7U16DlV+jtmPw4tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5210
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] usb: dwc2: drd: reset current session
 before setting the new one
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

On 10/5/2021 1:53 PM, Amelie Delaunay wrote:
> If role is changed without the "none" step, A- and B- valid session could
> be set at the same time. It is an issue.
> This patch resets A-session if role switch sets B-session, and resets
> B-session if role switch sets A-session.
> Then, it is possible to change the role without the "none" step.
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/drd.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 99672360f34b..aa6eb76f64dd 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -40,6 +40,7 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
>   	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
>   		return -EALREADY;
>   
> +	gotgctl &= ~GOTGCTL_BVALOVAL;
>   	if (valid)
>   		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
>   	else
> @@ -58,6 +59,7 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
>   	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
>   		return -EALREADY;
>   
> +	gotgctl &= ~GOTGCTL_AVALOVAL;
>   	if (valid)
>   		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
>   	else
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
