Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FB860B94
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 08:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98786C6C83C;
	Fri, 23 Feb 2024 07:50:07 +0000 (UTC)
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36639C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 21:52:11 +0000 (UTC)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 41MHSIx8024721; Thu, 22 Feb 2024 21:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pps0720;
 bh=ZY0miupEPjDb3ky7qBlSz8UN6ZkVSdnoC60JCcjbwNY=;
 b=XSMbouHMAxb1awvTUipcpvhR8OkhxmgKlI2rIuzsWozKFRzHDUi45zAQ0CrfAffw4wF8
 yBFP3ZEOa0JCrxrwBKXrwOHguq0kpgPbhLNxojktMDrIfIpsMCWP15xBH9DQrWyY9KHm
 3HIV0MTpAEUX24sHipxf6s5k9bbm5ska9LZn6HkSO4+XnzxRWH8cHVLxpDEXMu0oJwHA
 mqd+nu7Pryr7GfQyFUM3mGD0SFPRTVldfqhC5zY/kXcB+rtwYYYfPc5WHN9DYca/eGGa
 Vs/5PmoccDpwLDQ5GehmEJo4GG6rkbRJs9KgKKHJx+ANtY2i2bOSp9/gGU5XLC/OSQgY RQ== 
Received: from p1lg14879.it.hpe.com ([16.230.97.200])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3we5ghxksk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 21:51:29 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 5BBDC130FA;
 Thu, 22 Feb 2024 21:51:27 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Feb 2024 09:50:46 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Feb 2024 09:50:46 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Thu, 22 Feb 2024 09:50:46 -1200
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Feb 2024 21:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgAYFl9wDF8reLIIF0SMSJQuuNWKigoDKcIMA9V4AjBXsxIbm1Bk2PSeD5KZReXccaVGiJ30QLzrv316Q7HBksGQIwHQGQTXPSSI+8zlr/TrYStjVm9nrcrN7eY/woflWKbAyBeZdUzJg5NslyD0cfw5g19Tp9m3yFbRxPEFmDO7P0uqe2lQy+4AVv9xfAe5/9QR52E+fFdayw+twfne/t8JwC3+o/rbdekymSxG/LRLP0mpWSqV4MbrJu/CAmgwDO6UXMaUfqxyYxxfx7JZyaYYgvJqLV9N5Ys7eQNqsRgbjbgb/yB843pvf+jbLTpYCDxqbsno5SlFM0/NHJ2c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYTLgQhrBkn/TrCKVJYsuzFf9/AxzS6iCCgq8UZ1lFg=;
 b=KhxU6V79vDVLVghj11MAQSIR2FWHIw/37T/JJyd0iGWzA9d4L2CHBY2Uj4eXZXk97cL6WDdzP9konCIHMDViy6jg6XnNxucLjdVgWUuXzRdR+KX5ZW3hOaWYtmqWHlJjr8v1uKlSdqnDA2Rr8ymGzdlAI/XaZFYtDyqhBkWlBMLtovKpd6TCsSbwKQ/rjq9ndTzAQbF56CZXg0N3ZY1M8db8VezEX13AZJHOifQ44RbE1tHTNNFcjhKNGNG4L37SAaAQfM9U456dlu066wDKgcbrB1ynX+L9JC6Q54z9oedLp94IBoISb4yantT76l+dVR0Ij4SLKuYSjD8KxRbVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by LV8PR84MB3436.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 21:50:44 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f9c4:2ca:bc63:f0d6]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f9c4:2ca:bc63:f0d6%7]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 21:50:44 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>, Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [EXTERNAL] Re: [PATCH v2 2/6] crypto: crc64 - add crc64-iso
 framework
Thread-Index: AQHZy8EnMktNYynuQEKGWzL0s+J88K/l+VoAgAm5hACBKF9AsA==
Date: Thu, 22 Feb 2024 21:50:44 +0000
Message-ID: <MW5PR84MB18424EC8DDB4863777D302E2AB562@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
 <20230812025520.GE971@sol.localdomain>
 <87jztserrf.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <87jztserrf.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB1842:EE_|LV8PR84MB3436:EE_
x-ms-office365-filtering-correlation-id: d9e97282-1297-435d-9f47-08dc33f05250
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UWqdie+SIdOdeahs/26J1ZVDpvhbKCmjMyLjzEWDzJO1i3pN8AZ6Ck6TC3+PZ3rqY1Y/kENTGBWDVFO/9FH/CLxmyHj7KujJN0Ydf0L4KUH0u2IkVN0lmSfAVAK4fZflViOu+PzKHurH8jBasBBIMaONHy8pXVAScCx2FksKj8uHvIBwh5bykBBorxpnvC7c17BJW9+P+ctmkTSjsDA+gKsDasFTn+jBnjZFtWkjLteUJGYeirX0Bgy3TgprPChFsrxdoUTSi5D1B3Xesqdn54WVUxkj4BNmJORrJD1oYDyOk3dnWknUhRk7tR/AVYWgf7BZ0kkXH+iWnymK5TNoyUCZ4Z6DtenH89KAvQqAlG+Bb81jWHuTQbKGEzNzJXdVOM+P/12BuiFUyZ8dwaCaGzGubnDi+AhO68Z7u8W7kzhaZUMXsZ0hFgzyRJawhyJV2h4y2l5e5aPHsYnNCicLcvyj9BTNgyGj0o4b1wj0tuBdTQozqF+2UZbDNTLv9/MUxGnlklpiL4fdqTxC1XZXjsT4QsYyyZbVRxDYlGjAJ4omxKiMnl9S+C/Hmo8GV5JpH4SVtxur9XVsOnwtgNy7oK/WtkUNMFHwA8LrXlX5KhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6+r+EqKpGd10WQywf3fx+jgGXwMRQS2KXcBwdybn55SvfhmU77DTZIb67E0H?=
 =?us-ascii?Q?oux75wf68Rb4nY7e3SFTDGZelnhkkBSwPvnT7Pk82cSAkR3fAtwDxPYr0u4o?=
 =?us-ascii?Q?c82JwpkxXVGodeHscuon9GgCI6ytWF4yTXv0Z8qMZCVM8qMc3Qj1FC9gVZX8?=
 =?us-ascii?Q?tv5A1AKGQay4RphCzv48hwzQ3gzmkbI/YfLXTLYBgpF2m2DWwnBCCBQRt2JP?=
 =?us-ascii?Q?7bWaloIQ2iyTUZ29OWU7RhGxlEFdjKtTA2vIWHJB3ZQQWzvK+KQhtPmfhESO?=
 =?us-ascii?Q?vmTO0OY5huGEl02Gk8EpHy09v+MSD3uO9VpotenUX2+az304iZRnCoRzqNSf?=
 =?us-ascii?Q?sXVixwdbXq0bmzSrIpsuO1lDtQQeOdHgn+dHeA4XAjG3ZVpZ3qTqzmYVqWcz?=
 =?us-ascii?Q?c1ChEkMLSJLHZg3z87OevBjlLLyu0gw1jueeexmtTt3AyWAtgjB75jhQq5CG?=
 =?us-ascii?Q?0/fH7su+QlpQ8dTazy0Mi9HHhuzT/OO6rdUI4DRuclc+KtfbTYAq5Cjzi9mI?=
 =?us-ascii?Q?fm/4jl8k/dfe2c8rba3AtPvRw7igCR1gjmf21Rf3kCERMiYwZzwN7tohHOc5?=
 =?us-ascii?Q?722BtMlL8sDVkWH0QHMaJP1hJ5qUIUKIT9ZcCG8hkIvAZvB2gcI0V4dX8MHk?=
 =?us-ascii?Q?UeXOKfBJtROPJvJwPbKmpVjjnuF2yvLUSAvPuNZy2eIlLq/d2wuL1viY8lK6?=
 =?us-ascii?Q?sa8sl6I9Jb4B8rO5RtAd8tFfCJW5qXiU8A8cxnZzGCqV66EsjAiSftiNcJZP?=
 =?us-ascii?Q?SiLSr4PqC3yiSDou4Jnb78buvFikMaJ5w1FzViY3LWChbOafflvHUiFKRCvV?=
 =?us-ascii?Q?GqI5bu5rI90Dhiq/di54jpyGyWDZ5zw752oBkPdHt0dKj7H7YcMCq8rgtS/a?=
 =?us-ascii?Q?NFhaBwFvniBCE8spIo2+sxAUVoQmgVCx0gJZl3NXTg0pEW4znlpi0fQWIXDu?=
 =?us-ascii?Q?F9GQl9r4aCbFzxVzDT7+/knc4Gk/4S7gQqfHg/V4KZ1MPWeIAJn6p4uh95Bk?=
 =?us-ascii?Q?z7O9rBwYIKT4XqiNiE4q06Uu1LVTkgIdhqJXuGtnR8hQRSMPAsDRpmfKOptO?=
 =?us-ascii?Q?QT/9GZ6Hn1SZrP7dJVpsswDKLvL1bIAYdvc8LQMYenvMHfpjLfuY+oiKN1w2?=
 =?us-ascii?Q?9ZgmT/HicB9bej8rJtxXmg+xOdQ7z1P9CLetgKR0XwSsCgep+FJY4u4YdWrK?=
 =?us-ascii?Q?kV8G28HxRoH26tSem6gq3zmx/8FT+b55+g++Eap6c8GTwiJmiu3y7+wYz93r?=
 =?us-ascii?Q?uBYpsK8T36xA3p1Oe+4KnkA9giQfOpEdMQ4HBEcMuAG6BFHR/V3bChiFo84f?=
 =?us-ascii?Q?8dYG36lCE3PXjWqLHjah17Z9warTV6z6a6zXI/agE23YNMcxmvWInUZswUtm?=
 =?us-ascii?Q?mWpR3wLd5GNb1h23fWmn8WuQb0tbonEVrGeIpYZtDM5EdL6PsSBJ1QMUN5dc?=
 =?us-ascii?Q?TgW7CTRsc/966xJBEym+kT1pGuZJnDg6kg9irSJRMvjIZEdK7Jql4jk5cyJb?=
 =?us-ascii?Q?xZO/0U/rVFJYBHqx0nTgMUPzQgkankb2jFTcLgHhjxTU4LPkI33uCNa+VCiq?=
 =?us-ascii?Q?kvzwSxkLrGncNYFgTY8=3D?=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e97282-1297-435d-9f47-08dc33f05250
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 21:50:44.5865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8KgAzNQfJMca6vn03G2lziiAFAvpGYy0LS1CFesfAddaa0LsH3ieBNmOBTYxkuS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3436
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 8GFB0xbM8BaJFVgYpxyQNvK8HVYkeMNv
X-Proofpoint-ORIG-GUID: 8GFB0xbM8BaJFVgYpxyQNvK8HVYkeMNv
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402220169
X-Mailman-Approved-At: Fri, 23 Feb 2024 07:50:07 +0000
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will
 Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/6] crypto: crc64 - add crc64-iso
	framework
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



> -----Original Message-----
> From: Kamlesh Gurudasani <kamlesh@ti.com>
> Sent: Friday, August 18, 2023 2:26 AM
> Subject: Re: [EXTERNAL] Re: [PATCH v2 2/6] crypto: crc64 - add crc64-iso
> framework
> 
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > Is "crc64-iso" clear enough, or should it be "crc64-iso3309"?  There are
> > thousands of ISO standards.  Different CRC variants are specified by
> different
> > ISO standards.  Is this particular variant indeed commonly referred to
> as simply
> > the "ISO" CRC-64?  Even if it's currently the case that all other CRCs
> in ISO
> > standards are different widths than 64 bits (which may be unlikely?),
> I'm not
> > sure we should count on no CRC-64 variant ever being standardized by
> ISO.
> >
> > - Eric
> https://en.wikipedia.org/wiki/Cyclic_redundancy_check
> 
> Last entry CRC-64-ISO in the table.
> It is mentioned as crc64-iso and that's the
> only 64-bit CRC standardized by ISO. 

ECMA-182 (DLT-1 tapes) was contributed to become ISO/IEC 13421 in 1993, so
that was another "64-bit CRC standardized by ISO." Plus, ISO could publish new
standards with new CRCs at any time.

> But I do agree that crc64-iso3309 would be more specific, will change it
> to crc64-iso3309 in next revision. Thanks.
> 
> Regards,
> Kamlesh

ISO-3309:1991 was withdrawn and revised by
ISO/IEC 3309:1993, which was withdrawn and revised by
ISO/IEC 13239:2002, which was confirmed in 2007 and is still current.

Apparently only the 1991 version defined a CRC-64; later versions dropped
that.

Is there really a demand for adding a 23 year old deprecated algorithm to
the kernel?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
