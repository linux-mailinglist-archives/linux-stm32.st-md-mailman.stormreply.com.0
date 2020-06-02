Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34981EB6C6
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 09:50:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2ABBC36B22;
	Tue,  2 Jun 2020 07:50:52 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 115C2C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 07:50:50 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0527nXOu010001; Tue, 2 Jun 2020 03:50:25 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-00128a01.pphosted.com with ESMTP id 31bhb69rkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 03:50:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMjT39ZKX8AOvGmjBdmG1N83oKD+eJYSp1HziMe03TDppC6LhrUxpFExZ6h5qLZ0W1GCZc2B7Fbnpbm1mCFmhct/MwL19V4fkyn4MsJzcrWBd0j3EHiNz4Bb27nqmoStcI2GuCiuU48NjOZTQordQicQKIQYWW6yS1v6rCn9+ykduYpESeVavUKm2+MHZvSiwd5BkGwRVEhccH4AgKvN6ZcYSq/3RtPE9aCjhwj7othavtsoAdxvhq00rxtUP65drwGnZLRPehQXboHt+X/Mz84e4X9W6Nb2+DD1JAcJOXpqKjL2JHoSYyeTL3uwpd3SNoXQ6BE2ZlFvOc+M/RCgLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcwqP+OGTHkxrj/o3N2o9M+O5bMPkJD9aEvicfXjw3s=;
 b=GJ2Zn8trEqm3pyFYy7eztD5F2f1RS32fJAsd5Sv6RDaNAy8qxrn62POpluswBkuF+yefBxkSngvkfBHj0beRX0crT8r/2SmcPPj0GDGFJcoEaVkhHh0s0Oml+3vKrRSWnd4xPKo+ly8PAwCBtVGjDeSifNHxrkf/16tCd/IibWnNrxAAafU2VxgQEjzLJIjoM1bjJDgLTEizGN2KsIsW7EnK9lt5hhIbGLfwuiMmFQfVEKcirq7MmCdneopZgm6COMVBAiIiKleO5sd+n4QmKG6Rn/u65XXi5woKQcGmGliuNg8dOD3IZNjyBMm5DzDS83p3M0AuiXtkGbZvsYqraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcwqP+OGTHkxrj/o3N2o9M+O5bMPkJD9aEvicfXjw3s=;
 b=tOvBGNJWtq7JOhOMODgNBZpmukZt/mrdz3RUC8P/AIZrgfCWhHq5dX5UGMC4J9ZZDaso0vl3kCt5Yk/+lTG86SfZPXS5zFBgvNKBFc9BoEQLoAYNplrjPRw81oAAfOgmTUH1TUAhhP/vnABFeRdJepBlJtvjxdXhYMXvAgJMq8o=
Received: from BYAPR03MB4407.namprd03.prod.outlook.com (2603:10b6:a03:c5::24)
 by BYAPR03MB3749.namprd03.prod.outlook.com (2603:10b6:a03:6b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Tue, 2 Jun
 2020 07:50:23 +0000
Received: from BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0]) by BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::18cb:6059:b74f:73a0%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 07:50:23 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "jic23@kernel.org" <jic23@kernel.org>
Thread-Topic: [PATCH v2 3/3] iio: remove
 iio_triggered_buffer_postenable()/iio_triggered_buffer_predisable()
Thread-Index: AQHWMosiebcsgWLmWUu0dbt01y27SqjCXn4AgAKhWwA=
Date: Tue, 2 Jun 2020 07:50:23 +0000
Message-ID: <a0253d719a4390f65668789e5fc182ec19355f17.camel@analog.com>
References: <20200525113855.178821-1-alexandru.ardelean@analog.com>
 <20200525113855.178821-3-alexandru.ardelean@analog.com>
 <20200531164020.765822dc@archlinux>
In-Reply-To: <20200531164020.765822dc@archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.130.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c79c2cc9-7d49-46ae-1966-08d806c99b42
x-ms-traffictypediagnostic: BYAPR03MB3749:
x-microsoft-antispam-prvs: <BYAPR03MB374961A58268B8BFA2C495A5F98B0@BYAPR03MB3749.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cgc+0JY56S7488bKQVJWpDSLtmiSnuJli2cenqnUiwOjcbiGC5cIT9HFNuhQmkxcIDl3OIDzY1ji7RFPnyRCW3WN+MaQ8XOEywP4sZLwyKM0ymjRGXJy4HS+HRwJGBPARwUB1e1mVYWV7SS7zSkNJkTTEVaWYzJJ1X5NGe8m/CsTFppjBUnagHwLy1Da9Q4u7t3MPDfgfCE6c1b7lDAjbmy7gTYQoxC2yQ28pQV349PRnmQBBtTekwpukCyVE0XfIzdjzXIIVlI0nEldnUgSOlLZ7WLYnzDRvkVxy6REwfVYn+0DArYqvl2xyb0erRjdY8w6HEa66bGkA+nCEcP4CA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4407.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(366004)(376002)(39860400002)(346002)(6486002)(2616005)(2906002)(4326008)(8936002)(8676002)(6512007)(83380400001)(5660300002)(26005)(186003)(54906003)(478600001)(71200400001)(316002)(6916009)(86362001)(6506007)(66446008)(66476007)(7416002)(66946007)(66556008)(36756003)(64756008)(76116006)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oEW8YEntt5qLDIcJb79MlDCyXfmrUupeSiYE1vJT/MyC/qMXktbU6CpLYFcTXZ5A5YWjUH0BCDW6qkphOzLGazryKTRYEzUY8PcarhGO+nyB7lg5I2qV1WPnHNl081PS1ph3Sd5yyhE+EhVMgrmByBA1Eat8YLa6oVWOi2sZL8T6UVi9YO3XO4VfJFslKrqmUiFq25TDYOmbCh9u1VF+ZG/GZZSrtfb8fNgdDJeD9qKZPuu5XXacXAPWruA5wsQUM5C6GHanOg67IK96oNkCyHjoCa0DWOQ11Xn8rKP06TtYDcKG7N3DTuyF7+vMMFqNCENiTL1kdHs4QPeYyUev+xAagdkIBHNqz+mnQtS8I2INoXX0VULG0UUJo6BjmEiQohhDsmkuuTOt1VMND99UlejRZxJaA1XDBsIcMvdJkvYhnNUgNehg3Jpl4iJcJykvQsAoNyL/YT1LqtKc0ErlezkwHNcK/uO1ilhPTiogB3UnqWNzuZQwidZoD6+2NtWT
x-ms-exchange-transport-forked: True
Content-ID: <8AEA0E43D6FBD04BB3B4240009B8EA1D@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79c2cc9-7d49-46ae-1966-08d806c99b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 07:50:23.1541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsdBnzoKdBbQEvbSd68j+6xk7T2E3bxZzNbn1096V+uoQuq7FtnNrpfccPnwPa88V3VnAOewS+AXPcpZEX6iYOPH/k21zBhDaRSxnQuoNHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3749
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_08:2020-06-01,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0
 cotscore=-2147483648 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020050
Cc: "lars@metafoo.de" <lars@metafoo.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "songqiang1304521@gmail.com" <songqiang1304521@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] iio: remove
 iio_triggered_buffer_postenable()/iio_triggered_buffer_predisable()
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

On Sun, 2020-05-31 at 16:40 +0100, Jonathan Cameron wrote:
> On Mon, 25 May 2020 14:38:55 +0300
> Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:
> 
> > From: Lars-Peter Clausen <lars@metafoo.de>
> > 
> > This patch should be squashed into the first one, as the first one is
> > breaking the build (intentionally) to make the IIO core files easier to
> > review.
> > 
> > Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > ---
> 
> Friend poke.  Version log?

Version log is in the first patch.
I was wondering if I omitted it.
Seems, this time I didn't. But I admit, it probably would have been better
here.

> 
> Other than the wistful comment below (which I'm not expecting you to
> do anything about btw!) whole series looks good to me.
> 
> These are obviously no functional changes (I think) so it's only really
> patch 2 that
> could do with more eyes and acks.
> 
> Far as I can tell that case is fine as well because of the protections
> on being in the right mode, but more eyes on that would be great.
> 
> So assuming that's fine, what commit message do you want me to use for
> the fused single patch?

Commit message-wise: I think the message in the first commit would be
mostly sufficient.
No idea what other description would be needed.

So, maybe something like:

----------------------------------------------------------------------
All devices using a triggered buffer need to attach and detach the trigger
to the device in order to properly work. Instead of doing this in each and
every driver by hand move this into the core.

At this point in time, all drivers should have been resolved to
attach/detach the poll-function in the same order.

This patch removes all explicit calls of iio_triggered_buffer_postenable()
& iio_triggered_buffer_predisable() in all drivers, since the core handles
now the pollfunc attach/detach.

The more peculiar change is for the 'at91-sama5d2_adc' driver, since it's
not obvious that removing the hooks doesn't break anything**
----------------------------------------------------------------------

** for the comment about 'at91-sama5d2_adc', we really do need to get some
testing; otherwise this risks breaking it.


> 
> Thanks,
> 
> Jonathan
> 
> >  static const struct iio_trigger_ops atlas_interrupt_trigger_ops = {
> > diff --git a/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > index 17606eca42b4..8e13c53d4360 100644
> > --- a/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > +++ b/drivers/iio/dummy/iio_simple_dummy_buffer.c
> > @@ -99,20 +99,6 @@ static irqreturn_t iio_simple_dummy_trigger_h(int
> > irq, void *p)
> >  }
> >  
> >  static const struct iio_buffer_setup_ops
> > iio_simple_dummy_buffer_setup_ops = {
> > -	/*
> > -	 * iio_triggered_buffer_postenable:
> > -	 * Generic function that simply attaches the pollfunc to the
> > trigger.
> > -	 * Replace this to mess with hardware state before we attach the
> > -	 * trigger.
> > -	 */
> > -	.postenable = &iio_triggered_buffer_postenable,
> > -	/*
> > -	 * iio_triggered_buffer_predisable:
> > -	 * Generic function that simple detaches the pollfunc from the
> > trigger.
> > -	 * Replace this to put hardware state back again after the trigger
> > is
> > -	 * detached but before userspace knows we have disabled the ring.
> > -	 */
> > -	.predisable = &iio_triggered_buffer_predisable,
> >  };
> >  
> Hmm. Guess we should probably 'invent' a reason to illustrate the bufer
> ops in the dummy example.  Anyone feeling creative?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
