Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA5AC4879
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 08:36:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82903C36B16;
	Tue, 27 May 2025 06:36:13 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazon11021079.outbound.protection.outlook.com
 [40.107.51.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 039E1C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 06:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lehCx5WDnj2l0/Y40tWj/1QJL492QNVW5mYVVzThXYG+JOmNrTiCWh0tu/JwXhmKGz+SeeMEsG6ayOX6nqpGu+0o6Mbkl1nvQ2gm5+7pbF1kHYfRpBfe3QZgFzS1bxD0MbPGqHC1IRs+pWsw2LFZf7pDDPKzAlDBwA/dAHFmrmyVgmGOg2FDH0Dbgnzcbjcp1hWacBJZhFW7XGfmvnAakTS2tFzbecoNdsYRRqqQGwc4CS9qpvk3nsv6AgtQkE5zUKy/655QfCkgbJ5Pm6ALJJ5gbNgTNSA3JWMws5czfb386J19w2wYYB0vv5Hnm5RZyE8hvW38w4PWFVqFGNawPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dkQ4aDU9QaAq24RGtpzZ3mtQtThWv4tMocT0H28prU=;
 b=eVkfuyJyLV5025ax8vEOUojHJsu2rw369KCwegYIi+Vvex4ksHjfPCNggpRf5Pct0TIm4iEyjJZtYixV24uD8oYQZFYUUuNmYoc0MVQxvX+IQaRRWlTB4+4jwGUNeAPvrjBcUQmJ2jNHgTEgUuzVp3jxIvj7NNLWq5EKxVhJq2sDPEQEw2fLmRracyLlZCfhm/WhrFlO79aFOMxR8vZZE5Yybc/SWe06FoIangUirIHw4Qrk5dI5uiSrazi3CTddP2HfWGHpCqI/O2sYCuYGVsujI9I3ahYdWiT9LojzpJi0ygeOV183gvmpSDCeERFR8q3XJ0rB/dg71+/bp6Mb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB1803.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 06:36:07 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ac6c:f2c2:8013:8d0f%7]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:36:07 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "amelie.delaunay@foss.st.com" <amelie.delaunay@foss.st.com>
Thread-Topic: [PATCH v1 1/2] ARM: dts: stm32: add support of stm32mp157f-dk2
 board
Thread-Index: AQHbzJMjbulgi+Htd0yqItM+OiWvU7PkhgQAgAF9m6A=
Date: Tue, 27 May 2025 06:36:07 +0000
Message-ID: <PN0P287MB201936022C3BF4389C7BF8B79A64A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
 <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
In-Reply-To: <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN2P287MB1803:EE_
x-ms-office365-filtering-correlation-id: cedc6b0c-0c41-40cf-4fc1-08dd9ce8c2f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?Windows-1252?Q?G5tC6A7eB24ISfGzSZrw/I0L/wjpiU2U2RDyqYLtFssQkKOFCgePiITR?=
 =?Windows-1252?Q?0qFxxz0oUuOZ1zcV68i8X9MRVu1I4mugmnJA2/YaZcio8xKscJVJlP7r?=
 =?Windows-1252?Q?8/WNktbRBuQSH9t1nr/W5MA9rbR3lI8ZGEPTXa98N8rAwdA7mWcfMFUW?=
 =?Windows-1252?Q?4kM52slLEfX+JiF7zThRTUot0ciBUnnfI83FdSxMkCKFtShfKipvCm1v?=
 =?Windows-1252?Q?u/RGJV/TihUmS3KgVZMyOBAm/pRlpfdEnOJkEq8JiACY5LfFtiCIrchr?=
 =?Windows-1252?Q?gSPzt5g5I7p74kiYNLPRdNrVJpnQLOMNo5pBFuwrrR4jcU9qDac5h7Tf?=
 =?Windows-1252?Q?fw1eV/ugE54mTnIOnJF+7yvGqJKYCIjyqcw9XLgWsNki1oGfX/YY14u7?=
 =?Windows-1252?Q?e1xkRWQ6faVysg6fyHg3utSkZyBYEcb8YkwqEuB9CNBwUEmZTRktR2na?=
 =?Windows-1252?Q?4OmSt6tP/bG7y4dAC0IJUqSXKW2jsoCk0G8ZS9uqEFv4Tr8E9IdS6VQa?=
 =?Windows-1252?Q?d3rTw9+94FuTd66y4kb14SadXZyliIheMhSqnWnLstQxG+7eVIIp6DNy?=
 =?Windows-1252?Q?qKNqCfuI6sRHYMRGFkzpTGbsTIi1cq5kRCxs8Ru5MxeWqC+MXs96kbmT?=
 =?Windows-1252?Q?4OZhHWfAFn7mYJSN1i00pYmhsJee05mcS4Zlj4QJNrwW6Lpf1fWPjlcF?=
 =?Windows-1252?Q?2YmZ3Ew/Ee9a97roTcem2Ia86x8LuG5lNrh8delHvCEC7JYdpAv9chs/?=
 =?Windows-1252?Q?pKrcEPit3fORAqspsx41IjQdH7ZWxYB1UNgIgxVeKCXg1tJ1ceinzUx8?=
 =?Windows-1252?Q?V82AU3QzmnRoTBmqBbs1Zz67+dI0e1enBRWK9aSX8kK6Hxqc80fp7f29?=
 =?Windows-1252?Q?s4WcDSCWuKPXbPsX5934wp37ILbQAIgCzfy61E/YmWlRWXd98yzotm4p?=
 =?Windows-1252?Q?X75JJz1yIimK5nlnBjdcowedZQ3M7ATaM29RqYWFAQvOhkFFxTqgM1xm?=
 =?Windows-1252?Q?hmn6xb5zTOOYjLZ5msVW6utiFNEIRoh09FtOCvUbvFQuSPX/LYnkcmZU?=
 =?Windows-1252?Q?7gOmhfappp2ok2UiGK+CSLFWhrz/V1mI3htR4Xdzgy+F/j3oyixi8Ej+?=
 =?Windows-1252?Q?LkQeF+cMcjIydQMrrKXkh2RxNaJn1ILacSxIOySuascSWHtr7H5OcWUD?=
 =?Windows-1252?Q?/UiihnA7F0QnbKKuQoCdMRFxskJGrcMCVvErRTKSla4KFVpHWavJVLoz?=
 =?Windows-1252?Q?+s9hztWbmVwIIidnq+gNERVXzBR7w4/gWtdLDXPZHEBnnJUBvZYiwZ3z?=
 =?Windows-1252?Q?8jxoz0Ho1XHkY2UKvu55tbf5kd2lbo2P1OFW4vO9yGEMHgomQP+AuhqK?=
 =?Windows-1252?Q?VRtyDyX7m6Q5Xa9SKLMYQeK82WmBdvaK4GpOp7zX5aYzlV7zg6rs7vEV?=
 =?Windows-1252?Q?fXYcieI8gFQNbJR66r4ltragW9F7POQjYrnHS5fcrjYfcmCUkSMM5bic?=
 =?Windows-1252?Q?+F6a6P2H+nuxo0hKj6LKXdWTTJlFADoscAb4SeJf96lHJpq+y4JgLc6n?=
 =?Windows-1252?Q?ixxvFgaymg0VbHBSCHgNTHM+sYpJIRbFLgFaEmfn9c7q/X4V0YeRXmQ4?=
 =?Windows-1252?Q?Hlc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?p/7DzPGNgNaQACtCP/TJM6CbOB+/5IRGhnHClAOf69/Zx176cdQZn+TP?=
 =?Windows-1252?Q?WklgzT1v2CESAtW6FlsM7kIH5gvkcif7VshefWXlkcHoxaGqaMKy0O1g?=
 =?Windows-1252?Q?UF27H7W3Lc7bKwc5zipAaaukLpsnf3cYnGWoGR4YoeToJvCuG/c/60rS?=
 =?Windows-1252?Q?4aTJ+jdm3cfFhbga1xaNkJ0i2Fl3uPW4Fps83JrA1nWUJOoMxsAXH79c?=
 =?Windows-1252?Q?qLJJDswfSMVMZtT+xHtZ11VRREDqCpXz2Ic+Hcd2lSua7uYMBkafeD5m?=
 =?Windows-1252?Q?NzNREFNiCbQiXxj96XkX5hk5PYcmzXeDOU2sxMlQQP6gQYUrdZJ/AklN?=
 =?Windows-1252?Q?r0/Y8YADRMHUDJEQeXGoDElC+B786/UR6+i7QK4X4NcY1xvM8wZN+y87?=
 =?Windows-1252?Q?wjFTY2k5kEQPnpZ29zkVqX+qGgYT4si4CGpG5GGMFTsVtLkVoRmAVTt8?=
 =?Windows-1252?Q?2tE2QxfBn+jewMcoLq1yP0XW+KCnjC9P4wVcEydhsfnQatE5i2jcTxGb?=
 =?Windows-1252?Q?z5HcaGTZmtOk0TtDIWM2MpnRREaszAtUJFPn/bmeFdaeVvleGlA2moBc?=
 =?Windows-1252?Q?6zQJzFq2U0mU9uNUag3L6fnqER7AbWqjrJhXaMwQZKjsp/YqJt6L0ndh?=
 =?Windows-1252?Q?/lCCUlJo+PeJ/NBt8uQdepWRdX8xYBkFg+XFJgAUC1Hni8qNG21QgIBx?=
 =?Windows-1252?Q?kHycMDwfXMKzzAbq6T66Yf+/1kXd3X7b7eJSoaOnYBGA/gMsVjVIAa2L?=
 =?Windows-1252?Q?sXaJaYatcn9hUBY7HgT501KFsIZi8v/K35INa/MgR7OrDRv67AH1N+Sb?=
 =?Windows-1252?Q?v49E4pjCY9eb7kfjJsyI1/xb9EpSxUHnHRHRDS6iAnzA9nQAEG8g8TcQ?=
 =?Windows-1252?Q?3AIvwYwvC89qRIDM472qL5BWVtjAbpLk9+1j3tDBXXB+nAR78ZAj1wL6?=
 =?Windows-1252?Q?m4Zx+fjYHUW6ztgm6fJUYhKr/li4W+cT4WC5ql/AFl4xIPDAESKSSIes?=
 =?Windows-1252?Q?iA3i6VepJ8Pc446ay2P6TWlfRcGNmsjzIOusNq9ZcYkzRextbACkKzF+?=
 =?Windows-1252?Q?Wj19LexFqrPpNVPTMyiPuPCOFFl0DUT/0MLAcCs8BkPrViKPx8CNY0b4?=
 =?Windows-1252?Q?94OzxcbppB7j7NJPMNb/9IrXVcmUQOxOah3xuduprbNBDo04rZnzoTK5?=
 =?Windows-1252?Q?O2n2TXZudEMIBkePzU/KOEJk2fWEDxs6PVwIoK+YZtftnHms/Q5UIX/F?=
 =?Windows-1252?Q?qvCifyNAsJeUod5UNlz1pdo4flQ9I8dq9st7hPCdx8amp477ARJZ4r9A?=
 =?Windows-1252?Q?Ow8PDPIHBcfAyryy6dy2T+ITiO28+v6T+tqwe8v25D2/cDoiWRVjlmv+?=
 =?Windows-1252?Q?tEbtq6SFdZElz96NAoeHr6LFBQdGYy1cktJ5nwyIC1KM1YwqONg9Qa0P?=
 =?Windows-1252?Q?yvk7TlM1MRyZD7wgMx+6YA1+ag2y6E6yQNmWJwvNGPPmsMaYOFSQvGkN?=
 =?Windows-1252?Q?CWDyJvBDwa01MLTDRRW+2OrcMZjETT/kIKBa4hCvQi1SLk+gzoUA2lL6?=
 =?Windows-1252?Q?vhJw0CxrHBViwmFttTZd1Vk5vPT1bFKSGLAwzCc8SZnGIHmYvO4Nzm/x?=
 =?Windows-1252?Q?+/uprEcUU5wxGgihTtmok670lCgYpsn8cxPvj9q+6IY6Iv5qTuKT5pJ1?=
 =?Windows-1252?Q?p4C6rDQX69J2gQGbNDBLLnGKHSwxhkFcAA6eL8Koft39hlBMnG99og?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cedc6b0c-0c41-40cf-4fc1-08dd9ce8c2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:36:07.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZWdBMn/hkNNTZmeqtzTcmrL32meL8Fc4VdPiypj0yzu3zakeFEIR5ImmZjiPOXxvgpPhSpBrk3qErwnwhPDxAWeee6TWb67Ksz5D/KisUpmaCcOCdFl99cHe7Il0OU9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1803
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Roan van Dijk <roan@protonic.nl>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?Windows-1252?Q?Leonard_G=F6hrs?= <l.goehrs@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ARM: dts: stm32: add support of
 stm32mp157f-dk2 board
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Alexandre,

> Hi Himanshu
> =

> On 5/24/25 12:03, Himanshu Bhavani wrote:
> > STM32MP157F is similar to the STM32MP157C, so reuse the existing
> > stm32mp157c-dk2.dts as a base for the STM32MP157F-DK2 board.
> >
> > Datasheet: https://www.st.com/resource/en/data_brief/stm32mp157f-dk2.pdf
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > ---
> >=A0=A0 arch/arm/boot/dts/st/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 3 ++-
> >=A0=A0 arch/arm/boot/dts/st/stm32mp157f-dk2.dts | 15 +++++++++++++++
> >=A0=A0 2 files changed, 17 insertions(+), 1 deletion(-)
> >=A0=A0 create mode 100644 arch/arm/boot/dts/st/stm32mp157f-dk2.dts
> >
> > diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makef=
ile
> > index 60d55516f723..38179638e5eb 100644
> > --- a/arch/arm/boot/dts/st/Makefile
> > +++ b/arch/arm/boot/dts/st/Makefile
> > @@ -70,7 +70,8 @@ dtb-$(CONFIG_ARCH_STM32) +=3D \
> >=A0=A0=A0=A0=A0=A0 stm32mp157c-lxa-tac-gen2.dtb \
> >=A0=A0=A0=A0=A0=A0 stm32mp157c-odyssey.dtb \
> >=A0=A0=A0=A0=A0=A0 stm32mp157c-osd32mp1-red.dtb \
> > -=A0=A0=A0=A0 stm32mp157c-phycore-stm32mp1-3.dtb
> > +=A0=A0=A0=A0 stm32mp157c-phycore-stm32mp1-3.dtb \
> > +=A0=A0=A0=A0 stm32mp157f-dk2.dtb
> >=A0=A0 dtb-$(CONFIG_ARCH_U8500) +=3D \
> >=A0=A0=A0=A0=A0=A0 ste-snowball.dtb \
> >=A0=A0=A0=A0=A0=A0 ste-hrefprev60-stuib.dtb \
> > diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/d=
ts/st/stm32mp157f-dk2.dts
> > new file mode 100644
> > index 000000000000..ab406b2c44c1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > +/*
> > + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
> > + *
> > + * Author: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "stm32mp157c-dk2.dts"
> =

> In this case what is the aim of this series if you just use stm32mp157C
> devicetree ?

This patch series aims to add support for the STM32MP157F board device =

tree. The primary motivation is to ensure that users working with the =

STM32MP157F variant have a reference DTS available. Currently, no such =

device tree exists, even though the STM32MP157F and STM32MP157C are =

largely similar.

> ST people (mainly Am=E9lie) are preparing a full support of
> STM32MP157F-DK2 leveraging the F variant compare to the C variant.
> Series will be sent this week.

If ST is working on a dedicated DTS for the F variant, it's likely they are=
 starting =

from the C variant as a base, this is exactly the approach I=92ve taken her=
e. At this =

stage, I have not included an SCMI-based version of the board since it hasn=
't =

been tested yet.

Please let me know if you have any further suggestions.


Best Regards,
Himanshu

> Regards
> Alex
> =

> > +
> > +/ {
> > +=A0=A0=A0=A0 model =3D "STMicroelectronics STM32MP157F-DK2 Discovery B=
oard";
> > +=A0=A0=A0=A0 compatible =3D "st,stm32mp157f-dk2", "st,stm32mp157";
> > +};
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
