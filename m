Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B31DE07B
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2020 08:58:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 843CCC36B24;
	Fri, 22 May 2020 06:58:31 +0000 (UTC)
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68338C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 06:58:28 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04M6v33p013436; Fri, 22 May 2020 02:58:15 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0b-00128a01.pphosted.com with ESMTP id 313ca0yctx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 May 2020 02:58:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFEVMKeexNs/gB5Bz4FnnmXfOsJdeRd9Y6iyuGc7PzzOI87vvN3j5UofLo98Ceozw5HPQ7KXOZjsZ0QvEOSRTAn2OeMqwymhLrZmVcZ9M2JDla1BusD/bvtY8I60gcKUgifQsmst4C1HpsAMBNYC8IcbkdYz2VvrqZeIJk7qVXokT7nixX164flX6+/rSH+6t7d1srunMwUc8xGjp7pK7+M5t9Ym5jVkh14rdr+wjUsjBPpq3T1MhKv/0B3VaFcKqX6gYIKQV6xDfXR+zoluzN0T8sRv5gCtgL8y1HZXJrlTVTFFMLh4Hgw1J973/eGcCaOOQD7XJenlSEjcBuBbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqpm9cJle8mS8eWU/lzTG0FHehjV7gpIAlftNBMArUI=;
 b=OTIGeHSAJKs/I5ovmbjt68veXlo4itL1nyL5redzJTe+x4ml18E4z5tbFOUs0N3OPDglg4pwaH8WlEQS+IPCnwOhysj479xuDDJEsUAYAk8I7eAl5moxw0UeriHXLgc+UtKa3lvakvOPVKqwUofYBQcvCtKL7aDy0RT8780j0qz7NhFsynKwkotNCZcuztbp+wURrGM445z28M1bH1z1p8rd/uPUPdkfy51WROYhdMkFSJbFcc/kgRNBdVZTbxS1Y+Otvqo4jOtOmp7NW7FUt6KEI0pNfWvu2CEQqTqtV2rzzFwjaw08NNcjE4S2L/l0PbId2nTS+QHm7JqDPdZ4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqpm9cJle8mS8eWU/lzTG0FHehjV7gpIAlftNBMArUI=;
 b=E4FRsdkj78eJc3RCYKFBrKqUvwojTANVuxi2sv8F3XjDW1vG0jv8dLEp9g2aD5ri5Lacz9A3+hNnlsvUXR9j2B+nonDM+cYrGtljCH9VAxy7Fl3kgsgscYiwxphN7NWPL4Sv/IrwoaGh09cDjnjUUNXPPkVjQuCIu13KDe9iVJo=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (20.178.27.206) by
 DM6PR03MB3753.namprd03.prod.outlook.com (20.176.115.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23; Fri, 22 May 2020 06:58:13 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf%3]) with mapi id 15.20.3021.027; Fri, 22 May 2020
 06:58:13 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>
Thread-Topic: [PATCH v2 0/8] iio: core: wrap IIO device into an iio_dev_opaque
 object
Thread-Index: AQHWKfIQtA84O2YmVUKBckGu9/wX+qizuNoA
Date: Fri, 22 May 2020 06:58:13 +0000
Message-ID: <036bd63f14707d9c99273e334ac21eb68b29ea4c.camel@analog.com>
References: <20200514131710.84201-1-alexandru.ardelean@analog.com>
In-Reply-To: <20200514131710.84201-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 37f839b6-f8d6-4563-cc48-08d7fe1d7ef4
x-ms-traffictypediagnostic: DM6PR03MB3753:
x-microsoft-antispam-prvs: <DM6PR03MB3753407AE1D4F4A431D7A153F9B40@DM6PR03MB3753.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HcE+fAwxjhuY85/A5gc2AQkkk5JWOKIxkt2n115Q7pEi5gr7tp5ajZw0lek0WxD3hykOFGPXOnTyr3cMdcSVOd/l9eHiPrRCLUGkXdpzg2bXTxbHbi9DlL64/jGjCDM5PXC+THNgT7ZtZ/MsjnWaOm+mV68PtusCZtN/ugjaixkLvpRD2/jfV6EDkjzzuPKIwwiw1N3oY2EG2oStfXR3oNJEbrye+upvi+v+peFxoiiXDWLrw18Lrv2RdJQ8gYX+fHIkKzhSfurH3bS1ab9ytRXck+TM2bqc6bDdXgpJ6MSBbPO3kufMMhvZDrukTrum
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(6506007)(2616005)(2906002)(186003)(64756008)(66946007)(5660300002)(7416002)(91956017)(76116006)(71200400001)(66446008)(66476007)(66556008)(36756003)(110136005)(478600001)(26005)(316002)(8676002)(8936002)(6512007)(4326008)(86362001)(54906003)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 5UAaZcD0DKzZRJ1tvQHK38MmIjjEcdkDlB49XhuKebGdIFT9iHk7Cr/L5Cfa68qNbg523Z9k7inuOQaCa54B/2qWrUDoAKUzi+P1MRymUbV0ZvENlYgneWIPzLvUoRdb3KN80OSZDB++62tFQ6G7XOeM5bgpZ2RURQg5XVOlCcjIDV8Rtr6gcMzdIDCqWkgFsgGvW7LPwK2gT18n0R/RqV5NprPJ51Fdsc37LdhLBAcPKzuk+ZGFjk22EWNwvdWZnAZ3CCqrRxcv4dEZ4ZzdbDl2sGfHl3mlrBTS63AkqIdLpgNqM/lhMKLClMEzImBqGiIrmCWh+p6DNb1bWEDWbFZZjQ//rIUbLh0+yjIsSrtdSzDGaf3B/so9bFVxdzosGh/Cd+tFBK9WkdZijnqTmF89n3zIG+1R3favizmTa8+JeAuFLLSUBxetgQEHipmWlWaDfUvMF8YRBkQntdIqfBzPfFtfuR6v+PofRMH/+ck=
x-ms-exchange-transport-forked: True
Content-ID: <2CE88329049E3340AF14D968CD77C921@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f839b6-f8d6-4563-cc48-08d7fe1d7ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 06:58:13.1994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFkIgbBO1xnLeF9DTMRadeGAqT3I+R8cq698FTzovGifEq/KXGc5pKzfgc7JjJJ9ypUaYrvk3QgJZ9N4xQGVaYt9gkBHoDGsdNUONXr7LEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3753
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-22_02:2020-05-21,
 2020-05-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 mlxscore=0 cotscore=-2147483648 clxscore=1015 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005220055
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "ak@it-klinger.de" <ak@it-klinger.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>,
 "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/8] iio: core: wrap IIO device into an
 iio_dev_opaque object
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

On Thu, 2020-05-14 at 16:17 +0300, Alexandru Ardelean wrote:
> This change starts to hide some internal fields of the IIO device into
> the framework.
> 
> Because the iio_priv_to_dev() will be hidden some pre-work is done to
> try to remove it from some interrupt handlers.
> iio_priv_to_dev() will become a function call and won't be expandable
> into place (as-is now as an inline function).
> 

I'll defer this series.
A cleanup of iio_priv_to_dev() doesn't look like a bit detour.


> Changelog v1 -> v2:
> - add pre-work patches that remove some calls to iio_priv_to_dev() from
>   interrupt handlers
> - renamed iio_dev_priv -> iio_dev_opaque
> - moved the iio_dev_opaque to 'include/linux/iio/iio-opaque.h' this way
>   it should be usable for debugging
> - the iio_priv() call, is still an inline function that returns an
>   'indio_dev->priv' reference; this field is added to 'struct iio_dev';
>   the reference is computed in iio_device_alloc() and should be
>   cacheline aligned
> - the to_iio_dev_opaque() container is in the
>   'include/linux/iio/iio-opaque.h' header; it's still implemented with
>   some pointer arithmetic; one idea was to do it via an
>   'indio_dev->opaque' field; that may still be an optionif there are
>   some opinions in that direction
> 
> Alexandru Ardelean (8):
>   iio: proximity: ping: pass reference to IIO device via call-stack
>   iio: at91-sama5d2_adc: pass ref to IIO device via param for int
>     function
>   iio: at91_adc: pass ref to IIO device via param for int function
>   iio: stm32-dfsdm-adc: pass iio device as arg for the interrupt handler
>   iio: stm32-adc: pass iio device as arg for the interrupt handler
>   iio: core: wrap IIO device into an iio_dev_opaque object
>   iio: core: simplify alloc alignment code
>   iio: core: move debugfs data on the private iio dev info
> 
>  drivers/iio/adc/at91-sama5d2_adc.c |  7 ++-
>  drivers/iio/adc/at91_adc.c         |  5 +-
>  drivers/iio/adc/stm32-adc.c        | 10 ++--
>  drivers/iio/adc/stm32-dfsdm-adc.c  |  6 +--
>  drivers/iio/industrialio-core.c    | 75 ++++++++++++++++++++----------
>  drivers/iio/proximity/ping.c       |  5 +-
>  include/linux/iio/iio-opaque.h     | 27 +++++++++++
>  include/linux/iio/iio.h            | 24 +++-------
>  8 files changed, 99 insertions(+), 60 deletions(-)
>  create mode 100644 include/linux/iio/iio-opaque.h
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
