Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18833969685
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 10:06:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76F92C78028;
	Tue,  3 Sep 2024 08:06:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8061C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 20:54:15 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-204d391f53bso9017455ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724964854; x=1725569654;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpAKIRUeMQ69akkagQpjTbK7bpiP+z/aYeOQSNNIjDU=;
 b=G5bTn4iO1TrTjwXCg9PIO5FMNqye2Ki158FXouOOwTx8m4MwNBJf+K19cogUui/NIu
 PRHpmclc22O6W34lGIsR2B7syHOSPxMa4X25lswQNGvfgeFditFFa7DLmGnDjLXo0sA1
 8IpN+kT9VJGZSSazRW7/yZ4dAEFg5jte1ldLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724964854; x=1725569654;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bpAKIRUeMQ69akkagQpjTbK7bpiP+z/aYeOQSNNIjDU=;
 b=jsYHcftFigSt+xUzbjPlfsXiGSZSn2eMZA4oit/BahCWTwVzPGt1zvTAt6gfRpBAjg
 jsZIM4M9uGcr9juIsrLIZHoTWaVbjX6fX5lDTkocj9WAP4KooZgGoRkrGUWbaf4fsS2b
 RqbIpvtIZ3HyOuoQLWscQJ3rORSZ9GFHqlu7enLQ3XboJFdznlz9/BHBpq+1xVNyr4Lh
 KwGq3usU765x9J0pZ4vW9WRkFEy6lwzo/IdrlDPK7av/bETLb98TqOLeq/Qd+aZrAfVP
 uaDpKs3FT4mL1gNbm8t2orkesDyCGMG/LGT2pvnpRLPdnVmZWEIU4Hk8jwsYsvNMQMVB
 tNOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ7WUEiwPkd1YwWHxFcVdiZE5GOcD3qHP7SCyzrMJ3Qz171LlWbg2wZC9T/15Xn04vgGF5iIddCxyFzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuP3VT+1KaXr+j7Z0B12ccHuyYGptDn5fGJoYQnqAKdPRvIogR
 pKxzsxYyDbrwKIoJOJiXy33DvDHb9swBoztJ4R9sDkHjTQ8FMTBfdRd9Pdot0A==
X-Google-Smtp-Source: AGHT+IHWeXnhZnpNG3JqVZfHM2kILTImJt5gTQEIEKE4/lLhcadSeURX0TSadr8q6vHOf9OlWw3tSw==
X-Received: by 2002:a17:902:d505:b0:204:e310:8c7b with SMTP id
 d9443c01a7336-2050c3ef5dbmr41235765ad.34.1724964854292; 
 Thu, 29 Aug 2024 13:54:14 -0700 (PDT)
Received: from [10.69.74.12] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2051553720esm15596495ad.178.2024.08.29.13.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 13:54:13 -0700 (PDT)
Message-ID: <ef15f1a1-266c-4aba-a7ba-b7bf56fd20c7@broadcom.com>
Date: Thu, 29 Aug 2024 13:54:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, ansuelsmth@gmail.com, UNGLinuxDriver@microchip.com,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 krzk@kernel.org, jic23@kernel.org
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
 <20240829063118.67453-13-ruanjinjie@huawei.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20240829063118.67453-13-ruanjinjie@huawei.com>
X-Mailman-Approved-At: Tue, 03 Sep 2024 08:06:49 +0000
Subject: Re: [Linux-stm32] [PATCH net-next v3 12/13] net: bcmasp: Simplify
 with scoped for each OF child loop
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



On 8/28/24 11:31 PM, 'Jinjie Ruan' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Use scoped for_each_available_child_of_node_scoped() when
> iterating over device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
