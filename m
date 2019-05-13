Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766DA1B121
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:28:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26B4BC5AB8B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:28:22 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50135.outbound.protection.outlook.com [40.107.5.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73567C5AB8A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dbTAC//XHrFVIZfXDI+bV77HQpSpYzq9ex1ut4pJcg=;
 b=XckAKA7VFgGqj1+tFvJTSBBlwN5+SpL0VMNfD06Xa0BxSHHOApFtoZGC+5u+clFDuwy5kT/n3ITymFAN8r/34VF6hi4Sk47ihu87FXU1u/P4Kfc3QMh3UFRkcLGXiQ+Y8eOOsyZIKCJtI60IQpfyuyMJguULAPg6KyEItwzzhLQ=
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB3087.eurprd05.prod.outlook.com (10.175.22.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 07:28:18 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 07:28:18 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "jic23@kernel.org" <jic23@kernel.org>
Thread-Topic: [PATCH 4/5] iio: stmpe-adc: Use wait_for_completion_timeout
Thread-Index: AQHVBOJHMVYXdjmHB0653c7vvGs0gKZluzwAgAL12oA=
Date: Mon, 13 May 2019 07:28:17 +0000
Message-ID: <6bc5bf4c854288fae0591f33ea9ae4e5c4091616.camel@toradex.com>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-4-dev@pschenker.ch>
 <20190511111548.504948ae@archlinux>
In-Reply-To: <20190511111548.504948ae@archlinux>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c68ebad4-3e66-4d46-c477-08d6d77491b1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3087; 
x-ms-traffictypediagnostic: VI1PR0502MB3087:
x-microsoft-antispam-prvs: <VI1PR0502MB3087CDD718CE0EBF6AB80807F40F0@VI1PR0502MB3087.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(396003)(39840400004)(376002)(189003)(199004)(6916009)(6116002)(53936002)(478600001)(3846002)(5660300002)(14454004)(6246003)(2501003)(6506007)(91956017)(76116006)(73956011)(66446008)(64756008)(66556008)(66476007)(86362001)(66946007)(316002)(102836004)(486006)(476003)(2616005)(446003)(11346002)(44832011)(99286004)(7736002)(8676002)(81156014)(81166006)(4326008)(2351001)(8936002)(25786009)(305945005)(26005)(6512007)(54906003)(66066001)(76176011)(6486002)(14444005)(229853002)(36756003)(7416002)(68736007)(186003)(71200400001)(71190400001)(256004)(118296001)(5640700003)(2906002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3087;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aLasiDEjj1AmLmwKwpfhyXkxZxO9B8a3A6U3JErB2WuXUw5RLUCfL6vZjRfLTwRqEkwupWe0x3SLFpat2PirX+DeRso2t4rACfDNv3ZcWFfxSLUWpdR5z2Xy0f71DzTDDpLt+Vc3gbk9+RUIw8XBT3bVcJq+Fu3uKf5rjiLlcQe8D76OfFfi7nq4u0gAEQRT6fUcAZkbpI8yHBgGHBTOBYMCFo2UWjIi1hWEeGBgqxZg2OmPqH6036B57wVlLK53A6t/HdXhfNBu0tg/MEQxwmJQpk74SswAlRAOtfFWOarD6rqBUfpb9YrGX2nRyyGYGsZdFwVVmk/mWC+7cdByAiVnWIvBLBI2RNobL7PrnWgc3JAoMepEobow8oC5bZ81xvcrEAGP+Ch3Z7/mXgeUPX7JeXX1QGbwWYpT4Mn4vgQ=
Content-ID: <D331B7B33E79B841B5F2A31D1CE2760E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ebad4-3e66-4d46-c477-08d6d77491b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 07:28:17.9187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3087
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stefan@agner.ch" <stefan@agner.ch>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "David.Laight@ACULAB.COM" <David.Laight@ACULAB.COM>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/5] iio: stmpe-adc: Use
	wait_for_completion_timeout
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

On Sat, 2019-05-11 at 11:15 +0100, Jonathan Cameron wrote:
> On Tue,  7 May 2019 16:36:14 +0200
> Philippe Schenker <dev@pschenker.ch> wrote:
> 
> > From: Philippe Schenker <philippe.schenker@toradex.com>
> > 
> > Use wait_for_completion_timeout instead of
> > wait_for_completion_interuptible_timeout.
> > 
> > The interruptible variant gets constantly interrupted if a user
> > program is compiled with the -pg option.
> > The killable variant was not used due to the fact that a second
> > program, reading on this device, that gets killed is then also killing
> > that wait.
> > 
> > Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Hi Phillippe
> 
> This one clashed a little bit with our earlier patch to remove the
> unnecessary assignment.  I've applied it by hand but please check it.
> 
> Applied to the togreg branch of iio.git and pushed out as testing
> for the autobuilders to play with it.
> 
> Thanks,
> 
> Jonathan

Hmm, yeah I see it sorry for that! Somehow that line went in again in this
patch. Don't know why... Anyway I checked it and it looks good. Thank you!

Philippe

> > ---
> > 
> >  drivers/iio/adc/stmpe-adc.c | 18 ++++--------------
> >  1 file changed, 4 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> > index 82b43e4522b6..cc752a47444c 100644
> > --- a/drivers/iio/adc/stmpe-adc.c
> > +++ b/drivers/iio/adc/stmpe-adc.c
> > @@ -77,17 +77,11 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
> >  	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_CAPT,
> >  			STMPE_ADC_CH(info->channel));
> >  
> > -	*val = info->value;
> > -
> > -	ret = wait_for_completion_interruptible_timeout
> > -		(&info->completion, STMPE_ADC_TIMEOUT);
> > +	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
> >  
> >  	if (ret <= 0) {
> >  		mutex_unlock(&info->lock);
> > -		if (ret == 0)
> > -			return -ETIMEDOUT;
> > -		else
> > -			return ret;
> > +		return -ETIMEDOUT;
> >  	}
> >  
> >  	*val = info->value;
> > @@ -116,15 +110,11 @@ static int stmpe_read_temp(struct stmpe_adc *info,
> >  	stmpe_reg_write(info->stmpe, STMPE_REG_TEMP_CTRL,
> >  			STMPE_START_ONE_TEMP_CONV);
> >  
> > -	ret = wait_for_completion_interruptible_timeout
> > -		(&info->completion, STMPE_ADC_TIMEOUT);
> > +	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
> >  
> >  	if (ret <= 0) {
> >  		mutex_unlock(&info->lock);
> > -		if (ret == 0)
> > -			return -ETIMEDOUT;
> > -		else
> > -			return ret;
> > +		return -ETIMEDOUT;
> >  	}
> >  
> >  	/*
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
