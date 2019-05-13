Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F12C1B11C
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:26:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3395C5AB87
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:26:07 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40104.outbound.protection.outlook.com [40.107.4.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9055BC5AB86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+WWOsVPd9Dp6tLZvTsxCw7EKt6o0f+N1wA3iXlg2IA=;
 b=gJ91pD4/6OVnQszqG6V6i9mWuKWD9j4AyTYEStlTrByWHpnK8hszXEoU3QL2dhUsjHsPkOGDG/a7NOAcF2V9LgoJcrfh+QI3z+kkQLrIufTr67fNvUB2IWOSS9oxYcndAVnJMXS5Rt52szZG+VH4FvqQ7rg307m+sLbbT+jtXRw=
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB3917.eurprd05.prod.outlook.com (52.134.6.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 07:26:03 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 07:26:03 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "jic23@kernel.org" <jic23@kernel.org>
Thread-Topic: [PATCH 2/5] iio: stmpe-adc: Reinit completion struct on begin
 conversion
Thread-Index: AQHVBOJDb7gYXrDpa0WRGQ1Y/cnYSqZluTUAgAL3QgA=
Date: Mon, 13 May 2019 07:26:03 +0000
Message-ID: <ae8a2305c5ab0d312e1334e895a5e7fdb45fbd16.camel@toradex.com>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-2-dev@pschenker.ch>
 <20190511110832.24f58e4a@archlinux>
In-Reply-To: <20190511110832.24f58e4a@archlinux>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 732513a0-321d-4ee3-eecb-08d6d774417c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3917; 
x-ms-traffictypediagnostic: VI1PR0502MB3917:
x-microsoft-antispam-prvs: <VI1PR0502MB39174A9B981E84D16F20C1B6F40F0@VI1PR0502MB3917.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(396003)(39840400004)(199004)(189003)(44832011)(11346002)(186003)(25786009)(53936002)(102836004)(66066001)(6506007)(305945005)(476003)(7416002)(54906003)(2616005)(6512007)(5640700003)(446003)(14454004)(3846002)(6116002)(486006)(14444005)(256004)(26005)(6246003)(8676002)(478600001)(316002)(4326008)(81156014)(81166006)(71190400001)(71200400001)(6916009)(8936002)(2906002)(7736002)(2351001)(118296001)(76176011)(76116006)(66556008)(73956011)(66946007)(66476007)(91956017)(68736007)(64756008)(66446008)(36756003)(6436002)(2501003)(5660300002)(99286004)(6486002)(229853002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3917;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 24T+fq6093mvx2S5Yn8gx40DBe9+R7nUnbKqVMNOwvAg+/FPWW4RnWNdNuyvBEKo5pkxLfhYJb3Rw5eeoKpMVC7qep785vBGJ0qKLQjUFMFBGn0venqvYN/8Ssl9gXyFmraoA0VVHHO7b/M3ZRiCJCthQNo5SrE4RuIIpSqmWzOU71rwsAou383a5TrJVKAsj2B4UI0Oqo75T0+nIpQXbhb0Z223V36ZFT4IzMWp0zqqxr8THeikmVLc7X/nRKCzCPYPrUCrZb5naDRKHmoVpSMn6OTcyIrGGbHPfuUgQx8SeLxy51LK+PmiWWnqRt6TFZ9NiZ9ZRPGdgVntLwtScSs0H7bbn4bZtoMV+f/wJHRtH055fSaZpCv8EqqYBvWR7OEg97bkLdYfK5HrHcYIoZ9CxpoXT1WZNKm8HsHhJU8=
Content-ID: <D521BDBCFF93BF4AA6C08DB679517BE2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732513a0-321d-4ee3-eecb-08d6d774417c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 07:26:03.3097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3917
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
Subject: Re: [Linux-stm32] [PATCH 2/5] iio: stmpe-adc: Reinit completion
 struct on begin conversion
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

On Sat, 2019-05-11 at 11:08 +0100, Jonathan Cameron wrote:
> On Tue,  7 May 2019 16:36:12 +0200
> Philippe Schenker <dev@pschenker.ch> wrote:
> 
> > From: Philippe Schenker <philippe.schenker@toradex.com>
> > 
> > In some cases, the wait_completion got interrupted. This caused the
> > error-handling to mutex_unlock the function. The before turned on
> > interrupt then got called anyway. In the ISR then completion() was
> > called causing wrong adc-values returned in a following adc-readout.
> > 
> > Reinitialise completion struct to make sure the counter is zero
> > when beginning a new adc-conversion.
> > 
> > Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Hi Philippe, 
> 
> To me this looks like a fix that we should consider applying to stable.
> However, as it is in the middle of this series I'm not going to take
> it via the fast route (during rc's). If people want to backport it
> they will have to wait until after the next merge window.
> If anyone has an urgent need, then shout in the next week and I'll
> pull this version out and we can restructure the set.
> 
> Applied to the togreg branch of iio.git and pushed out as testing
> for the autobuilders to play with it.
> 
> Thanks,
> 
> Jonathan

Hi Jonathan! I don't think that's necessary. As long as it gets into stable at
some point. Our customer use downstream anyway. Where I'm about to apply it now.

Thanks,
Philippe
> 
> > ---
> > 
> >  drivers/iio/adc/stmpe-adc.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> > index 9ec338ba3440..b3872eb37293 100644
> > --- a/drivers/iio/adc/stmpe-adc.c
> > +++ b/drivers/iio/adc/stmpe-adc.c
> > @@ -65,6 +65,8 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
> >  
> >  	mutex_lock(&info->lock);
> >  
> > +	reinit_completion(&info->completion);
> > +
> >  	info->channel = (u8)chan->channel;
> >  
> >  	if (info->channel > STMPE_ADC_LAST_NR) {
> > @@ -105,6 +107,8 @@ static int stmpe_read_temp(struct stmpe_adc *info,
> >  
> >  	mutex_lock(&info->lock);
> >  
> > +	reinit_completion(&info->completion);
> > +
> >  	info->channel = (u8)chan->channel;
> >  
> >  	if (info->channel != STMPE_TEMP_CHANNEL) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
