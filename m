Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B043E7CA043
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Oct 2023 09:14:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48BF0C6B452;
	Mon, 16 Oct 2023 07:14:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B692C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 14:37:56 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6bf58009a8dso1362114a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697207875; x=1697812675;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UbPsrJcoBy9BqlyOGafIHjglt8aQnlICvj5agohrEkI=;
 b=KisXMrw8VCBoQqHkMgN6cJDbLvH4ng5tk0X2imoK5lKow+pnzjCqe7hG4a6Fqv0ScL
 YRuGp2CXDhicP26DpJhN+ZcVIC9v+p9IuN9Gh7ywwUgvBWX9AXlTymdETijI91c9JoTV
 26G6lkrIyDyAfjIKZpkIsZwvCMOd3+jJkIIxaBtouItlKeR+irYmGALIDBl2FUdNuSuN
 BUJsg5Pz1OZnO5A1RbMF0n0vqYdpx3vyALX2IFOQKvAbWpcNnI02t+hlOF0DKhI1qK8u
 LTnAdws5rMafm8dD6piwQHqqLWcnFlH1+E0qKjlSDWmN62CD+nybiP4G/6I6iUSKTzAW
 MPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697207875; x=1697812675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbPsrJcoBy9BqlyOGafIHjglt8aQnlICvj5agohrEkI=;
 b=uE1S95B/kQxrVG87AShf8r8fcN0p+G+sxAzJm3QB/Nf50IdEXnoSaMbb8jzvGxNMnY
 tOjppetODUoW7TtdFfcBw2zmeu8JY/gqUP0AWXO2bedJRrLz8fvpJAjoDvMSHOMO0qTH
 GpE4rP8typPB4iQP1ZlaKQadmtgE2C5AOsLoQoZPXOXG+PsnItdIFs+6M0loNLFNQ7dn
 VWvGNofjA+VNegFcyVajSwgDsK8oOlw3dWSBbwXsi90/wcgns0nbdA7Ej8SNcTnZyozJ
 MUh8DlBWiMSgFztQpQcmPSMaRvloaOPTL2Lmjet0qLQhWcbaswzLS+L0tFg+zleJ1Xry
 7OlA==
X-Gm-Message-State: AOJu0YwkxXwt5K7Oh8EYrV05lJMKCGmioxe8UOGGbCyXjVROXON/+Nr/
 a2QNa4nzGIzBN2057EfMZXc=
X-Google-Smtp-Source: AGHT+IFfm+l7CiPc096l3so6sYjYDqpMw8wulF9kO9eG3vYQ6hHQHV4GyWqRQmtsxauxwFJ4npblNw==
X-Received: by 2002:a05:6830:18f8:b0:6c4:e81f:59b8 with SMTP id
 d24-20020a05683018f800b006c4e81f59b8mr27317088otf.22.1697207874959; 
 Fri, 13 Oct 2023 07:37:54 -0700 (PDT)
Received: from [172.16.49.130] (cpe-70-114-247-242.austin.res.rr.com.
 [70.114.247.242]) by smtp.googlemail.com with ESMTPSA id
 t26-20020a05683014da00b006c4d56392f4sm684143otq.24.2023.10.13.07.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 07:37:54 -0700 (PDT)
Message-ID: <2e52c8b4-e70a-453f-853a-1962c8167dfa@gmail.com>
Date: Fri, 13 Oct 2023 09:37:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>
References: <20231008040140.1647892-1-dimitri.ledkov@canonical.com>
 <ZSkeWHdOAOfjtpwJ@gondor.apana.org.au>
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <ZSkeWHdOAOfjtpwJ@gondor.apana.org.au>
X-Mailman-Approved-At: Mon, 16 Oct 2023 07:14:45 +0000
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 James Prestwood <prestwoj@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: remove md4 driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Herbert,

On 10/13/23 05:39, Herbert Xu wrote:
> On Sun, Oct 08, 2023 at 05:01:39AM +0100, Dimitri John Ledkov wrote:
>> No internal users left and cryptographically insecure. Users should
>> upgrade to something else, e.g. sha256 blake3.
>>
>> Some drivers have their own full or partial md4 implementation without
>> using crypto/md4.
>>
>> Userspace code search indicates a few copies of hash_info.h
>> https://codesearch.debian.net/search?q=HASH_ALGO_MD4&literal=1 without
>> need for MD4.
>>
>> Preserve uapi hash algorithm indexes and array length, but rename the
>> MD4 enum.
>>
>> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
>> ---
>>   crypto/Kconfig                 |   6 -
>>   crypto/Makefile                |   1 -
>>   crypto/hash_info.c             |   4 +-
>>   crypto/md4.c                   | 241 ---------------------------------
>>   crypto/tcrypt.c                |  12 --
>>   crypto/testmgr.c               |   6 -
>>   crypto/testmgr.h               |  42 ------
>>   include/uapi/linux/hash_info.h |   2 +-
>>   8 files changed, 3 insertions(+), 311 deletions(-)
>>   delete mode 100644 crypto/md4.c
> 
> Patch applied.  Thanks.

Does this patch break userspace?

Here's a thread regarding MD4 the last time its removal was attempted:
https://lore.kernel.org/linux-crypto/20210818144617.110061-1-ardb@kernel.org/

Please note that iwd does use MD4 hashes here:
https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/checksum.c#n63

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-mschapv2.c#n165

Regards,
-Denis
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
