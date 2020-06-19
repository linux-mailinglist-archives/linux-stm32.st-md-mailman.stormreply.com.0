Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A921F20031F
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2020 10:00:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FB00C36B0D;
	Fri, 19 Jun 2020 08:00:51 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC972C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 08:00:48 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05J7uo3Q012600; Fri, 19 Jun 2020 04:00:38 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by mx0a-00128a01.pphosted.com with ESMTP id 31q66c9acs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 04:00:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6HAh16+Qb+Xr2LW8JeGsh+aGhRK7rNnqnixY4MGhpSLpi7sXuxPUfIaYAZxbpLi696l4nv5bmy3nFQWx4ftKazXuMbHII7WT4hZtcn0XpKhw4Uf45ZyP1utprmldcBgiOiNmc7vOoZplIfhKbn9rJrsgdD1EpERzuSkG6QMn3BO6puFPmoZpFDyByb6NpkHROk5OWPhDQWQHxIATLp8IJTfjNjUo/93VCAXnDEDeQrrCIX/Rh4r9G58vayJ6N5pNXtIq3ReafVXjz7hIDR/uZza01ZpkgxyXYP57nIqdOYXdt4wWlvxLa88kCTeSUA/AVXk2PyCmoabcYd2WX1HKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdcsVEViQlATrXMJJ+D7Qu3NheT/ufEvfo9P/zN3AqQ=;
 b=I5TvrCDVSOMmYWVA6jRUmIAtXnV57VzPeHdlj4V0cFs8glhzAlGrwPDQHd5I7m/lNBj/yb1jwJCbeICtBktuCpU8k+JZg6f2aO48AuI+H6Q1jsVMzPK8fjh7Q00Rv/whZQ9dhtwRQcJVg1f/ZzFon+B0o/BXpJxCg3TJ4ZPwy8agOgvIZ0jn5GKCk83XOA9Z8Kq3UmhnkVi+v7jhTauQmqfKdPSpJfpEgSurT2zIvxtTrob8hRrSSuRzWVioM2dvMd03GavuLzAR/3fWC5cmcSM2bg5Xql4YOtmypnsVcU1tWoYAsosjXH78PeHCW1Fj19Z2sqrItRFAdsbK4ZGfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdcsVEViQlATrXMJJ+D7Qu3NheT/ufEvfo9P/zN3AqQ=;
 b=7J+USZbLXGK1/bMwOy47uNIFCV+70fn7rirTUrSZTO4KTXUMgqSSmIqdH4GEC8RaLYN0OV9s7uAMmBi70qJVeyVaDOM1zNalf5vDXkD4cxoSqkCp7aHulgQgGJjH3sf/pqOSzFd6JzvwBZnpaG+MW8C4vmhnM9grdiJBk9VXRnE=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM5PR03MB2587.namprd03.prod.outlook.com (2603:10b6:3:3e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 08:00:36 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 08:00:36 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "jic23@jic23.retrosnub.co.uk" <jic23@jic23.retrosnub.co.uk>
Thread-Topic: [PATCH v2] iio: stm32-dfsdm-adc: remove usage of
 iio_priv_to_dev() helper
Thread-Index: AQHWMm4+8MivrZaWmkWRz46nFDyQuqjCT2yAgB1rJQA=
Date: Fri, 19 Jun 2020 08:00:36 +0000
Message-ID: <eb26c2b2aa2e1fbadc80bcf27551160c05eaa050.camel@analog.com>
References: <20200522130804.631508-1-alexandru.ardelean@analog.com>
 <20200525082648.39656-1-alexandru.ardelean@analog.com>
 <20200531154535.4e7490e0@archlinux>
In-Reply-To: <20200531154535.4e7490e0@archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jic23.retrosnub.co.uk; dkim=none (message not signed)
 header.d=none; jic23.retrosnub.co.uk;
 dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54c13e8b-5346-4de5-9890-08d81426d9be
x-ms-traffictypediagnostic: DM5PR03MB2587:
x-microsoft-antispam-prvs: <DM5PR03MB25870570FAE6529772D07A46F9980@DM5PR03MB2587.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H29A/rbVpcgAfCoZqPkBlex4qlOtRRrIRaUjZp/HE6zqfpunlyr9cwHOMDeGVq3is5tAYo57uF9n/0yLBXlLNJTJL/LIUiz5Gh9yFQMdHV7QhcqzWdDI+Z7s5n/h3zMv45I1RU41DcsSjPBjm0cVA1R3XrznVVMEVY4AsthYb93lRGbfpRHPkwjBxDyL425iNhe0L1oRiupcLjiM1IwPVtNtLVOcJzAPF/eihqN6hS++EhlJ1oKrYKfP7/SV3lY9w0s74WzgUYu/PlFk2n8NOvOZXlCDm1L1R8ejCE4NhErb+Oj/bpEGFpz2ujJhXmUWew4aBS/3KkgKUbauHCIxCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(83380400001)(316002)(4326008)(91956017)(2616005)(5660300002)(186003)(26005)(30864003)(66476007)(64756008)(6512007)(8936002)(66556008)(6506007)(76116006)(66946007)(8676002)(66446008)(36756003)(478600001)(71200400001)(6916009)(6486002)(86362001)(54906003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uPGuK73SdHngyQeJ1V3LbtnAsMZqBdv/uCORN+FaUmnChUlDdgTkKeYk9cYrb4bIW1XrOFGQ2GB25v9Ilr/R/4rKHnm4C0/rEkX9e9Z/k5zg7O8QCeNEt/MSwK0jIvqR2FmcX4bflkW1IPnStYtsLNrZAVlHlOfz/s+6EjWJHTyVuIF4YsRkQwj7mnqrd0LZ5UU9XVR5c5PZQx6sNy/PgO1tkBY6/RDiBN6U+ZGdNnSrlLsWlLCSNJkFxkPIiByY7Uk+GXQd/fN0od/pYZMV5v8hKPMbCXFDFIs23dfcMW6X5P2pZy4nhz34uq7OLnsnk31GUz0ophAssNcnqVKnvAcZDXMgtNmNenAKGJF/C8WT6AhspGpXUqZlxhhy0oGAcwuW3k7yDMNMho+wPr+m0yoR+b9tQGX6O7mCL3a8w96zCBEBkMUQIrGfSbkK3i3ZVu7aztD+9mYymnWoGWCu5x5vkXEM7zBOqf6aB2LUzFI=
x-ms-exchange-transport-forked: True
Content-ID: <1762005F5BDBAC42B1281DD0DD4AAC31@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c13e8b-5346-4de5-9890-08d81426d9be
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 08:00:36.6365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+8zG8ueQa0IEogzgikcPe2am+nS39obb6sR/Sk2N7ZomqUhKxjvtC0iT7n6nWQJjZAeoOHPtEirOZwMol80FtakcLttiIFyXuVQaw3R088=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2587
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_04:2020-06-18,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 cotscore=-2147483648 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190057
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dfsdm-adc: remove usage of
 iio_priv_to_dev() helper
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

On Sun, 2020-05-31 at 15:45 +0100, Jonathan Cameron wrote:
> [External]
> 
> On Mon, 25 May 2020 11:26:48 +0300
> Alexandru Ardelean <alexandru.ardelean@analog.com> wrote:
> 
> > We may want to get rid of the iio_priv_to_dev() helper. The reason is
> > that
> > we will hide some of the members of the iio_dev structure (to prevent
> > drivers from accessing them directly), and that will also mean hiding
> > the
> > implementation of the iio_priv_to_dev() helper inside the IIO core.
> > 
> > Hiding the implementation of iio_priv_to_dev() implies that some fast-
> > paths
> > may not be fast anymore, so a general idea is to try to get rid of the
> > iio_priv_to_dev() altogether.
> > The iio_priv() helper won't be affected by the rework, as the iio_dev
> > struct will keep a reference to the private information.
> > 
> > For this driver, not using iio_priv_to_dev(), means reworking some
> > paths to
> > pass the iio device and using iio_priv() to access the private
> > information.
> > 
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> Looks great.  Will let it sit a little longer on list for others to
> review
> though.
> 

ping on this :)

> Thanks,
> 
> Jonathan
> 
> > ---
> > 
> > Changelog v1 -> v2:
> > * changed some paths to pass a reference to ref to iio device and
> > access
> >   private state-struct via iio_priv()
> > 
> >  drivers/iio/adc/stm32-dfsdm-adc.c | 65 ++++++++++++++++---------------
> >  1 file changed, 33 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-
> > dfsdm-adc.c
> > index 76a60d93fe23..03dfc0b6ba98 100644
> > --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> > +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> > @@ -330,9 +330,9 @@ static int stm32_dfsdm_compute_all_osrs(struct
> > iio_dev *indio_dev,
> >  	return 0;
> >  }
> >  
> > -static int stm32_dfsdm_start_channel(struct stm32_dfsdm_adc *adc)
> > +static int stm32_dfsdm_start_channel(struct iio_dev *indio_dev)
> >  {
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	const struct iio_chan_spec *chan;
> >  	unsigned int bit;
> > @@ -350,9 +350,9 @@ static int stm32_dfsdm_start_channel(struct
> > stm32_dfsdm_adc *adc)
> >  	return 0;
> >  }
> >  
> > -static void stm32_dfsdm_stop_channel(struct stm32_dfsdm_adc *adc)
> > +static void stm32_dfsdm_stop_channel(struct iio_dev *indio_dev)
> >  {
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	const struct iio_chan_spec *chan;
> >  	unsigned int bit;
> > @@ -418,11 +418,11 @@ static void stm32_dfsdm_stop_filter(struct
> > stm32_dfsdm *dfsdm,
> >  			   DFSDM_CR1_DFEN_MASK, DFSDM_CR1_DFEN(0));
> >  }
> >  
> > -static int stm32_dfsdm_filter_set_trig(struct stm32_dfsdm_adc *adc,
> > +static int stm32_dfsdm_filter_set_trig(struct iio_dev *indio_dev,
> >  				       unsigned int fl_id,
> >  				       struct iio_trigger *trig)
> >  {
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	u32 jextsel = 0, jexten = STM32_DFSDM_JEXTEN_DISABLED;
> >  	int ret;
> > @@ -447,11 +447,11 @@ static int stm32_dfsdm_filter_set_trig(struct
> > stm32_dfsdm_adc *adc,
> >  	return 0;
> >  }
> >  
> > -static int stm32_dfsdm_channels_configure(struct stm32_dfsdm_adc *adc,
> > +static int stm32_dfsdm_channels_configure(struct iio_dev *indio_dev,
> >  					  unsigned int fl_id,
> >  					  struct iio_trigger *trig)
> >  {
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> >  	struct stm32_dfsdm_filter_osr *flo = &fl->flo[0];
> > @@ -491,11 +491,11 @@ static int stm32_dfsdm_channels_configure(struct
> > stm32_dfsdm_adc *adc,
> >  	return 0;
> >  }
> >  
> > -static int stm32_dfsdm_filter_configure(struct stm32_dfsdm_adc *adc,
> > +static int stm32_dfsdm_filter_configure(struct iio_dev *indio_dev,
> >  					unsigned int fl_id,
> >  					struct iio_trigger *trig)
> >  {
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	struct stm32_dfsdm_filter *fl = &adc->dfsdm->fl_list[fl_id];
> >  	struct stm32_dfsdm_filter_osr *flo = &fl->flo[fl->fast];
> > @@ -521,7 +521,7 @@ static int stm32_dfsdm_filter_configure(struct
> > stm32_dfsdm_adc *adc,
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = stm32_dfsdm_filter_set_trig(adc, fl_id, trig);
> > +	ret = stm32_dfsdm_filter_set_trig(indio_dev, fl_id, trig);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -729,21 +729,22 @@ static ssize_t dfsdm_adc_audio_set_spiclk(struct
> > iio_dev *indio_dev,
> >  	return len;
> >  }
> >  
> > -static int stm32_dfsdm_start_conv(struct stm32_dfsdm_adc *adc,
> > +static int stm32_dfsdm_start_conv(struct iio_dev *indio_dev,
> >  				  struct iio_trigger *trig)
> >  {
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	int ret;
> >  
> > -	ret = stm32_dfsdm_channels_configure(adc, adc->fl_id, trig);
> > +	ret = stm32_dfsdm_channels_configure(indio_dev, adc->fl_id, trig);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	ret = stm32_dfsdm_start_channel(adc);
> > +	ret = stm32_dfsdm_start_channel(indio_dev);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	ret = stm32_dfsdm_filter_configure(adc, adc->fl_id, trig);
> > +	ret = stm32_dfsdm_filter_configure(indio_dev, adc->fl_id, trig);
> >  	if (ret < 0)
> >  		goto stop_channels;
> >  
> > @@ -757,13 +758,14 @@ static int stm32_dfsdm_start_conv(struct
> > stm32_dfsdm_adc *adc,
> >  	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
> >  			   DFSDM_CR1_CFG_MASK, 0);
> >  stop_channels:
> > -	stm32_dfsdm_stop_channel(adc);
> > +	stm32_dfsdm_stop_channel(indio_dev);
> >  
> >  	return ret;
> >  }
> >  
> > -static void stm32_dfsdm_stop_conv(struct stm32_dfsdm_adc *adc)
> > +static void stm32_dfsdm_stop_conv(struct iio_dev *indio_dev)
> >  {
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  
> >  	stm32_dfsdm_stop_filter(adc->dfsdm, adc->fl_id);
> > @@ -771,7 +773,7 @@ static void stm32_dfsdm_stop_conv(struct
> > stm32_dfsdm_adc *adc)
> >  	regmap_update_bits(regmap, DFSDM_CR1(adc->fl_id),
> >  			   DFSDM_CR1_CFG_MASK, 0);
> >  
> > -	stm32_dfsdm_stop_channel(adc);
> > +	stm32_dfsdm_stop_channel(indio_dev);
> >  }
> >  
> >  static int stm32_dfsdm_set_watermark(struct iio_dev *indio_dev,
> > @@ -1017,7 +1019,7 @@ static int __stm32_dfsdm_postenable(struct
> > iio_dev *indio_dev)
> >  		goto stop_dfsdm;
> >  	}
> >  
> > -	ret = stm32_dfsdm_start_conv(adc, indio_dev->trig);
> > +	ret = stm32_dfsdm_start_conv(indio_dev, indio_dev->trig);
> >  	if (ret) {
> >  		dev_err(&indio_dev->dev, "Can't start conversion\n");
> >  		goto err_stop_dma;
> > @@ -1063,7 +1065,7 @@ static void __stm32_dfsdm_predisable(struct
> > iio_dev *indio_dev)
> >  {
> >  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  
> > -	stm32_dfsdm_stop_conv(adc);
> > +	stm32_dfsdm_stop_conv(indio_dev);
> >  
> >  	stm32_dfsdm_adc_dma_stop(indio_dev);
> >  
> > @@ -1159,7 +1161,7 @@ static int stm32_dfsdm_single_conv(struct iio_dev
> > *indio_dev,
> >  
> >  	adc->nconv = 1;
> >  	adc->smask = BIT(chan->scan_index);
> > -	ret = stm32_dfsdm_start_conv(adc, NULL);
> > +	ret = stm32_dfsdm_start_conv(indio_dev, NULL);
> >  	if (ret < 0) {
> >  		regmap_update_bits(adc->dfsdm->regmap, DFSDM_CR2(adc-
> > >fl_id),
> >  				   DFSDM_CR2_REOCIE_MASK,
> > DFSDM_CR2_REOCIE(0));
> > @@ -1180,7 +1182,7 @@ static int stm32_dfsdm_single_conv(struct iio_dev
> > *indio_dev,
> >  	else
> >  		ret = IIO_VAL_INT;
> >  
> > -	stm32_dfsdm_stop_conv(adc);
> > +	stm32_dfsdm_stop_conv(indio_dev);
> >  
> >  	stm32_dfsdm_process_data(adc, res);
> >  
> > @@ -1313,8 +1315,8 @@ static const struct iio_info stm32_dfsdm_info_adc
> > = {
> >  
> >  static irqreturn_t stm32_dfsdm_irq(int irq, void *arg)
> >  {
> > -	struct stm32_dfsdm_adc *adc = arg;
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct iio_dev *indio_dev = arg;
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	struct regmap *regmap = adc->dfsdm->regmap;
> >  	unsigned int status, int_en;
> >  
> > @@ -1574,7 +1576,7 @@ static int stm32_dfsdm_adc_probe(struct
> > platform_device *pdev)
> >  	iio->dev.of_node = np;
> >  	iio->modes = INDIO_DIRECT_MODE;
> >  
> > -	platform_set_drvdata(pdev, adc);
> > +	platform_set_drvdata(pdev, iio);
> >  
> >  	ret = of_property_read_u32(dev->of_node, "reg", &adc->fl_id);
> >  	if (ret != 0 || adc->fl_id >= adc->dfsdm->num_fls) {
> > @@ -1603,7 +1605,7 @@ static int stm32_dfsdm_adc_probe(struct
> > platform_device *pdev)
> >  		return irq;
> >  
> >  	ret = devm_request_irq(dev, irq, stm32_dfsdm_irq,
> > -			       0, pdev->name, adc);
> > +			       0, pdev->name, iio);
> >  	if (ret < 0) {
> >  		dev_err(dev, "Failed to request IRQ\n");
> >  		return ret;
> > @@ -1650,8 +1652,8 @@ static int stm32_dfsdm_adc_probe(struct
> > platform_device *pdev)
> >  
> >  static int stm32_dfsdm_adc_remove(struct platform_device *pdev)
> >  {
> > -	struct stm32_dfsdm_adc *adc = platform_get_drvdata(pdev);
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  
> >  	if (adc->dev_data->type == DFSDM_AUDIO)
> >  		of_platform_depopulate(&pdev->dev);
> > @@ -1663,8 +1665,7 @@ static int stm32_dfsdm_adc_remove(struct
> > platform_device *pdev)
> >  
> >  static int __maybe_unused stm32_dfsdm_adc_suspend(struct device *dev)
> >  {
> > -	struct stm32_dfsdm_adc *adc = dev_get_drvdata(dev);
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> >  
> >  	if (iio_buffer_enabled(indio_dev))
> >  		__stm32_dfsdm_predisable(indio_dev);
> > @@ -1674,8 +1675,8 @@ static int __maybe_unused
> > stm32_dfsdm_adc_suspend(struct device *dev)
> >  
> >  static int __maybe_unused stm32_dfsdm_adc_resume(struct device *dev)
> >  {
> > -	struct stm32_dfsdm_adc *adc = dev_get_drvdata(dev);
> > -	struct iio_dev *indio_dev = iio_priv_to_dev(adc);
> > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > +	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
> >  	const struct iio_chan_spec *chan;
> >  	struct stm32_dfsdm_channel *ch;
> >  	int i, ret;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
