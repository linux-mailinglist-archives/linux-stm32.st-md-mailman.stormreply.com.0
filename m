Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CDB476ED6
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 11:26:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A394C5EC76;
	Thu, 16 Dec 2021 10:26:14 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE278C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 10:26:12 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B0D4C51AA;
 Thu, 16 Dec 2021 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639650371; bh=k4oCTzHWO9aKpQER+AWnzrWa1pS3dqzrimzCRTKqKA4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ci5pFXrGckK7/Io71ECfYXFPgXXFIe4YsyKE0kUtmLrHvyiVX0ntS+5bvEFlR7cFk
 XvLNzdArBC6zxpaeZvYeoeFPdQFlgnyRPqLhF4YJBFgipkIlAlaOEY60+8VKo7dGWZ
 o8EIYGATrk46THUeqcTCRLJ4GAlPMmRZtJ4UkZ4Jf4n0usHicChjSSGHA5L+kQuGon
 NuYfH/8tuIrmcfL52uXfuZagCZEOfj+kBS2JC66+a/2FMEfgfFEtXAcjgvm0mIcjaw
 kmj+TmXezOfGMD3U2UYtp4Yz/HZPsaidpimQxb9tbueNKvQuDCNzkptsNrdJ8vlH5a
 lMH5GKsC8EYxQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D993EA0071;
 Thu, 16 Dec 2021 10:26:10 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EE936400F9;
 Thu, 16 Dec 2021 10:26:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VQI3QmHS";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9qspZ6jE3V+zmLfogtn8PqaTjjN5Rv7+RCtChAcMLwZTMfrMWeq/ow7Cnp7OV7smMrC2+rFzbTydYHCFo5p8M2cPjsZxn/Q0zhMTi3fr1EXMSciIVDP8/yZVwyKc+2pnOxchspNiF+A7tv+4P1EjGxGgg0kOcHMITC/KVzOfSekqqV8NVBB/1deePM5ZzYqGTyCrirXFNFKodfyDgzswU3/b2YBy0Ds05wwoBK5a9oyRU1dKQ5IMeyivO3Yy3fs0XXdwaP6JkX1xy0o5yn084wnbSGDew2xQAmPb7j49FT+4Lw6Dh6TSXF8Zr1d2fXpsEnvg8Tt+CKu6BCNIGkUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4oCTzHWO9aKpQER+AWnzrWa1pS3dqzrimzCRTKqKA4=;
 b=K2rHrYwc20k60SkvHrp7brLOs4E7fSk3SIfQfUiA9wZrsTLX8GcpbZfvHdDlXmbTOQlPur8iYHTlOm7xtRCdkRjXK7AHwGbHww8NPi6NBZyqiyhIUDRE7v5Cp18ZnBN9ed2gsu0P+eUX11z1Tx7VxM/hOr4RdrXV/G1kBInVzsywtFKCOkksuNRIcvfk3NXiviWzr2v9anNGx7s/fciD10kWb8jN7X/rWtZz431moFRyeegSnenc1W9XZPCnD4PdpWFyAIL4ZT6amXD+y+HuZUqjCDa6BRX2suV2Xw6YLpcnQlk8GKhG9wc780A3wUruHif1Afpo2COP73UFJ4Gp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4oCTzHWO9aKpQER+AWnzrWa1pS3dqzrimzCRTKqKA4=;
 b=VQI3QmHS6pfJax+w/0nYO2qvTXWz1uINhZ8s4u5DRWxauGmNc4qMdil+NK3XeH2bGapbLLLaD5Xdm8kDvRVWqQA4CLyg57EHcUcUMJeZdArnEfGy7FkwEMPAaA3tMbjv1X5LyqFHzRY899pmFL0/Ky7uAAES0J0sb2/n4k/+MZU=
Received: from BYAPR12MB3413.namprd12.prod.outlook.com (2603:10b6:a03:ab::15)
 by BYAPR12MB4631.namprd12.prod.outlook.com (2603:10b6:a03:10d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Thu, 16 Dec
 2021 10:26:07 +0000
Received: from BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1]) by BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 10:26:07 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 2/3] usb: dwc2: drd: add role-switch-default-node support
Thread-Index: AQHX6roizsl48NT+yEWqxj+wXd7aeKw0+TYA
Date: Thu, 16 Dec 2021 10:26:06 +0000
Message-ID: <e55c014f-3858-5400-1664-c6087cc9e6c7@synopsys.com>
References: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1638806203-6624-3-git-send-email-fabrice.gasnier@foss.st.com>
In-Reply-To: <1638806203-6624-3-git-send-email-fabrice.gasnier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 170fa192-2da6-417b-f536-08d9c07e78a4
x-ms-traffictypediagnostic: BYAPR12MB4631:EE_
x-microsoft-antispam-prvs: <BYAPR12MB46312F53B2133AF441C1F2D5A7779@BYAPR12MB4631.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGEicVU1WMhJ8xSGpwr3ks0iF9LbMiuE2RWjRlntGxqpZl+ITciGE3V7UTO0dhrCy9UezdKgIGnTVftpELuiwWv+B5jgA/ilDrNrGkVwitHSi/jud/qhy/TLVxHBV2chVdUjMFNpzNnt1fvVNMWy+4AnxuSkQfxXgA7Ir817VwYul/g8dY4eUlHsdbraw/Bo8xSxQhIu58H2qoTkgLIvEewDNapKRvMmRmIRSuGVtLLnzGnYLxxMGyqtwXFNHAUEBVuPtlino09H3oNoKxkM721gObXCnjQM/4W3tfugfPl/VJco8dk3Tju7lFBJV6GGcjvXc/R5R7j0mWm6ogsY1lT+mGOVgcM8JNo634eYszpG/MSdGTqMi49AwiOvLUt0Yyok0A6ieikcEWoYTFBbhLcQQIMS2WLrqqIKok0QJfYiWRCFGZOJaKgSkvyDNijR1qpOdeNjSos29jTY/nNUVObxUyaFjX4GSwRBoxasOOnqf5hkxnz7wCoJl1F396YzE3jd9aNHlIlWVtEbtAI9XCxbKDZ3kEn3ie03J8UF3J9isySiTrk42HNenhbRKZFQERqXvpqatyuAc4EmtCrABOiBNeg96eDKlr6qnKE9+UtK+AOTWgnQ9d7i3n0NsANl6QVoZL9bf+xGSHLrRjgmxQptfgRIBbZUIfpcG1Y9gNsbJv6/M5nmmh1dMr2EA3hxu7S4Wi27pGMXzEZdTuCQOOgBA161aGW8yqDyiqPQBSJ/880zyXnUm3hJZi1Ry2lE/3HGuj6Sd3p5eTEYvN+y8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(8936002)(122000001)(38070700005)(38100700002)(91956017)(83380400001)(71200400001)(186003)(26005)(2906002)(76116006)(6486002)(8676002)(508600001)(36756003)(31686004)(31696002)(6512007)(4326008)(2616005)(66946007)(54906003)(66556008)(64756008)(6506007)(53546011)(110136005)(5660300002)(66446008)(86362001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ylc2OGlxdGszUGNZVGJFeFdValBuTmV5bXBwNktsdmt6ZytUOGpjVDl4YnFD?=
 =?utf-8?B?ZmdQcGxlb0JzdlZoMm91c3NXYU1tbGZFaVBOcnZXVEE5WnA5bXNyMGNDejB3?=
 =?utf-8?B?MmZDREhYTDJBemh0dEZGM1Q5akp0SVNlOHRPV05wMzNFTWJ6Y2YwSDNTWmpz?=
 =?utf-8?B?Mk56cEhKU3BNV0xwY3VZeHZoR2kwM1hVUlVOUEpzOHlrZ29LRkR6UkxnMjNR?=
 =?utf-8?B?R1JKM3NremMvSGhuNmp5T2tmUExnSkhaRmprOHhGTlUzNlRVWUd6Nkwxc3Ns?=
 =?utf-8?B?WWZCMFM0Y0xvUkhFMGRhRGpEL1JVcUpSMGxuSGRNcXRwSFFSM1l1MDRhZHkz?=
 =?utf-8?B?ais4dXdqdmZxdTVIN2pmNWF6SEV6WnVnZzgwR1BjSmI4WSs4NDd0RkJNZ0g2?=
 =?utf-8?B?MnNyeGFYUVduTkhrVGxDWGZLSlZEZENWdVE5akRNWTdGSktLUFBXNUdWaEJp?=
 =?utf-8?B?NDNRcmRpKzhyQkZWOWVGT01ZY1B1aTI5NktROXM2djUvREFIL0NCZTdNMER5?=
 =?utf-8?B?amdEczBpWktIYTdOc2VaWTdiMUpJY1ZneThOT3FEaHNlUTN2N1FobWk1RUFD?=
 =?utf-8?B?dndHV1BTNEoxTDMzV2llVWV2MzFIbkxMdUNKNFRsRm5XQ08vMVBsQzg4dExN?=
 =?utf-8?B?WC9FbE1OaWZvQVB5VW40Q3VWK3BsQktGZDI3cjdsZXhuZXhucjhDM2lwT3hY?=
 =?utf-8?B?ZXZFYnNwK2xJV0tJcXVFWlN6N2N2ZW16UXFmUXZ2dVUwL0RSaDFjRVlJMjRP?=
 =?utf-8?B?cmM5dVB2TTNsYWFsTWpZVHZUYVRkVkJxWDZpbkhrQkg2VXNQSlZaUGFLajNa?=
 =?utf-8?B?cmFvd0x6TW1JYlFGdHJ4cUI3MXRpS09FZ3dBN2FBK1h6ZXVEL3QveUpNMito?=
 =?utf-8?B?ZjhTdTVvUVRLOUVMTVN0S3A4dnAyNWJZcWJKSFc4TTQrWXN5d2tRakIvQ3dZ?=
 =?utf-8?B?SW4wKzBzV3VrTkNMSGY1RWNJblRoa1J0MGNtbFM0TWJVOG9vTG84a1dCL1FF?=
 =?utf-8?B?YWZlU25KaEYvYm9sbU9zV1V2bkxxUW9ySWszaFo5cTlTaVR3b3VETUNTc2ZF?=
 =?utf-8?B?MmUxOENISHBELytzeWFpdVBiVWdLaTBtbVlPSXg5QlNmKzlxRHhsaVdiaXUy?=
 =?utf-8?B?djJzblU2STU5QkJUREQzREVuYkc2WWl2dWpVY1V0WnZmbE45K1FlTDkzUmNT?=
 =?utf-8?B?Z0gwb3hSamdLTnA2MmZGbzFIUkVVZUFuL045SS9IdW9KUE9ndktUaE9DV0da?=
 =?utf-8?B?QVkvQ0NDMFdvWUpUaDN6VGxmMkxFM3JuaTZNYi83QTRsSUVESmhqc3hmUWJ3?=
 =?utf-8?B?akw0NkhmakFJbGl5RlluZmpVOXlYN3FuL3lSQTJPc29vbE9ucU1tSFRrVnFX?=
 =?utf-8?B?SWtGMllVNkkzUzN5dVZpT1h1RnFTejM4Tld6YmtWSWRwSVVSVStrMGhPdWlK?=
 =?utf-8?B?eGZMV1dnQUNIWU1jc2tlU1c1Z1dxbkpxNHd4cldINWtJNmllQmVTbkxZU2FB?=
 =?utf-8?B?Z2VZL2VYUVB3Z3ZvR1FUNW53WStNS0VXamxOck1vMFkyZzJmSkFrYzhpdHJL?=
 =?utf-8?B?UXZicE95YVZYMnlxV01TK3BDOUlibC9CODIzREJZRkdQWUZDUjZiVGFCQ3pp?=
 =?utf-8?B?VHZYQlVmV0h4Y2dqSzBGT2xxbGNPTlJVZEdoaUNoNkx5VmlwbnRyMDNsSkVu?=
 =?utf-8?B?cEZFTTlEK1B1VXBsNkhoUjhZOWpQcU9jZ3RsYU15VTQvU0VIeUlkMHp6Skg5?=
 =?utf-8?B?NndCSmdkbldPTTN3TG5FK0d6ejYrZzUwZ3BEL0hlM1FERVJpRVVLdWJyR1E3?=
 =?utf-8?B?R1hoc0VmWnJJelZlNHlZZis1aUpPdEFpNzgvdmdvdXQ0L2c0QjBDZEY3VHZr?=
 =?utf-8?B?dEpKNnlxdHRBQjREQVl1UUt4c0MxOVlXc3Y3aWF1MG8yK2NubmJlKzdET3c4?=
 =?utf-8?B?aytGWVBzS3ZIS25UbWlIY3NUWDE3dE5leE5FUFV0Tm5sU0t0Y1FGSFl0a0Fa?=
 =?utf-8?B?bmFtS1FvSklHVklBcE5VSVJ6QW9rWFdLZEJKanhPUkpzUmRhNjBDTnltQ0da?=
 =?utf-8?B?R3J6V1dOUlJwYjZGUkVyUmh4N0tkcEpTTGtNM3BnYjVGNVp4MUZ6STZDUkp0?=
 =?utf-8?B?RUVPaDlSRU1uMk9NWVphT3BOQzVhY1UrQ3hKNnl6WE9xZGNSWTA5bEVyUThT?=
 =?utf-8?B?cVE9PQ==?=
Content-ID: <7A46968EC1F638489E3D9EDD7E39B723@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170fa192-2da6-417b-f536-08d9c07e78a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:26:06.8843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AaOdJbQnbXj00foMkhLzJ117d3MxdcislN4sdCAtU7zef7a+V5579MEc45spXUNtezte+k+R12bKQAN+fp/wOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4631
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 2/3] usb: dwc2: drd: add
	role-switch-default-node support
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

On 12/6/2021 7:56 PM, Fabrice Gasnier wrote:
> When using usb-role-switch, while the usb role is not yet define
> (USB_ROLE_NONE), the user may want to configure the default mode to host
> or device.
> Use role-switch-default-mode for that purpose.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> ---
>   drivers/usb/dwc2/core.h |  3 +++
>   drivers/usb/dwc2/drd.c  | 13 +++++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 37185eb..e2fe642 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -869,6 +869,8 @@ struct dwc2_hregs_backup {
>    *                      - USB_DR_MODE_HOST
>    *                      - USB_DR_MODE_OTG
>    * @role_sw:		usb_role_switch handle
> + * @role_sw_default_mode: default operation mode of controller while usb role
> + *			is USB_ROLE_NONE
>    * @hcd_enabled:	Host mode sub-driver initialization indicator.
>    * @gadget_enabled:	Peripheral mode sub-driver initialization indicator.
>    * @ll_hw_enabled:	Status of low-level hardware resources.
> @@ -1065,6 +1067,7 @@ struct dwc2_hsotg {
>   	enum usb_otg_state op_state;
>   	enum usb_dr_mode dr_mode;
>   	struct usb_role_switch *role_sw;
> +	enum usb_dr_mode role_sw_default_mode;
>   	unsigned int hcd_enabled:1;
>   	unsigned int gadget_enabled:1;
>   	unsigned int ll_hw_enabled:1;
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index aa6eb76..4f453ec 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -24,6 +24,10 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
>   	gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN;
>   	gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
>   	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
> +	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
> +		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> +	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
> +		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
>   	dwc2_writel(hsotg, gotgctl, GOTGCTL);
>   
>   	spin_unlock_irqrestore(&hsotg->lock, flags);
> @@ -105,6 +109,14 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   
>   	spin_lock_irqsave(&hsotg->lock, flags);
>   
> +	if (role == USB_ROLE_NONE) {
> +		/* default operation mode when usb role is USB_ROLE_NONE */
> +		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
> +			role = USB_ROLE_HOST;
> +		else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
> +			role = USB_ROLE_DEVICE;
> +	}
> +
>   	if (role == USB_ROLE_HOST) {
>   		already = dwc2_ovr_avalid(hsotg, true);
>   	} else if (role == USB_ROLE_DEVICE) {
> @@ -146,6 +158,7 @@ int dwc2_drd_init(struct dwc2_hsotg *hsotg)
>   	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
>   		return 0;
>   
> +	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
>   	role_sw_desc.driver_data = hsotg;
>   	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
>   	role_sw_desc.set = dwc2_drd_role_sw_set;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
