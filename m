Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C76AFF5A
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5C6BC6B47F;
	Wed,  8 Mar 2023 07:00:30 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE036C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 11:36:19 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3276mTum012987; Tue, 7 Mar 2023 05:36:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=qE/pOQbPGtEALzSxE353IyUrRX1F9n9Ysy8nZBmQSQc=;
 b=BAdQO7BrtXVjSf9xdGGSFoLVxW1hRDgjo5WgRaoZXIR+3BCy0F2GOwxcV/KIt/o4V2ev
 /N54nY03WFSJZAB4IZLBHVmiy3quxTji7hx9RFSY8m/qtLNxigYPBbPCDeb8KwpeVEqw
 0JzdeyS7ybpT6amnL2P6LgaLiMEvdmKMTJtZIEwtLVFP5PIKUqboN9/OhSMkl5sz5f94
 ve0lQQVR8BOUUzRPOwn3pSW2K7qgrUG3wyi/7IVyi/5R/tkVQiihxGyVABIaZkcNJ3HO
 mR3bojh0rSOqqHl3vkhF9DNqlApsYA1r3qfpKTyJHWHmokEFfYn416tgH5a38FyBf+je TA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p449742f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:36:03 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 05:36:01 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via
 Frontend Transport; Tue, 7 Mar 2023 05:36:01 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BAA5C45;
 Tue,  7 Mar 2023 11:36:01 +0000 (UTC)
Date: Tue, 7 Mar 2023 11:36:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20230307113601.GV68926@ediswmail.ad.cirrus.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
 <20230306195556.55475-16-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230306195556.55475-16-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: lfMpGTS3UyB_ceFJsXDewKvJ5F4h_XaD
X-Proofpoint-ORIG-GUID: lfMpGTS3UyB_ceFJsXDewKvJ5F4h_XaD
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Doug Berger <opendmb@gmail.com>,
 Nandor Han <nandor.han@ge.com>, Schspa Shi <schspa@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Semi Malinen <semi.malinen@ge.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 15/16] gpio: wm8994: Utilize helpers
 from string_choices.h
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

On Mon, Mar 06, 2023 at 09:55:55PM +0200, Andy Shevchenko wrote:
> There are a few helpers available to convert a boolean variable
> to the dedicated string literals depending on the application.
> Use them in the driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
