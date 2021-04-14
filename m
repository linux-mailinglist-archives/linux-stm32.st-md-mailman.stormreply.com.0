Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED935F6F2
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Apr 2021 17:01:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27791C57B78;
	Wed, 14 Apr 2021 15:01:39 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C869C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 15:01:32 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so13705324oti.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pWUtMV31lAE/hyg87N7iEfJU2y6qay0uOr7HTCluXiQ=;
 b=weX1bUpjRw6wuytQJlFfHNsn28nJPkkHmgBmJw8yPf3L2dHbbM5kfw3GHxlJBh1DyO
 BJkCg2eP4j3uyTHTdQaKSyyrOp+Fdowe+89rwe7wEGQbQm73jyYQTJ7L9wx49d6igFYd
 vbmQpzTiwPwqdGDeylnvV3vHpL+PWpFnvnzhRJ+IDnGQvkvXtwuLb+d5yUV9tHJCFx7s
 bOw6rogRUZEzwOFKIQ91VGxbwbpZd7+mDC+GgCrvp1IoZyasKbedKt0fyfNtq6M1NaxO
 7QzGAS3TRRrj5hg+1RxcPnAG82mKMruMgDVEaVQhzyw4zOZpmht7sd/ADU718gXGHYFJ
 +Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pWUtMV31lAE/hyg87N7iEfJU2y6qay0uOr7HTCluXiQ=;
 b=KqRshgytfQ9K6oMU/sO/uxZowttmfbccxBJINDTHnO8ttDp811eNJU1FcEQ6z61hWk
 +0mUW3DjKsFERD2ZkQDpu1jy0fPrQhzm/XxWV09nElaGlMK/X0DsQjZ1j6cbctvMU/Lc
 5iarSEwTdmsFkSPgg60Bz8N/ox1wn58M0lYgitF+P6Yo8be7EUG98EwIbK62vBzg/7Zi
 44TUbl/koOsU8a3RDYLWg9LTAHY6Z8rkqp1/Np6twK7bb19wwOvYHSMP3lGZ8f9yjTuL
 SAj9eJwY+TNtziIIZbAouwVP1sUyXD+0U4cr/0isYBDgNWrV5OGELf6kbpfX1scdoRiv
 hb2w==
X-Gm-Message-State: AOAM533mFC3Og/4l76MwYtNaGwTS8dCnrda2BOQOiZ1ZMAxk5qEmff+X
 xRoLEPHXsUCZkeh76ZsATSveVA==
X-Google-Smtp-Source: ABdhPJxDtOsCeDQQ/deHM1lftmwj2WSD1eWrJZcD1R9B4e21VGSd2wMo678cp9rC6umgF66U/MAcWg==
X-Received: by 2002:a9d:7f9a:: with SMTP id t26mr2801371otp.363.1618412491567; 
 Wed, 14 Apr 2021 08:01:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id z25sm337558otm.34.2021.04.14.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:01:31 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:01:29 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <YHcDyUap4cU8WNh6@builder.lan>
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
 <20210331073347.8293-3-arnaud.pouliquen@foss.st.com>
 <YHYOd/vqeZCiqkpJ@builder.lan>
 <3df5317b-d28a-9362-6876-99442fdb8ef5@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3df5317b-d28a-9362-6876-99442fdb8ef5@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/2] remoteproc: stm32: add capability
	to detach
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

On Wed 14 Apr 02:23 CDT 2021, Arnaud POULIQUEN wrote:
> On 4/13/21 11:34 PM, Bjorn Andersson wrote:
> > On Wed 31 Mar 02:33 CDT 2021, Arnaud Pouliquen wrote:
[..]
> >> +		err = mbox_send_message(ddata->mb[idx].chan,
> >> +					&dummy_data);
> > 
> > Seems I posted my comment on v1, rather than this latest version. Please
> > let me know if we should do anything about this dummy_data.
> 
> Thanks for pointing this out, you are right, the mailbox driver is stm32_ipcc
> and it only sends a signal to the remote processor.
> 
> As message can be queued by the mailbox framework using a local variable seems
> not a good option. As this code is a copy/past of the kick and stop?
> I propose to get this one and I will send a new patch to fix the usage in the
> whole driver.
> 

That works for me, I've merged the two patches.

Thanks,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
