Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2F4B124
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 07:13:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BC83CC2395
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 05:13:19 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ACF1CC2394
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 05:13:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so1816671wrs.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 22:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9guZEDssE8I+Ozz4TU41/U7IQZOO1+3LKJDr7vi/5Ig=;
 b=OW2v0Mufw9VUMtEQX0EIYMhdF6CFGIbVcMLAKreHYZkGp2OyuSAfASx/K+buOjywda
 Dk6qy5lfj9BrOmNUZl8p3cKJhYMkjPokGwuXVK6EsSXD9p4uhxX/orHbR2WjAjNgEbcS
 VMUmfHMO6pK1C8PqH53BeGopVDQr4MsKWW4ZhvihkaJIxYd1aLloqGLIN9IflPdrF+Al
 K7KRXKaG/oGSStyrstgrltAQBz7LhiLZFOy4fXG2+pTjQkXdffJItdA2mcrSEdkjfUWp
 GSvHKJBu3v29Bi2p2ENmLZHSdjCxcuk7eJEpq2HcGfO7+y0z2RuNhWxr0WmxVi5kIqzm
 zpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9guZEDssE8I+Ozz4TU41/U7IQZOO1+3LKJDr7vi/5Ig=;
 b=iR66aUfo8fUwNC+hSqxu2V7/zmWKKZkW8dl+GDSFK4bi97+3y5DEtkRlRu/ELuBkyo
 0gDoZKLOzgyXVv2+b3tNJUqbSufVFCCiKW0lLFFXymqJStT0EdDUzllxyYMv2ZIDjM02
 xP0ligOLtJWyzgWM86zQwGC+6xnYwhQejWNpNalKTxs1Gx+X8KvmLxOtN9PKGgEUNSTr
 pSt40pAH9ciDy4g66OoNrg/9wDx5hgjwtb5hkWJoE0nWV4Vvxeir34i2EtFdrk4mAn0B
 ZEhI3GUOrFXGOcTjs7VozJKjGom8K5eZMmnSJpVXirgN0E6jGRXj0UqpemonEx7ULSqp
 Mfjw==
X-Gm-Message-State: APjAAAV9lVnXVa+/zRn2tg9COAsjXoSl6a6tFyb6L+nKtsjLLPm5WkNf
 qBEEat0z+VTJ0mGrIOTDbmE=
X-Google-Smtp-Source: APXvYqxGBww6ssn1q6Cc/uBn6zveGVb+IPhy76VqGDZJSXuEch6xRNKIOwbG51zvq8ngpGJrw8nuoA==
X-Received: by 2002:adf:f442:: with SMTP id f2mr17524212wrp.275.1560921196964; 
 Tue, 18 Jun 2019 22:13:16 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E000CE01247662D4005.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:ce0:1247:662d:4005])
 by smtp.googlemail.com with ESMTPSA id f204sm301596wme.18.2019.06.18.22.13.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:13:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: colin.king@canonical.com
Date: Wed, 19 Jun 2019 07:13:08 +0200
Message-Id: <20190619051308.23582-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617165836.4673-1-colin.king@canonical.com>
References: <20190617165836.4673-1-colin.king@canonical.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add sanity check to
	device_property_read_u32_array call
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

Hi Colin,

> Currently the call to device_property_read_u32_array is not error checked
> leading to potential garbage values in the delays array that are then used
> in msleep delays.  Add a sanity check to the property fetching.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
I have also sent a patch [0] to fix initialize the array.
can you please look at my patch so we can work out which one to use?

my concern is that the "snps,reset-delays-us" property is optional,
the current dt-bindings documentation states that it's a required
property. in reality it isn't, there are boards (two examples are
mentioned in my patch: [0]) without it.

so I believe that the resulting behavior has to be:
1. don't delay if this property is missing (instead of delaying for
   <garbage value> ms)
2. don't error out if this property is missing

your patch covers #1, can you please check whether #2 is also covered?
I tested case #2 when submitting my patch and it worked fine (even
though I could not reproduce the garbage values which are being read
on some boards)


Thank you!
Martin


[0] https://lkml.org/lkml/2019/4/19/638
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
