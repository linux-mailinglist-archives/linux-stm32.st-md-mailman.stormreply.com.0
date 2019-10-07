Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F24CE117
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2019 14:01:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 700D0C36B0C;
	Mon,  7 Oct 2019 12:01:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B49C8C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 12:01:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97C1ReM019171; Mon, 7 Oct 2019 14:01:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=OEpRCuiUUpuXpVGGrL2q81jRJQBKQeGZCtDBBTVYUIA=;
 b=0Xz1510Od/ISk/HqXDwSoQLNJrii7ylF8vSUb+L1F/bnrtuOiapxTCZJonOoNzkhMrQS
 SWXIjF8oD/O7iPRykelg7o2WoF/2iNoyVNgEKOiKFQvDCf13a5XW374mwV1jE4IJ4FTH
 +tuR7pKpO7b6KSHfhzV/fqE4+5oH1HB/P41nrTT/vOn0OEnlFXUGe1U/bQrpx+VfzJhN
 tAZ39rJnaGcQvbOYjNc0zQRInkLOJktL8j9gOyf3mRM8aop/DWfzBo/p/H3sxhVvJsUD
 DVOPW/BJ4pAdAanLezCd0MZteix0MDAWIqStC+dKCPnoj0/yVmkPgGLlXWnNFFzD+Boa pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2p258j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 14:01:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11CBF100038;
 Mon,  7 Oct 2019 14:01:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06AC32CE74D;
 Mon,  7 Oct 2019 14:01:22 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 7 Oct
 2019 14:01:21 +0200
Date: Mon, 7 Oct 2019 14:01:20 +0200
From: Alain Volmat <alain.volmat@st.com>
To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <20191007120120.GB12773@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Pierre Yves MORDRET <pierre-yves.mordret@st.com>,
 wsa@the-dreams.de, alexandre.torgue@st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
References: <1570200954-17919-1-git-send-email-alain.volmat@st.com>
 <a5093a73-ba62-ae37-10dc-3434c9da40f7@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5093a73-ba62-ae37-10dc-3434c9da40f7@st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Cc: wsa@the-dreams.de, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: remove warning when
	compiling with W=1
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

Hi Pierre-Yves,

thanks for the comments.

On Mon, Oct 07, 2019 at 09:59:22AM +0200, Pierre Yves MORDRET wrote:
> Hi Alain
> 
> Fixes tag is missing in your patch.
> [ i.e ==> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver") ]

Okay, will push a v2 for that.

> 
> Nonetheless patch only consists in removing a comment character ?

Yes, the comment currently starts in a way of a kernel-doc description
(https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation) leading the compiler to produce the warning since there is no
function prototype after the comment.

Regards,
Alain

> 
> Thanks
> 
> On 10/4/19 4:55 PM, Alain Volmat wrote:
> > Remove the following warning:
> > 
> > drivers/i2c/busses/i2c-stm32f7.c:315:
> > warning: cannot understand function prototype:
> > 'struct stm32f7_i2c_spec i2c_specs[] =
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
> > ---
> >  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > index d36cf08..7aa4a47 100644
> > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > @@ -305,7 +305,7 @@ struct stm32f7_i2c_dev {
> >  	struct regmap *regmap;
> >  };
> >  
> > -/**
> > +/*
> >   * All these values are coming from I2C Specification, Version 6.0, 4th of
> >   * April 2014.
> >   *
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
