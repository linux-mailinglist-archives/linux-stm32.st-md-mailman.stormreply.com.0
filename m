Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D17151E22E0
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 15:25:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8061AC36B21;
	Tue, 26 May 2020 13:25:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B58C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 13:25:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QDHI6K000932; Tue, 26 May 2020 15:25:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=STMicroelectronics;
 bh=xam4h5P921QTvxnY7TQyj2o3qwifx5eAv55dBjp4C04=;
 b=Dy1DtaoAYIH+RD3SVogc5foxz64N5O1fpg5KfbZ7XJOCKlVl7ppwrL7BIYnuShpW6p7h
 JRUcJcZ4hfsyXVSHXJi1x/LRcmFmBgviVor/XOhFaK9u4PrNu/RcmTHSnXo7QCvdCtPD
 DMMnPEg9HqNsZqt8Hfsjpa30aYxzTRubIV/FOmhJ73+O7F1U2i9qYKSHvvRCpGfExp6r
 nrxjgUw1vGtPEwA7WeWg+rokuRQJeJ/parJSER15Kt/iGIbd025W0QKDmMMwb/MEUk+o
 +EbXwCd57ltXwKIJI92bQZPiU5FFIXlkUrUxuVC8gVIeyJv0Bli5uWf8n0OdET+SDMeK Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316tqgym3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 15:25:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFBE810002A;
 Tue, 26 May 2020 15:25:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EC692B6C18;
 Tue, 26 May 2020 15:25:38 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 26 May
 2020 15:25:38 +0200
Date: Tue, 26 May 2020 15:25:36 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <dinghao.liu@zju.edu.cn>
Message-ID: <20200526132536.GH14423@gnbcxd0016.gnb.st.com>
Mail-Followup-To: dinghao.liu@zju.edu.cn, kjlu@umn.edu,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200521070507.13015-1-dinghao.liu@zju.edu.cn>
 <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
 <7548c995.d205f.1725111d7c4.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7548c995.d205f.1725111d7c4.Coremail.dinghao.liu@zju.edu.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
Cc: kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Fix runtime PM imbalance in
 stm32f7_i2c_reg_slave
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

On Tue, May 26, 2020 at 09:00:23PM +0800, dinghao.liu@zju.edu.cn wrote:
> 
> > Overall, there are several other calls to pm_runtime_get_sync within this
> > driver, would you like to fix them all at once ?
> > 
> 
> Sure, I will send a new patch to merge them all.

Thanks, you might want to add a Fixes: tag in your commit message as well.

> 
> > On Thu, May 21, 2020 at 03:05:07PM +0800, Dinghao Liu wrote:
> > > pm_runtime_get_sync() increments the runtime PM usage counter even
> > > the call returns an error code. Thus a pairing decrement is needed
> > > on the error handling path to keep the counter balanced.
> > > 
> > > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > > ---
> > >  drivers/i2c/busses/i2c-stm32f7.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > > index 330ffed011e0..602cf35649c8 100644
> > > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > > @@ -1767,8 +1767,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
> > >  		return ret;
> > >  
> > >  	ret = pm_runtime_get_sync(dev);
> > > -	if (ret < 0)
> > > +	if (ret < 0) {
> > > +		pm_runtime_put_autosuspend(dev);
> > 
> > Considering that if we fail here there is a very good chance that this is due
> > to the resume failing, pm_runtime_put_noidle would probably make more sense
> > since pm_runtime_put_autosuspend will most probably fail as well.
> > 
> 
> Agree. Thank you for your advice!
> 
> Regards.
> Dinghao
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
