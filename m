Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E0476EDA
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 11:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DA38C5EC76;
	Thu, 16 Dec 2021 10:26:40 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C94FC5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 10:26:39 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17AE547772;
 Thu, 16 Dec 2021 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639650398; bh=TEolMqXeSATtD2baMNpTuvBqCPKTAbWzg/S9F3KFyc8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=P2pweiISLce+aMuPT2LiSq5h2eAl5hjeN43fCfiQp0a/7XAUeugO7LwviIo/aVJpf
 jJeu3djWJiAiGHd/lGsSJO62J9tVguhnKW6B8JCoHyIdcB7dGEP3UpE0GaGU+IRBHW
 wmtuCUnKV5UIgjE0SWK9SqVPLZ7rQ6Dhg4NBWoEficWyVZ09E/HKBUyIrrTxaUT61V
 DXiM15rN2qPUoEjoLs92wGvISFp29UQY3UM2qgENHa3054Ao3y/N8YNmD2o5IjrWU0
 iydeXCoA/zeEy+XJ0WzgBb+PS7lOliA3JgFs8GkL+MsUVDPNRCweNsRoWT+8RA9fjs
 GgRk98M4jFjiQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 03AA8A0080;
 Thu, 16 Dec 2021 10:26:36 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 670F5801D6;
 Thu, 16 Dec 2021 10:26:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="TiKjM/GR";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSoCE8Z5+Ub0RnDKYIgBhV9Fdic56hDZSV0npYEdKtBWLqc5GrkLAA0YDhCdnnaarCxS3BY57dXnjrKYUAhdpSTuROFjZ1IPiHc1eotdMZ5Lji0VdMgAoItPHeD8h3zy7YbQw3qkZzqpUjnTnFVoxIaWIqlfkXt9AIxsx4/XmbR9JPvIaNUJEcE747w5H2B0u/+6lKbCxIMPBCV3MTOjBjlXE21K5TEoeWa+JPdw0tpwtH6z49pW+HXmaK/KVr6IGHwI4C99kzFghL3BZ8kBg/hFwyIyEoR2cFwNm2jRxLZ1ZBhc+cPR6LMj8e2DOxsTprjmPoRWpoEOfrUr5IqZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEolMqXeSATtD2baMNpTuvBqCPKTAbWzg/S9F3KFyc8=;
 b=gdmh3FOWogUeMAKKCHIU0yI97kowQlheVljrXVYZa3gIMSMosB2PYLxWc4pU4cRp8/EGypCBiB/UCEw3xZGNtEefaPmh+P3yT+ACIqt/tKu6qt7fiZUFfzuBZlZLvTl8UuRV24IRyYXTAis6rysrfrQ9L0GJqAKAw/iYSU1vDuQkmgW/nc/S4a4s4xUPkYZ/v0nETYlO5Kb8sVZ/qNyzdE1ppVsiTvx6AWJ7M38f9NOdr2TGCaHIpY0I5Gd+sPBJ0mPNLseeLNcXsBGng8r4wdfB3j0byrxw/Lo8T6KfJvEGx6Fp9uBdNppepEFxNi5eHO/rWZpeKyCBvHgWMevsow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEolMqXeSATtD2baMNpTuvBqCPKTAbWzg/S9F3KFyc8=;
 b=TiKjM/GRGFaQ1/Y9oBTjUzNiDp90qi3ZfycdXR5bSk5/+AWB5QiX3hPNwLWaXvH7Pb/oW/cRi+waysPLQhyuFicsT6gu7IHusU/QLEN+MvsTSJaWkOHmfxNnjesvOl5Sh4emi7acL0YN1gMicFVz8FiB85dC+02WeoAN9GPTzMU=
Received: from BYAPR12MB3413.namprd12.prod.outlook.com (2603:10b6:a03:ab::15)
 by BYAPR12MB3126.namprd12.prod.outlook.com (2603:10b6:a03:df::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Thu, 16 Dec
 2021 10:26:34 +0000
Received: from BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1]) by BYAPR12MB3413.namprd12.prod.outlook.com
 ([fe80::51c0:c3a7:fb8a:11e1%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 10:26:34 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH 3/3] usb: dwc2: drd: restore role and overrides upon
 resume
Thread-Index: AQHX6roiG1adQQu2GEqyh8VLpxLQkaw0+VgA
Date: Thu, 16 Dec 2021 10:26:34 +0000
Message-ID: <6f7adaf0-4894-4e7b-6c2b-757e25a1f39b@synopsys.com>
References: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1638806203-6624-4-git-send-email-fabrice.gasnier@foss.st.com>
In-Reply-To: <1638806203-6624-4-git-send-email-fabrice.gasnier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 036cdcbd-1eda-4576-6e52-08d9c07e8912
x-ms-traffictypediagnostic: BYAPR12MB3126:EE_
x-microsoft-antispam-prvs: <BYAPR12MB31260BA6D0D87E9C028B1996A7779@BYAPR12MB3126.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pdiEcP/rKQ3KTDcf28lFmI3+/8Z+s1OY1RHu9gFPO0wzBq9xizazEHza5UmC5HF/U38Zmy++r7Zzv7DjtcJANOvMj8D1tH7opzjWzUXNq8m+/0LqY29WrmqNEbfAcwram3D/2RmAyBCQOF4cqZjQaiBgN+V3XLESNBa2rBfo7Xs/mckrhZFUAI86//MPrHjmKKpn4u6Bza4T9W/qRnI3glEKkOXRoIGBxwPOxbjI0nR8tuVRNnZiV8gg8V+SffiSNs41pvATCxKnCyB+ykAcX21AioX2BxhaP0Xq6NGv/12eYP0pvdRF7Q1enaAuKVVc37chKqf7lDY8v1yWDmftWfKqLYzHJrDSvXMa88fMWnskIFRS9DtS4G4GL7pJpA4peppxvmZ9hLQ6jMvk5Dp0FiXCo8+N+UTtd4fPOJe8oUbrpFwoJWix3mVFP4GOF/EFV3LHfxN7hVWiMrgTKy6eHC65R2NCBSDPyM1uN3l5h/nTwrCzPuuJdBI2+E4lOofi6YLckHfhgUAjWgylRxL3ODr4ilnGCj4XuUvu2JK8o06YRSSK1qgKkYj162Fxn5z2sKwsxx19HF4X6BJVhLdfMXORauyePEFnkSIxLasE7YaL0VDBqlJHASENr6JUY2o7jKBvJ7bzGsQR6ipSKfUM+blrPhmjQai0DJuDwoFC6Si/llg++xfaDLTm8BMXWxaceE2dk+OyJgotcOJ8+fjOb5lzwGW08pZ5jNp2bqJ02S4C3Y1xdpE1WygP6aUtqjHT/WTEllBRQIcvvNC5L+e6Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(6512007)(86362001)(66446008)(64756008)(66556008)(38070700005)(508600001)(83380400001)(6506007)(71200400001)(31696002)(91956017)(2906002)(4326008)(186003)(2616005)(66946007)(31686004)(66476007)(53546011)(5660300002)(8936002)(6486002)(8676002)(110136005)(26005)(122000001)(54906003)(38100700002)(316002)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXFuQ0tEZS8wWEhCOXNpT3ZwUmd1ejllQUt2ejVQRGpzMU1TK1o5dTFpRThC?=
 =?utf-8?B?aUo3TWkzdVdaVnZqOGhyNzZsclY5WnRMZi83NnY1Qld5b3NtRkkveW9HWU9w?=
 =?utf-8?B?SHBhTkkybEFpS2tQaHVRV0dZV1RLVWhxbnlkZXhoYnpRNmgzMHU1djZTendv?=
 =?utf-8?B?NEhWUURlNmNteGxUY2liM2o2RUdDS1BJbkd0WjVZZmhBSnpSeVBXd0ZtVzVL?=
 =?utf-8?B?TFloeStpQVZ3bXB0QlBiWWhnNXNsUnF1M3JnWFUyRUh5MGZ0bVhQUy9Ddmph?=
 =?utf-8?B?NVUveE1HbmFLeTZsbEp1bFhvRGc3T2l5MTkvNHVDdDMxT2VQZUhqeWljR3Bu?=
 =?utf-8?B?ZkVtWHdQSnl4OENkYi9YU3cvY2hsWDduV1RVTkpxenFuK2ZKOUZabUdRYjVE?=
 =?utf-8?B?MXJJeU1GSGcrRkVyRFBzVnF4c3pnaWdZbXpybFNoUjF5QzlyN09LcFpMd3Nu?=
 =?utf-8?B?STF1a09wM2RlTjFrWnZWN016ZlpNZ1VzY09YQXRBRGhLNHpxaHF6SEVUWHdk?=
 =?utf-8?B?Q0lzU1RlRnNZR1VvOXorVzBQd2VPc1RxazFDc0tMamJoVlFnSlI5OU1HUVZm?=
 =?utf-8?B?TmgxY250V1l3NWhTUkNsT1VNZ1BsWGRJait3YUNibnZiN083U2dUZlg1NVNv?=
 =?utf-8?B?dkJzaXR0SmdJRHJ1TTRlT25ZOFUyblF4d2Q0QXp5S1p1OEcvd1c4ZnNHVU9p?=
 =?utf-8?B?c2V2NTZkN2FJMmZ5ZFZHenV1ektJZzVkVWJVbHVzZFpWeXlKZ2tuYjVoYnZw?=
 =?utf-8?B?d3ovbGxPUTFPWmZ4dEZ0ZXQ5bnZTQ2JvWXR0R3pwU21EdzRVTHBGQkNqekxO?=
 =?utf-8?B?S2FISFA1VmNlUk4zZVQ4OEtLQm5SNm9CR3lBdVFJRUtsTXpiRUxuRlFPNTA0?=
 =?utf-8?B?SmFwNUd4eGdHYWNxSkV6N1dMYzVDUFIwQUZIQ0pQLzlFOVlQb05jd2laZ1Br?=
 =?utf-8?B?ZHBXZFFIMzJ4Z0V4Vm55WUVxclVyTEVvWGs1R3JxN0h4NkRLWnIycU4zNkNR?=
 =?utf-8?B?Q1FNampNcWlSaFl4a1BhZEVPckcxU3VQYndIVWZMRzJvUW0yVGJKRkh4YUtZ?=
 =?utf-8?B?NVRqSlBxTElkdzFZVzltN1VCQU5GYkhhTDJRMWZ3OEF5U0pTendpa25SSHFm?=
 =?utf-8?B?YWNuM0IvVzltMnU0VGV6Z0dVcGJrcDNBSmNEeEM4aUp5R3VTaVlFSHBWVnZr?=
 =?utf-8?B?VFBSTmZxbHJKZVVLUFY4UkF5WjRuaytqb3Y5LzVFWG9QSWhPbnRULyt3dFpt?=
 =?utf-8?B?RUV1TU5lNVRDY0RsNlkxc01TK2IrMlRoMnVoV3dsN1AvOXhwZkZsZjdHSXJ4?=
 =?utf-8?B?UGVwUUFYaFB1VTVpQ2Z2dVJVUDQ2Y1BXV2cyRG1tYzk0Nk5NRmVaMDZwYmJh?=
 =?utf-8?B?WERqbUc1MU1CZ1V4YktTZlg3QmNidmV2NkNvcmlrOXJObWlZdXFxaW52NDR4?=
 =?utf-8?B?SWdjUjhmdnE1MnAxYnRqSkMrZFAzYnpGRGZHN0JETEljazhEMk5UcklUVVdO?=
 =?utf-8?B?SDFEd2NTTUVUQm83Q1d4Z3RzOGRzRFlST3F5OHRmbU1ISXhpVkhLZ2dSRXdl?=
 =?utf-8?B?V0ZtU0hCeTU2d2FPTi9rV0dmTCs1aVF3WHJ0emlRRUFER0ZmUDNmVFluelFy?=
 =?utf-8?B?SkV0WTR6UzNEMCtSckN4KzZrdENsQ0FlaVFXVVdhUFFUN1NWTnNONlhxcUl5?=
 =?utf-8?B?QUJCQnRaR25xZ3NpT3FIZDFISm1OTVJ1NHlGejRGZHViZXlYWVh6eTE5SE5N?=
 =?utf-8?B?WlVST3RuZ1djU2FCR0t4WElXbWFVUTZaa25NRFRDclFNWmpKVE5SVXZkVlIy?=
 =?utf-8?B?ODdoL3pMN0Y5cWgyMGpPSHZsc2NUSTdiVitrMzVSNXVvSHdVRVJiSzdaTG9s?=
 =?utf-8?B?MDRqazA3a21uLy92dVl6UDJTM05tSTcyeGVrNGxXSXQ0eGNJME9EWkNNWXVW?=
 =?utf-8?B?UGtoTmZxVTVTcGl6WEsxWmVWWS8vTVRUYzk2cVcxS1paWDJKNnAwQ1kvcHZn?=
 =?utf-8?B?WUVGaTFlRnNYK1JVV2xXNnk0dmFTZmFPemZrRmJlTWN3RUNWUDkzTHkvV1o3?=
 =?utf-8?B?Vm5RVTQrSTJPcW9zMmFqeU5QQU5TeUNzQTJKVVpFTHRUYUxIWnQyREc0ZlFI?=
 =?utf-8?B?N2RhRkwzY3UwVDQyenJ5M1dnWVdEVVpYeFFjVmpTSDBnTTZ0RG9NN093bjJo?=
 =?utf-8?B?bHc9PQ==?=
Content-ID: <91B6FD40BB2CBC4CBAFFB8B3C0148934@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036cdcbd-1eda-4576-6e52-08d9c07e8912
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 10:26:34.4766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3H/C9OhcADBNEiOLIUMZfhITry7+GTxiFnZspNx8wBGDqIw6UB+T4s9ffs/hfsLl0aWMyUOyErBk3MkBQFKrsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3126
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] usb: dwc2: drd: restore role and
 overrides upon resume
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
> Override enable bits may not be restored when going to low power mode
> (e.g. when in DWC2_POWER_DOWN_PARAM_NONE).
> These bits are set when probing/initializing drd (role switch). Restore
> them upon resume from low power mode (in case these have been lost).
> 
> To achieve this, the last known role is restored upon resume. And the
> override enable bits are always set when configuring aval, bval and vbval.
> 
> When resuming, forcing the role should be done only once, or this can cause
> port changes in HOST mode for instance.
> So, only restore FORCEDEVMODE/FORCEHOSTMODE when role_sw is unused
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/drd.c      | 38 ++++++++++++++++++++++++++++++++++++--
>   drivers/usb/dwc2/platform.c | 10 ++++++----
>   2 files changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 4f453ec..1b39c47 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -13,6 +13,10 @@
>   #include <linux/usb/role.h>
>   #include "core.h"
>   
> +#define dwc2_ovr_gotgctl(gotgctl) \
> +	((gotgctl) |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN | \
> +	 GOTGCTL_DBNCE_FLTR_BYPASS)
> +
>   static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
>   {
>   	unsigned long flags;
> @@ -21,8 +25,7 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
>   	spin_lock_irqsave(&hsotg->lock, flags);
>   
>   	gotgctl = dwc2_readl(hsotg, GOTGCTL);
> -	gotgctl |= GOTGCTL_BVALOEN | GOTGCTL_AVALOEN | GOTGCTL_VBVALOEN;
> -	gotgctl |= GOTGCTL_DBNCE_FLTR_BYPASS;
> +	dwc2_ovr_gotgctl(gotgctl);
>   	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
>   	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
>   		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> @@ -44,6 +47,9 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
>   	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
>   		return -EALREADY;
>   
> +	/* Always enable overrides to handle the resume case */
> +	dwc2_ovr_gotgctl(gotgctl);
> +
>   	gotgctl &= ~GOTGCTL_BVALOVAL;
>   	if (valid)
>   		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
> @@ -63,6 +69,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
>   	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
>   		return -EALREADY;
>   
> +	/* Always enable overrides to handle the resume case */
> +	dwc2_ovr_gotgctl(gotgctl);
> +
>   	gotgctl &= ~GOTGCTL_AVALOVAL;
>   	if (valid)
>   		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
> @@ -196,6 +205,31 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
>   void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
>   {
>   	u32 gintsts, gintmsk;
> +	enum usb_role role;
> +
> +	if (hsotg->role_sw) {
> +		/* get last known role (as the get ops isn't implemented by this driver) */
> +		role = usb_role_switch_get_role(hsotg->role_sw);
> +
> +		if (role == USB_ROLE_NONE) {
> +			if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
> +				role = USB_ROLE_HOST;
> +			else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
> +				role = USB_ROLE_DEVICE;
> +		}
> +
> +		/* restore last role that may have been lost */
> +		if (role == USB_ROLE_HOST)
> +			dwc2_ovr_avalid(hsotg, true);
> +		else if (role == USB_ROLE_DEVICE)
> +			dwc2_ovr_bvalid(hsotg, true);
> +
> +		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
> +
> +		dev_dbg(hsotg->dev, "resuming %s-session valid\n",
> +			role == USB_ROLE_NONE ? "No" :
> +			role == USB_ROLE_HOST ? "A" : "B");
> +	}
>   
>   	if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
>   		gintsts = dwc2_readl(hsotg, GINTSTS);
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index c8f18f3..e6a7fc0 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -748,10 +748,12 @@ static int __maybe_unused dwc2_resume(struct device *dev)
>   		spin_unlock_irqrestore(&dwc2->lock, flags);
>   	}
>   
> -	/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
> -	dwc2_force_dr_mode(dwc2);
> -
> -	dwc2_drd_resume(dwc2);
> +	if (!dwc2->role_sw) {
> +		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
> +		dwc2_force_dr_mode(dwc2);
> +	} else {
> +		dwc2_drd_resume(dwc2);
> +	}
>   
>   	if (dwc2_is_device_mode(dwc2))
>   		ret = dwc2_hsotg_resume(dwc2);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
