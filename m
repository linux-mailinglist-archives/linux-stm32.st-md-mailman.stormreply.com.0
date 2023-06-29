Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44444742F4D
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 23:10:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF2DCC6B455;
	Thu, 29 Jun 2023 21:10:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0561C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688073028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGOWLH5yYZOQguU6z0SZDCNOwqtS2A+CXlPEXU7v820=;
 b=Yut570b8ekLKcuP2MfKu+jr0N1n4tLzy7mAPrRD8XgTq0QWzQEyc0v7wjsAePxKaPhLoE5
 v6QoZRqmOMnAe/GFYRcZlVhpgtp3ssH+0/mRTZkyb89v0ONM/lbyWFqjjUvAasdxObgyKT
 Gr5IpTnuPDrmQcTOL0YrV03TmpoaXNY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Wj6tS_bgNOKg2ZOVXwolRQ-1; Thu, 29 Jun 2023 17:10:27 -0400
X-MC-Unique: Wj6tS_bgNOKg2ZOVXwolRQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-56ff81be091so9880067b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 14:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688073026; x=1690665026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGOWLH5yYZOQguU6z0SZDCNOwqtS2A+CXlPEXU7v820=;
 b=bp7iTPDd66/UFAYqZLn5R5oxhNYAkf/6NwxOydBlOl3v/1RCclU5Ih18G2T7IYjpkN
 6uQgC25UKqb9fY8tCrgpMPedj5QY9/RELUe4BW/zN5WaUFnmdQ8VdrDg+RZFbpWe06zg
 011cwCIZz9zkj7K/FS7DH3n4WdHAzGdNRk5GocjDKdYd0dNNxqlEnJb0QzkTrW2/9nYy
 toCzRY3OyAol7KWrpKCtXaBTxAfSsteWY7QUakA1lThw3RC0mwUxsJcJ11YyELsSmeQk
 yCCBUMTPu/HLoXIVBDejcxXpTtjK5lRL9SLCpROU71nT6q6FqEGvuIRG/r+G/Afob3to
 G2AQ==
X-Gm-Message-State: ABy/qLZI6/5MDHvkdYyk0hw3KLnA/x/CWN0cJ203Owm5By8BXVFacuMw
 p3Dt9UmALmBBfRgu7qByPxPcHiG2UyvNrNEcwaW0+tBWjUN6WAlDLlE98jnamslzCOIdc8uMqRQ
 fCFohbhRAwC21tY229IXNZWCfhKA4U2YNGKC/gSQo
X-Received: by 2002:a05:690c:360d:b0:56d:a2d:d08c with SMTP id
 ft13-20020a05690c360d00b0056d0a2dd08cmr400003ywb.51.1688073026766; 
 Thu, 29 Jun 2023 14:10:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFexhIe4+FSUhftLbXEZ7SljYaaxr3sHvF+qUjRjfjmLU8owbauYcWADujmTq/eC0LfyIjjVg==
X-Received: by 2002:a05:690c:360d:b0:56d:a2d:d08c with SMTP id
 ft13-20020a05690c360d00b0056d0a2dd08cmr399983ywb.51.1688073026548; 
 Thu, 29 Jun 2023 14:10:26 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 a205-20020a8166d6000000b0057020aa41basm3041764ywc.65.2023.06.29.14.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 14:10:25 -0700 (PDT)
Date: Thu, 29 Jun 2023 16:10:23 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230629211023.pznzgue6arn7fzfl@halaney-x13s>
References: <20230629191725.1434142-1-ahalaney@redhat.com>
 <20230629191725.1434142-3-ahalaney@redhat.com>
 <e9157117-bd7a-4b75-841e-090103f75d22@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <e9157117-bd7a-4b75-841e-090103f75d22@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-qcom-ethqos: Log
 more errors in probe
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

On Thu, Jun 29, 2023 at 10:32:24PM +0200, Andrew Lunn wrote:
> On Thu, Jun 29, 2023 at 02:14:18PM -0500, Andrew Halaney wrote:
> > These are useful to see when debugging a probe failure.
> 
> Since this is used for debugging, maybe netdev_dbg(). Anybody actually
> doing debugging should be able to turn that on.
> 

In my opinion it is better to use dev_err_probe() as done here because:

1. If it's -EPROBE_DEFER it will be under debug level already
2. If it's anything else, its an error and the logs are useful

I've ran into both ends of this now (failure of a platform dependency to
load, be it a bug in the driver, or just failing to select said driver),
and I've seen issues where new integrators (say you're bringing up a new
board) leave something out, etc, and run into issues because of that.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
