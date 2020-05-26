Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F71E22C3
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 15:11:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B5B4C36B21;
	Tue, 26 May 2020 13:11:29 +0000 (UTC)
Received: from aliyun-sdnproxy-1.icoremail.net (aliyun-cloud.icoremail.net
 [47.90.88.95])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with SMTP id 92E8BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 13:11:26 +0000 (UTC)
Received: by ajax-webmail-mail-app3 (Coremail) ; Tue, 26 May 2020 21:00:23
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.78.173]
Date: Tue, 26 May 2020 21:00:23 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Alain Volmat" <alain.volmat@st.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
References: <20200521070507.13015-1-dinghao.liu@zju.edu.cn>
 <20200526083400.GC10725@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Message-ID: <7548c995.d205f.1725111d7c4.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDnX0PnEs1eVcoKAA--.2911W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgYMBlZdtOUN1wABsP
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW5GwCS07vEc2IjII80xcxEwVAKI48JMI
 AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY
 6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
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


> Overall, there are several other calls to pm_runtime_get_sync within this
> driver, would you like to fix them all at once ?
> 

Sure, I will send a new patch to merge them all.

> On Thu, May 21, 2020 at 03:05:07PM +0800, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > the call returns an error code. Thus a pairing decrement is needed
> > on the error handling path to keep the counter balanced.
> > 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/i2c/busses/i2c-stm32f7.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > index 330ffed011e0..602cf35649c8 100644
> > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > @@ -1767,8 +1767,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
> >  		return ret;
> >  
> >  	ret = pm_runtime_get_sync(dev);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		pm_runtime_put_autosuspend(dev);
> 
> Considering that if we fail here there is a very good chance that this is due
> to the resume failing, pm_runtime_put_noidle would probably make more sense
> since pm_runtime_put_autosuspend will most probably fail as well.
> 

Agree. Thank you for your advice!

Regards.
Dinghao
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
