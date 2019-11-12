Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B58F9885
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2019 19:22:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B35C36B0B;
	Tue, 12 Nov 2019 18:22:47 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B767BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 18:22:44 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l24so12372746pgh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eN2ydQIW1tC0Y5Z0139/3auQ6iVhazzk9qa2dg7E35A=;
 b=MWBU2TrWEjnv7/l1uY+2LGCdf2/o3Ps8RrNThkke2K6F5E2Kd7kAIELZvATtRT5rpo
 44FXpxsAjez8dSk53I99VA17eLO+/DHGY2TcyBtnlWFy55VrQ8bW5P4CmBQULXQ6Jyz/
 qAVTlGOcsac833IhAMBPJ2Aj/vcOobVMXUx/Vl77MUJlBY7ePRdUfWqHzPb+odViVwwv
 ILKi2oqNsZ+N92V9GB9awn5VUVN+kraXUpzEzLJQcj5osoE1MSaLog1Kqzec9YdnZSMj
 aqNP8LjsnUfceLLGOd7VirMYcn8Yryhe5YAqX+dmewAnlGkPHMt11OrG/hihxNrexAme
 4Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eN2ydQIW1tC0Y5Z0139/3auQ6iVhazzk9qa2dg7E35A=;
 b=mjiIx0b5Z8BmGIfdlsKxeC97pboJxOjlQHJNYACOpR8QEVPri+Jk0K9Bfmr8ugwnD8
 gLJkb0TyiTsP+rUMW1mRS65xyeqFeM2hEWdyCm3KZ8joS876ECNwT7c+7J4XIviVX74a
 lci0ZMdEQ07JJubdRr07wzq41J/SpU+ieue7c4j0jtG5cMldLXY06w1GxPWHFHS8/Ng9
 BedQWSthn78w7lPuJeqiMz1KGTunWWG1u9o2V2upMrVry1XuyNzLIlCQ5M6u9CPvbAsx
 P1CwGSqoUCK/0X4BR0h5GLvMeoQlE3uhp+gEO5AtsFUS7b1uUx/1QCqumgfiDYOtNMK7
 uwhQ==
X-Gm-Message-State: APjAAAUPLBTxu26LS0aJn/aHguisT4UUOUC+ycinqE6t0jq7dpvlx6u8
 Vs1kn/1TUQIQDuMlLlmr6b3luQ==
X-Google-Smtp-Source: APXvYqyNFBPp/s1UwzZ90jSmHOfBQDutaWu+vqexmr5bu/ksMtz7nUUVT9E1TsDpGP8PNhA0IjGiIw==
X-Received: by 2002:a17:90a:2470:: with SMTP id
 h103mr8728391pje.12.1573582962818; 
 Tue, 12 Nov 2019 10:22:42 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id e24sm3139075pjt.18.2019.11.12.10.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 10:22:42 -0800 (PST)
Date: Tue, 12 Nov 2019 10:22:39 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien DESSENNE <fabien.dessenne@st.com>
Message-ID: <20191112182239.GA21530@yoga>
References: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
 <20191111220416.GB3108315@builder>
 <392808fa-1504-233f-234b-0cca21886c17@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <392808fa-1504-233f-234b-0cca21886c17@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: stm32: fix probe error case
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

On Tue 12 Nov 06:09 PST 2019, Fabien DESSENNE wrote:

> Hi Bjorn,
> 
> 
> On 11/11/2019 11:04 PM, Bjorn Andersson wrote:
> > On Mon 07 Oct 00:39 PDT 2019, Fabien Dessenne wrote:
> >
> >> If the rproc driver is probed before the mailbox driver and if the rproc
> >> Device Tree node has some mailbox properties, the rproc driver probe
> >> shall be deferred instead of being probed without mailbox support.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >> Changes since v1: test IS_ERR() before checking PTR_ERR()
> >> ---
> >>   drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
> >>   1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> >> index 2cf4b29..a507332 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
> >>   	}
> >>   };
> >>   
> >> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> >> +static int stm32_rproc_request_mbox(struct rproc *rproc)
> >>   {
> >>   	struct stm32_rproc *ddata = rproc->priv;
> >>   	struct device *dev = &rproc->dev;
> >> @@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
> >>   
> >>   		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
> >>   		if (IS_ERR(ddata->mb[i].chan)) {
> >> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> >> +				return -EPROBE_DEFER;
> > If for some reason you get EPROBE_DEFER when i > 0 you need to
> > mbox_free_channel() channels [0..i) before returning.
> 
> The mailbox framework returns EPROBE_DIFFER to inform that the mailbox 
> provider has not registered yet. I do not expected to have a success 
> followed by a EPROBE_DEFER error.
> 
> But in the very special case where we use two different mailbox 
> providers this may happen.
> 

I agree, it's unlikely to ever cause any problems...

> I will send an updated version, thanks for pointing this.
> 

I appreciate that.

Thanks,
Bjorn

> BR
> 
> Fabien
> 
> >
> > Regards,
> > Bjorn
> >
> >>   			dev_warn(dev, "cannot get %s mbox\n", name);
> >>   			ddata->mb[i].chan = NULL;
> >>   		}
> >>   	}
> >> +
> >> +	return 0;
> >>   }
> >>   
> >>   static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> >> @@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
> >>   	if (ret)
> >>   		goto free_rproc;
> >>   
> >> -	stm32_rproc_request_mbox(rproc);
> >> +	ret = stm32_rproc_request_mbox(rproc);
> >> +	if (ret)
> >> +		goto free_rproc;
> >>   
> >>   	ret = rproc_add(rproc);
> >>   	if (ret)
> >> -- 
> >> 2.7.4
> >>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
