Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA727CD37
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Sep 2020 14:42:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B126BC36B37;
	Tue, 29 Sep 2020 12:42:49 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34351C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Sep 2020 12:42:48 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTVhK162323;
 Tue, 29 Sep 2020 12:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ooQL/jdNK5E0bwGTZMVh9gDWLUQ2nvmJK92rRekHYUQ=;
 b=fbDsT6lWzQ+ORM5K3s5HbTh37q+P1z9c+/B6RQ4VQx7oLjM2gwzIeE8N0TK9/h4MlugJ
 VmZKpujw7s9mQJMKXROtdkaJX+/M40fG89wb5M/Eb5lfOuzm6ifBoSQMNa1ZDYLDy96Q
 N5FurL2lN7UYjwYGf1sjjyvRX87rPwj+KMvYkCQLizmlU/Ua4y+pfB0M4iK5IHDAfOby
 Hommc306kBsy4enPQXLV0Mli3U5nB0z5aegJtQ2KWz1ehAOh7di/nh/mvWIUPuCzfgWZ
 mEbkR9polc8Mr77IP2HqyemXrTNGhtvRUKntBy9kx5+xTdBCZUmB2KCW9Fcu9Ddd4fTT HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 33swkktdv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 12:41:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TCTjQh051184;
 Tue, 29 Sep 2020 12:41:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 33tfjwmsb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 12:41:27 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08TCfLK3017010;
 Tue, 29 Sep 2020 12:41:21 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Sep 2020 05:41:20 -0700
Date: Tue, 29 Sep 2020 15:41:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20200929124108.GY4282@kadam>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=942 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=966 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290111
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Joe Perches <joe@perches.com>, openipmi-developer@lists.sourceforge.net
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
 to separate statements
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

On Tue, Sep 29, 2020 at 02:20:00PM +0200, Ard Biesheuvel wrote:
> On Sun, 27 Sep 2020 at 21:56, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> >
> > These patches replace commas by semicolons.
> 
> 
> Why?
> 

In the best case, these commas are just uninitentional mess, like typing
an extra space character or something.  I've looked at them before and
one case I see where they are introduced is when people convert a
struct initializer to code.

-	struct foo {
-		.a = 1,
-		.b = 2,
 		...
+	foo.a = 1,
+	foo.b = 2,

The times where commas are used deliberately to replace curly braces are
just evil.  Either way the code is cleaner with semi-colons.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
