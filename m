Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1CF324230
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 17:37:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 777E0C57B59;
	Wed, 24 Feb 2021 16:37:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B609FC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 16:37:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OGRDTU021753; Wed, 24 Feb 2021 17:37:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DwLM0KcLcwJC1fZLY+u0SH/xiwU5fXlyvT9JzVAZ6qo=;
 b=oAy3IRcmqTzJ7sDzCBFkz2wfEeL5z8RpInkBtTwG491rIpxWES6tzmK3/T1rdaJM2xir
 yo7eN4ANz8MPGZZHtASPnXeAdq9aZcsQAeHPsDMa/NbuljLS6/RArKLrfij3czIAo/NB
 fMAFWv6pQIA5mO4Pn7UuYKCY7HZEsb5nv6F9bbItIFgSG0Cs9J5RBTpHwdCoEsWuOtcj
 ZEXcb0K2A03fUnAzr28IjqJgs/yCTaErD4YPi4d0YQ1WXr7hqDKrqOFS+xsc8jRzLxu5
 vB59GyGBujX8wW5wJbSrZJFLBHBHMber5bL8G/Qh8skPiW9OROeUxZD2uJ+mpftzoEzz 6Q== 
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cfn81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 17:37:06 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMNrQXn/rkgN4Ef4O7ue739a9A/TgJ1Ea3uKFpRbEf/DWVX8EiUM2fAmMRLAyEMj9W2hFvnSwBpxKxWUsxLsRWELccFIyyPKNwzyZlG204oHzGhnD0aAKV/5++rmMqaHHG6k3HBVXJZC4rdCgy5ZVTDcCFfvTYX2//2cVslyGUPHPq1IAJdugGv2hgYd/Vz8A4V6OdDd7vKJUmGWVCx54msndZ3jikRqbR11QCMQ5FLIa3xTxbW27ynx4HfnP0faWSxIEL5VlMqcdj1hDtTFSKpZ/2iqGRavDaMmog9Wa+VnnVyu7rgF+1SAq/vyu23S4jQazxjy7Fo9Ilr1IIlHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwLM0KcLcwJC1fZLY+u0SH/xiwU5fXlyvT9JzVAZ6qo=;
 b=jyQR3GA2CcNZfx4zxYK4Tt0Yfk0pBJhsQciXi+uhS53ej1GxmhoO6LI/D68PsvF20zgQw4wAtQKcYf+l35TNhYOsQjMp+cJKQyjTIqgqnaPNpzg80HCeW13kRNIFUvf+nNQEWYKUlfqq9gKipKkRizrfCNqgDdjcK8yi0snhzhsv6VAS49+lSjahg8xvr7sV7FEdCM7hX8lXImSQ+hMX5UB7qhXQEkXbK2tbnzwO4NBdArcj7sN9DD70prm4Jvk34JJN9XVWlftFgSQMwLUCCqT9uKMZxvpliKsVYQslyIXDR/fzbTeocrMwZxgOqRJd7h0VZqc9UuCbCFkIlCYoDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:31d::16)
 by AM6PR10MB2053.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:37::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 24 Feb
 2021 16:37:05 +0000
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac]) by AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac%4]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 16:37:05 +0000
From: Alexandre TORGUE <alexandre.torgue@st.com>
To: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt stealing"
Thread-Index: AQHXCreaAXqyCcGD7kqtyIyP4rFM6qpnc189gAANO3A=
Date: Wed, 24 Feb 2021 16:37:04 +0000
Message-ID: <AS8PR10MB4712324DCF8BFD6937F83820EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
References: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
 <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Enabled=True;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SetDate=2021-02-24T15:59:11.903Z;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Name=None
 (Unclassified); MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_ContentBits=0;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Method=Privileged; 
authentication-results: flowbird.group; dkim=none (message not signed)
 header.d=none;flowbird.group; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe78b25f-9645-4d33-dc7b-08d8d8e26b79
x-ms-traffictypediagnostic: AM6PR10MB2053:
x-ld-processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB20538685BFC9C45268BB93F9EE9F9@AM6PR10MB2053.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGH6kp+Ye9H6OK06rZiibboJBvqFtRVSc/f1LvtUBhAOybdWoUi1FZcWeuFyFsnFMy3Bph5IgC2EzfAOKXG549sc6tj6TnUn3b32s0wca12g8dv2tMqmVIbch/nT2vYqJcl68ddtxFovHYqebbcCyK8pIo0Y9vrTkOvrj+92vX5oLLMG5+lJiJ+M0Zzkwh6lhW469Nda2FhpX+2h3xaVNsX4tLqJ/8mRUc5cKdUO0tZzQ4DZo1S8tnbVugtmAz9MAbiPzIZ8i9x4uZ75lIWIl4y8vWJ4SYa5pTa1IpYRBSVb9Dj1k+Q1oH+t/yrCa6dGpEb5SfpB2dxJ45s7rJC6kmFVvxihr1p2WT2/Of+82ezd8ZKvL24FguqZ8HvTZHpswuo1/LN7XKm7l2fKgldUI5FSUh1saRfSzyxe/TB1t7tgLMwc7mKAQ9Q0z7EgTt1wjlb3kZ08gqSj/RSFOSCXLdcv7hF5ffOBG7SD2uWnMZDI6E0w6bgP3CAsC3EPULcFal9S3OEAwmXfq7YegTXEog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(52536014)(86362001)(33656002)(54906003)(71200400001)(2940100002)(26005)(186003)(7696005)(8676002)(66476007)(478600001)(53546011)(83380400001)(9686003)(4326008)(66556008)(66446008)(8936002)(66574015)(316002)(76116006)(6506007)(2906002)(66946007)(55236004)(55016002)(64756008)(5660300002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?00boTHCbRlJrYEKbqyGUEShLQ/oBsZl4J9Hh5auCZAW5jvl4ax1MhNyhzb?=
 =?iso-8859-1?Q?nOLlOnFArgYharTh8d6ItVjbAxazTVJ7staY06DZwaEoKpgpEqWzNVb8GF?=
 =?iso-8859-1?Q?F+hWUspPMRTO7qRxRLTxbckMjfhM22CfpwsZbhZSCoXHwS+uHfhmMBQ/Gt?=
 =?iso-8859-1?Q?tjs41XvHAKTxYIp77PRGZ4Rus6kjK9QV7UNm6csMaHGp6W6E9Nzj4xCV+t?=
 =?iso-8859-1?Q?NDJj0+JLWYDYQ/y4/q6DzNI21bpJFP/qIj33yMseaxtFEOEXllOUsq6DOa?=
 =?iso-8859-1?Q?Djjpu2ZM3SfVTPVj0MADcKO/2KlGqBhzdXTO1QYMs2a2Gv9rAL1ea6uaJe?=
 =?iso-8859-1?Q?nW9aAt1rczJcUYBNMjQ9ArlWvsnJ/p4BYHGpXS0dIi+gP3trS8EcPGV6YH?=
 =?iso-8859-1?Q?bcVT9jTdb6Db9KHCPIoz+4JBFRnE777dzdHuDsIUeYC1pgI8dDC+KupkBU?=
 =?iso-8859-1?Q?ZEi/syI1pdYUUwZwTDvbK5AjwOqn+wRpBWrVZehgLx4Tszm31yCUIM5LtW?=
 =?iso-8859-1?Q?LiNoG87q69zbJ8AgNOsLDtxm6mpMT/gWCUd21nx+bI2IjtTlLfVgJMrewe?=
 =?iso-8859-1?Q?UqJINvRIUiV5rVJ/7j+VezIlt6Rs82F3dRXGXzQyeo/GXOczFHgwkP1PI+?=
 =?iso-8859-1?Q?Ops3gtYgtoTIB0G8c6KFpzqNpNw5hT1hBjHp3/gNWIY5NbKufTP5uX1kZK?=
 =?iso-8859-1?Q?7Jycm2+8ni/TIaY0RuVfJ9dhGW76pJwpgVLvPeA+Domai0cZXQzgciRZUK?=
 =?iso-8859-1?Q?0JIcd8ayEGGdt8q5afiEWZpmHJ+EZkgRyJHe6+oVbbkQMpPmV2QQFd4UeP?=
 =?iso-8859-1?Q?VNa4JNMQY7gpE7z/zr25udXMWDN/2VWpw/P+5SA5yPzkBMndg3wUFIaT5d?=
 =?iso-8859-1?Q?JWyYehmAOSYLtXJny9KLDNmIhytX3P1nR6+61s4FxuNtm6sl/dPzPlZMcW?=
 =?iso-8859-1?Q?wZOUc0VF5LdI2/yXnI22UNg3O2Qy4tukaG35jp6HpT9NBdR++z4KueKQhN?=
 =?iso-8859-1?Q?KmtOFCdaLSZUG+aeuy0ETfc482gN0XkLvaKyNSyPo8f81Me0ks9w7wcOmI?=
 =?iso-8859-1?Q?qwpQ3YVnn/XR3zrcM7IgV4KxwTpdjq9VrsSmImO9s76prz5d8s371RFzkC?=
 =?iso-8859-1?Q?muU7TY7jmNGdhwTMC4ojJK2A8HtN7t8imT9uf6lkcB9S/pI9MSfaIRwXrq?=
 =?iso-8859-1?Q?35ZIB3SkZO08BusEtbk4C6kVzVD/aXIfzAUqy8LKY7NLp4w0tU41QmfWfM?=
 =?iso-8859-1?Q?k61/MFUqfP7OLSybJOvl60xB1jxwqN4ouyAjrQZG6i7j1+MuHVcu7POoUT?=
 =?iso-8859-1?Q?340HB6EQwGYWV/dMWNfYQ367g8Jag9Hhlpw3sU1mUPrwlfgVPvvUod7n10?=
 =?iso-8859-1?Q?txlOpuPdvP?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe78b25f-9645-4d33-dc7b-08d8d8e26b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 16:37:04.8798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClkN+5oL2GJYhTAWAbQ4drxHberzwte/OWW5xaP0aa25OofgpLx5fEOT/3fOq6WGrze3i5iHO8nAepBvylYelQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2053
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_06:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240126
Cc: Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>
Subject: Re: [Linux-stm32] [BUG] stm32mp1 gpiod_to_irq() can cause
	"interrupt stealing"
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Martin

Due to my mailer my answer was not clear.

> -----Original Message-----
> From: Alexandre TORGUE <alexandre.torgue@st.com>
> Sent: mercredi 24 f=E9vrier 2021 16:59
> To: Fuzzey, Martin <martin.fuzzey@flowbird.group>; linux-stm32@st-md-
> mailman.stormreply.com
> Cc: Fabien DESSENNE - foss <fabien.dessenne@foss.st.com>
> Subject: Re: [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt stealing"
> =

> Hi Martin
> =

> =

> From: Fuzzey, Martin <martin.fuzzey@flowbird.group>
> Sent: Wednesday, February 24, 2021 3:15 PM
> To: linux-stm32@st-md-mailman.stormreply.com <linux-stm32@st-md-
> mailman.stormreply.com>
> Cc: Alexandre TORGUE <alexandre.torgue@st.com>
> Subject: [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt stealing"
> =

> Hi,
> =

> I have run into a rather nasty problem on STM32MP1 and I'm not quite sure
> of the right way to fix it (otherwise I would have sent a patch).
> =

> It is possible for one driver to break another driver's GPIO interrupts.
> In fact it is even possible for userspace to break a driver's interrupts.
> =

> On STM32MP1 the external GPIO interrupts go through the EXTI module
> which has 16 interrupt lines connected to the ARM GIC.
> The EXTI maps the GPIO interrupts by line number (so GPIOA_0, GPIOB_0
> ...) all share one GIC interrupt line and only one can be used at any time
> (selected by a multiplexer register in the EXTI)
> =

> The existing stm32mp1 pinctrl driver already handles this, both the setti=
ng of
> the EXTI multiplexer and mutual exclusion.
> =

> However consider a driver which does something like
> =

> =A0=A0=A0 int irq =3D gpiod_to_irq(gpiod);
> =A0=A0=A0 int ret =3D devm_request_irq(dev, irq, ...)
> =

> Suppose there are 2 such drivers using a gpiod configured from DT that
> happen to both have the same line number (eg GPIOA0 and GPIOB0)
> =

> In this case everything works fine initially for the first driver to prob=
e.
> When the second driver probes gpiod_to_irq() obtains a linux virq number
> but devm_request_irq() returns -EBUSY.
> So far so good, the DT configuration was not compatible with the hardware
> constraints so it is expected to fail.
> =

> However, after the second driver calls gpiod_to_irq(), the interrupt alre=
ady
> successfully obtained by the first driver no longer receives any interrup=
ts.
> =

> The reason is that gpiod_to_irq() calls the .alloc function of the EXTI i=
nterrupt
> controller which, in turn calls .alloc of the parent GIC interrupt contro=
ller.
> =

> That not only allocates a linux virq number but also changes the mapping =
of
> the GIC interrupt line to the new VIRQ.
> =

> So when an interrupt occurs on the GPIO used by the first driver it will =
now
> be mapped to the VIRQ allocated by the second driver and ignored...


 =

Even if this second interrupt is freed ? We have to check if we need to add=
 a
link between .alloc and .activate callbacks or move the protection.


 =

> When using the legacy sysfs gpio interface it is even worse because it is
> possible to break the interrupts of a kernel driver without even explicit=
ly
> requesting an interrupt from userspace.
> =

> drivers/gpio/gpiolib-sysfs.c contains this function
> =

> static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *at=
tr,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 int n)
> {
> ...
> =A0=A0=A0=A0=A0=A0=A0 if (attr =3D=3D &dev_attr_direction.attr) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!show_direction)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mod=
e =3D 0;
> =A0=A0=A0=A0=A0=A0=A0 } else if (attr =3D=3D &dev_attr_edge.attr) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (gpiod_to_irq(desc) < 0)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mod=
e =3D 0;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!show_direction && test=
_bit(FLAG_IS_OUT, &desc->flags))
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mod=
e =3D 0;
> =A0=A0=A0=A0=A0=A0=A0 }
> =

> =A0=A0=A0=A0=A0=A0=A0 return mode;
> }
> =

> The purpose of this is to hide the "edge" attribute if the GPIO does not
> support interrupts (even if no interrupt has yet been requested for that
> GPIO) It does this using the call to gpiod_to_irq() and hiding the attrib=
ute if it
> fails.
> =

> So, merely exporting to userspace via sysfs a GPIO (even not as an
> interrupt) having the same line number as another GPIO used by a kernel
> driver will break interrupts for that driver...
> =

> Regards,
> =

> Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
