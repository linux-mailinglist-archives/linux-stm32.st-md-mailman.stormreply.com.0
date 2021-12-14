Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFA473D22
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 07:22:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B620AC5EC76;
	Tue, 14 Dec 2021 06:22:42 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B85C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 06:22:41 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D7A4C0455;
 Tue, 14 Dec 2021 06:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639462960; bh=4KbnA4kcO+xpAVOSiMCtD+NV3lsePn+vduUx33K3z+0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=iNxmta3+nRW76r1+O+bapQjPzZbsqPXtU/GqQjQ3zy7Kan9Ot8bksLYJUJBhzlcAA
 9Ac4x6e1dTiS7iZbJAWdVYYX0MHEk2qEIcWEt5kjjHcDHE7Ej42mXfBy5QG5w4G9FM
 EUq8/CldDt6GY9MvDvqd8g/zeq+blVN2w+8Xcp96+gQM3oUb7+PBN1QSLlz7GRyprE
 4kibRa/JS6ezcJ9AtL/8DYK+f0xCe9RWhHI1KhEySE6xkFnhDktdv3RGXG43X3CuUK
 oNKA/1gf0zUJyOf3oV4XRTrV66TGPeTCPFURM64MyNmBJMYsEH2J+R5woyjsa/S/l0
 4T0piinig4Mdw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 68563A0096;
 Tue, 14 Dec 2021 06:22:39 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 96704401C0;
 Tue, 14 Dec 2021 06:22:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="rR65mVZ8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzHoUONMcqUHE7TUAjQuW5dCYblJZDCfYQ8aqdJ+Vx4thoN42Ja4OITZlGjVuw3l3JnhZXrKnNW0pHNqsmazQ4sqOscxPikLDnTsVlfV8Q8D65n7hq1G0kJRu8DuFL7R7ih8PuE0KxAzoNtVO9rOkxUMggAXbyl9m4GwsxM4wJYoA0yJ0fCJy3Ml6+pGM2gkWkWc7+ZWm/IW4bCt9GErCnbzYjn/jRwG4dOYZRv+4QVTKXcRETX1yuNe5odgzC2i+Rk2hLvmzLasyIr7ViBplAm+iN5wPfZWC4QNX0Kw168EqjvUJzVCXlQ+IS6LyJLidPVmMZfwNF0ada7IWhlr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KbnA4kcO+xpAVOSiMCtD+NV3lsePn+vduUx33K3z+0=;
 b=mCjO73UHdlmPMOrrIUQkTwwwwpXaqIOYhaPUUNkIcylcyzK/OlXkU13MYeJXWe36Bm7Gtj4PUmuUM3iuseoNJBeRpRrhLfupEZVoGBP3ZJ/O0fxRQ0eTu1dNqrzxeJzKf68KW3RXavpm8fodMlViRmfQsz3ItcxrrofkokZXksX4fEc92NzHIE/1tsb8OWnmvRi+tXL9yU6xfMrASElkjFcXisT+0WTCy2S3GiOjZ3q6kaGY2FnlyG2/3d61fXYxv9mD5kJsPsnJYMAw74D1Pa3eOdRsddmRJFT+Odq5UMDcEe7OA4OUmHu201YOZL55Y6QKxykt9Oid4YcgGeCccQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KbnA4kcO+xpAVOSiMCtD+NV3lsePn+vduUx33K3z+0=;
 b=rR65mVZ8ZdAKmGZHQQMIVk1n/fduey2bRkW5CknU87dveGmdfAGqf8cFpdNcN1nHZDf/fktQJqHhQud/h2KGRvsU1COoweoGAE1P1rI6DBB5cr3bubUVYT14s5q0+vykRISvNC7yYnlF55JlW7Yv2HGhG5IzgQABFY7x3GoNA6Q=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM6PR12MB3754.namprd12.prod.outlook.com (2603:10b6:5:1c4::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Tue, 14 Dec 2021 06:22:36 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 06:22:36 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] usb: dwc2: gadget: don't try to disable ep0 in
 dwc2_hsotg_suspend
Thread-Index: AQHX62qCxCNUA/jq7kGn/hM1/5MI16wxjyKA
Date: Tue, 14 Dec 2021 06:22:35 +0000
Message-ID: <46125d28-b065-b882-8a62-9d494b271755@synopsys.com>
References: <20211207130101.270314-1-amelie.delaunay@foss.st.com>
In-Reply-To: <20211207130101.270314-1-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af7c8eb4-8917-4bdb-b2b0-08d9beca1f1b
x-ms-traffictypediagnostic: DM6PR12MB3754:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3754A5F17A729B7DA633D373A7759@DM6PR12MB3754.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V1aYmsjOziZeP3C8IyfFmH0yoJXz32tnZAUvd+cqPaLyd0p36WFXHFtGghDAKKO4Af+iVs07RAFQqFXFOwG9a+w9uH3KGN71ZnA217RY9Vy7QNVETl4CppAdT7tCOxPczrCLl7ePY4LXftCZOmYy43uRHTDbE+7Ss9TZt0MhRfxNINI3dUFzlkfZd2tvLWnzVIk2wqJ+ImLOh2u9h9N/JPmNdmgefgO4+78v9dZ020XGA6ibsfjI4XAtqu9TKAKkZfo3j1K457LVxz2MX40HGi4tw8BKNjuifkfK8qOwFBr34iMIq3+Omm9dXYG1pv8wqeK+QKzi6eLBv0wqgc54xi0UvNM/sBmDkLNnJmmOpnsSZJFRm79hSgzNgP9ZLbSqHze+G/JcZ5O3eYfCUZ/xKqzhfUnMu+BAd2mfEyYfkroHq5lG0A73htpSEw3aIaUIZ93wOB37C98RIkBYJMafz5jxFYCUc3WJUs6BgtXewIu2PC7jfAyQuHQyODEYhvXQcmb5eQHLFBjIOpXReBiD0A/IjTp4pBBwVKBTDZHAxcnhJTuLgMEIg80i/sDuugy+ntIULRmwdKKYIm3Xl2zjwR5rQY3HT1SeiPwFEQWPhuh+BEe6ez90EKW6gIGlwW9Mi4KNa8SssrWDgg+pzrg990EgTsxcx0aVbuItBQ5Dpeoo5km560aQEnYDkq6kDbEb+AvBF0dczxvMgJZ+b0sbD+yXcYi8wQ87AIf/k9sVrtT9JQpyb5la2OginxV8NmJk8xFn/Zel4aRi6QZFXyMGug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(53546011)(4326008)(83380400001)(2616005)(31686004)(64756008)(71200400001)(6486002)(8676002)(316002)(31696002)(66476007)(2906002)(26005)(66446008)(66556008)(186003)(76116006)(38070700005)(508600001)(6506007)(91956017)(110136005)(54906003)(8936002)(86362001)(122000001)(6512007)(5660300002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0d3ajRTUms1T3ZkOVlLQ3JhMlNZdWdNeXl5SlBlcTNjbytxc1hVd0RkRURl?=
 =?utf-8?B?RlRkSVlJZmRxaXJod2hIUjY3VU5tcFQzbFNaVGZQL2JZdlgxeUpqR3FIeWlv?=
 =?utf-8?B?NTFDanRrU3lTNCs4blZaVVVjVnhkMXFKcDdGemljRjViRitINGIyVnJ1WlJv?=
 =?utf-8?B?czZKV0g4YWRVN0hpNStUdG9DMzh6ZVA1ekRtOHd0OEFNSUg0ZHNneG1GNDFB?=
 =?utf-8?B?cGxKdERvbFg5eTFkd3YxK3BvM2paMTI5N0szRnRVNmErcXZkeFFyZW13a3g2?=
 =?utf-8?B?Y3hNTWt5YzZFYjIrUGMzREVRNWtBeHNNMzJ6cXdVaWk0RWNxSll2NUUzTWdO?=
 =?utf-8?B?cmFiTmU1OTl1NE5Xc3l6Rjhzc0pDeDRwSmVWaERtRlphQVdjdG84R1g3Q011?=
 =?utf-8?B?ZHpsL3E5eDlOQWhIUEswVGpFZEQyTzNjcUxsN3ByOE9ScUhZRFdieU9mNGd3?=
 =?utf-8?B?VlJwQlFUKzUxT0JDRXJvbk9WUWtzU1VrVWgyWHhXdFZmWGtRRmYxdkFGVkhX?=
 =?utf-8?B?dnA2eEkySVZhMFAyRTQxRUpUMUdaVTJONlk3Tk5UaEtWSDg1cW5YVmNNL2sy?=
 =?utf-8?B?T1ozTituUHRQZzVTajJzWVRsdVROeWdXdG92U0RUam5IRlJ0YTlxa3FFd0Zx?=
 =?utf-8?B?L3BoZ3ZxV2ptTVBhbWFDVDdOYzI0NmpYRmlaa0VsMGdTanFtWEJYNFJOekcz?=
 =?utf-8?B?OWhBaUU1dCt0M0Jrcy84MUtZL3VvNldYTTM1RDRZSmR3K2NUcGlUYTVOaGNY?=
 =?utf-8?B?OUYxUU9ISkZoa291c3ppczdTdUFVTWhwZW1nRjhEanljZVNGTEFlNzlhSHJM?=
 =?utf-8?B?ck00Wm8rc0kzUmY5UU84Y0FuVW93MkY1UWVhemllMjRyUVZxWmNOTi94bTB1?=
 =?utf-8?B?T1h6L0Jvbm9XT2dBeDA3YkhJalhrZmJJdmFTMEUyemd5OXhIVDR6TFllMk9P?=
 =?utf-8?B?aVllakJxSXVGOTYvUnFLTDRUbWo2WGVjdTMrMmtBdlQ0N0NEQ29weHFNeENp?=
 =?utf-8?B?T1haK0VrOGhCK3V2OVNHWE5Sc0dJL0pHY0FnU0ZTK255RGtOYUpYaTlRTzNJ?=
 =?utf-8?B?Y3dKYkJIMmM5Q28vQzBxTEcwbEpEQ2t4NnRKMDNhNXc1d2RPZlJKUW5EN2RW?=
 =?utf-8?B?WnJTcE5mMW1NeCtVTUFIaUFvYWxycU91SWZVb1RVak5xQ0hrRXFQditJYWxi?=
 =?utf-8?B?UENDMTF4aldPSGlGQ2J0NFFZeGdPWFRyMEM3Tk1TV0ZCQUwxWWNyV3l5Q1pj?=
 =?utf-8?B?ZXRZcW82LzZCNUZxb3RFVTloU1h5QUd6ZlhXT1Q4OVFnUVoxSG9BYkJTQTBK?=
 =?utf-8?B?YzVhMU1lcFNRMDdSRDhtakF2a1VwK1g3a0t3ODJQdE9YM2FCSkFQK3h3dE5G?=
 =?utf-8?B?MnJDc1ZnSnRBNElvR0x1SmNZVU5tY0VTY0UrRkNFN01mMkhzTFoyWkhjTHZZ?=
 =?utf-8?B?U0FoQ3MwaEtiZ2lELzUyc1I2eEd6Z2JmdzdiWHFRMFFscC9wRjZ3bkhMRkhQ?=
 =?utf-8?B?MEliSmRZWWhFY3AwZFJhNXZtVUFzZlFjb2pxbnoyQ1ZUVkJhMG96OG0vdmZm?=
 =?utf-8?B?OWNMNHRSMTdaaUFUZUEvay8wOW0xVzEwSWgybk4rR3BCcFlxV0VOM0hNSUVp?=
 =?utf-8?B?OVhXV3JHYjNCT3N4QU9IcnorUVd6QnMwMmdxZ1NLZWZSN3AvdWtLNG5WY0Z3?=
 =?utf-8?B?Z05oVUtZdmU1OGNFUFZIK3lkV0pRbFZDbENQZnYxRkpNVTV6ell0L0NaRkhx?=
 =?utf-8?B?aFphb3orNzZQbTB3MkRZWGg5OXJCK1kzS1Z1a1g4dGtGUkR3bndIVkVzL3BX?=
 =?utf-8?B?UFNMaWpFR3RMT3ZjS2JXNEFTT3BYOWJ0Qm15SFZPQ015d2dsVGJidFdCMUYr?=
 =?utf-8?B?dVZnU3A5Tnh1cXMxVmoxbDZvQ29iMFZJVFhiYWRWRlQ3eDlCMUxNUjN2b05m?=
 =?utf-8?B?ZWhGZWhsV1FRWE91NFpLZFVBNUJVeUpMUS8xYi9pU3dHY2trek1obEpqSnVV?=
 =?utf-8?B?bDVKbkNwanJXVUhUcHY5MTB6VWxMVUFtc1I4ajEwNi9weURlZDZ4VFhEaXlv?=
 =?utf-8?B?eldkSHNPYWtLYWRBd2srUzdDcjkvUmVZQW1NeThDczlmcmhuNlFWTk84ejZD?=
 =?utf-8?B?aUh3RU1PNzJucnVvUE5DcDNLUjMxTy9SWG1IRTRNMW9UeEJUczdJY3Q5NE1T?=
 =?utf-8?B?cXc9PQ==?=
Content-ID: <A548CC0280EE5141A15D794557CF156C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7c8eb4-8917-4bdb-b2b0-08d9beca1f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 06:22:36.0927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9ibN3Z6ppIcSqnJyS4ZQSTybWrL4xPDunqc/+h8qZZD5Obz3be/f2UnBDWyTbKf0slOUS9mQ+igV8ZbY+5Mzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3754
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: dwc2: gadget: don't try to
 disable ep0 in dwc2_hsotg_suspend
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

Hi Amelie,

On 12/7/2021 5:01 PM, Amelie Delaunay wrote:
> Calling dwc2_hsotg_ep_disable on ep0 (in/out) will lead to the following
> logs before returning -EINVAL:
> dwc2 49000000.usb-otg: dwc2_hsotg_ep_disable: called for ep0
> dwc2 49000000.usb-otg: dwc2_hsotg_ep_disable: called for ep0
> 

This messages printed for EP0 OUT which can't be disabled, but EP0 IN 
can and should be disabled. Your patch exclude EP0 IN from disabling flow.

Thanks,
Minas

> To avoid these two logs while suspending, start disabling the endpoint
> from the index 1, as done in dwc2_hsotg_udc_stop:
> 
> 	/* all endpoints should be shutdown */
> 	for (ep = 1; ep < hsotg->num_of_eps; ep++) {
> 		if (hsotg->eps_in[ep])
> 			dwc2_hsotg_ep_disable_lock(&hsotg->eps_in[ep]->ep);
> 		if (hsotg->eps_out[ep])
> 			dwc2_hsotg_ep_disable_lock(&hsotg->eps_out[ep]->ep);
> 	}
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>   drivers/usb/dwc2/gadget.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index b884a83b26a6..ee31f9a328da 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5086,7 +5086,7 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
>   		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>   		spin_unlock_irqrestore(&hsotg->lock, flags);
>   
> -		for (ep = 0; ep < hsotg->num_of_eps; ep++) {
> +		for (ep = 1; ep < hsotg->num_of_eps; ep++) {
>   			if (hsotg->eps_in[ep])
>   				dwc2_hsotg_ep_disable_lock(&hsotg->eps_in[ep]->ep);
>   			if (hsotg->eps_out[ep])

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
