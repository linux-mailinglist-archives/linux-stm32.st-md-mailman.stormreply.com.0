Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15A3240FA
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 16:59:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9116FC57B59;
	Wed, 24 Feb 2021 15:59:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88A6EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 15:59:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OFqRPO002800; Wed, 24 Feb 2021 16:59:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/icQfA4hvAsfl1LWavP44Q7JL1qYsgxEe5v4OMLawaU=;
 b=q+X7vSoOUcsQMIHy8EcNbH/hW4BCIjWUYMAq3hesCYEp9eW2CI6VCK3ceqAIXaiqgxpy
 nHsgdOw6dReboR4xwA9RFCghQoR3cjvYSWMiSvHjmYNmp37nG75s6l4bGZFvXDalaKSI
 ztsPhcCJKAx3ZCIbVmmz+fwMq7OWA/ebi4qHCQXtd37tWR6osbUv+HH3CJi/PnUhvvjD
 BvoecjCZG9a7VrBKqpS/Q4GV6ZCmSzihIRuuTFzTunnlS0KnI5zrejPKXZfT71Z4e5Ju
 LtYqrRIyZUEs2ZCzUAOHDOZC7FkqUH8UclacUMYoc5OlUBJh30OILvfap/dKMj9n4R9P ng== 
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vfaxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 16:59:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoG9LBYo2dHtZHy7ba332UBzOm80E1Axa16Kn2cGuxNdyBqkw6iRWVox7Gw/M5VvjIvzPrWlBlXd/YKJhTio7uGAm9gdGhQpgbqUXxIKdzVCvpZ3uU0V4nmVP6BokPd6/tsSOH8mJLFAnB8U/Q4MMb8PLC7iD77nVe1nIlyqvikcKfgaXMBoIeq2exm3AMxc9saHBi3LPq8HzEUG8v80sY5gG91WxlhJ37+a2udxz82xrp0iU4wPa0b0IOnGRCAcagHLkJsWn1blxXgwqQy9hiCG7OeyyIX/wSBF+m3dFWWcvJ51jSosarKtaiz6MdXi/ScZY+cptSHTT1t3aFAq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/icQfA4hvAsfl1LWavP44Q7JL1qYsgxEe5v4OMLawaU=;
 b=FBXjUEzx4dVQA8aydpGM7RXf1hnZ/PoM9/5h/j1k+cpviAJeQO/CqyrsErAMRQMMynW3/6cAx5yUXwXvQGCRVsPTSBktVVuyAX3sUc94fvrhq4obS57YHIbLZ/YIFOc1JisHiBQZFYYUkiF/7mi9fotQ+MV3nBU1vyH8TXopqS0BELWgmuT9MvhxVqHGevV+TaL3JuzmlhRGCHuPKRCynXCcdwIp6ioJv5TXDPvxn9lhtG2HAMzefymwteP9wIGKIJ5b+HKBj/La5/ITNkUKISnjuYoWxgzMmu+kewJNXFfysu25/7jaPb7c1LcyQ2uL+S1VcVSWCIiV1bk5PIERqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:31d::16)
 by AM7PR10MB3511.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Wed, 24 Feb
 2021 15:59:12 +0000
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac]) by AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac%4]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 15:59:12 +0000
From: Alexandre TORGUE <alexandre.torgue@st.com>
To: "Fuzzey, Martin" <martin.fuzzey@flowbird.group>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt stealing"
Thread-Index: AQHXCreaAXqyCcGD7kqtyIyP4rFM6qpnc189
Date: Wed, 24 Feb 2021 15:59:12 +0000
Message-ID: <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
References: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
In-Reply-To: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
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
x-originating-ip: [165.225.77.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16c540ca-35c8-4c7f-d9db-08d8d8dd20dc
x-ms-traffictypediagnostic: AM7PR10MB3511:
x-ld-processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR10MB3511A26DADED17425FF78517EE9F9@AM7PR10MB3511.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qph7mpV77bUHVAbikXuzlgSpTx4vlzz2Fdnq+X8QqKDgpadDE6cK2tY1JdDHhyrttlYj8l5VSY0MqJBk0+GCKB0cuHxZfe/ztHyzHyIIbrwJi5kKbr9Ii/KL9dTfGs7uaP+sVlapNyvH1bQ/cQLP2BANsQ8NerM+Duf8gHVfq+seW3MiKUhB/zOm3mwMGchmN5aIneGUWHQP4jNEqTDbdjAPIcKAktx5eHuHjY1Xs0y/8AZYtMymQY6aYv6KiktkOV5ByXGU5CKzmnGZxs4VJqqglly8q0pE0rdjHjv5dfuSoxUKile2zcyDH6RW7tVZj04D3JawhidUJ2O2AanBrXr0FrPGR0dR+dohYixBxgGR78CmMsJGH3QEPKzPIKcLCFhPKvz7TfKhPFq3J6AugdFSrK002vv/bijQdB81NGjzOKJslMEZghYJHiwVtN/Cc/fSu8acP1c5CmMqj5DyZR4PIyX62OOKBYnvHAl4oWQpJ+JthFAlUmW1+VJFJH7fvATdXl3DAc1RQxJn5H8g3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(6506007)(5660300002)(66476007)(76116006)(83380400001)(4326008)(71200400001)(53546011)(110136005)(186003)(26005)(7696005)(55236004)(2906002)(8676002)(66446008)(478600001)(55016002)(91956017)(33656002)(52536014)(64756008)(9686003)(8936002)(86362001)(66556008)(66946007)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?o586yj4AVHRokX7p3KxaX5/juXFkZLLcSBB0OCZXcUSM5FkWybf/TsUJoa?=
 =?iso-8859-1?Q?f+uSupI/MXWcah+yMDvZaemT8hzu3/nmmyE/1yLY68pTAw6Wh+DLir0BAp?=
 =?iso-8859-1?Q?RzzN1roOnhYOeVa0vW7X3xveedpJkGeiwWaYqxRWidnpOc1Icd6+ktWBnw?=
 =?iso-8859-1?Q?baf3uLj3U+9dox2yUDwrOZiYDNa3yUUktiNMv8nbsKGpHdXz/HFAAWM1Td?=
 =?iso-8859-1?Q?ghiZ9wLvsz1egcVMct2jN5MFaS39agGx4EGb3hv+NcvlOZnV6s1Px0xdfL?=
 =?iso-8859-1?Q?8fKtC7k1kH/3qq2w78RywvLsdcx2M9tV74x13Jpz4Z+KxdlAvDJuKGnqel?=
 =?iso-8859-1?Q?oYIm5XFnwi6kvalGgr8XuNZ3M/udCC3zOugXXmOg5h9QKSbzbGhdZ/hYmu?=
 =?iso-8859-1?Q?VwsSB4OgivmWB/w98xEB3a74j3rRMSkfUD2u4+IeesXO9IxdqwDS9x3iHr?=
 =?iso-8859-1?Q?RWBedA741MziNV5YVUKrgyu3cr0FEyAy+QQCgGpq5nkEEO5VFJV9jKvQ+Z?=
 =?iso-8859-1?Q?ZtfLUEP0KM1+mcebOzk1b0IwnWxsaNQH4j5eFsxK6AEcWMrFlSi80lPusM?=
 =?iso-8859-1?Q?cRjZvsBurxozRqoVg4X/hiIOTIG2PtFITso8ORfzh6n0d82/boIKLFyxdR?=
 =?iso-8859-1?Q?Dz+eUjhPGhZyo2xvbvolDj1e1ZYkVPK85h0YIzKgKErfw8w0N/nMnUMudF?=
 =?iso-8859-1?Q?TpG+wlooey4w9uUfw7yaeMaQh17nXp+XH4YBA/PxMVzF9jpBl9PDJQXkyA?=
 =?iso-8859-1?Q?vEevVzpCAFbYaKCekocVtmb0Ywd1tnhPsydirxip/YjZp6PxCSP/QvkfHA?=
 =?iso-8859-1?Q?IrjnW16acWzytoq+OPbX+U/04K+6AfgDNfAE4mpM0d6rJarpZyJZxYboKu?=
 =?iso-8859-1?Q?LJOQGWn8OERNDn3irvj7ctlbdI8g+R5mswwc8W7cQCAZgeKmyKnao4Isiw?=
 =?iso-8859-1?Q?VuWX+DX84W23TuKFq13pBU4YQTBBMpSO20CeuFWg76wJVdeZ3JAF/rvCND?=
 =?iso-8859-1?Q?w8Qru/RW6FHnwZNzFpPR2o4JT9VYsRaO1SxpgmMmbWE/TF5N+tpRSpGxEe?=
 =?iso-8859-1?Q?WKGvPjyI6l3kmgHKErhXrPjJWCJ92/Lm8g1yjO+gqJNFebPlvUARdTwVlk?=
 =?iso-8859-1?Q?/Py/wYbnOf38H1TIO3R1y2TMWkg5e8/wOugl9BMlOBuHDX8XwMQvVXnToF?=
 =?iso-8859-1?Q?2OeK/kEKB9PDlETeOLAyuVqcqB2Kt3+Njnv/FzoxY55CLbp8f3cFEV70EM?=
 =?iso-8859-1?Q?KIQ1UAIFk7v6Y+JCzACjPLhp5gb7unxs8wAPgDmEUrYg66KhFT7qQtVsgC?=
 =?iso-8859-1?Q?LPS2Z862FwtwdS52WKt44X/yHmo2D/b/w4i8Y71mGyreKtwkuu5UWREOmA?=
 =?iso-8859-1?Q?YtRHAXTo+m?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c540ca-35c8-4c7f-d9db-08d8d8dd20dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 15:59:12.2347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IiNrNUIbPeNviK5eNKkiuPedj9c9JAx6qhEWsYZSjKC3RdwO1POOrPcrCxQtdB+YGXrBiORHTslvxCF/7hdivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3511
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_06:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240124
Cc: Fabien DESSENNE - foss <fabien.dessenne@foss.st.com>
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


From: Fuzzey, Martin <martin.fuzzey@flowbird.group>
Sent: Wednesday, February 24, 2021 3:15 PM
To: linux-stm32@st-md-mailman.stormreply.com <linux-stm32@st-md-mailman.sto=
rmreply.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [BUG] stm32mp1 gpiod_to_irq() can cause "interrupt stealing" =

=A0
Hi,

I have run into a rather nasty problem on STM32MP1 and I'm not quite
sure of the right way to fix it (otherwise I would have sent a patch).

It is possible for one driver to break another driver's GPIO interrupts.
In fact it is even possible for userspace to break a driver's interrupts.

On STM32MP1 the external GPIO interrupts go through the EXTI module
which has 16 interrupt lines connected to the ARM GIC.
The EXTI maps the GPIO interrupts by line number (so GPIOA_0, GPIOB_0
...) all share one GIC interrupt line and only one can
be used at any time (selected by a multiplexer register in the EXTI)

The existing stm32mp1 pinctrl driver already handles this, both the
setting of the EXTI multiplexer and mutual exclusion.

However consider a driver which does something like

=A0=A0=A0 int irq =3D gpiod_to_irq(gpiod);
=A0=A0=A0 int ret =3D devm_request_irq(dev, irq, ...)

Suppose there are 2 such drivers using a gpiod configured from DT that
happen to both have the same line number
(eg GPIOA0 and GPIOB0)

In this case everything works fine initially for the first driver to probe.
When the second driver probes gpiod_to_irq() obtains a linux virq
number but devm_request_irq() returns -EBUSY.
So far so good, the DT configuration was not compatible with the
hardware constraints so it is expected to fail.

However, after the second driver calls gpiod_to_irq(), the interrupt
already successfully obtained by the first driver no longer receives
any interrupts.

The reason is that gpiod_to_irq() calls the .alloc function of the
EXTI interrupt controller which, in turn calls .alloc of the parent
GIC interrupt controller.

That not only allocates a linux virq number but also changes the
mapping of the GIC interrupt line to the new VIRQ.

So when an interrupt occurs on the GPIO used by the first driver it
will now be mapped to the VIRQ allocated by the second driver and
ignored...

Even if this second interrupt is freed ? We have to check if we need to add=
 a link between .alloc and .activate
callbacks or move the protection.

When using the legacy sysfs gpio interface it is even worse because it
is possible to break the interrupts of a kernel driver without even
explicitly requesting
an interrupt from userspace.

drivers/gpio/gpiolib-sysfs.c contains this function

static umode_t gpio_is_visible(struct kobject *kobj, struct attribute *attr,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 int n)
{
...
=A0=A0=A0=A0=A0=A0=A0 if (attr =3D=3D &dev_attr_direction.attr) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!show_direction)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =
=3D 0;
=A0=A0=A0=A0=A0=A0=A0 } else if (attr =3D=3D &dev_attr_edge.attr) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (gpiod_to_irq(desc) < 0)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =
=3D 0;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!show_direction && test_b=
it(FLAG_IS_OUT, &desc->flags))
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =
=3D 0;
=A0=A0=A0=A0=A0=A0=A0 }

=A0=A0=A0=A0=A0=A0=A0 return mode;
}

The purpose of this is to hide the "edge" attribute if the GPIO does
not support interrupts (even if no interrupt has yet been requested
for that GPIO)
It does this using the call to gpiod_to_irq() and hiding the attribute
if it fails.

So, merely exporting to userspace via sysfs a GPIO (even not as an
interrupt) having the same line number as another GPIO used by a
kernel driver will break interrupts for
that driver...

Regards,

Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
