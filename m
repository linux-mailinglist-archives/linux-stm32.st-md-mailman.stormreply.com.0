Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D65473D2B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 07:25:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF00C5F1D8;
	Tue, 14 Dec 2021 06:25:30 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E9E3C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 06:25:28 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD0AC47655;
 Tue, 14 Dec 2021 06:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639463127; bh=+WA7zGIAaSVT7MVIcoWcvmQXmV+u//VINLlq1XDUiIk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QJbERhz0QVcdfQxh/d3/bQe2mwL6GpoSCM7G6tHGUINTcdFx5O/Zz6fuu8SkjFxf1
 6YdCx+NHulJ8tUfw+YdKiwDOx0cYwWJHp3i05rulOX4T4V80mMqx/Ozv88sYHrsF/H
 tCL9oft4MidtzNAU7QmB/X2/i1YvVVwFwovXfVNVuvkvW3nrWdN9fi/yEAh3OoxRbf
 3o6jxy1CiOBEPj9EzOZ7XOlQOcGg6L7jE7ixGB/b6UyG5iUeGqBMSBMwtGE/46p8z4
 5br4RfH2GIgDapVvob2i86A6uxVP+Xa26TC92IzOqJdjJRCqu+N8WmOzZFS5PHMX6W
 IzgwqsFlge3Ug==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 557AFA0083;
 Tue, 14 Dec 2021 06:25:26 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 995AF400A3;
 Tue, 14 Dec 2021 06:25:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YLAaQEUt";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9+9NTXU7rtbrwYRlClQVBabZH4bAJ+B5xsAJGLOv0V57h0bw+fJhmnXwwwuy/J6gPZT+13OcrfOuXQFEP68mY9KusaEyaflEhGvUfBcXETwUDTquK53nuiYhIdhorEtnhmgie92kPBPr54mo01O/ZH6mFEb65OcZJPYT1ivRMhHvF12zbZzEX26sOogpxyitIM8XULVYH1qvwkt5RrruHhYbHuCxO0qiIcHGn4u210hUiWFDzcQZT25/H5Iz2aTCTuRG+BOlYf3qP/rzgKX7RG7Gq8eVuBYxGHsMh2LgoAf663lwO3KY4vj9U8MNnYTkNH0l5jR9C8GaZj2HKloAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WA7zGIAaSVT7MVIcoWcvmQXmV+u//VINLlq1XDUiIk=;
 b=Y+erM2yZlMYQdx1GI3eQ/uPsHhM9ePS5YHyYA9Kwtii60bxO/NBRQGjo6vLRQX6mqBSJogurvkn3PI5qf3Zp8Pwh/wSxIv6J5bjY/s+tm2Bb+Hq+6Q3y747vLYo7mclOrUZb+OYbXdJd5++mVmR+0FtnLkLkxu/AbeFUEplGQ7tt6qlLGDVb9pXQ9bXXVbdBx0Pt5QZgoDUfxdLe9iUnq3qTPCIIXiVo3u71zcCsN6ClIzZVuwPjRBoMIMorkgaslHXp9Xb4Mr3309Vzx/To3pxJ7IYM/EzTsheXtuGisPjKAblYkLS5ieT2MIp++2LYQIwGBSIIGxrxwShM+Qr9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WA7zGIAaSVT7MVIcoWcvmQXmV+u//VINLlq1XDUiIk=;
 b=YLAaQEUtRNmuGi6asYSbDYOp2lTDZfyf1zmT0YZAkzzBi35mUuWdc8mLgTfh2i/Gt2C/IzNf6d7x/JKlbdFeg7Gknssg1sYlW/MQ9fn0E5OwdXV+iqfMC6zc6ft8Wpk8a6XZeZhgc77ZbVS3NSuEmpJt4t3rQYvo0JJn4ryC+VQ=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM6PR12MB3754.namprd12.prod.outlook.com (2603:10b6:5:1c4::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Tue, 14 Dec 2021 06:25:22 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 06:25:22 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] usb: dwc2: platform: adopt dev_err_probe() to silent
 probe defer
Thread-Index: AQHX62MrP6OJ5a4hRkm0OP/E3EfUNqwxj/eA
Date: Tue, 14 Dec 2021 06:25:22 +0000
Message-ID: <1b5e7e68-e320-ee1b-d395-9256327c1752@synopsys.com>
References: <20211207120829.266837-1-amelie.delaunay@foss.st.com>
In-Reply-To: <20211207120829.266837-1-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b5091f3-8bc9-4606-7790-08d9beca8225
x-ms-traffictypediagnostic: DM6PR12MB3754:EE_
x-microsoft-antispam-prvs: <DM6PR12MB37546C6645737F493289455EA7759@DM6PR12MB3754.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ieJRMwrJrjYs2O4+YNWyLbrIQWT2Q3+V2JI0Rez0sFtoAo/qz4tAj+vh+48ZqnQYNUDbJlKtTbOITgaPYR26WFgn7mcxmEpJXpJ08k6KkXFs2cj3Kjg2tIBt4rFRRrRG6RQKxKs9VMMkc3irnt+GUaGnMBMlscIxglAznvGoimedTbiy9Mb71nstFGAkWmJSe4c7Erns8LmmVc9Lqds49y5yRsQJh4RKiWbeNibKeFJDuaZxf0lwWH+Ef4i8ky0vL63gFNHHIxRfDlD7VLTpwq/gAdhYrVwa2Yk5mqgWdjPUuaRc/vnC3QE2XahmIq6zs7xQqkNzuQBc5V2LXoHi8RRohMIZNMxeRdEwKfqlURju2GHWLKDT9O0n04tonTIKy8HdkL2UAVeMULZX+LUwZS4mTHn72jhYlI0v2nfJvz0MujzD3cBfTAY0EauDwEbI/KdzxGZx5Q2vzFD5NHM1+APs20btcH8EgRXDMShDUaVnOnk+pYTJpLgI7R/BoCYeNiY87hnvxkuoIu2B9gl+uv5WV/QXxAOlhCnP7v3wQq3itPWexlIRYY7ijsfsCLzGQduZVS4W5pG85C5D504jSgQzMgFODQdakS3Nu0RAZ/HxHVdn96mDhutcabqFve+OdHGvewpcBoVn5Kun0+5h3vsZLAA+loReOAKJCH5ceVe0SRDUhFDLsQfMkv9X+PkFuEVBhEN6mYHEH9UleC1mSApJF3RfV0ARDu9LG40/UtYoDUxMiWRmmlRw49NObaS7BgZxsW3Cxdr6DKtD0TlUsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(53546011)(4326008)(83380400001)(2616005)(31686004)(64756008)(71200400001)(6486002)(8676002)(316002)(31696002)(66476007)(2906002)(26005)(66446008)(66556008)(186003)(76116006)(38070700005)(508600001)(6506007)(91956017)(110136005)(54906003)(8936002)(86362001)(122000001)(6512007)(5660300002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU1KYmpWY3BLR0xvdWlJV0J4cWVlUXE1NXJnTEpPZmQ3T1JpelhvLzBYZmUr?=
 =?utf-8?B?dHlkRHM5NU1OQzZpdzdzR0hyUTVQaTVoeXFuV3FKWU8yVXZnd2pPczh6bkF1?=
 =?utf-8?B?N2g0QWQ2MFhLczFUSUhrS25Xcis0WGE1WWxId0h5T1J2YkJWaXlINmlMc0k2?=
 =?utf-8?B?TzdaL090cElmT3hBaTF1WjV4VlhWRHRQV1dSemFubTdhUzdqWHhPMFdTMVRm?=
 =?utf-8?B?eUsxbURZNTF6cXpuRitPeThZUDBCV0JXc3VJNmNrelNzQ3U1c0FTT0xJRyts?=
 =?utf-8?B?aEhSc0pGQnQzbkZ0OTNUOGFKaHlBdUhyOW5YNDJNYUE4LzRuQ0dWUjlJQUpV?=
 =?utf-8?B?UlFOZ0xNTkZaK1I5cTBCQ2ticFhLOC9hdjVObUx0WCt1OUpzZ3dmTW9qZEZ1?=
 =?utf-8?B?Y2xiQUNHWFJ1dTVYTEt2UHVKY1I3ODhHRU53UlNsb1N3WHlBR1EwWkUzSkFa?=
 =?utf-8?B?Q1hjcVovRmZ0T1dGU05BaXNud2NiaCs3aFRidWI3S1RMMEVtR3lMWDJvZWNl?=
 =?utf-8?B?aDdJR0tlUjlxeitwR2UxTW9pblp4elBRR1RUU2djK3dKRHRISjVRLzRZS1pJ?=
 =?utf-8?B?b0ZBL2JYN2lhRWpMZVBra2t5NmZ6SlZ3RExNQWowR2hzdTFteTBvVkhmZUUz?=
 =?utf-8?B?c1lpZW1Za1NuQnE2WjZGMEdFWU14SWF4aCswclBTS3N2LytEZXZYdjFPaFUr?=
 =?utf-8?B?MGlkM0NBTm9RVU15NlNNZWJidTF2T3ZPMGJ0RmdpWWtZZjM4U09mMzdwSkEv?=
 =?utf-8?B?aWlpdGgwajlaTXlYb3RKdlJoNUgvYk5WTGI2Q3JzN0pRNjYrQVZaa0Z5c2dE?=
 =?utf-8?B?VUl4YnNPUC9zY3VERlcrVERGaG4vT2hxQ3h6OVRKQWhnaWJxcFJiTHFMRTlS?=
 =?utf-8?B?eTdEcWpiNHVZOWFjd0FmTTVvQ1JpSzhXRjF1NGJlL2hhMXBQYzZHRGc4eS9z?=
 =?utf-8?B?MHNXdEQ0S0Y0aUN0RXFGK3creDZGMmQ2MlVoUHZCU1hUU01Md3F5S05WOTdy?=
 =?utf-8?B?amZSVHhGMExBTDRZTVg2MkxYZVdCbzlBR3RSanI4Y3JxeDNoNCs3anU2TzVS?=
 =?utf-8?B?THJ4QnF6Q3pwWjdVVmpkVnc1RVdodW5KY1RJcTBhRk9IaGlJZEFaajU0Ym4z?=
 =?utf-8?B?NVYwL29LZ1kxZ1hYU2NQRHRYMnhrYnN6Nlc0OG80RUIzUExid2orZFNPR0lB?=
 =?utf-8?B?bzF2bWpvd04vRmhaUnlBeEFXNm03T2czL1p3M3pGRk0rK05qYWt3c0dJalIy?=
 =?utf-8?B?YytaZnVOdmN5YXdUVWxrdmx2TXBlT2ZIV1Urb2czcWxKY2xoenJ5Zk9CRk1S?=
 =?utf-8?B?MlRQOW5CR0E2TzZiZXBsbzNRdlNWM0dHQUxkcjE3QVd3bDg0aElRMUVSSTEy?=
 =?utf-8?B?YTgzQ2FzbW5OeWtqcytZS3ZBYlZVNnYxWk9qTGJKYTlCZVlNaDBsWThOSy9q?=
 =?utf-8?B?NXNXTFVaWGJpUXJLUGZFTmZrWHZMQy9vajl3Qkc3Y2NhaHZMT3lhcUZHdk9H?=
 =?utf-8?B?ZndEamVPenZNWVVuK014ZkFYRzREZExHcjQ1RXBHQm5Nem5sU2hvQVlBcFNq?=
 =?utf-8?B?eGxCbGlyWDF0dFl5S3EwQ1EvaXRSbTRnOUtyNGtwRlFTQ05oUGl1eXhFc2xQ?=
 =?utf-8?B?dGNRNEM2OENXdXZGTk1RbGVnRThkcHZCUThOd0Rud040T0lUMkxiNmZhZlJZ?=
 =?utf-8?B?aG5Pd0p5eFgxUGZNME9Hb3pIK0tUNVlYay93NFN6MFNQRlpZSjdiM2lOcXBq?=
 =?utf-8?B?RU9ia2J3MjJoOEpNRE1zclQ3RTJ5bjBuSEpmRUtDeWhUbmV0czJsV09NdkNY?=
 =?utf-8?B?ME9ydUZrTDhvM2lQQ3RHeEFROHBVdk9FYy9ZWkZjT2xRdlBjaHB6aEQzbmRz?=
 =?utf-8?B?cGMrdFZzRi93R2RHQm1kdGlxQWpDUGs4djJKWTR3NTAwUEQra0NhdzVNbW93?=
 =?utf-8?B?QTZ0L0R5bFBlK3RYOXJ3N3RMUzhkY3BMVHNudkRmYmxrK0V2Nk9ESGpteGpl?=
 =?utf-8?B?SFlyUjJUK3FHdWdKZERqOUxzaU9FZzRKdFl2SlRGVnA5T1FpczBuQzdnYTgv?=
 =?utf-8?B?VmVDVjBtREx6aTZYbGN6c3JrMnFWdWJuNlU1QXEwTnB1UGdteDhGUzVOeVFZ?=
 =?utf-8?B?dCtIdS9sUGRhRjNTZEN5VmhzN2kwMVluRkdlVGs2aG80anhNWTBJYWptNWhz?=
 =?utf-8?B?Q2c9PQ==?=
Content-ID: <DEEA6F760C8DFF4096A48375CAC7BE56@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5091f3-8bc9-4606-7790-08d9beca8225
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 06:25:22.2062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7e9HhlfN5sbf+oXcpRBijiqVZT2OPhCaQ1etjh+LkS4KKzY2wQ2ZPNFlgayw7UiTmPdWMGLHv0wSO6ZRj7nQvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3754
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: dwc2: platform: adopt
 dev_err_probe() to silent probe defer
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

On 12/7/2021 4:08 PM, Amelie Delaunay wrote:
> In case of probe defer, a message is logged for resets and clocks. Use
> dev_err_probe to log the message only when error code is not -517.
> Simplify phy, regulators and drd probe defer handling with dev_err_probe().
> Then, take benefit of devices_deferred debugfs in case of probe deferral.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/platform.c | 53 +++++++++++--------------------------
>   1 file changed, 16 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index c8f18f3ba9e3..a1feaa09be57 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -222,20 +222,16 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   	int i, ret;
>   
>   	hsotg->reset = devm_reset_control_get_optional(hsotg->dev, "dwc2");
> -	if (IS_ERR(hsotg->reset)) {
> -		ret = PTR_ERR(hsotg->reset);
> -		dev_err(hsotg->dev, "error getting reset control %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hsotg->reset))
> +		return dev_err_probe(hsotg->dev, PTR_ERR(hsotg->reset),
> +				     "error getting reset control\n");
>   
>   	reset_control_deassert(hsotg->reset);
>   
>   	hsotg->reset_ecc = devm_reset_control_get_optional(hsotg->dev, "dwc2-ecc");
> -	if (IS_ERR(hsotg->reset_ecc)) {
> -		ret = PTR_ERR(hsotg->reset_ecc);
> -		dev_err(hsotg->dev, "error getting reset control for ecc %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hsotg->reset_ecc))
> +		return dev_err_probe(hsotg->dev, PTR_ERR(hsotg->reset_ecc),
> +				     "error getting reset control for ecc\n");
>   
>   	reset_control_deassert(hsotg->reset_ecc);
>   
> @@ -251,11 +247,8 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   		case -ENOSYS:
>   			hsotg->phy = NULL;
>   			break;
> -		case -EPROBE_DEFER:
> -			return ret;
>   		default:
> -			dev_err(hsotg->dev, "error getting phy %d\n", ret);
> -			return ret;
> +			return dev_err_probe(hsotg->dev, ret, "error getting phy\n");
>   		}
>   	}
>   
> @@ -268,12 +261,8 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   			case -ENXIO:
>   				hsotg->uphy = NULL;
>   				break;
> -			case -EPROBE_DEFER:
> -				return ret;
>   			default:
> -				dev_err(hsotg->dev, "error getting usb phy %d\n",
> -					ret);
> -				return ret;
> +				return dev_err_probe(hsotg->dev, ret, "error getting usb phy\n");
>   			}
>   		}
>   	}
> @@ -282,10 +271,8 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   
>   	/* Clock */
>   	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
> -	if (IS_ERR(hsotg->clk)) {
> -		dev_err(hsotg->dev, "cannot get otg clock\n");
> -		return PTR_ERR(hsotg->clk);
> -	}
> +	if (IS_ERR(hsotg->clk))
> +		return dev_err_probe(hsotg->dev, PTR_ERR(hsotg->clk), "cannot get otg clock\n");
>   
>   	/* Regulators */
>   	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
> @@ -293,12 +280,9 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   
>   	ret = devm_regulator_bulk_get(hsotg->dev, ARRAY_SIZE(hsotg->supplies),
>   				      hsotg->supplies);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(hsotg->dev, "failed to request supplies: %d\n",
> -				ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(hsotg->dev, ret, "failed to request supplies\n");
> +
>   	return 0;
>   }
>   
> @@ -558,16 +542,12 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   		hsotg->usb33d = devm_regulator_get(hsotg->dev, "usb33d");
>   		if (IS_ERR(hsotg->usb33d)) {
>   			retval = PTR_ERR(hsotg->usb33d);
> -			if (retval != -EPROBE_DEFER)
> -				dev_err(hsotg->dev,
> -					"failed to request usb33d supply: %d\n",
> -					retval);
> +			dev_err_probe(hsotg->dev, retval, "failed to request usb33d supply\n");
>   			goto error;
>   		}
>   		retval = regulator_enable(hsotg->usb33d);
>   		if (retval) {
> -			dev_err(hsotg->dev,
> -				"failed to enable usb33d supply: %d\n", retval);
> +			dev_err_probe(hsotg->dev, retval, "failed to enable usb33d supply\n");
>   			goto error;
>   		}
>   
> @@ -579,8 +559,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   
>   	retval = dwc2_drd_init(hsotg);
>   	if (retval) {
> -		if (retval != -EPROBE_DEFER)
> -			dev_err(hsotg->dev, "failed to initialize dual-role\n");
> +		dev_err_probe(hsotg->dev, retval, "failed to initialize dual-role\n");
>   		goto error_init;
>   	}
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
