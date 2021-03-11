Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7EA336D80
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 09:08:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A491C5718D;
	Thu, 11 Mar 2021 08:08:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8083C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 08:08:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B82wba019609; Thu, 11 Mar 2021 09:08:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vX73Ecqq3xqTDqBzbnzkrsI/nLoEtMe0TLwJlBCaHCE=;
 b=R5Kdeo9VX/jKoDTgWpwS/id3C2mCV1iFL/M0Dwn3SEQiTuRLuJWFtfBSsdMCUtajiAkM
 Fm3WXawyVttnr7YgT/H2lYcHqpBqgQB7eiOrzCboRYkS+sR3qweP5nERfGI2fwAmfYT+
 ELDYH5rrI6AKUQKpP1wOV1sE2r4OEOy7FLOWK/q8YjqiUvTjluIGC+h3R+AT+FDyfecT
 DI5rf6W2DHMZvB3SVD/lfr+U40b8n1J9eCmtYg5QF5dX6nYN09sVFIZy67p5o/T25/nK
 n5KpH73KWz1QBSHc+C9VDt80YuvNxsyq9O+tTJC87x25LXuwNtuqSNw+4tBt0rd/oouR wg== 
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx07-00178001.pphosted.com with ESMTP id 37403758r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 09:08:31 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GB8EySb3gla5YDw0ciJjVAdObMVIiIafObbARmxC0RRLOBfLDm3UtQXVAFW80r7Q2FJUWqG8uYpGjFIGY42hef1MiqH9KmHHq0ei/sGeFdhSnj4IrVATjMXlgQaiEXOsmAofUIGHDhN6/ZrxqYu5XcgCUz4bHPz3o3N2sZGSDPrGZzEMNt7b05H7hhtrAQ9PvgLNwi5eQFakj0jPRVB6UP+TWRlXNua+OFoGDgV9lDqHDMYep3KNX1GB0bEhKBsIpKi/y2pXzIIAbZXTUeYe2ax2ATWDTuB58RsNW5GSFx9a5xRiFe6qZtUyLqj12WxdvyjBl7XlEd70jtKqLR0ujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vX73Ecqq3xqTDqBzbnzkrsI/nLoEtMe0TLwJlBCaHCE=;
 b=Rb0veY5j6rhU2G1BncPuxopc5iQiC2j2+/9dXmuMZv4cerQ78mmhA9Lrgj8mX1qAMY/idOyp63zqsOo1EEFiTGaIAz+tvHsW3clY7/k/u6rmrr4THmQ07EBijyj5gygEJDcgZO6Q3X3o/n/Z70uQqXRpZ1xoctQSpbKC88ULkclAAE9QJJGYh7E1sglzug/kI9XxUUPt7INJISqEq5JDnxZiRXuhi0gXp+mVVqcvTjyqyL9CE9oeOT4/sHOXURLeKgyXtgYQQfa3sz2vQ2/eQ1//MwBeAvatosYMSMhzOaaVZ4+16Gu+KTj1/+TsnhaTaw40PKmbLTRI+ZgA4SQHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:31d::16)
 by AM7PR10MB3842.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 08:08:29 +0000
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac]) by AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac%4]) with mapi id 15.20.3912.031; Thu, 11 Mar 2021
 08:08:29 +0000
From: Alexandre TORGUE <alexandre.torgue@st.com>
To: Alex G. <mr.nuke.me@gmail.com>, Gabriel FERNANDEZ - foss
 <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne CARRIERE <etienne.carriere@st.com>,
 "marex@denx.de" <marex@denx.de>, Marek Vasut <marex@denx.de>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH v2 00/14] Introduce STM32MP1 RCC in secured mode
Thread-Index: AQHW88JA4Ryvoibg3Ei/AnpMx/3VHap8dNwAgAI7PnA=
Date: Thu, 11 Mar 2021 08:08:29 +0000
Message-ID: <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
In-Reply-To: <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 852391ea-a0db-421b-a42c-08d8e464db34
x-ms-traffictypediagnostic: AM7PR10MB3842:
x-ld-processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR10MB384250A29FF6CAEC4B90F802EE909@AM7PR10MB3842.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VBTawvUFe08OaLyN531HPSCiL9ATP6YtvG3fC9m4UT2rZiRw8n5TznyCvcRYCg30ShG40Nqear52It8FAAHYgpEeKUqdFcjnjT1eBPYIev7vevrumRJvWVyKz8dHVJPlIlxgCVgKcESgV0yM5uSk2Ba6sT8YHB7eTr/urerfVHKdOQkYIRWrwTm6rDGDiXuMFSzJzCRj83RJGNViwhggJegwAkZ6y4uC6MYRK8WGVikDREPVFZYu5odJHg7+iHHHK8U1U+dILTzUdFnpl93Ih4+YppvrAFrLK5BGpUI0rqol5YJCv/DhT0dFMzKMribHtXQb//df7VPXL9642+J4R4RdbTg5B+qJubW844nUAy2ui7gsYQaRmE6BVl7LrnKhTbIE0MCERVkf/HcaZUvxxQQeDSeleaqQjJChsJPkCGrllRPpNGvZ8OIazhVd0/y+w5B4eEuAt8mtlkhxU4Rtsi9dRvUM6fWQEjkQ5PyOjw3bV0HQEUizXIxUDeZ4k5U1vALfn5xGh/hNrJxQNCMP2eza65eNmvtXCtQNkFoCLAU9rc7tCI7L6g1PVFG/WCGdGQd8IrHkH0tOWAxqf9IO+BQpyCVrVTghPbgNTH0Y/54=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(52536014)(8936002)(4326008)(71200400001)(110136005)(76116006)(66476007)(66556008)(64756008)(2906002)(66946007)(66446008)(33656002)(186003)(8676002)(7416002)(54906003)(478600001)(26005)(9686003)(55016002)(316002)(86362001)(55236004)(6506007)(53546011)(921005)(5660300002)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RkhPZ1RvYmhibmdnai9HV0Z1cVBDUmhyT2VrN29ZRmxwMGRGRVc4RURCN25h?=
 =?utf-8?B?YTh6T3cvM2hFTW1vVEFNV0NHcHNPZ1RLZ1MxaHFSNEt6dklXTU5rWld6MDRa?=
 =?utf-8?B?Wk9hb1JnS1BiazhNNytXQ1F2NnI3S21YZS9ZYUlJOWZZSGFOcnhrQnpFNno5?=
 =?utf-8?B?RDNKTUFCQXNYQWhUajdTZ3dyNHZzcmMrV2RxZEYxNjdtRFZkWndMaHlkVmYv?=
 =?utf-8?B?bFRhYjBnU0RCWjFTQi9RdUcvQlVXQUptU2RqbTFCY2xmMHBBZGNDdXNjSHlQ?=
 =?utf-8?B?TzFzOUR4Z1pzZzRGb0ZCUFl4ZGFLdDBBTUpFNFJBMWZQM3djK1BzMlcvYmc5?=
 =?utf-8?B?dkFqWUpqUUV2UXlVbnFjeFppN01kRzJTbWFtcTFPdkNwUW5vMHlGNWx3a1BX?=
 =?utf-8?B?d1NYYlBZdWdVUm5PejlLMjZXRjNRT2hGWkRaYXNFZzJKamd3dENCQkRUeTVJ?=
 =?utf-8?B?d25iSmRKYXZaYnVraVU2djd5eVd3TERQQjQvb1l6VW43Ryt2UGlXaVEyclZL?=
 =?utf-8?B?b3c2RXpjczlUSUtveC93d2FWREdFZ0JKdC9lSm9kcy92blpHMDNLWFdxTVMv?=
 =?utf-8?B?eHk1dzNXMExSbWxBOUdNUDZ4SUVvajdmVW1HVXZsb0ZRNlh4OVQ4NTlDWUhv?=
 =?utf-8?B?OUUwR1lYV05rRXI2dkhVVlBDSjJBN3ZGOTc0NWZqM2tLblVNcVBQbHNtMGpH?=
 =?utf-8?B?clJFWFlXaC9EY211bnVCcmtsUkRFb0txWitHdWVOMjN4SkV4UEt2d3IvTnlH?=
 =?utf-8?B?dmRlekdsbmhJOUYyaEErZXk0NWFPOVV4VnZZVXcxU1lLb3EyY3gva256OXZP?=
 =?utf-8?B?L3FjNUtRa2w5OEhmbEwzZ0pIQzRLeUtqTU9TWHNSdUVrUiszT1JQMjJZZm1h?=
 =?utf-8?B?aUxLMDI2MkttY2tIZGFUVEhvK1hmNTU3R1VRUmVXaStKbVJuTWVOMjVOa3FB?=
 =?utf-8?B?VnV2bWVCT05zS0RJeVJKbUhiY2hZTTcvZkFCUTRzb29NelpKTDBydGxDd3dk?=
 =?utf-8?B?cFNPVk5ZZGpSVHpwOG5QQTMwM3BoS3U4WFBLeDAxRzBXZlVMSE1QYmdKOHg1?=
 =?utf-8?B?WlU3ZkcxS1dFcXBWQWc2K0VrNzl3RE9uV2JGblVtMmtudjdPT0JTRVVKck5j?=
 =?utf-8?B?ZitBMFQ2SURtbFhxYkRobERWVUR1YzRrbW5rSkRNK0tjQnM4UjhPZ3FVQWFy?=
 =?utf-8?B?bVFTRHpvTVl0VXpQQUlYaVlRUC95UUxMdHh0VTkrcmtUWWJFRmdDeVZTRWE2?=
 =?utf-8?B?SnZZMk1XR1V1ZlhzbStHN3NMdUVPSlhvTlFyd0xVdUcxNENNNEVROGVTTUFO?=
 =?utf-8?B?eG14TW1EK1J4T0NwaVQxTDNGbktyWDBEWFlrMUNZcEphUEtMcElSWHViZEFD?=
 =?utf-8?B?WEIwSUhqTll4S2F3eUo0TmRUVEsrdEExc1VsQWVWVDljeVEzYjJCNDhuR0lr?=
 =?utf-8?B?dVcwZzBvZ2N2N2U1NWtNVUdDOW9DeWRYby96SFZCVnhrVVVUVVIycitzRDZC?=
 =?utf-8?B?ZkhNREdPKzhDVzJSVXE3YUhKaU9xaGFPTU1TelVVY0l2cjhPU283SkdyM01L?=
 =?utf-8?B?U0FtVSt4WGttWGc5dlRiZTRxT0J6VlZKUjkvS1J2bVhXZGZHcFoxamlKTmo0?=
 =?utf-8?B?a0crOXNRSXhBNFlZY3hFbXZ6bEdidHNtOVFwTXpyM0dpTkp1Q0tJdmZNbXd5?=
 =?utf-8?B?bW9XaVNLMVpaeEs1ZlFIV3hYbEczSUxnV0lxWCtiU084NExKNGh5WDRDWHJr?=
 =?utf-8?Q?LhCDf/FJuPH52BnYefbGAiws+S1+ogbc06EDooM?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 852391ea-a0db-421b-a42c-08d8e464db34
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 08:08:29.7143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAhPUubPL8tmtdJcBp2Qz+VelpFfxtyBq/Syp+c2Y1R4pcOgFz/xeLORtrOT9mEtyqMXpwYk7Y0DVfrfGa+iTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3842
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_02:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110044
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
	secured mode
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

Hi ALex

> -----Original Message-----
> From: Alex G. <mr.nuke.me@gmail.com>
> Sent: mardi 9 mars 2021 22:50
> To: Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>; Michael
> Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Rob Herring <robh+dt@kernel.org>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; Philipp Zabel <p.zabel@pengutronix.de>;
> Etienne CARRIERE <etienne.carriere@st.com>; marex@denx.de; Marek
> Vasut <marex@denx.de>
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-stm32@st-
> md-mailman.stormreply.com
> Subject: Re: [PATCH v2 00/14] Introduce STM32MP1 RCC in secured mode
> 
> On 1/26/21 3:01 AM, gabriel.fernandez@foss.st.com wrote:
> > From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> >
> > Platform STM32MP1 can be used in configuration where some clocks and
> > IP resets can relate as secure resources.
> > These resources are moved from a RCC clock/reset handle to a SCMI
> > clock/reset_domain handle.
> >
> > The RCC clock driver is now dependent of the SCMI driver, then we have
> > to manage now the probe defering.
> >
> > v1 -> v2:
> >    - fix yamllint warnings.
> 
> Hi Gabriel,
> 
> I don't have much clout with the maintainers, but I have to NAK this series
> after finding major breakage.
> 
> The problem with series is that it breaks pretty much every board it touches.
> I have a DK2 here that I'm using for development, which no longer boots with
> this series applied.
> 
> The crux of the matter is that this series assumes all boards will boot with an
> FSBL that implements a very specific SCMI clock tree. This is major ABI
> breakage for anyone not using TF-A as the first stage bootloader. Anyone
> using u-boot SPL is screwed.
> 
> This series imposes a SOC-wide change via the dtsi files. So even boards that
> you don't intend to convert to SCMI will get broken this way.
> Adding a -no-scmi file that isn't used anywhere doesn't help things.

You are right. We mainly take care about NO ST (DH/...) boards, but  not really about current usage
Of our stm32 boards. Several options exist:

1- Break the current ABI: as soon as those patches are merged, stm32mp157c-dk2.dtb will impose to use 
A tf-a for scmi clocks. For people using u-boot spl, the will have to create their own "no-secure" devicetree.

2-As you suggest, create a new "secure" dtb per boards (Not my wish for maintenance perspectives).

3- Keep kernel device tree as they are and applied this secure layer (scmi clocks phandle) thanks to dtbo in
U-boot.

The third could be the less costly.

Thanks 
Alex

> Here's what I suggest:
> 
> Generate new dtb files for those boards that you want to convert. So you
> would get:
>    - stm32mp157c-dk2.dtb # Good old hardware clocks
>    - stm32mp157c-dk2-secure-rcc.dtb # Clocks accessible by scmi.
> 
> A lot of users use a larger build system where they extract the relevant files.
> With the scheme I'm proposing you don't break their builds, and you allow
> SCMI users to have upstream support.
> 
> This means that you'll have to rethink the DTS and DTSI changes to
> accomodate both use cases.
> 
> Thanks,
> Alex
> 
> 
> 
> 
> >
> > Gabriel Fernandez (14):
> >    clk: stm32mp1: merge 'clk-hsi-div' and 'ck_hsi' into one clock
> >    clk: stm32mp1: merge 'ck_hse_rtc' and 'ck_rtc' into one clock
> >    clk: stm32mp1: remove intermediate pll clocks
> >    clk: stm32mp1: convert to module driver
> >    clk: stm32mp1: move RCC reset controller into RCC clock driver
> >    reset: stm32mp1: remove stm32mp1 reset
> >    dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
> >    dt-bindings: reset: add IDs for SCMI reset domains on stm32mp15
> >    dt-bindings: reset: add MCU HOLD BOOT ID for SCMI reset domains on
> >      stm32mp15
> >    clk: stm32mp1: new compatible for secure RCC support
> >    ARM: dts: stm32: define SCMI resources on stm32mp15
> >    ARM: dts: stm32: move clocks/resets to SCMI resources for stm32mp15
> >    dt-bindings: clock: stm32mp1 new compatible for secure rcc
> >    ARM: dts: stm32: introduce basic boot include on stm32mp15x board
> >
> >   .../bindings/clock/st,stm32mp1-rcc.yaml       |   6 +-
> >   arch/arm/boot/dts/stm32mp15-no-scmi.dtsi      | 158 ++++++
> >   arch/arm/boot/dts/stm32mp151.dtsi             | 127 +++--
> >   arch/arm/boot/dts/stm32mp153.dtsi             |   4 +-
> >   arch/arm/boot/dts/stm32mp157.dtsi             |   2 +-
> >   arch/arm/boot/dts/stm32mp15xc.dtsi            |   4 +-
> >   drivers/clk/Kconfig                           |  10 +
> >   drivers/clk/clk-stm32mp1.c                    | 495 +++++++++++++++---
> >   drivers/reset/Kconfig                         |   6 -
> >   drivers/reset/Makefile                        |   1 -
> >   drivers/reset/reset-stm32mp1.c                | 115 ----
> >   include/dt-bindings/clock/stm32mp1-clks.h     |  27 +
> >   include/dt-bindings/reset/stm32mp1-resets.h   |  15 +
> >   13 files changed, 704 insertions(+), 266 deletions(-)
> >   create mode 100644 arch/arm/boot/dts/stm32mp15-no-scmi.dtsi
> >   delete mode 100644 drivers/reset/reset-stm32mp1.c
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
