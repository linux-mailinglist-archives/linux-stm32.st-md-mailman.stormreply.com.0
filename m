Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF06DB1AB
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 19:35:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F587C6B44A;
	Fri,  7 Apr 2023 17:35:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E106EC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680888900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VgSBn4v63sH/hPEOpjuOfluIneyO592ey/flc3R1Lws=;
 b=ZVOQpywM/ihvbcFJMqZ6oqfoZgQPs3K/v1FXm38XDIf83KE8JgM5jwYEFDyItUh46nvCCM
 B2FJqY3os5gp1Q82tT6puKwEn7Z9dGqu7sXQXYI++sPIJMfsRMmK1VoFdwfNIMolyIg2dV
 6letRGpm0babh+lpx9neiBqmklf+/SY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-BNSGZPHiNTeO8Mrh6JN1eQ-1; Fri, 07 Apr 2023 13:34:57 -0400
X-MC-Unique: BNSGZPHiNTeO8Mrh6JN1eQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-17a678c2de9so22325653fac.14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Apr 2023 10:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680888897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgSBn4v63sH/hPEOpjuOfluIneyO592ey/flc3R1Lws=;
 b=DKCOPAMn43nEzdWyZ9XUbih9ZUPzK89xp8j/m+lD+RwVGeWQenhwtP+iz9xRu2Bo6p
 h1GvpTWCS3mt6CG67NW6zWybmQQOs8hpaDI34J9TPcSjmgTKcDV3hmksHR7p9TcvjjaY
 KM1TMr0PtLagkNyAhb2vXAcRAuiHezrWT2GTMJ3VUnfEUWQaHH6Zgc/dqW68eVF7mF5V
 uzNmnCCNbGWP5Q59Hzp2H6XGBMUuUBwFZLb56bpOMvQ2bRvZ8ZOAm+aH+mmKFeB+NZLp
 PDvIWXNNOjSjBqk5Oi26QBSsqpYlB4N6L/l5rnoBNGggQyQJhDJbU/25Kr5jKk+mdvT8
 nRWA==
X-Gm-Message-State: AAQBX9fSSmOq8RZCpQHAKltJvlJnGZnDLCz0wfpLPc9soAi/GFSnUT+e
 kwnbCy333NFHMQK3911p51j0rwjTRsZbd6X6nFzXK2OptJM+/4QMKaIDf0iyACA7k914F5ozF4X
 g9l8+KpVZi8qY5n/AUFtbfOiUs/5YQxEGq//QcV+q
X-Received: by 2002:a05:6871:828:b0:17a:ce6b:726 with SMTP id
 q40-20020a056871082800b0017ace6b0726mr1927776oap.57.1680888897191; 
 Fri, 07 Apr 2023 10:34:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXsTSTagUzg6KkiTKxiPA0gPNgmGx86bP9YtG1X657Q3uhpK3CFF1WVzwPqGtc/1IMJf5fWg==
X-Received: by 2002:a05:6871:828:b0:17a:ce6b:726 with SMTP id
 q40-20020a056871082800b0017ace6b0726mr1927741oap.57.1680888896927; 
 Fri, 07 Apr 2023 10:34:56 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net.
 [104.53.165.62]) by smtp.gmail.com with ESMTPSA id
 y1-20020a056870458100b001777244e3f9sm1822096oao.8.2023.04.07.10.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 10:34:56 -0700 (PDT)
Date: Fri, 7 Apr 2023 12:34:53 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230407173453.hsfhbr66254z57ym@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-9-ahalaney@redhat.com>
 <ZChIbc6TnQyZ/Fiu@corigine.com>
MIME-Version: 1.0
In-Reply-To: <ZChIbc6TnQyZ/Fiu@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, agross@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrey.konovalov@linaro.org,
 ncai@quicinc.com, devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 08/12] net: stmmac: Pass
 stmmac_priv in some callbacks
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

On Sat, Apr 01, 2023 at 05:06:21PM +0200, Simon Horman wrote:
> On Fri, Mar 31, 2023 at 04:45:45PM -0500, Andrew Halaney wrote:
> > Passing stmmac_priv to some of the callbacks allows hwif implementations
> > to grab some data that platforms can customize. Adjust the callbacks
> > accordingly in preparation of such a platform customization.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> 
> ...
> 
> >  #define stmmac_reset(__priv, __args...) \
> > @@ -223,59 +240,59 @@ struct stmmac_dma_ops {
> >  #define stmmac_dma_init(__priv, __args...) \
> >  	stmmac_do_void_callback(__priv, dma, init, __args)
> >  #define stmmac_init_chan(__priv, __args...) \
> > -	stmmac_do_void_callback(__priv, dma, init_chan, __args)
> > +	stmmac_do_void_callback(__priv, dma, init_chan, __priv, __args)
> 
> Hi Andrew,
> 
> Rather than maintaining these macros can we just get rid of them?
> I'd be surprised if things aren't nicer with functions in their place [1].
> 
> f.e., we now have (__priv, ..., __priv, ...) due to a generalisation
>       that seems to take a lot more than it gives.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/ZBst1SzcIS4j+t46@corigine.com/
> 

Thanks for the pointer. I think that makes sense, I'll take that
approach for these functions (and maybe in a follow-up series I'll
tackle all of them just because the lack of consistency will eat me up).

Sorry for the delay, had some issues around the house that became
urgent.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
