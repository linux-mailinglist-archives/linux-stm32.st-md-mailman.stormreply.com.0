Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 744185EA84D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 16:24:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2569DC5EC6B;
	Mon, 26 Sep 2022 14:24:19 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AB1BC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 14:24:17 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MblJc6yfrz1P74b;
 Mon, 26 Sep 2022 22:20:00 +0800 (CST)
Received: from kwepemm000015.china.huawei.com (7.193.23.180) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:24:14 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000015.china.huawei.com (7.193.23.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:24:14 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Mon, 26 Sep 2022 22:24:14 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH -next] ASoC: stm: Fix PM disable depth imbalance in
 stm32_i2s_probe
Thread-Index: AQHY0abuFjw3CB3nU0SvLlv0/xwKZa3xwfcg
Date: Mon, 26 Sep 2022 14:24:14 +0000
Message-ID: <baa8d7791be0479d9bfd9e2f0df779d2@huawei.com>
References: <20220926091439.103839-1-zhangqilong3@huawei.com>
 <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
In-Reply-To: <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] =?utf-8?b?562U5aSNOiBbUEFUQ0ggLW5leHRdIEFTb0M6IHN0?=
 =?utf-8?q?m=3A_Fix_PM_disable_depth_imbalance_in_stm32=5Fi2s=5Fprobe?=
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

> Hello Zhang,
> 
> On 9/26/22 11:14, Zhang Qilong wrote:
> > The pm_runtime_enable will increase power disable depth. Thus a
> > pairing decrement is needed on the error handling path to keep it
> > balanced according to context.
> >
> > Fixes:efc162cbd480f ("ASoC: stm: Use dev_err_probe() helper")
> > Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> > ---
> >  sound/soc/stm/stm32_i2s.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
> > index 6aafe793eec4..5a717443b105 100644
> > --- a/sound/soc/stm/stm32_i2s.c
> > +++ b/sound/soc/stm/stm32_i2s.c
> > @@ -1139,12 +1139,15 @@ static int stm32_i2s_probe(struct
> platform_device *pdev)
> >  	pm_runtime_enable(&pdev->dev);
> >
> >  	ret = snd_dmaengine_pcm_register(&pdev->dev,
> &stm32_i2s_pcm_config, 0);
> > -	if (ret)
> > +	if (ret) {
> > +		pm_runtime_disable(&pdev->dev);
> >  		return dev_err_probe(&pdev->dev, ret, "PCM DMA register
> error\n");
> > +	}
> >
> >  	ret = snd_soc_register_component(&pdev->dev,
> &stm32_i2s_component,
> >  					 i2s->dai_drv, 1);
> >  	if (ret) {
> > +		pm_runtime_disable(&pdev->dev);
> >  		snd_dmaengine_pcm_unregister(&pdev->dev);
> >  		return ret;
> >  	}
> 
> Seems that there the error has been introduced in this commit:
> 32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support") The
> pm_runtime_enable should be at the end of the stm32_i2s_probe as
> done here:
> https://github.com/STMicroelectronics/linux/blob/v5.15-stm32mp/sound/
> soc/stm/stm32_i2s.c#L1200
> 
> Please, could you update your patch in this way?
> With also an update of the "Fixes:" reference in the commit message

Hi,

Very useful guide, and I have send v2 version. In addition, I found several similar problems at the same time and fixed it through a patch set.

Thanks,
Zhang
> 
> Thanks,
> Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
