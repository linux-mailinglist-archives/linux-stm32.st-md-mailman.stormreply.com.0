Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31C1E0D2C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 13:31:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 864F1C36B24;
	Mon, 25 May 2020 11:31:17 +0000 (UTC)
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59460C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 11:31:15 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PBUBES011495; Mon, 25 May 2020 07:30:53 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0b-00128a01.pphosted.com with ESMTP id 3170f7vx0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 07:30:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dctKRFm6b+eaNS8zGPgkEGp6gmDmz03mvK2rI2gj6HAG2TOqfW/ppGAp9U/b9eNEAjEIwLDaW9RoFxycS0kdlscz4FriAAwlvbox7wQgwKJjMzaXT/rSQFVy8SUC82cEt7jdvFVb3h3QyBTOo+td9letrOJU338NLUUG3roFTsgTQa1/oJ+bFHdkZRoboOiCmUovGyWjwax1BHaAF63lSt4aUIvkPe4QaU5S437oE5KHmhODrLMIGS9MXavEIAaYPN1/nXKEMtw/k6jkxWGCDJBpZsPBHWhuKY1kDMZF9Xc4bquj9nwkmOsLRwNbhaFJzf5ifyNA9wLSAIg+GAvw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL3rHVCcVmWswJ7BHYh5oz+3GkoH2xwcbBB9dpD/au4=;
 b=jiUb4WiOZgX7CsK3o03ZzqfEpll17Xe6op57euU5K4oUC1YLBWDWE8shMnGPZLJSsIXOjxIXWVYhHrU8a2cLaVmzTJYLkHoshIv9H/wrR8UOczy0C8uYjvgDsPZxlKUbRRcqkXtFNG8ttfEk/3JZIBzobuoemt4YWGGfwNR6XTALSTVvATkWK1tbIN0Fd5DJijKmBfpAW9fj8tD3dkCgb9EVNgpEFU8sqbFWBNcKTtsYKgt7EFbokpA3/SmFU8dt3K8KCtLBvNkH05XpAP8IvdDuOv5hg0qvMp6ty++JK3wcwOMeOi1op6I8+gJuo+Rnoa540qGjO8yJLt2RiaU+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL3rHVCcVmWswJ7BHYh5oz+3GkoH2xwcbBB9dpD/au4=;
 b=YIcdPaPM9l0KNwzmB+A3JQ9DoTn7XNtAfs4YkXVg53PMtZuXLPhWyHlbsWHVpfnOEB89UwxVmOmoUAMsmvAbrJHBKdR2Yk736p6QszsF5iixBkX7RbdV82Zk42TnIWmzPHQ0tIYHh0rTMBjDyvjmgjXZyRQ73rBD3kaLvGr1VVk=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB5340.namprd03.prod.outlook.com (2603:10b6:5:24d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Mon, 25 May
 2020 11:30:50 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::e02f:b3c0:d1e9:5eaf%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 11:30:50 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: "jic23@kernel.org" <jic23@kernel.org>
Thread-Topic: [PATCH 3/3] iio: remove
 iio_triggered_buffer_postenable()/iio_triggered_buffer_predisable()
Thread-Index: AQHWMCZKLt3OeVqlw0aF7gKX7H9J1ai3QOwAgAFuswA=
Date: Mon, 25 May 2020 11:30:50 +0000
Message-ID: <750e0a27a053fc43319f06971063fd0101e9d6ee.camel@analog.com>
References: <20200522104632.517470-1-alexandru.ardelean@analog.com>
 <20200522104632.517470-3-alexandru.ardelean@analog.com>
 <20200524143830.11c2d97e@archlinux>
In-Reply-To: <20200524143830.11c2d97e@archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 615bb5ae-96bf-43bb-ad4e-08d8009f140a
x-ms-traffictypediagnostic: DM6PR03MB5340:
x-microsoft-antispam-prvs: <DM6PR03MB5340489B01E04CACF6AC7F80F9B30@DM6PR03MB5340.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VOFw5zjeKdIAhdfbjM9RBqzVn8aWEo46PzwT2cAKMWhfVFdd9YGjBbK/00n/rvdfiKyt6TqzP2uM81idFGrb3ozevsLdUtEmaFzvRwg8+dbmZtfzwj7XRR7C/rVoEpecUBr9lJ3G3OUqGY0HbFY00KHFIL7Ec/cQO9L/WMnP3eouEFEO0Jo0CA8NFZe5V4hW6iE8y62RM31G0O6zzLLOKT4weiDDHnBNLXt9/xZu2vIgkcR9z/DvhSXRSxLmxiJajvZIO95ReeTfiDPhg1FQ5N/bSSZZ4BXRFRFO9Y25N0jKCKxb4wCPnWTKBNG2Vv/dsXMInD7rqQ83vckedqsHUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(136003)(376002)(39860400002)(346002)(6486002)(8676002)(7416002)(186003)(66476007)(26005)(66446008)(8936002)(76116006)(5660300002)(36756003)(91956017)(66946007)(66556008)(2616005)(64756008)(4326008)(86362001)(2906002)(54906003)(6512007)(6916009)(316002)(71200400001)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: CTyOwtHFMEMM2PFtT0CBxpXAJGH0fIOMhMp4NU4F0wPrIdnZct2zGpHPJhKedkEaW/OTOXd6iJKdCD+OPa6gG4oBytGOub1UFDCxrxZc+xC+OsI5FFCHBn1QH8B3D1KMb/Kl9Rij/fl64cbC+Oo7c7SxYC4iK4juHqFDICT9tFyQdPdpJf9szH9GljIqg+8sl5xtXxvd9to20VOg5VckbKpLm443CNyueYMULWRDT+CePPYJOjMjxIsbCVLBNP9grk08RlpD/KvC40GDUbVfhLqNTMNvt9HbSlsQ9Tni0fGZ+0UlZHya8fsNsacxtVG2wKBgnSljnEJayupMN2HmunPHszrfnG9SllccfevyhqGWfBzP7TV2SkNdQxKGJCZHWUtO2X+6bNSeICZWjBEj7dRKkHCaV744L26mhtCYmITIpEXDZSkOF5P6GxIY6u1A/TwvANbmu123nQ2ukUnOYMtT+BqVKclauCL93/79DSE=
x-ms-exchange-transport-forked: True
Content-ID: <43C1FAE6047AA64599DD2083361C7D58@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615bb5ae-96bf-43bb-ad4e-08d8009f140a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 11:30:50.8119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZlDmf35ZuuCqm8LyrjtM01o05bzU8iZ52Z+sJoEkTSv1VUF0UeuCl30HlWyTkyiru/CERasEPRCsasFrxzM8Kbj85bXPPMOYfunPcNQ9SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_05:2020-05-25,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 cotscore=-2147483648
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005250089
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
Subject: Re: [Linux-stm32] [PATCH 3/3] iio: remove
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

On Sun, 2020-05-24 at 14:38 +0100, Jonathan Cameron wrote:
> [External]
> 
> On Fri, 22 May 2020 13:46:32 +0300
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
> 
> Yeah!  Didn't realise you'd finally gotten to the end of your mammoth rework
> leading to this.
> 
> A few really minor things inline to tidy up.

Will fix these and send a V2.

> 
> Thanks,
> 
> Jonathan
> 
>  
> > diff --git a/drivers/iio/accel/st_accel_buffer.c
> > b/drivers/iio/accel/st_accel_buffer.c
> > index b5c814ef1637..c87f9a7d2453 100644
> > --- a/drivers/iio/accel/st_accel_buffer.c
> > +++ b/drivers/iio/accel/st_accel_buffer.c
> > @@ -33,13 +33,9 @@ static int st_accel_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  {
> >  	int err;
> >  
> > -	err = iio_triggered_buffer_postenable(indio_dev);
> > -	if (err < 0)
> > -		return err;
> > -
> >  	err = st_sensors_set_axis_enable(indio_dev, indio_dev-
> > >active_scan_mask[0]);
> >  	if (err < 0)
> > -		goto st_accel_buffer_predisable;
> > +		return err;
> >  
> >  	err = st_sensors_set_enable(indio_dev, true);
> >  	if (err < 0)
> > @@ -49,8 +45,6 @@ static int st_accel_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  
> >  st_accel_buffer_enable_all_axis:
> >  	st_sensors_set_axis_enable(indio_dev, ST_SENSORS_ENABLE_ALL_AXIS);
> > -st_accel_buffer_predisable:
> > -	iio_triggered_buffer_predisable(indio_dev);
> >  	return err;
> >  }
> >  
> > @@ -60,12 +54,10 @@ static int st_accel_buffer_predisable(struct iio_dev
> > *indio_dev)
> >  
> >  	err = st_sensors_set_enable(indio_dev, false);
> >  	if (err < 0)
> > -		goto st_accel_buffer_predisable;
> > -
> > -	err = st_sensors_set_axis_enable(indio_dev, ST_SENSORS_ENABLE_ALL_AXIS);
> > +		return err;
> >  
> > -st_accel_buffer_predisable:
> > -	err2 = iio_triggered_buffer_predisable(indio_dev);
> > +	err2 = st_sensors_set_axis_enable(indio_dev,
> > +					  ST_SENSORS_ENABLE_ALL_AXIS);
> >  	if (!err)
> I don't think you can get here with err set.
> >  		err = err2;
> >  
> 
> ...
>   
> > diff --git a/drivers/iio/gyro/st_gyro_buffer.c
> > b/drivers/iio/gyro/st_gyro_buffer.c
> > index 9c92ff7a82be..7b86502d5da3 100644
> > --- a/drivers/iio/gyro/st_gyro_buffer.c
> > +++ b/drivers/iio/gyro/st_gyro_buffer.c
> > @@ -33,13 +33,9 @@ static int st_gyro_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  {
> >  	int err;
> >  
> > -	err = iio_triggered_buffer_postenable(indio_dev);
> > -	if (err < 0)
> > -		return err;
> > -
> >  	err = st_sensors_set_axis_enable(indio_dev, indio_dev-
> > >active_scan_mask[0]);
> >  	if (err < 0)
> > -		goto st_gyro_buffer_predisable;
> > +		return err;
> >  
> >  	err = st_sensors_set_enable(indio_dev, true);
> >  	if (err < 0)
> > @@ -49,8 +45,6 @@ static int st_gyro_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  
> >  st_gyro_buffer_enable_all_axis:
> >  	st_sensors_set_axis_enable(indio_dev, ST_SENSORS_ENABLE_ALL_AXIS);
> > -st_gyro_buffer_predisable:
> > -	iio_triggered_buffer_predisable(indio_dev);
> >  	return err;
> >  }
> >  
> > @@ -59,13 +53,8 @@ static int st_gyro_buffer_predisable(struct iio_dev
> > *indio_dev)
> >  	int err, err2;
> >  
> >  	err = st_sensors_set_enable(indio_dev, false);
> > -	if (err < 0)
> > -		goto st_gyro_buffer_predisable;
> 
> Previously we didn't bother trying to carry on if this failed. I don't think
> we
> should start doing so now.
> 
> > -
> > -	err = st_sensors_set_axis_enable(indio_dev, ST_SENSORS_ENABLE_ALL_AXIS);
> >  
> > -st_gyro_buffer_predisable:
> > -	err2 = iio_triggered_buffer_predisable(indio_dev);
> > +	err2 = st_sensors_set_axis_enable(indio_dev,
> > ST_SENSORS_ENABLE_ALL_AXIS);
> >  	if (!err)
> >  		err = err2;
> >  
> 
> ...
> 
> > diff --git a/drivers/iio/light/gp2ap020a00f.c
> > b/drivers/iio/light/gp2ap020a00f.c
> > index 070d4cd0cf54..29d7af33efa1 100644
> > --- a/drivers/iio/light/gp2ap020a00f.c
> > +++ b/drivers/iio/light/gp2ap020a00f.c
> > @@ -1390,12 +1390,6 @@ static int gp2ap020a00f_buffer_postenable(struct
> > iio_dev *indio_dev)
> >  
> >  	mutex_lock(&data->lock);
> I guess it doesn't matter, but no idea why this was ever under the local lock!
> 
> >  
> > -	err = iio_triggered_buffer_postenable(indio_dev);
> > -	if (err < 0) {
> > -		mutex_unlock(&data->lock);
> > -		return err;
> > -	}
> > -
> >  	/*
> >  	 * Enable triggers according to the scan_mask. Enabling either
> >  	 * LIGHT_CLEAR or LIGHT_IR scan mode results in enabling ALS
> > @@ -1430,8 +1424,6 @@ static int gp2ap020a00f_buffer_postenable(struct
> > iio_dev *indio_dev)
> >  		err = -ENOMEM;
> >  
> >  error_unlock:
> > -	if (err < 0)
> > -		iio_triggered_buffer_predisable(indio_dev);
> >  	mutex_unlock(&data->lock);
> >  
> >  	return err;
> > @@ -1465,8 +1457,6 @@ static int gp2ap020a00f_buffer_predisable(struct
> > iio_dev *indio_dev)
> >  	if (err == 0)
> >  		kfree(data->buffer);
> >  
> > -	iio_triggered_buffer_predisable(indio_dev);
> > -
> >  	mutex_unlock(&data->lock);
> >  
> >  	return err;
>   
> ...
> 
> > diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> > index 2a4b3d331055..0fee767af026 100644
> > --- a/drivers/iio/light/vcnl4000.c
> > +++ b/drivers/iio/light/vcnl4000.c
> > @@ -957,29 +957,20 @@ static int vcnl4010_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  	int ret;
> >  	int cmd;
> >  
> > -	ret = iio_triggered_buffer_postenable(indio_dev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/* Do not enable the buffer if we are already capturing events. */
> > -	if (vcnl4010_is_in_periodic_mode(data)) {
> > -		ret = -EBUSY;
> > -		goto end;
> > -	}
> > +	if (vcnl4010_is_in_periodic_mode(data))
> > +		return -EBUSY;
> >  
> >  	ret = i2c_smbus_write_byte_data(data->client, VCNL4010_INT_CTRL,
> >  					VCNL4010_INT_PROX_EN);
> >  	if (ret < 0)
> > -		goto end;
> > +		return ret;
> >  
> >  	cmd = VCNL4000_SELF_TIMED_EN | VCNL4000_PROX_EN;
> > +	
> >  	ret = i2c_smbus_write_byte_data(data->client, VCNL4000_COMMAND, cmd);
> >  	if (ret < 0)
> > -		goto end;
> > -
> > -	return 0;
> > -end:
> > -	iio_triggered_buffer_predisable(indio_dev);
> > +		i2c_smbus_write_byte_data(data->client, VCNL4010_INT_CTRL, 0);
> >  
> >  	return ret;
> >  }
> > @@ -987,18 +978,14 @@ static int vcnl4010_buffer_postenable(struct iio_dev
> > *indio_dev)
> >  static int vcnl4010_buffer_predisable(struct iio_dev *indio_dev)
> >  {
> >  	struct vcnl4000_data *data = iio_priv(indio_dev);
> > -	int ret, ret_disable;
> > +	int ret, ret2;
> >  
> >  	ret = i2c_smbus_write_byte_data(data->client, VCNL4010_INT_CTRL, 0);
> > -	if (ret < 0)
> > -		goto end;
> >  
> > -	ret = i2c_smbus_write_byte_data(data->client, VCNL4000_COMMAND, 0);
> > +	ret2 = i2c_smbus_write_byte_data(data->client, VCNL4000_COMMAND, 0);
> 
> hmm. This does change the flow a tiny bit.   I wonder if we really
> care about carrying on if we get an error on the first write?
> We are device not responding territory at that point.   Maybe just return
> immediately and avoid the dance with the two ret variables?
> 
> >  
> > -end:
> > -	ret_disable = iio_triggered_buffer_predisable(indio_dev);
> >  	if (ret == 0)
> > -		ret = ret_disable;
> > +		ret = ret2;
> >  
> >  	return ret;
> >  }
> 
> ...
>   
> >  static const struct iio_buffer_setup_ops st_press_buffer_setup_ops = {
> > diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
> > index 37fe851f89af..e082ad007b22 100644
> > --- a/drivers/iio/pressure/zpa2326.c
> > +++ b/drivers/iio/pressure/zpa2326.c
> > @@ -1240,12 +1240,7 @@ static int zpa2326_preenable_buffer(struct iio_dev
> > *indio_dev)
> >  static int zpa2326_postenable_buffer(struct iio_dev *indio_dev)
> >  {
> >  	const struct zpa2326_private *priv = iio_priv(indio_dev);
> > -	int                           err;
> > -
> > -	/* Plug our own trigger event handler. */
> > -	err = iio_triggered_buffer_postenable(indio_dev);
> > -	if (err)
> > -		goto err;
> > +	int                           err = 0;
> >  
> >  	if (!priv->waken) {
> >  		/*
> > @@ -1254,7 +1249,7 @@ static int zpa2326_postenable_buffer(struct iio_dev
> > *indio_dev)
> >  		 */
> >  		err = zpa2326_clear_fifo(indio_dev, 0);
> >  		if (err)
> > -			goto err_buffer_predisable;
> > +			goto out;
> >  	}
> >  
> >  	if (!iio_trigger_using_own(indio_dev) && priv->waken) {
> > @@ -1264,14 +1259,10 @@ static int zpa2326_postenable_buffer(struct iio_dev
> > *indio_dev)
> >  		 */
> >  		err = zpa2326_config_oneshot(indio_dev, priv->irq);
> >  		if (err)
> > -			goto err_buffer_predisable;
> > +			goto out;
> >  	}
> >  
> > -	return 0;
> > -
> > -err_buffer_predisable:
> > -	iio_triggered_buffer_predisable(indio_dev);
> > -err:
> > +out:
> >  	zpa2326_err(indio_dev, "failed to enable buffering (%d)", err);
> 
> Doesn't this now print the error in the good path?
> 
> Probably still want the return 0.   It's a bit messier but I'd
> just move the prints into the error paths and return directly from
> each.   Will be cleaner code that this.
> 
> 
> >  
> >  	return err;
> > @@ -1287,7 +1278,6 @@ static int zpa2326_postdisable_buffer(struct iio_dev
> > *indio_dev)
> >  static const struct iio_buffer_setup_ops zpa2326_buffer_setup_ops = {
> >  	.preenable   = zpa2326_preenable_buffer,
> >  	.postenable  = zpa2326_postenable_buffer,
> > -	.predisable  = iio_triggered_buffer_predisable,
> >  	.postdisable = zpa2326_postdisable_buffer
> >  };
> >  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
