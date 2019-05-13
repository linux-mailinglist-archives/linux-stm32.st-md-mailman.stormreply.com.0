Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E71B173
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:47:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5B2AC5B649
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:47:18 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80118.outbound.protection.outlook.com [40.107.8.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56E57C5B648
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Idj7L7lGUdG6n77DQwKx3XrrWz8l64DyegcDCLArJRg=;
 b=k8ZJK1puhabwPXvMuG8nd3S5IhfCJ7VwOf2RhMKYpPKr36NE+x9T6YtOsfYMkPqXTzpqyylI/ERwdfYERvCRtnGPbETc4SAmY7JEyQyP47fFcp1Bl2AAS5iwO6sITuj4Ml/cKunLwseuEdV/DiYSLccHvaRLGUAs3Tld9OFQsKU=
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com (52.134.17.157) by
 VI1PR0502MB2957.eurprd05.prod.outlook.com (10.175.21.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 07:47:14 +0000
Received: from VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571]) by VI1PR0502MB3965.eurprd05.prod.outlook.com
 ([fe80::48ff:f344:98da:6571%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 07:47:14 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "jic23@kernel.org" <jic23@kernel.org>
Thread-Topic: [PATCH 5/5] iio: stmpe-adc: Reset possible interrupts
Thread-Index: AQHVBOJDlcfa27rPFkC6CK5LLhcgfqZlvamAgAL4uYA=
Date: Mon, 13 May 2019 07:47:14 +0000
Message-ID: <b2cb0c244d95d1e1e267c75eb40045b7a3cee6d1.camel@toradex.com>
References: <20190507143615.28477-1-dev@pschenker.ch>
 <20190507143615.28477-5-dev@pschenker.ch>
 <20190511112429.25ddd84d@archlinux>
In-Reply-To: <20190511112429.25ddd84d@archlinux>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=philippe.schenker@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82491514-95af-4da6-b44b-08d6d77736f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0502MB2957; 
x-ms-traffictypediagnostic: VI1PR0502MB2957:
x-microsoft-antispam-prvs: <VI1PR0502MB2957448724AAEF9B4AF4CB87F40F0@VI1PR0502MB2957.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(39840400004)(396003)(376002)(189003)(199004)(476003)(486006)(53936002)(446003)(2616005)(11346002)(4326008)(6246003)(64756008)(6916009)(6512007)(118296001)(91956017)(66946007)(66476007)(66556008)(73956011)(2501003)(66446008)(76116006)(5640700003)(6506007)(6436002)(54906003)(26005)(102836004)(6486002)(76176011)(99286004)(86362001)(7736002)(305945005)(229853002)(316002)(7416002)(8676002)(81166006)(81156014)(8936002)(256004)(36756003)(14444005)(71200400001)(71190400001)(2351001)(186003)(6116002)(3846002)(44832011)(5660300002)(25786009)(2906002)(66066001)(478600001)(14454004)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB2957;
 H:VI1PR0502MB3965.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 61JyQFfRSPT/OTeNvYQXkW5F9uBqgDwP89pq7O/zUWbGF23O6knRzBLCRfrl52zT0unDq32pQJTbVxv25AZI6C6NV//jjvdV6RrIVNYR7dTWp6vQTxLRCI9ad9OHpisA95D+pAVPoRJdUp68KiG03xy5diAMYohObi4w04RgutY4dppz8EamDVVCPcuvgTd0IS6YtQAJeus+fGUACzVOeHOtJRPNswb+S+/iyot6m3F5KxmJy0lXDv6I2luqP7JCnbMjFmLRVstwsilmy9/HhD3lCna1RrSfT6phW/d9RZNSWKN+OrBrsMhGa0GI5T3AZIUH53ACqfwjk04ySiFSiuKqSIxjhhbwtmICDQ1G7i3jKySXac+x6WxdaSaVRN1SJ5K4ZdV5ZLD9w/n6zZ2B/8ASpFguRFsmTjzSGwm8n2U=
Content-ID: <01947B48A97B014CA10C2DC0D37BDAF9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82491514-95af-4da6-b44b-08d6d77736f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 07:47:14.1393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB2957
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
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: stmpe-adc: Reset possible
	interrupts
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

On Sat, 2019-05-11 at 11:24 +0100, Jonathan Cameron wrote:
> On Tue,  7 May 2019 16:36:15 +0200
> Philippe Schenker <dev@pschenker.ch> wrote:
> 
> > From: Philippe Schenker <philippe.schenker@toradex.com>
> > 
> > Clear any interrupt that still is on the device on every channel
> > this driver is activated for in probe and specific channels in
> > the timeout handler.
> > 
> > Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> I'm never particularly clean on blanket resets as they do tend to
> hide bugs. However, the probe one is something that would happen anyway
> if there was a 'reset' function.
> 
> Applied to the togreg branch of iio.git and pushed out as testing
> for the autobuilders to play with it.
> 
> Thanks,
> 
> Jonathan

You're right about hiding bugs. But if the interrupt for whatever (hardware?)
reason does not occur, it prevents further interrupts as it does not get reset.

So this reset takes care that after a timeout one is still able to read out the
ADC.

Philippe

> 
> > ---
> > 
> >  drivers/iio/adc/stmpe-adc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
> > index cc752a47444c..a5990e9f2c80 100644
> > --- a/drivers/iio/adc/stmpe-adc.c
> > +++ b/drivers/iio/adc/stmpe-adc.c
> > @@ -80,6 +80,8 @@ static int stmpe_read_voltage(struct stmpe_adc *info,
> >  	ret = wait_for_completion_timeout(&info->completion, STMPE_ADC_TIMEOUT);
> >  
> >  	if (ret <= 0) {
> > +		stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_STA,
> > +				STMPE_ADC_CH(info->channel));
> >  		mutex_unlock(&info->lock);
> >  		return -ETIMEDOUT;
> >  	}
> > @@ -326,6 +328,9 @@ static int stmpe_adc_probe(struct platform_device *pdev)
> >  	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_EN,
> >  			~(norequest_mask & 0xFF));
> >  
> > +	stmpe_reg_write(info->stmpe, STMPE_REG_ADC_INT_STA,
> > +			~(norequest_mask & 0xFF));
> > +
> >  	return devm_iio_device_register(&pdev->dev, indio_dev);
> >  }
> >  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
